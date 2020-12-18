#include <iostream>
#include <iomanip>

#include "dg/algorithm.h"

#include "shu.cuh"
#include "parameters.h"

//const unsigned k=4;
const double Tmax = 0.01;
const double eps = 1e-14;
const unsigned n=1; //make error in space small
unsigned Nx = 100, Ny = Nx;

int main( int argc, char * argv[])
{

    double dt0;
    std::cout << "type dt0 (1e-3)!\n";
    std::cin >> dt0;
    std::cout << "k n dt Nx eps vort enstr energy\n";
    dg::Grid2d grid( 0, 1, 0, 1, n, Nx, Ny, dg::PER, dg::PER);
    dg::DVec w2d( dg::create::weights(grid));
    dg::Lamb lamb( 0.5, 0.8, 0.1, 1.);
    const dg::HVec omega = dg::evaluate ( lamb, grid);
    shu::Shu<dg::DMatrix, dg::DVec> shu( grid, eps);
    const dg::DVec stencil = dg::evaluate( dg::one, grid);
    for(unsigned i=0; i<6;i++)
    {
        double dt = dt0/pow(2,i);
        unsigned NT = (unsigned)(Tmax/dt);
        double time = 0;
        //initiate solver
        dg::DVec y0( omega ), y1( y0);
        //make solver and stepper
        dg::ExplicitMultistep< dg::DVec > ab("eBDF",3, y0);
        ab.init( shu, time, y0, dt);

        double vorticity = dg::blas2::dot( stencil, w2d, y1);
        double enstrophy = 0.5*dg::blas2::dot( y1, w2d, y1);
        double energy =    0.5*dg::blas2::dot( y1, w2d, shu.potential()) ;
        /////////////////////////////////////////////////////////////////
        try{
        for( unsigned i=0; i<NT; i++)
        {
            ab.step( shu, time, y1);
        }
        }
        catch( dg::Fail& fail) { 
            std::cerr << "CG failed to converge to "<<fail.epsilon()<<"\n";
            std::cerr << "Does Simulation respect CFL condition?\n";
        }
        std::cout << 2 <<" "<<n<<" "<<dt<<" "<<Nx<<" "<<eps<<" ";
        std::cout << fabs(dg::blas2::dot( stencil , w2d, y1));
        std::cout << " "<<fabs(0.5*dg::blas2::dot( y1, w2d, y1)-enstrophy)/enstrophy;
        std::cout << " "<<fabs(0.5*dg::blas2::dot( y1, w2d, shu.potential())-energy)/energy <<"\n";
    }
    std::cout << std::endl;
    return 0;

}
