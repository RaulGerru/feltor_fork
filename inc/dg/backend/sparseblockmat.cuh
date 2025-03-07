#pragma once

#include <thrust/device_vector.h>
//#include <cusp/system/cuda/utils.h>
#include "sparseblockmat.h"

namespace dg
{
#if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CPP
template<class value_type>
using EllSparseBlockMatDevice = EllSparseBlockMat<value_type>;
template<class value_type>
using CooSparseBlockMatDevice = CooSparseBlockMat<value_type>;
#else

/**
* @brief Ell Sparse Block Matrix format device version
*
* @ingroup sparsematrix
* This class holds a copy of a EllSparseBlockMat on the device, which may
be gpu, cpu or omp depending on the THRUST_DEVICE_SYSTEM macro. It can be applied
to device vectors and does the same thing as the host version

@copydetails EllSparseBlockMat
*/
template<class value_type>
struct EllSparseBlockMatDevice
{
    EllSparseBlockMatDevice() = default;
    /**
    * @brief Allocate storage
    *
    * A device matrix has to be constructed from a host matrix. It simply
        copies all internal data of the host matrix to the device
        @param src  source on the host
    */
    EllSparseBlockMatDevice( const EllSparseBlockMat<value_type>& src)
    {
        data = src.data;
        cols_idx = src.cols_idx, data_idx = src.data_idx;
        num_rows = src.num_rows, num_cols = src.num_cols, blocks_per_line = src.blocks_per_line;
        n = src.n, left_size = src.left_size, right_size = src.right_size;
        right_range = src.right_range;
    }
    /**
    * @brief Display internal data to a stream
    *
    * @param os the output stream
    */
    void display( std::ostream& os = std::cout) const;
    int total_num_rows()const{
        return num_rows*n*left_size*right_size;
    }
    int total_num_cols()const{
        return num_cols*n*left_size*right_size;
    }

    /**
    * @brief Apply the matrix to a vector
    * \f[  y= \alpha M x + \beta y\f]
    * @tparam Vector a valid Vector type
    * @param alpha multiplies input
    * @param x input
    * @param beta premultiplies output
    * @param y output may not alias input
    */
    void symv(SharedVectorTag, CudaTag, value_type alpha, const value_type* x, value_type beta, value_type* y) const;
#ifdef _OPENMP
    void symv(SharedVectorTag, OmpTag, value_type alpha, const value_type* x, value_type beta, value_type* y) const;
#endif //_OPENMP
    void launch_multiply_kernel(value_type alpha, const value_type* x, value_type beta, value_type* y) const;

    thrust::device_vector<value_type> data;
    thrust::device_vector<int> cols_idx, data_idx;
    thrust::device_vector<int> right_range; // behold that right_size != right_range[1]-right_range[0] in general
    int num_rows, num_cols, blocks_per_line;
    int n;
    int left_size, right_size;
};


/**
* @brief Coo Sparse Block Matrix format device version
*
* @ingroup sparsematrix
* This class holds a copy of a CooSparseBlockMat on the device, which may
be gpu or omp depending on the THRUST_DEVICE_SYSTEM macro. It does the same thing as the host version with the difference that it applies to device vectors.

@copydetails CooSparseBlockMat
*/
template<class value_type>
struct CooSparseBlockMatDevice
{
    CooSparseBlockMatDevice() = default;
    /**
    * @brief Allocate storage
    *
    * A device matrix has to be constructed from a host matrix. It simply
        copies all internal data of the host matrix to the device
        @param src  source on the host
    */
    CooSparseBlockMatDevice( const CooSparseBlockMat<value_type>& src)
    {
        data = src.data;
        rows_idx = src.rows_idx, cols_idx = src.cols_idx, data_idx = src.data_idx;
        num_rows = src.num_rows, num_cols = src.num_cols, num_entries = src.num_entries;
        n = src.n, left_size = src.left_size, right_size = src.right_size;
    }
    /**
    * @brief Display internal data to a stream
    *
    * @param os the output stream
    */
    void display(std::ostream& os = std::cout) const;
    int total_num_rows()const{
        return num_rows*n*left_size*right_size;
    }
    int total_num_cols()const{
        return num_cols*n*left_size*right_size;
    }

    /**
    * @brief Apply the matrix to a vector
    *
    * @param alpha multiplies input
    * @param x input
    * @param beta premultiplies output
    * @param y output may not equal input
    */
    void symv(SharedVectorTag, CudaTag, value_type alpha, const value_type** x, value_type beta, value_type* y) const;
#ifdef _OPENMP
    void symv(SharedVectorTag, OmpTag, value_type alpha, const value_type** x, value_type beta, value_type* y) const;
#endif //_OPENMP

