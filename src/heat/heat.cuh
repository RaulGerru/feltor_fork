#pragma once

#include "dg/algorithm.h"
#include "parameters.h"
#include "dg/geometries/geometries.h"

namespace heat
{

template< class Geometry, class IMatrix, class Matrix, class container>
struct Implicit
{
    Implicit( const Geometry& g, Parameters p, dg::geo::solovev::Parameters gp):
        p(p),
        m_ds(dg::geo::createSolovevField( gp), g, p.bcx, p.bcy,
              dg::geo::PsiLimiter(
                dg::geo::solovev::Psip(gp), gp.psipmaxlim),
              dg::forward,
              gp.rk4eps, p.mx, p.my),
        m_ellipticForward( g, dg::normed, dg::forward),
        m_ellipticBackward( g, dg::normed, dg::backward),
        m_ellipticPerp( g, dg::normed, dg::centered)
    {
        auto c = dg::geo::createSolovevField(gp);
        dg::geo::BinaryVectorLvl0 bhat = dg::geo::createBHat( c);
        dg::SparseTensor<container> bb, hh;
        bb = dg::geo::createAlignmentTensor( bhat, g);
        m_ellipticForward.set_chi( bb);
        m_ellipticBackward.set_chi( bb);
        hh = dg::geo::createProjectionTensor( bhat, g);
        m_ellipticPerp.set_chi( hh);
    }
    void operator()( double t, const container& x, container& y)
    {
        if (p.p_diff == "adjoint")    {
            m_ds.symv( p.nu_parallel, x, 0., y);
        }
        else if (p.p_diff == "elliptic")    {
            dg::blas2::symv( m_ellipticForward, x, y);
            dg::blas2::symv( -0.5*p.nu_parallel, m_ellipticBackward, x, -0.5*p.nu_parallel, y);
            //laplace is negative
        }
        else
        {
            dg::blas1::scal( y,0.);
        }
        if( p.nu_perp != 0)
            dg::blas2::symv( -p.nu_perp, m_ellipticPerp, x, 1., y);

    }
    const container& weights(){return m_ds.weights();}
    const container& inv_weights(){return m_ds.inv_weights();}
    const container& precond(){return m_ds.precond();}
  private:
    const heat::Parameters p;
    dg::geo::DS<Geometry, IMatrix, Matrix, container> m_ds;
    dg::Elliptic3d<Geometry, Matrix, container> m_ellipticForward, m_ellipticBackward, m_ellipticPerp;

};

struct Quantities{
    double energy = 0., energy_diffusion = 0.; // int T dV
    double entropy = 0., entropy_diffusion = 0.; // int T^2/2 dV
    double Dpar [2] = {0,0};
    double Dperp [2] = {0,0};
};

template< class Geometry, class IMatrix, class Matrix, class container >
struct Explicit
{
    Explicit( const Geometry& grid,
              heat::Parameters p,
              dg::geo::solovev::Parameters gp);

    const dg::geo::DS<Geometry,IMatrix,Matrix,container>& ds(){
        return m_ds;
    }
    void operator()( double t, const container& y, container& yp);
    const Quantities& quantities() const{
        return m_q;
    }
    void energies( const container& y);
  private:
    container chi, omega, lambda;
    container m_invB, m_divb;
//     ,pupil;
    const container  one;
    const container w3d, v3d;

    //matrices and solvers
    dg::geo::DS<Geometry,IMatrix,Matrix,container> m_ds;

