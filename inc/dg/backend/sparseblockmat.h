#pragma once

#include <cmath>
#include <thrust/host_vector.h>
#include <cusp/coo_matrix.h>
#include "exblas/exdot_serial.h"
#include "config.h"
#include "exceptions.h"
#include "tensor_traits.h"
#include "tensor_traits.h"

namespace dg
{

/**
* @brief Ell Sparse Block Matrix format
*
* @ingroup sparsematrix
* The basis of this format is the ell sparse matrix format, i.e. a format
where the number of entries per line is fixed.
* The clue is that instead of a values array we use an index array with
indices into a data array that contains the actual blocks. This safes storage if the number
of nonrecurrent blocks is small.
The indices and blocks are those of a one-dimensional problem. When we want
to apply the matrix to a multidimensional vector we can multiply it by
Kronecker deltas of the form
\f[ M = \begin{pmatrix}
B & C &   &   &   & \\
A & B & C &   &   & \\
  & A & B & C &   & \\
  &   & A & B & C & \\
  &   &   &...&   &
  \end{pmatrix}\rightarrow
\text{data} = ( A, B, C, 0)\quad \text{cols_idx} = ( 0,0,1,0,1,2,1,2,3,2,3,4,...)
\quad \text{data_idx} = ( 3,1,2,0,1,2,0,1,2,0,1,2,...)\f]
where \f$A,\ B,\ C,\ 0\f$ are \f$n\times n\f$ block matrices. The 0 is used
for padding in order to keep the number of elements per line constant as 3
(in this example \c blocks_per_line=3, \c num_different_blocks=4).
The matrix M has \c num_rows rows and \c num_cols columns of blocks.
\f[  1_\mathrm{left}\otimes M \otimes 1_\mathrm{right}\f]
where \f$ 1\f$ are diagonal matrices of variable size and \f$ M\f$ is our
one-dimensional matrix.
*/
template<class value_type>
struct EllSparseBlockMat
{
    ///@brief default constructor does nothing
    EllSparseBlockMat() = default;
    /**
    * @brief Allocate storage
    *
    * @param num_block_rows number of rows \c num_rows. Each row contains blocks.
    * @param num_block_cols number of columns \c num_cols.
    * @param num_blocks_per_line number of blocks in each line
    * @param num_different_blocks number of nonrecurrent blocks
    * @param n each block is of size nxn
    */
    EllSparseBlockMat( int num_block_rows, int num_block_cols,
                  int num_blocks_per_line, int num_different_blocks, int n):
        data(num_different_blocks*n*n),
        cols_idx( num_block_rows*num_blocks_per_line),
        data_idx(cols_idx.size()), right_range(2),
        num_rows(num_block_rows),
        num_cols(num_block_cols),
        blocks_per_line(num_blocks_per_line),
        n(n), left_size(1), right_size(1)
        {
            right_range[0]=0;
            right_range[1]=1;
        }
    /// total number of rows is \c num_rows*n*left_size*right_size
    int total_num_rows()const{
        return num_rows*n*left_size*right_size;
    }
    /// total number of columns is \c num_cols*n*left_size*right_size
    int total_num_cols()const{
        return num_cols*n*left_size*right_size;
    }

    /**
     * @brief Convert to a cusp coordinate sparse matrix
     *
     * @return The matrix in coo sparse matrix format
     */
    cusp::coo_matrix<int, value_type, cusp::host_memory> asCuspMatrix() const;

    /**
    * @brief Apply the matrix to a vector
    *
    * \f[  y= \alpha M x + \beta y\f]
    * @param alpha multiplies input
    * @param x input
    * @param beta premultiplies output
    * @param y output may not alias input
    */
    void symv(SharedVectorTag, SerialTag, value_type alpha, const value_type* RESTRICT x, value_type beta, value_type* RESTRICT y) const;

