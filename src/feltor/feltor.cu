#include <iostream>
#include <iomanip>
#include <vector>
#include <sstream>
#include <cmath>
// #define DG_DEBUG

#include "draw/host_window.h"
//#include "draw/device_window.cuh"
#include "dg/backend/xspacelib.cuh"
#include "dg/backend/timer.cuh"
#include "file/read_input.h"

#include "feltor.cuh"
#include "parameters.h"
#include "geometry.h"

/*
   - reads parameters from input.txt or any other given file, 
   - integrates the Feltor - functor and 
   - directly visualizes results on the screen using parameters in window_params.txt
*/


int main( int argc, char* argv[])
{
    //Parameter initialisation
    std::vector<double> v, v2,v3;
    std::stringstream title;
    if( argc == 1)
    {
        try{
        v = file::read_input("input.txt");
        }catch( toefl::Message& m){m.display();}
    }
    else if( argc == 2)
    {
        v = file::read_input( argv[1]);
    }
    else
    {
        std::cerr << "ERROR: Too many arguments!\nUsage: "<< argv[0]<<" [filename]\n";
        return -1;
    }

    /////////////////////////////////////////////////////////////////////////
    const eule::Parameters p( v);
    p.display( std::cout);
    v2 = file::read_input( "window_params.txt");
    GLFWwindow* w = draw::glfwInitAndCreateWindow( p.Nz/v2[2]*v2[3], v2[1]*v2[4], "");
    draw::RenderHostData render(v2[1], p.Nz/v2[2]);

    //////////////////////////////////////////////////////////////////////////
    try{ v3 = file::read_input( "geometry_params.txt"); }
    catch (toefl::Message& m) {  
        m.display(); 
        for( unsigned i = 0; i<v.size(); i++)
        return -1;}

    const solovev::GeomParameters gp(v3);
    gp.display( std::cout);
    double Rmin=gp.R_0-(gp.boxscale)*gp.a;
    double Zmin=-(gp.boxscale)*gp.a*gp.elongation;
    double Rmax=gp.R_0+(gp.boxscale)*gp.a; 
    double Zmax=(gp.boxscale)*gp.a*gp.elongation;
    //Make grid
     dg::Grid3d<double > grid( Rmin,Rmax, Zmin,Zmax, 0, 2.*M_PI, p.n, p.Nx, p.Ny, p.Nz, dg::DIR, dg::DIR, dg::PER, dg::cylindrical);  
    //create RHS 
    eule::Feltor<dg::DMatrix, dg::DVec, dg::DVec > feltor( grid, p,gp); //initialize before rolkar!
    eule::Rolkar<dg::DMatrix, dg::DVec, dg::DVec > rolkar( grid, p,gp);

    /////////////////////The initial field///////////////////////////////////////////
    //dg::Gaussian3d init0(gp.R_0+p.posX*gp.a, p.posY*gp.a, M_PI, p.sigma, p.sigma, p.sigma, p.amp);

    //dg::BathRZ init0(16,16,p.Nz,Rmin,Zmin, 30.,5.,p.amp);
//     solovev::ZonalFlow init0(gp,p.amp);
    solovev::Nprofile grad(gp); //initial background profile
    
    std::vector<dg::DVec> y0(4, dg::evaluate( grad, grid)), y1(y0); 

    //field aligned blob (gpu only)
    dg::Gaussian gaussian( gp.R_0+p.posX*gp.a, p.posY*gp.a, p.sigma, p.sigma, p.amp);
    dg::GaussianZ gaussianZ( M_PI, M_PI/2., 1);
    y1[1] = feltor.dz().evaluate( gaussian);
    y1[2] = dg::evaluate( gaussianZ, grid);
    dg::blas1::pointwiseDot( y1[1], y1[2], y1[1]);

    //y1[1] = dg::evaluate( init0, grid);
    //damp the bath on psi boundaries 
    //dg::blas1::pointwiseDot(rolkar.damping(),y1[1], y1[1]); 
    dg::blas1::axpby( 1., y1[1], 1., y0[1]); //initialize ni
    dg::blas1::transform(y0[1], y0[1], dg::PLUS<>(-1));
    feltor.initializene(y0[1],y0[0]);    

    dg::blas1::axpby( 0., y0[2], 0., y0[2]); //set Ue = 0
    dg::blas1::axpby( 0., y0[3], 0., y0[3]); //set Ui = 0

    dg::Karniadakis< std::vector<dg::DVec> > karniadakis( y0, y0[0].size(), p.eps_time);
//     dg::AB< 3, std::vector<dg::DVec> > ab( y0);
    karniadakis.init( feltor, rolkar, y0, p.dt);
// // ab.init( feltor,  y0, p.dt);
    dg::DVec dvisual( grid.size(), 0.);
    dg::HVec hvisual( grid.size(), 0.), visual(hvisual);
    dg::HMatrix equi = dg::create::backscatter( grid);
    draw::ColorMapRedBlueExtMinMax colors(-1.0, 1.0);

    //create timer
    dg::Timer t;
    double time = 0;
    unsigned step = 0;
    
    const double mass0 = feltor.mass(), mass_blob0 = mass0 - grid.lx()*grid.ly();
    double E0 = feltor.energy(), energy0 = E0, E1 = 0, diff = 0;
    std::cout << "Begin computation \n";
    std::cout << std::scientific << std::setprecision( 2);
    while ( !glfwWindowShouldClose( w ))
    {

        hvisual = y0[0];
        dg::blas2::gemv( equi, hvisual, visual);
        colors.scalemax() = (float)thrust::reduce( visual.begin(), visual.end(), 0., thrust::maximum<double>() );
        colors.scalemin() = -colors.scalemax();        
        //colors.scalemin() = 1.0;
        //colors.scalemin() =  (float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() );

        title << std::setprecision(2) << std::scientific;
        //title <<"ne / "<<(float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() )<<"  " << colors.scalemax()<<"\t";
        title <<"ne-1 / " << colors.scalemax()<<"\t";
        for( unsigned k=0; k<p.Nz/v2[2];k++)
        {
            unsigned size=grid.n()*grid.n()*grid.Nx()*grid.Ny();
            dg::HVec part( visual.begin() + k*v2[2]*size, visual.begin()+(k*v2[2]+1)*size);
            render.renderQuad( part, grid.n()*grid.Nx(), grid.n()*grid.Ny(), colors);
        }

        //draw ions
        //thrust::transform( y1[1].begin(), y1[1].end(), dvisual.begin(), dg::PLUS<double>(-0.));//ne-1
        hvisual = y0[1];
        dg::blas2::gemv( equi, hvisual, visual);
        colors.scalemax() = (float)thrust::reduce( visual.begin(), visual.end(), 0., thrust::maximum<double>() );
        //colors.scalemin() = 1.0;        
        colors.scalemin() = 2.0-colors.scalemax();        
        //colors.scalemin() =  (float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() );

        title << std::setprecision(2) << std::scientific;
        //title <<"ni / "<<(float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() )<<"  " << colors.scalemax()<<"\t";
        title <<"ni-1 / " << colors.scalemax()-1<<"\t";
        for( unsigned k=0; k<p.Nz/v2[2];k++)
        {
            unsigned size=grid.n()*grid.n()*grid.Nx()*grid.Ny();
            dg::HVec part( visual.begin() + k*v2[2]*size, visual.begin()+(k*v2[2]+1)*size);
            render.renderQuad( part, grid.n()*grid.Nx(), grid.n()*grid.Ny(), colors);
        }

        ////transform to Vor
        dvisual=feltor.potential()[0];
        dg::blas2::gemv( rolkar.laplacianM(), dvisual, y1[1]);
        hvisual = y1[1];
        //hvisual = feltor.potential()[0];
        dg::blas2::gemv( equi, hvisual, visual);
        colors.scalemax() = (float)thrust::reduce( visual.begin(), visual.end(), 0.,thrust::maximum<double>()  );
        //colors.scalemin() =  (float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() );
        colors.scalemin() = -colors.scalemax();
        //title <<"Phi / "<<colors.scalemin()<<"  " << colors.scalemax()<<"\t";
        title <<"Omega / "<< colors.scalemax()<<"\t";
        for( unsigned k=0; k<p.Nz/v2[2];k++)
        {
            unsigned size=grid.n()*grid.n()*grid.Nx()*grid.Ny();
            dg::HVec part( visual.begin() + k*v2[2]*size, visual.begin()+(k*v2[2]+1)*size);
            render.renderQuad( part, grid.n()*grid.Nx(), grid.n()*grid.Ny(), colors);
        }

        //draw U_e
        hvisual = y0[2];
        dg::blas2::gemv( equi, hvisual, visual);
        colors.scalemax() = (float)thrust::reduce( visual.begin(), visual.end(), 0.,thrust::maximum<double>()  );
        //colors.scalemin() =  (float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() );
        colors.scalemin() = -colors.scalemax();
        //title <<"Ue / "<<colors.scalemin()<<"  " << colors.scalemax()<<"\t";
        title <<"Ue / " << colors.scalemax()<<"\t";
        for( unsigned k=0; k<p.Nz/v2[2];k++)
        {
            unsigned size=grid.n()*grid.n()*grid.Nx()*grid.Ny();
            dg::HVec part( visual.begin() + k*v2[2]*size, visual.begin()+(k*v2[2]+1)*size);
            render.renderQuad( part, grid.n()*grid.Nx(), grid.n()*grid.Ny(), colors);
        }

        //draw U_i
        hvisual = y0[3];
        dg::blas2::gemv( equi, hvisual, visual);
        colors.scalemax() = (float)thrust::reduce( visual.begin(), visual.end(), 0., thrust::maximum<double>()  );
        //colors.scalemin() =  (float)thrust::reduce( visual.begin(), visual.end(), colors.scalemax()  ,thrust::minimum<double>() );
        colors.scalemin() = -colors.scalemax();
        //title <<"Ui / "<<colors.scalemin()<< "  " << colors.scalemax()<<"\t";
        title <<"Ui / " << colors.scalemax()<<"\t";
        for( unsigned k=0; k<p.Nz/v2[2];k++)
        {
            unsigned size=grid.n()*grid.n()*grid.Nx()*grid.Ny();
            dg::HVec part( visual.begin() + k*v2[2]*size, visual.begin()+(k*v2[2]+1)*size);
            render.renderQuad( part, grid.n()*grid.Nx(), grid.n()*grid.Ny(), colors);
        }


        title << std::fixed; 
        title << " &&   time = "<<time;
        glfwSetWindowTitle(w,title.str().c_str());
        title.str("");
        glfwPollEvents();
        glfwSwapBuffers( w);

        //step 
#ifdef DG_BENCHMARK
        t.tic();
#endif//DG_BENCHMARK
        for( unsigned i=0; i<p.itstp; i++)
        {
            step++;
            std::cout << "(m_tot-m_0)/m_0: "<< (feltor.mass()-mass0)/mass_blob0<<"\t";
            E0 = E1;
            E1 = feltor.energy();
            diff = (E1 - E0)/p.dt;
            double diss = feltor.energy_diffusion( );
            std::cout << "(E_tot-E_0)/E_0: "<< (E1-energy0)/energy0<<"\t";
            std::cout << "Accuracy: "<< 2.*(diff-diss)/(diff+diss)<<"\n";

            try{ karniadakis( feltor, rolkar, y0);}
//             try{ ab( feltor,  y0);}
            catch( dg::Fail& fail) { 
                std::cerr << "CG failed to converge to "<<fail.epsilon()<<"\n";
                std::cerr << "Does Simulation respect CFL condition?\n";
                glfwSetWindowShouldClose( w, GL_TRUE);
                break;
            }
        }
        time += (double)p.itstp*p.dt;
#ifdef DG_BENCHMARK
        t.toc();
        std::cout << "\n\t Step "<<step;
        std::cout << "\n\t Average time for one step: "<<t.diff()/(double)p.itstp<<"s\n\n";
#endif//DG_BENCHMARK
    }
    glfwTerminate();
    ////////////////////////////////////////////////////////////////////

    return 0;

}
