#include <iostream>
#include <iomanip>
#include <cmath>
#include "dst_dst.h"

using namespace std;
using namespace toefl;


fftw_r2r_kind kind = FFTW_RODFT00;
fftw_r2r_kind kind_inv = inverse_kind( kind);
int main()
{
    const size_t rows = 4, cols = 9;
    Matrix<double, TL_NONE> test( rows, cols);
    Matrix<double, TL_NONE> test_T( cols, rows);

    DST_DST dst_dst( rows, cols, kind);
    for( size_t i = 0; i < rows; i++)
        for( size_t j = 0; j < cols; j++)
            test(i,j) = sin( M_PI*(i+1)/(rows+1.))*sin( 2*M_PI*(j+1)/(cols+1.));
    cout << setprecision(2) << fixed;
    cout << "Testmatrix is\n" << test<<endl;

    dst_dst.r2r_T( test, test_T);
    cout << "transformed matrix is\n" << test_T<<endl;
    dst_dst.r_T2r( test_T, test);
    cout << "backtransformed is (should be input times 200)\n" << test << endl;
    ////////////////////////////////////////////////////////////////////////////////
    Matrix<double, TL_NONE> m0( rows, cols);

    fftw_plan forward =  fftw_plan_r2r_2d( rows, cols, m0.getPtr(), m0.getPtr(), kind, kind, FFTW_MEASURE); 
    fftw_plan backward = fftw_plan_r2r_2d( rows, cols, m0.getPtr(), m0.getPtr(), kind_inv, kind_inv, FFTW_MEASURE); 
    for( size_t i = 0; i < rows; i++)
        for( size_t j = 0; j < cols; j++)
            m0(i,j) = sin( M_PI*(i+1)/(rows+1.))*sin( 2*M_PI*(j+1)/(cols+1.));
    fftw_execute_r2r( forward, m0.getPtr(), m0.getPtr());
    cout << m0 <<endl;
    fftw_execute_r2r( backward, m0.getPtr(), m0.getPtr());
    cout << m0 <<endl;

    return 0 ;
}