    void launch_multiply_kernel(value_type alpha, const value_type** x, value_type beta, value_type* y) const;

    thrust::device_vector<value_type> data;
    thrust::device_vector<int> cols_idx, rows_idx, data_idx;
    int num_rows, num_cols, num_entries;
    int n, left_size, right_size;
};

///@cond
template<class value_type>
inline void EllSparseBlockMatDevice<value_type>::symv(SharedVectorTag, CudaTag,
        value_type alpha, const value_type* x, value_type beta, value_type* y) const
{
    launch_multiply_kernel( alpha, x, beta, y);
}
template<class value_type>
inline void CooSparseBlockMatDevice<value_type>::symv(SharedVectorTag, CudaTag,
        value_type alpha, const value_type** x, value_type beta, value_type* y) const
{
    if( num_entries==0)
        return;
    launch_multiply_kernel( alpha, x, beta, y);
}
#ifdef _OPENMP
template<class value_type>
inline void EllSparseBlockMatDevice<value_type>::symv(SharedVectorTag, OmpTag, value_type alpha, const value_type* x, value_type beta, value_type* y) const
{
    if( !omp_in_parallel())
    {
        #pragma omp parallel
        {
            launch_multiply_kernel(alpha, x, beta, y);
        }
        return;
    }
    launch_multiply_kernel(alpha, x, beta, y);
}

template<class value_type>
inline void CooSparseBlockMatDevice<value_type>::symv(SharedVectorTag, OmpTag, value_type alpha, const value_type** x, value_type beta, value_type* y) const
{
    if( num_entries==0)
        return;
    assert( beta == 1 && "Beta != 1 yields wrong results in CooSparseBlockMat!!");
    // In fact, Beta is ignored in the following code
    if( !omp_in_parallel())
    {
        #pragma omp parallel
        {
            launch_multiply_kernel(alpha, x, beta, y);
        }
        return;
    }
    launch_multiply_kernel(alpha, x, beta, y);
}
#endif //_OPENMP

template<class value_type>
void EllSparseBlockMatDevice<value_type>::display( std::ostream& os) const
{
    os << "Data array has   "<<data.size()/n/n<<" blocks of size "<<n<<"x"<<n<<"\n";
    os << "num_rows         "<<num_rows<<"\n";
    os << "num_cols         "<<num_cols<<"\n";
    os << "blocks_per_line  "<<blocks_per_line<<"\n";
    os << "n                "<<n<<"\n";
    os << "left_size             "<<left_size<<"\n";
    os << "right_size            "<<right_size<<"\n";
    os << "right_range_0         "<<right_range[0]<<"\n";
    os << "right_range_1         "<<right_range[1]<<"\n";
    os << " Columns: \n";
    for( int i=0; i<num_rows; i++)
    {
        for( int d=0; d<blocks_per_line; d++)
            os << cols_idx[i*blocks_per_line + d] <<" ";
        os << "\n";
    }
    os << "\n Data: \n";
    for( int i=0; i<num_rows; i++)
    {
        for( int d=0; d<blocks_per_line; d++)
            os << data_idx[i*blocks_per_line + d] <<" ";
        os << "\n";
    }
    os << std::endl;

}
template<class value_type>
void CooSparseBlockMatDevice<value_type>::display( std::ostream& os) const
{
    os << "Data array has   "<<data.size()/n/n<<" blocks of size "<<n<<"x"<<n<<"\n";
    os << "num_rows         "<<num_rows<<"\n";
    os << "num_cols         "<<num_cols<<"\n";
    os << "num_entries      "<<num_entries<<"\n";
    os << "n                "<<n<<"\n";
    os << "left_size             "<<left_size<<"\n";
    os << "right_size            "<<right_size<<"\n";
    os << " Columns: \n";
    for( int i=0; i<num_entries; i++)
        os << cols_idx[i] <<" ";
    os << "\n Rows: \n";
    for( int i=0; i<num_entries; i++)
        os << rows_idx[i] <<" ";
    os << "\n Data: \n";
    for( int i=0; i<num_entries; i++)
        os << data_idx[i] <<" ";
    os << std::endl;

}

///@endcond
///@addtogroup dispatch
///@{
template <class T>
struct TensorTraits<EllSparseBlockMatDevice<T> >
{
    using value_type  = T;
    using tensor_category = SparseBlockMatrixTag;
};
template <class T>
struct TensorTraits<CooSparseBlockMatDevice<T> >
{
    using value_type  = T;
    using tensor_category = SparseBlockMatrixTag;
};
///@}
#endif // THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CPP
} //namespace dg
#if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
#include "sparseblockmat_gpu_kernels.cuh"
#elif THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_OMP
#include "sparseblockmat_omp_kernels.h"
#endif

