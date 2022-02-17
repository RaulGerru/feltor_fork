<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.3">
  <compound kind="file">
    <name>accumulate.cuh</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>accumulate_8cuh.html</filename>
    <namespace>dg::exblas</namespace>
    <namespace>dg::exblas::gpu</namespace>
    <member kind="function" static="yes">
      <type>static __device__ void</type>
      <name>Accumulate</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>ae8560d81d2a195d7fae6fee57db801f0</anchor>
      <arglist>(int64_t *accumulator, double x, int stride=1)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static __device__ int</type>
      <name>Normalize</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>a93eb209e12fbdddcd2f38555495f22d3</anchor>
      <arglist>(int64_t *accumulator, int &amp;imin, int &amp;imax, int stride=1)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static __device__ double</type>
      <name>Round</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>a0e48bd1ab779211fb7d10b9437c26a30</anchor>
      <arglist>(int64_t *accumulator)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>accumulate.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>accumulate_8h.html</filename>
    <namespace>dg::exblas</namespace>
    <namespace>dg::exblas::cpu</namespace>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>Accumulate</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>aeb5ba33e37102969daf45883c7582d0d</anchor>
      <arglist>(int64_t *accumulator, double x)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static bool</type>
      <name>Normalize</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>af9a857ad6a802d04c4b33f3ca7af6bf3</anchor>
      <arglist>(int64_t *accumulator, int &amp;imin, int &amp;imax)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static double</type>
      <name>Round</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>a2f7276f907e32c14eb50f7cf1f9c6142</anchor>
      <arglist>(int64_t *accumulator)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>exdot_cuda.cuh</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>exdot__cuda_8cuh.html</filename>
    <includes id="accumulate_8cuh" name="accumulate.cuh" local="yes" imported="no">accumulate.cuh</includes>
    <namespace>dg::exblas</namespace>
    <member kind="function">
      <type>__host__ void</type>
      <name>exdot_gpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a48b3fa9c609028c5a26e0280b35fbaa6</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *d_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>__host__ void</type>
      <name>exdot_gpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a95d1caab696c6453b99cdf9ab52daec8</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *d_superacc, int *status)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>exdot_omp.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>exdot__omp_8h.html</filename>
    <includes id="accumulate_8h" name="accumulate.h" local="yes" imported="no">accumulate.h</includes>
    <namespace>dg::exblas</namespace>
    <member kind="function">
      <type>void</type>
      <name>exdot_omp</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a77b3aef855b6280b5a2fae8e89216e09</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_omp</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>aa6a5971251a01870e26f2c769fef613d</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>exdot_serial.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>exdot__serial_8h.html</filename>
    <includes id="accumulate_8h" name="accumulate.h" local="yes" imported="no">accumulate.h</includes>
    <class kind="union">dg::exblas::udouble</class>
    <namespace>dg::exblas</namespace>
    <member kind="function">
      <type>void</type>
      <name>exdot_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a020aba11430835ed502b897fe94eab6d</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a5511b744a196e5830b9094b371832bbe</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>mpi_accumulate.h</name>
    <path>/home/matthias/Projekte/feltor/inc/dg/backend/exblas/</path>
    <filename>mpi__accumulate_8h.html</filename>
    <includes id="accumulate_8h" name="accumulate.h" local="yes" imported="no">accumulate.h</includes>
    <namespace>dg::exblas</namespace>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>mpi_reduce_communicator</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a69e81c6d1be55e0ad3f58c791f711315</anchor>
      <arglist>(MPI_Comm comm, MPI_Comm *comm_mod, MPI_Comm *comm_mod_reduce)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>reduce_mpi_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>af724256742492b85f5a729c9699c398e</anchor>
      <arglist>(unsigned num_superacc, int64_t *in, int64_t *out, MPI_Comm comm, MPI_Comm comm_mod, MPI_Comm comm_mod_reduce)</arglist>
    </member>
  </compound>
  <compound kind="union">
    <name>dg::exblas::udouble</name>
    <filename>uniondg_1_1exblas_1_1udouble.html</filename>
    <member kind="variable">
      <type>double</type>
      <name>d</name>
      <anchorfile>uniondg_1_1exblas_1_1udouble.html</anchorfile>
      <anchor>ad18ae17400d59bd70c2de1ed9dd8db43</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int64_t</type>
      <name>i</name>
      <anchorfile>uniondg_1_1exblas_1_1udouble.html</anchorfile>
      <anchor>a14a7a3c5dd02aed2a272ccef78391632</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg::exblas</name>
    <filename>namespacedg_1_1exblas.html</filename>
    <namespace>dg::exblas::cpu</namespace>
    <namespace>dg::exblas::gpu</namespace>
    <class kind="union">dg::exblas::udouble</class>
    <member kind="function">
      <type>__host__ void</type>
      <name>exdot_gpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a48b3fa9c609028c5a26e0280b35fbaa6</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *d_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>__host__ void</type>
      <name>exdot_gpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a95d1caab696c6453b99cdf9ab52daec8</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *d_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_omp</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a77b3aef855b6280b5a2fae8e89216e09</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_omp</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>aa6a5971251a01870e26f2c769fef613d</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a020aba11430835ed502b897fe94eab6d</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>exdot_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a5511b744a196e5830b9094b371832bbe</anchor>
      <arglist>(unsigned size, PointerOrValue1 x1_ptr, PointerOrValue2 x2_ptr, PointerOrValue3 x3_ptr, int64_t *h_superacc, int *status)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>mpi_reduce_communicator</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>a69e81c6d1be55e0ad3f58c791f711315</anchor>
      <arglist>(MPI_Comm comm, MPI_Comm *comm_mod, MPI_Comm *comm_mod_reduce)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>reduce_mpi_cpu</name>
      <anchorfile>namespacedg_1_1exblas.html</anchorfile>
      <anchor>af724256742492b85f5a729c9699c398e</anchor>
      <arglist>(unsigned num_superacc, int64_t *in, int64_t *out, MPI_Comm comm, MPI_Comm comm_mod, MPI_Comm comm_mod_reduce)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg::exblas::cpu</name>
    <filename>namespacedg_1_1exblas_1_1cpu.html</filename>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>Accumulate</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>aeb5ba33e37102969daf45883c7582d0d</anchor>
      <arglist>(int64_t *accumulator, double x)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static bool</type>
      <name>Normalize</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>af9a857ad6a802d04c4b33f3ca7af6bf3</anchor>
      <arglist>(int64_t *accumulator, int &amp;imin, int &amp;imax)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static double</type>
      <name>Round</name>
      <anchorfile>namespacedg_1_1exblas_1_1cpu.html</anchorfile>
      <anchor>a2f7276f907e32c14eb50f7cf1f9c6142</anchor>
      <arglist>(int64_t *accumulator)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg::exblas::gpu</name>
    <filename>namespacedg_1_1exblas_1_1gpu.html</filename>
    <member kind="function" static="yes">
      <type>static __device__ void</type>
      <name>Accumulate</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>ae8560d81d2a195d7fae6fee57db801f0</anchor>
      <arglist>(int64_t *accumulator, double x, int stride=1)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static __device__ int</type>
      <name>Normalize</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>a93eb209e12fbdddcd2f38555495f22d3</anchor>
      <arglist>(int64_t *accumulator, int &amp;imin, int &amp;imax, int stride=1)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static __device__ double</type>
      <name>Round</name>
      <anchorfile>namespacedg_1_1exblas_1_1gpu.html</anchorfile>
      <anchor>a0e48bd1ab779211fb7d10b9437c26a30</anchor>
      <arglist>(int64_t *accumulator)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Extension: ExBLAS</title>
    <filename>index.html</filename>
  </compound>
</tagfile>
