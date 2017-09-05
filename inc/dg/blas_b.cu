#include <iostream>
#include <iomanip>

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>

#include "backend/timer.cuh"
#include "blas.h"
#include "backend/derivatives.h"
#include "backend/evaluation.cuh"
#include "backend/projection.cuh"

const double lx = 2.*M_PI;
const double ly = 2.*M_PI;
double function(double x, double y, double z){ return sin(y)*sin(x);}

//typedef float value_type;
//typedef dg::fDVec Vector;
//typedef dg::fDMatrix Matrix;
//typedef cusp::array1d<float, cusp::device_memory> Vector;
typedef double value_type;
typedef dg::DVec Vector;
//typedef thrust::device_vector<double> Vector;
typedef dg::DMatrix Matrix;
//typedef cusp::array1d<double, cusp::device_memory> Vector;
typedef dg::IDMatrix IMatrix;

int main()
{
    dg::Timer t;
    unsigned n, Nx, Ny, Nz; 
    std::cout << "Type n, Nx, Ny and Nz ( Nx and Ny shall be multiples of 2)\n";
    std::cin >> n >> Nx >> Ny >> Nz;
    dg::Grid3d grid(      0., lx, 0, ly, 0, ly, n, Nx, Ny, Nz);
    dg::Grid3d grid_half( 0., lx, 0, ly, 0, ly, n, Nx/2, Ny/2, Nz);
    Vector w2d;
    dg::blas1::transfer( dg::create::weights(grid), w2d);

    std::cout<<"Evaluate a function on the grid\n";
    t.tic();
    Vector x;
    dg::blas1::transfer( dg::evaluate( function, grid), x);
    t.toc();
    std::cout<<"Evaluation of a function took    "<<t.diff()<<"s\n";
    std::cout << "Sizeof value type is "<<sizeof(value_type)<<"\n";
    value_type gbytes=(value_type)x.size()*sizeof(value_type)/1e9;
    std::cout << "Sizeof vectors is "<<gbytes<<" GB\n";
    int multi=200;
    t.tic();
    value_type norm=0;
    for( int i=0; i<multi; i++)
        norm += dg::blas1::dot( w2d, x);
    t.toc();
    std::cout<<"DOT took                         " <<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    Vector y(x), z(x), u(x), v(x);
    Matrix M;
    dg::blas2::transfer(dg::create::dx( grid, dg::centered), M);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::symv( M, x, y);
    t.toc();
    std::cout<<"centered x derivative took       "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    dg::blas2::transfer(dg::create::dx( grid, dg::backward), M);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::symv( M, x, y);
    t.toc();
    std::cout<<"forward x derivative took        "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    dg::blas2::transfer(dg::create::dy( grid, dg::backward), M);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::symv( M, x, y);
    t.toc();
    std::cout<<"forward y derivative took        "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    dg::blas2::transfer(dg::create::dy( grid, dg::centered), M);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::symv( M, x, y);
    t.toc();
    std::cout<<"centered y derivative took       "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    dg::blas2::transfer(dg::create::jumpX( grid), M);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::symv( M, x, y);
    t.toc();
    std::cout<<"jump X took                      "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    IMatrix inter, project; 
    dg::blas2::transfer(dg::create::interpolation( grid, grid_half), inter);
    dg::blas2::transfer(dg::create::projection( grid_half, grid), project);
    Vector x_half = dg::evaluate( dg::zero, grid_half);
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::gemv( inter, x_half, x);
    t.toc();
    std::cout<<"Interpolation on original grid  "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas2::gemv( project, x, x_half);
    t.toc();
    std::cout<<"Projection onto half grid       "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    

    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::axpby( 1., y, -1., x);
    t.toc();
    std::cout<<"AXPBY (1*y-1*x=x)                "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::axpbygz( 1., x, -1., y, 2., z);
    t.toc();
    std::cout<<"AXPBYGZ (1*x-1*y+2*z=z)          "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::axpbygz( 1., x, -1., y, 3., x);
    t.toc();
    std::cout<<"AXPBYGZ (1*x-1.*y+3*x=x)         "<<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::pointwiseDot(  y, x, x);
    t.toc();
    std::cout<<"pointwiseDot (yx=x)              "<<t.diff()/multi<<"s\t" <<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::pointwiseDot( 1., y, x, 2.,u,v,0.,  z);
    t.toc();
    std::cout<<"pointwiseDot (1*yx+2*uv=z)       "<<t.diff()/multi<<"s\t" <<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        dg::blas1::pointwiseDot( 1., y, x, 2.,u,v,0.,  v);
    t.toc();
    std::cout<<"pointwiseDot (1*yx+2*uv=v)       "<<t.diff()/multi<<"s\t" <<gbytes*multi/t.diff()<<"GB/s\n";
    t.tic();
    for( int i=0; i<multi; i++)
        norm += dg::blas2::dot( w2d, y);
    t.toc();
    std::cout<<"DOT(w,y) took                    " <<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";

    t.tic();
    for( int i=0; i<multi; i++)
    {
        norm += dg::blas2::dot( x, w2d, y);
    }
    t.toc();
    std::cout<<"DOT(x,w,y) took                  " <<t.diff()/multi<<"s\t"<<gbytes*multi/t.diff()<<"GB/s\n";
    std::cout<<norm<<std::endl;

    return 0;
}