    ///@brief Sets right_range from 0 to right_size
    void set_default_range(){
        right_range[0]=0;
        right_range[1]=right_size;
    }
    /**
    * @brief Display internal data to a stream
    *
    * @param os the output stream
    * @param show_data if true, displays the whole data vector
    */
    void display( std::ostream& os = std::cout, bool show_data = false) const;

    thrust::host_vector<value_type> data;//!< The data array is of size n*n*num_different_blocks and contains the blocks. The first block is contained in the first n*n elements, then comes the next block, etc.
    thrust::host_vector<int> cols_idx; //!< is of size num_rows*num_blocks_per_line and contains the column indices % n into the vector
    thrust::host_vector<int> data_idx; //!< has the same size as cols_idx and contains indices into the data array, i.e. the block number
    thrust::host_vector<int> right_range; //!< range, [0,right_size] per default (can be used to apply the matrix to only part of the right rows
    int num_rows; //!< number of block rows, each row contains blocks
    int num_cols; //!< number of block columns
    int blocks_per_line; //!< number of blocks in each line
    int n;  //!< each block has size n*n
    int left_size; //!< size of the left Kronecker delta
    int right_size; //!< size of the right Kronecker delta (is e.g 1 for a x - derivative)

};


//four classes/files play together in mpi distributed EllSparseBlockMat
//CooSparseBlockMat and kernels, NearestNeighborComm, RowColDistMat
//and the creation functions in mpi_derivatives.h
/**
* @brief Coo Sparse Block Matrix format
*
* @ingroup sparsematrix
* The basis of this format is the well-known coordinate sparse matrix format.
* The clue is that instead of a values array we use an index array with
indices into a data array that contains the actual blocks. This safes storage if the number
of nonrecurrent blocks is small.
\f[
M = \begin{pmatrix}
A &   &  B&  & & \\
  & C &   &  & & \\
  &   &   &  & & \\
  & A &   &  & B & C
\end{pmatrix}
\rightarrow
\text{data}=(A,B,C)\quad \text{rows_idx} = ( 0,0,1,3,3,3)
\quad\text{cols_idx} = (0,2,1,1,4,5)
\f]
where \f$A,\ B,\ C,\ 0\f$ are \f$n\times n\f$ block matrices.
The matrix M in this example has \c num_rows=4, \c num_cols=6, \c num_entries=6.

The indices and blocks are those of a one-dimensional problem. When we want
to apply the matrix to a multidimensional vector we can multiply it by
Kronecker deltas of the form
\f[  1_\mathrm{left}\otimes M \otimes 1_\mathrm{right}\f]
where \f$ 1\f$ are diagonal matrices of variable size and \f$ M\f$ is our
one-dimensional matrix.
@note This matrix type is used for the computation of boundary points in
an mpi - distributed \c EllSparseBlockMat
@attention We assume that the input vector in \c symv has the layout
that is given by the Buffer vectors in \c dg::NearestNeighborComm
@sa \c dg::NearestNeighborComm
*/
template<class value_type>
struct CooSparseBlockMat
{
    ///@brief default constructor does nothing
    CooSparseBlockMat() = default;
    /**
    * @brief Allocate storage
    *
    * @param num_block_rows number of rows. Each row contains blocks.
    * @param num_block_cols number of columns.
    * @param n each block is of size nxn
    * @param left_size size of the left_size Kronecker delta
    * @param right_size size of the right_size Kronecker delta
    */
    CooSparseBlockMat( int num_block_rows, int num_block_cols, int n, int left_size, int right_size):
        num_rows(num_block_rows), num_cols(num_block_cols), num_entries(0),
        n(n),left_size(left_size), right_size(right_size){}

    /**
    * @brief Convenience function to assemble the matrix
    *
    * appends the given matrix entry to the existing matrix
    * @param row row index
    * @param col column index
    * @param element new block
    */
    void add_value( int row, int col, const thrust::host_vector<value_type>& element)
    {
        assert( (int)element.size() == n*n);
        int index = data.size()/n/n;
        data.insert( data.end(), element.begin(), element.end());
        rows_idx.push_back(row);
        cols_idx.push_back(col);
        data_idx.push_back( index );

        num_entries++;
    }