    const heat::Parameters p;
    Quantities m_q;
    dg::Elliptic3d<Geometry, Matrix, container> m_ellipticForward, m_ellipticBackward, m_ellipticPerp;

};

template<class Geometry, class IMatrix, class Matrix, class container>
Explicit<Geometry,IMatrix,Matrix,container>::Explicit( const Geometry& g, heat::Parameters p, dg::geo::solovev::Parameters gp):
    chi( dg::evaluate( dg::one, g)), omega(chi),  lambda(chi),
    one( dg::evaluate( dg::one, g)),
    w3d( dg::create::volume(g)), v3d( dg::create::inv_volume(g)),
    m_ds( dg::geo::createSolovevField(gp), g, p.bcx, p.bcy, dg::geo::PsiLimiter( dg::geo::solovev::Psip(gp), gp.psipmaxlim), dg::forward),
    p(p),
    m_ellipticForward( g, dg::normed, dg::forward),
    m_ellipticBackward(g, dg::normed, dg::backward),
    m_ellipticPerp(g, dg::normed, dg::centered)
{
    //----------------------------init fields----------------------
    auto c = dg::geo::createSolovevField(gp);
    dg::assign(  dg::pullback(dg::geo::InvB(c), g), m_invB);
    dg::assign(  dg::pullback(dg::geo::Divb(c), g), m_divb);
    dg::geo::BinaryVectorLvl0 bhat = dg::geo::createBHat( c);
    dg::SparseTensor<container> bb, hh;
    bb = dg::geo::createAlignmentTensor( bhat, g);
    m_ellipticForward.set_chi( bb);
    m_ellipticBackward.set_chi( bb);
    hh = dg::geo::createProjectionTensor( bhat, g);
    m_ellipticPerp.set_chi(hh);
}

template<class G,class I, class M, class V>
void Explicit<G,I,M,V>::energies( const V& y)
{
    m_q.energy  = dg::blas2::dot( one, w3d, y);
    m_q.entropy = 0.5*dg::blas2::dot( y, w3d, y);
    //Compute rhs of energy theorem
    if (p.p_diff == "adjoint")    {
        m_ds.symv( y, chi);
    }
    else if (p.p_diff == "non-adjoint")    {
        m_ds.ds( dg::centered, y, chi);
        dg::blas1::pointwiseDot(m_divb, chi, chi); // (Div b) ds T
        m_ds.dss(1., y, 1., chi);                  // ds^2 T
    }
    else if (p.p_diff == "elliptic")    {
        dg::blas2::symv(m_ellipticForward, y, chi);
        dg::blas2::symv(-0.5, m_ellipticBackward, y, -0.5, chi);
    }
    m_q.Dpar[0] = p.nu_parallel*dg::blas2::dot(one, w3d, chi);
    m_q.Dpar[1] = p.nu_parallel*dg::blas2::dot(y,   w3d, chi);
    if( p.nu_perp != 0)
    {
        dg::blas2::symv( -1., m_ellipticPerp, y, 0., chi);
        m_q.Dperp[0] = p.nu_perp*dg::blas2::dot( one, w3d, chi);
        m_q.Dperp[1] = p.nu_perp*dg::blas2::dot( y,   w3d, chi);
    }
    m_q.energy_diffusion  = m_q.Dpar[0] + m_q.Dperp[0];
    m_q.entropy_diffusion = m_q.Dpar[1] + m_q.Dperp[1];
}

template<class G, class I, class Matrix, class container>
void Explicit<G,I,Matrix,container>::operator()( double tt, const container& y, container& yp)
{
    // y := T - 1 or T
    dg::Timer t;
    t.tic();
    dg::blas1::scal(yp, 0.);
    //-----------------------parallel dissi------------------------
    if (p.p_diff == "non-adjoint")    {
        m_ds.dss(p.nu_parallel, y, 1., yp);  // ds^2 T
        m_ds.ds( dg::centered, y, lambda);   // (Div b) ds T
        dg::blas1::pointwiseDot( p.nu_parallel, m_divb, lambda, 1., yp);
    }
    t.toc();
#ifdef MPI_VERSION
    int rank;
    MPI_Comm_rank( MPI_COMM_WORLD, &rank);
    if(rank==0)
#endif
    std::cout << "One rhs took "<<t.diff()<<"s\n";
}

} //namespace heat

