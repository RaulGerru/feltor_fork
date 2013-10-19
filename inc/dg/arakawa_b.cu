#include <iostream>
#include <iomanip>

#include <thrust/device_vector.h>
#include <thrust/host_vector.h>

#include "preconditioner2d.cuh"
#include "evaluation.cuh"
#include "arakawa.cuh"
#include "blas.h"
#include "typedefs.cuh"

#include "timer.cuh"

using namespace std;
using namespace dg;

const double lx = M_PI;
const double ly = 2.*M_PI;
//const double lx = 1.;
//const double ly = 1.;


//choose some mean function (attention on lx and ly)
/*
//THESE ARE NOT PERIODIC
double left( double x, double y) { return sin(x/2)*sin(x/2)*exp(x)*sin(y/2.)*sin(y/2.)*log(y+1); }
double right( double x, double y){ return sin(y/2.)*sin(y/2.)*exp(y)*sin(x/2)*sin(x/2)*log(x+1); }
*/
double left( double x, double y) {return sin(x)*exp(x-M_PI)*sin(y);}
double right( double x, double y) {return sin(x)*sin(y)*exp(y-M_PI);}
double jacobian( double x, double y) 
{
    return exp( x-M_PI)*(sin(x)+cos(x))*sin(y) * exp(y-M_PI)*sin(x)*(sin(y) + cos(y)) - sin(x)*exp(x-M_PI)*cos(y) * cos(x)*sin(y)*exp(y-M_PI); 
}

/*
double left( double x, double y) {return sin(x)*cos(y);}
double right( double x, double y) {return cos(x)*sin(y);}
double jacobian( double x, double y) 
{
    return cos(x)*cos(y)*cos(x)*cos(y) - sin(x)*sin(y)*sin(x)*sin(y); 
}
*/
////These are for comparing to FD arakawa results
//double left( double x, double y) {return sin(2.*M_PI*(x-hx/2.));}
//double right( double x, double y) {return y;}
//double jacobian( double x, double y) {return 2.*M_PI*cos(2.*M_PI*(x-hx/2.));}

int main()
{
    Timer t;
    unsigned n, Nx, Ny;
    cout << "Type n, Nx and Ny! \n";
    cin >> n;
    cin >> Nx; 
    cin >> Ny; //more N means less iterations for same error
    Grid<double> grid( 0, lx, 0, ly, n, Nx, Ny, dg::DIR, dg::DIR);
    S2D<double > s2d( grid);
    DVec w2d = create::w2d( grid);
    cout << "# of 2d cells                     " << Nx*Ny <<endl;
    cout << "# of Legendre nodes per dimension "<< n <<endl;
    DVec lhs = evaluate ( left, grid), jac(lhs);
    DVec rhs = evaluate ( right,grid);
    const DVec sol = evaluate( jacobian, grid );
    DVec eins = evaluate( one, grid );


    ArakawaX<DVec> arakawa( grid);
    t.tic(); 
    arakawa( lhs, rhs, jac);
    t.toc();
    cout << "\nArakawa took "<<t.diff()<<"s\n\n";
    //cout<<jac<<endl;


    cout << scientific;
    cout << "Mean     Jacobian is "<<blas2::dot( eins, w2d, jac)<<"\n";
    cout << "Mean rhs*Jacobian is "<<blas2::dot( rhs, w2d, jac)<<"\n";
    cout << "Mean   n*Jacobian is "<<blas2::dot( lhs, w2d, jac)<<"\n";
    blas1::axpby( 1., sol, -1., jac);
    cout << "Distance to solution "<<sqrt(blas2::dot( w2d, jac))<<endl; //don't forget sqrt when comuting errors
    //periocid bc       |  dirichlet in x per in y
    //n = 1 -> p = 2    |        1.5
    //n = 2 -> p = 1    |        1
    //n = 3 -> p = 3    |        3
    //n = 4 -> p = 3    |        3
    //n = 5 -> p = 5    |        5
    // quantities are all conserved to 1e-15 for periodic bc
    // for dirichlet bc these are not better conserved than normal jacobian

    return 0;
}