    /// total number of rows is \c num_rows*n*left_size*right_size
    int total_num_rows()const{
        return num_rows*n*left_size*right_size;
    }
    /// total number of columns is \c num_cols*n*left_size*right_size
    int total_num_cols()const{
        return num_cols*n*left_size*right_size;
    }



    /**
    * @brief Apply the matrix to a vector
    *
    * @param alpha multiplies input
    * @param x input
    * @param beta premultiplies output (cannot be anything other than 1, the given value is ignored)
    * @param y output may not alias input
    * @attention beta == 1 (anything else is ignored)
    */
    void symv(SharedVectorTag, SerialTag, value_type alpha, const value_type** x, value_type beta, value_type* RESTRICT y) const;
    /**
    * @brief Display internal data to a stream
    *
    * @param os the output stream
    * @param show_data if true, displays the whole data vector
    */
    void display(std::ostream& os = std::cout, bool show_data = false) const;

    thrust::host_vector<value_type> data;//!< The data array is of size \c n*n*num_different_blocks and contains the blocks
    thrust::host_vector<int> cols_idx; //!< is of size \c num_entries and contains the column indices
    thrust::host_vector<int> rows_idx; //!< is of size \c num_entries and contains the row indices
    thrust::host_vector<int> data_idx; //!< is of size \c num_entries and contains indices into the data array
    int num_rows; //!< number of rows
    int num_cols; //!< number of columns
    int num_entries; //!< number of entries in the matrix
    int n;  //!< each block has size n*n
    int left_size; //!< size of the left Kronecker delta
    int right_size; //!< size of the right Kronecker delta (is e.g 1 for a x - derivative)
};
///@cond

template<class value_type>
void EllSparseBlockMat<value_type>::symv(SharedVectorTag, SerialTag, value_type alpha, const value_type* RESTRICT x, value_type beta, value_type* RESTRICT y) const
{
    //simplest implementation (all optimization must respect the order of operations)
    for( int s=0; s<left_size; s++)
    for( int i=0; i<num_rows; i++)
    for( int k=0; k<n; k++)
    for( int j=right_range[0]; j<right_range[1]; j++)
    {
        int I = ((s*num_rows + i)*n+k)*right_size+j;
        // if y[I] isnan then even beta = 0 does not make it 0
        y[I] = beta == 0 ? (value_type)0 : y[I]*beta;
        for( int d=0; d<blocks_per_line; d++)
        {
            value_type temp = 0;
            for( int q=0; q<n; q++) //multiplication-loop
                temp = DG_FMA( data[ (data_idx[i*blocks_per_line+d]*n + k)*n+q],
                            x[((s*num_cols + cols_idx[i*blocks_per_line+d])*n+q)*right_size+j],
                            temp);
            y[I] = DG_FMA( alpha,temp, y[I]);
        }
    }
}
template<class value_type>
cusp::coo_matrix<int, value_type, cusp::host_memory> EllSparseBlockMat<value_type>::asCuspMatrix() const
{
    cusp::array1d<value_type, cusp::host_memory> values;
    cusp::array1d<int, cusp::host_memory> row_indices;
    cusp::array1d<int, cusp::host_memory> column_indices;
    for( int s=0; s<left_size; s++)
    for( int i=0; i<num_rows; i++)
    for( int k=0; k<n; k++)
    for( int j=right_range[0]; j<right_range[1]; j++)
    {
        int I = ((s*num_rows + i)*n+k)*right_size+j;
        for( int d=0; d<blocks_per_line; d++)
        for( int q=0; q<n; q++) //multiplication-loop
        {
            row_indices.push_back(I);
            column_indices.push_back(
                ((s*num_cols + cols_idx[i*blocks_per_line+d])*n+q)*right_size+j);
            values.push_back(data[ (data_idx[i*blocks_per_line+d]*n + k)*n+q]);
        }
    }
    cusp::coo_matrix<int, value_type, cusp::host_memory> A(
        total_num_rows(), total_num_cols(), values.size());
    A.row_indices = row_indices;
    A.column_indices = column_indices;
    A.values = values;
    return A;
}

template<class value_type>
void CooSparseBlockMat<value_type>::symv( SharedVectorTag, SerialTag, value_type alpha, const value_type** x, value_type beta, value_type* RESTRICT y) const
{
    if( num_entries==0)
        return;
    if( beta!= 1 )
        std::cerr << "Beta != 1 yields wrong results in CooSparseBlockMat!! Beta = "<<beta<<"\n";
    assert( beta == 1 && "Beta != 1 yields wrong results in CooSparseBlockMat!!");
    // In fact, Beta is ignored in the following code

    //simplest implementation (sums block by block)
    for( int s=0; s<left_size; s++)
    for( int k=0; k<n; k++)
    for( int j=0; j<right_size; j++)
    for( int i=0; i<num_entries; i++)
    {
        value_type temp = 0;
        for( int q=0; q<n; q++) //multiplication-loop
            temp = DG_FMA( data[ (data_idx[i]*n + k)*n+q],
                    //x[((s*num_cols + cols_idx[i])*n+q)*right_size+j],
                    x[cols_idx[i]][(q*left_size +s )*right_size+j],
                    temp);
        int I = ((s*num_rows + rows_idx[i])*n+k)*right_size+j;
        y[I] = DG_FMA( alpha,temp, y[I]);
    }
}

template<class T>
void EllSparseBlockMat<T>::display( std::ostream& os, bool show_data ) const
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
    os << "Column indices: \n";
    for( int i=0; i<num_rows; i++)
    {
        for( int d=0; d<blocks_per_line; d++)
            os << cols_idx[i*blocks_per_line + d] <<" ";
        os << "\n";
    }
    os << "\n Data indices: \n";
    for( int i=0; i<num_rows; i++)
    {
        for( int d=0; d<blocks_per_line; d++)
            os << data_idx[i*blocks_per_line + d] <<" ";
        os << "\n";
    }
    if(show_data)
    {
        os << "\n Data: \n";
        for( unsigned i=0; i<data.size()/n/n; i++)
            for(unsigned k=0; k<n*n; k++)
            {
                dg::exblas::udouble res;
                res.d = data[i*n*n+k];
                os << "idx "<<i<<" "<<res.d <<"\t"<<res.i<<"\n";
            }
    }
    os << std::endl;
}

