#ifndef _DG_FUNCTORS_CUH_
#define _DG_FUNCTORS_CUH_

#include <cmath>

namespace dg
{
 
///@addtogroup functions
///@{

/**
 * @brief Functor for the absolute maximum
 *
 * @tparam T value-type
 */
template <class T>
struct AbsMax
{
    /**
     * @brief Return the absolute maximum
     *
     * @param x left value
     * @param y right value
     *
     * @return absolute maximum
     */
    __host__ __device__
    T operator() (const T& x, const T& y)
    {
        T absx = x>0 ? x : -x;
        T absy = y>0 ? y : -y;
        return absx > absy ? absx : absy;
    }
};

/**
 * @brief Functor returning a gaussian
 * \f[
   f(x,y) = Ae^{-(\frac{(x-x_0)^2}{2\sigma_x^2} + \frac{(y-y_0)^2}{2\sigma_y^2})} 
   \f]
 */
struct Gaussian
{
    /**
     * @brief Functor returning a gaussian
     *
     * @param x0 x-center-coordinate
     * @param y0 y-center-coordinate
     * @param sigma_x x - variance
     * @param sigma_y y - variance 
     * @param amp Amplitude
     */
    Gaussian( double x0, double y0, double sigma_x, double sigma_y, double amp)
        : x00(x0), y00(y0), sigma_x(sigma_x), sigma_y(sigma_y), amplitude(amp){}
    /**
     * @brief Return the value of the gaussian
     *
     * \f[
       f(x,y) = Ae^{-(\frac{(x-x_0)^2}{2\sigma_x^2} + \frac{(y-y_0)^2}{2\sigma_y^2})} 
       \f]
     * @param x x - coordinate
     * @param y y - coordinate
     *
     * @return gaussian
     */
    double operator()(double x, double y)
    {
        return  amplitude*
                   exp( -((x-x00)*(x-x00)/2./sigma_x/sigma_x +
                          (y-y00)*(y-y00)/2./sigma_y/sigma_y) );
    }
    /**
     * @brief Return the value of the gaussian
     *
     * \f[
       f(x,y) = Ae^{-(\frac{(x-x_0)^2}{2\sigma_x^2} + \frac{(y-y_0)^2}{2\sigma_y^2})} 
       \f]
     * @param x x - coordinate
     * @param y y - coordinate
     * @param y z - coordinate
     *
     * @return gaussian
     */
    double operator()(double x, double y, double z)
    {
        return  amplitude*
                   exp( -((x-x00)*(x-x00)/2./sigma_x/sigma_x +
                          (y-y00)*(y-y00)/2./sigma_y/sigma_y) );
    }
  private:
    double  x00, y00, sigma_x, sigma_y, amplitude;

};
/**
 * @brief Functor returning a gaussian in x-direction
 * \f[
   f(x,y) = Ae^{-(\frac{(x-x_0)^2}{2\sigma_x^2}) } 
   \f]
 */
struct GaussianX
{
    /**
     * @brief Functor returning a gaussian in x 
     *
     * @param x0 x-center-coordinate
     * @param sigma_x x - variance
     * @param amp Amplitude
     */
    GaussianX( double x0, double sigma_x, double amp)
        :x00(x0), sigma_x(sigma_x), amplitude(amp){}
    /**
     * @brief Return the value of the gaussian
     *
     * \f[
       f(x,y) = Ae^{-(\frac{(x-x_0)^2}{2\sigma_x^2})} 
       \f]
     * @param x x - coordinate
     * @param y y - coordinate
     *
     * @return gaussian
     */
    double operator()(double x, double y)
    {
        return  amplitude* exp( -((x-x00)*(x-x00)/2./sigma_x/sigma_x ));
    }
  private:
    double  x00, sigma_x, amplitude;

}; 
/**
 * @brief Functor returning a gaussian in y-direction
 * \f[
   f(x,y) = Ae^{-\frac{(y-y_0)^2}{2\sigma_y^2}} 
   \f]
 */
struct GaussianY
{
    /**
     * @brief Functor returning a gaussian
     *
     * @param y0 y-center-coordinate
     * @param sigma_y y - variance 
     * @param amp Amplitude
     */
    GaussianY( double y0, double sigma_y, double amp)
        : y00(y0), sigma_y(sigma_y), amplitude(amp){}
    /**
     * @brief Return the value of the gaussian
     *
     * \f[
       f(x,y) = Ae^{-\frac{(y-y_0)^2}{2\sigma_y^2}} 
       \f]
     * @param x x - coordinate
     * @param y y - coordinate
     *
     * @return gaussian
     */
    double operator()(double x, double y)
    {
        return  amplitude*exp( -((y-y00)*(y-y00)/2./sigma_y/sigma_y) );
    }
  private:
    double  y00, sigma_y, amplitude;

};


/**
 * @brief Functor for a linear polynomial in x-direction
 * 
 * \f[ f(x,y) = a*x+b) \f]
 */
struct LinearX
{
    /**
     * @brief Construct with two coefficients
     *
     * @param a linear coefficient 
     * @param b constant coefficient
     */
    LinearX( double a, double b):a_(a), b_(b){}
    /**
     * @brief Return linear polynomial in x 
     *
     * @param x x - coordianate
     * @param y y - coordianate
     
     * @return result
     */
    double operator()( double x, double y){ return a_*x+b_;}
  private:
    double a_,b_;
};
/**
 * @brief Functor for a linear polynomial in y-direction
 * 
 * \f[ f(x,y) = a*y+b) \f]
 */
struct LinearY
{
    /**
     * @brief Construct with two coefficients
     *
     * @param a linear coefficient 
     * @param b constant coefficient
     */
    LinearY( double a, double b):a_(a), b_(b){}
    /**
     * @brief Return linear polynomial in x 
     *
     * @param x x - coordianate
     * @param y y - coordianate
     
     * @return result
     */
    double operator()( double x, double y){ return a_*y+b_;}
  private:
    double a_,b_;
};

/**
 * @brief Functor returning a Lamb dipole
 */
struct Lamb
{
    /**
     * @brief Functor returning a Lamb-dipole
     *
     * @param x0 x-center-coordinate
     * @param y0 y-center-coordinate
     * @param R radius of the dipole
     * @param U  speed of the dipole
     */
    Lamb(  double x0, double y0, double R, double U):R_(R), U_(U), x0_(x0), y0_(y0)
    {
        gamma_ = 3.83170597020751231561;
        lambda_ = gamma_/R;
        j_ = j0( gamma_);
        //std::cout << r_ <<u_<<x0_<<y0_<<lambda_<<gamma_<<j_<<std::endl;
    }
    /**
     * @brief Return the value of the dipole
     *
     * @param x x - coordinate
     * @param y y - coordinate
     *
     * @return Lamb
     */
    double operator() (double x, double y)
    {
        double radius = sqrt( (x-x0_)*(x-x0_) + (y-y0_)*(y-y0_));
        double theta = atan2( (y-y0_),(x-x0_));

        if( radius <= R_)
            return 2.*lambda_*U_*j1( lambda_*radius)/j_*cos( theta) ;
        return 0;
    }
    /**
     * @brief The total enstrophy of the dipole
     *
     * Analytic formula. True for periodic and dirichlet boundary conditions.
     * @return enstrophy
     */
    double enstrophy( ) { return M_PI*U_*U_*gamma_*gamma_;}