template<class value_type>
void CooSparseBlockMat<value_type>::display( std::ostream& os, bool show_data) const
{
    os << "Data array has   "<<data.size()/n/n<<" blocks of size "<<n<<"x"<<n<<"\n";
    os << "num_rows         "<<num_rows<<"\n";
    os << "num_cols         "<<num_cols<<"\n";
    os << "num_entries      "<<num_entries<<"\n";
    os << "n                "<<n<<"\n";
    os << "left_size             "<<left_size<<"\n";
    os << "right_size            "<<right_size<<"\n";
    os << "row\tcolumn\tdata:\n";
    for( int i=0; i<num_entries; i++)
        os << rows_idx[i]<<"\t"<<cols_idx[i] <<"\t"<<data_idx[i]<<"\n";
    if(show_data)
    {
        os << "\n Data: \n";
        for( unsigned i=0; i<data.size()/n/n; i++)
            for(unsigned k=0; k<n*n; k++)
            {
                dg::exblas::udouble res;
                res.d = data[i*n*n+k];
                os << "idx "<<i<<" "<<res.d <<"\t"<<res.i<<"\n";
            }
    }
    os << std::endl;

}

///@endcond
///@addtogroup dispatch
///@{
template <class T>
struct TensorTraits<EllSparseBlockMat<T> >
{
    using value_type  = T;
    using tensor_category = SparseBlockMatrixTag;
};
template <class T>
struct TensorTraits<CooSparseBlockMat<T> >
{
    using value_type  = T;
    using tensor_category = SparseBlockMatrixTag;
};
///@}

} //namespace dg