    /**
     * @brief The total energy of the dipole
     *
     * Analytic formula. True for periodic and dirichlet boundary conditions.
     * @return  energy
     */
    double energy() { return 2.*M_PI*R_*R_*U_*U_;}
  private:
    double R_, U_, x0_, y0_, lambda_, gamma_, j_;
};

struct Vortex
{
    /**
     * @brief 
     *
     * @param state 
     * @param R characteristic radius of dipole
     * @param vel_ratio u_drift/u_dipole
     * @param kz
     */
    Vortex( double x0, double y0, unsigned state, 
          double R,  double u_dipole, double kz = 0):
        x0_(x0), y0_(y0), s_(state),  R_(R), u_d( u_dipole), kz_(kz){
        g_[0] = 3.83187; //groundstate with uuu=2
        g_[1] = 3.83235; //groundstate with uuu=-1
        g_[2] = 7.016;
        c_[0] = 0.5;
        c_[1] = -1;
        c_[2] = -1;
    }
    double operator()( double x, double y)
    {
        double r = sqrt( (x-x0_)*(x-x0_)+(y-y0_)*(y-y0_));
        double theta = atan2( y-y0_, x-x0_);
        //std::cout << cos(theta)<<std::endl;
        double beta = sqrt(1-(c_[s_]));
        double norm = 1.2965125;

        if( r/R_<=1.)
            return u_d*(
                    r/R_*(1+beta*beta/g_[s_]/g_[s_]) 
                    - beta*beta/g_[s_]/g_[s_]*j1(g_[s_]*r/R_)/j1(g_[s_])
                    )*cos(theta)/norm;
        return u_d*cos(theta)
                  *beta*beta/g_[s_]/g_[s_]
                  *bessk1(beta*r/R_)/bessk1(beta)/norm;
    }
    double operator()( double x, double y, double z)
    {
        return this->operator()(x,y)*cos(kz_*z);
    }
    private:
    double bessk1(double x)
    // Returns the modified Bessel function K1(x) for positive real x.
    { 
        double y,ans;
        if (x <= 2.0) 
        {
            y=x*x/4.0; 
            ans = (log(x/2.0)*bessi1(x))+(1.0/x)*(1.0+y*(0.15443144 +
                       y*(-0.67278579+y*(-0.18156897+y*(-0.1919402e-1 +
                       y*(-0.110404e-2+y*(-0.4686e-4))))))); 
        } 
        else 
        { 
            y=2.0/x; 
            ans = (exp(-x)/sqrt(x))*(1.25331414+y*(0.23498619 +
                      y*(-0.3655620e-1+y*(0.1504268e-1+y*(-0.780353e-2 +
                      y*(0.325614e-2+y*(-0.68245e-3))))))); 
        } 
        return ans; 
    }
    double bessi1(double x) 
    //Returns the modified Bessel function I1(x) for any real x. 
    {   double ax,ans; 
        double y; 
        if ((ax=fabs(x)) < 3.75) 
        {
            y=x/3.75; 
            y*=y; 
            ans = ax*(0.5+y*(0.87890594+y*(0.51498869+y*(0.15084934 +
                       y*(0.2658733e-1+y*(0.301532e-2+y*0.32411e-3)))))); 
        } 
        else 
        { 
            y=3.75/ax; 
            ans = 0.2282967e-1+y*(-0.2895312e-1+y*(0.1787654e-1 -
                      y*0.420059e-2)); ans=0.39894228+y*(-0.3988024e-1+
                      y*(-0.362018e-2 +y*(0.163801e-2+y*(-0.1031555e-1+y*ans)))); 
            ans *= (exp(ax)/sqrt(ax)); 
        } 
        return x < 0.0 ? -ans : ans; 
    }
    double x0_, y0_;
    unsigned s_;
    double R_, c_[3], u_d;
    double g_[3];
    double kz_;
};
/**
 * @brief Exponential
 *
 * @tparam T value-type
 */
template< class T>
struct EXP 
{
    EXP( double amp = 1., double lambda = 1.): amp_(amp), lambda_(lambda){}
    __host__ __device__
    T operator() (const T& x) 
    { 
        return amp_*exp(lambda_*x);
    }
  private:
    double amp_, lambda_;
};
/**
 * @brief natural logarithm
 *
 * @tparam T value-type
 */
template < class T>
struct LN
{
    __host__ __device__
    T operator() (const T& x) 
    { 
        return log(x);
    }

};
/**
 * @brief Square root 
 *
 * @tparam T value-type
 */
template < class T>
struct SQRT
{
    __host__ __device__
    T operator() (const T& x) 
    { 
        return sqrt(x);
    }

};

/**
 * @brief Minmod function
 *
 * @tparam T value-type
 */
template < class T>
struct MinMod
{
    __host__ __device__
    T operator() ( T a1, T a2, T a3)
    {
        if( a1*a2 > 0) 
            if( a1*a3 > 0)
            {
                if( a1 > 0)
                    return min( a1, a2, a3, +1.);
                else
                    return min( a1, a2, a3, -1.);
            }
        return 0.;


    }
    private:
    __host__ __device__
    T min( T a1, T a2, T a3, T sign)
    {
        T temp = sign*a1;
        if( sign*a2 < temp)
            temp = sign*a2;
        if( sign*a3 < temp)
            temp = sign*a3;
        return sign*temp;

    }
};

/**
 * @brief Add a constant value
 *
 * @tparam T value type
 */
template <class T>
struct PLUS
{
    /**
     * @brief Construct
     *
     * @param value to be added 
     */
    PLUS( T value): x_(value){}
    /**
     * @brief Add a constant value
     *
     * @param x  the input
     *
     * @return  x + value
     */
    __host__ __device__
        T operator()(const T& x){ return x + x_;}
    private:
    T x_;
};

/**
 * @brief absolute value
 *
 * @tparam T value type
 */
template <class T>
struct ABS
{
    __host__ __device__
        T operator()(const T& x){ return fabs(x);}
};



///@}
} //namespace dg

#endif //_DG_FUNCTORS_CUH
