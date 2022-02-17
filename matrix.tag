<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.3">
  <compound kind="file">
    <name>functors.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>functors_8h.html</filename>
    <class kind="struct">dg::mat::BESSELI0</class>
    <class kind="struct">dg::mat::GAMMA0</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>lanczos.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>lanczos_8h.html</filename>
    <includes id="tridiaginv_8h" name="tridiaginv.h" local="yes" imported="no">tridiaginv.h</includes>
    <includes id="matrixfunction_8h" name="matrixfunction.h" local="yes" imported="no">matrixfunction.h</includes>
    <class kind="class">dg::mat::UniversalLanczos</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>matrix.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>matrix_8h.html</filename>
    <includes id="functors_8h" name="functors.h" local="yes" imported="no">functors.h</includes>
    <includes id="lanczos_8h" name="lanczos.h" local="yes" imported="no">lanczos.h</includes>
    <includes id="mcg_8h" name="mcg.h" local="yes" imported="no">mcg.h</includes>
    <includes id="matrixsqrt_8h" name="matrixsqrt.h" local="yes" imported="no">matrixsqrt.h</includes>
    <includes id="matrixfunction_8h" name="matrixfunction.h" local="yes" imported="no">matrixfunction.h</includes>
    <includes id="polarization_8h" name="polarization.h" local="yes" imported="no">polarization.h</includes>
    <includes id="polarization__init_8h" name="polarization_init.h" local="yes" imported="no">polarization_init.h</includes>
    <includes id="sqrt__cauchy_8h" name="sqrt_cauchy.h" local="yes" imported="no">sqrt_cauchy.h</includes>
    <includes id="sqrt__ode_8h" name="sqrt_ode.h" local="yes" imported="no">sqrt_ode.h</includes>
    <includes id="tensorelliptic_8h" name="tensorelliptic.h" local="yes" imported="no">tensorelliptic.h</includes>
    <includes id="tridiaginv_8h" name="tridiaginv.h" local="yes" imported="no">tridiaginv.h</includes>
  </compound>
  <compound kind="file">
    <name>matrix_doc.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>matrix__doc_8h.html</filename>
  </compound>
  <compound kind="file">
    <name>matrixfunction.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>matrixfunction_8h.html</filename>
    <includes id="functors_8h" name="functors.h" local="yes" imported="no">functors.h</includes>
    <includes id="sqrt__cauchy_8h" name="sqrt_cauchy.h" local="yes" imported="no">sqrt_cauchy.h</includes>
    <includes id="sqrt__ode_8h" name="sqrt_ode.h" local="yes" imported="no">sqrt_ode.h</includes>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
    <member kind="function">
      <type>auto</type>
      <name>make_FuncEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga4a848690246725f758dbfaca0412b881</anchor>
      <arglist>(UnaryOp f)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchy_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga7a8d18ad1d50cc1ecb8c3cad6048b627</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchyEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gab28d4900057b7a9c53db4f80c2c0207d</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtODE_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gaa9cefff623540bc46612a9643ece3c63</anchor>
      <arglist>(int exp, std::string tableau, value_type rtol, value_type atol, unsigned &amp;number)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static auto</type>
      <name>make_Linear_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga6dba73c0e20f6b40bfd046726017e5c8</anchor>
      <arglist>(int exp)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>matrixsqrt.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>matrixsqrt_8h.html</filename>
    <includes id="lanczos_8h" name="lanczos.h" local="yes" imported="no">lanczos.h</includes>
    <class kind="struct">dg::mat::MatrixSqrt</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>mcg.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>mcg_8h.html</filename>
    <includes id="tridiaginv_8h" name="tridiaginv.h" local="yes" imported="no">tridiaginv.h</includes>
    <includes id="matrixfunction_8h" name="matrixfunction.h" local="yes" imported="no">matrixfunction.h</includes>
    <class kind="class">dg::mat::MCG</class>
    <class kind="class">dg::mat::MCGFuncEigen</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>polarization.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>polarization_8h.html</filename>
    <includes id="lanczos_8h" name="lanczos.h" local="yes" imported="no">lanczos.h</includes>
    <includes id="matrixsqrt_8h" name="matrixsqrt.h" local="yes" imported="no">matrixsqrt.h</includes>
    <includes id="matrixfunction_8h" name="matrixfunction.h" local="yes" imported="no">matrixfunction.h</includes>
    <includes id="tensorelliptic_8h" name="tensorelliptic.h" local="yes" imported="no">tensorelliptic.h</includes>
    <class kind="class">dg::mat::PolCharge</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>polarization_init.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>polarization__init_8h.html</filename>
    <class kind="class">dg::mat::PolChargeN</class>
    <class kind="struct">dg::TensorTraits&lt; mat::PolChargeN&lt; G, M, V &gt; &gt;</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>sqrt_cauchy.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>sqrt__cauchy_8h.html</filename>
    <class kind="struct">dg::mat::SqrtCauchyInt</class>
    <class kind="struct">dg::mat::DirectSqrtCauchy</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
    <member kind="define">
      <type>#define</type>
      <name>M_PI</name>
      <anchorfile>sqrt__cauchy_8h.html</anchorfile>
      <anchor>ae71449b1cc6e6250b91f539153a7a0d3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>sqrt_ode.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>sqrt__ode_8h.html</filename>
    <includes id="tridiaginv_8h" name="tridiaginv.h" local="yes" imported="no">tridiaginv.h</includes>
    <class kind="struct">dg::mat::InvSqrtODE</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
    <member kind="function">
      <type>auto</type>
      <name>make_directODESolve</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>gadc96cca132705ee18a2c02dfb1b0cb36</anchor>
      <arglist>(ExplicitRHS &amp;&amp;ode, std::string tableau, value_type epsTimerel, value_type epsTimeabs, unsigned &amp;number, value_type t0=0., value_type t1=1.)</arglist>
    </member>
    <member kind="function">
      <type>InvSqrtODE&lt; Container &gt;</type>
      <name>make_inv_sqrtodeCG</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga4c9bb92436f2d161ca96ce4205edefe7</anchor>
      <arglist>(Matrix &amp;A, const Preconditioner &amp;P, const Container &amp;weights, dg::get_value_type&lt; Container &gt; epsCG)</arglist>
    </member>
    <member kind="function">
      <type>InvSqrtODE&lt; Container &gt;</type>
      <name>make_inv_sqrtodeTri</name>
      <anchorfile>namespacedg_1_1mat.html</anchorfile>
      <anchor>af203581057d74acbf141557a0f407bc9</anchor>
      <arglist>(const Matrix &amp;TH, const Container &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_expode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga01fbaf572f56fac2c92900b7275e1a69</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_besselI0ode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga030adac2335f5353c03af46a7a295875</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tensorelliptic.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>tensorelliptic_8h.html</filename>
    <class kind="struct">dg::mat::TensorElliptic</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
  </compound>
  <compound kind="file">
    <name>tridiaginv.h</name>
    <path>/home/matthias/Projekte/feltor/inc/matrix/</path>
    <filename>tridiaginv_8h.html</filename>
    <includes id="functors_8h" name="functors.h" local="yes" imported="no">functors.h</includes>
    <class kind="class">dg::mat::TridiagInvHMGTI</class>
    <class kind="class">dg::mat::TridiagInvDF</class>
    <class kind="class">dg::mat::TridiagInvD</class>
    <namespace>dg</namespace>
    <namespace>dg::mat</namespace>
    <member kind="function">
      <type>value_type</type>
      <name>compute_Tinv_m1</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga1501fbced46ee2dc28e99e9babaf5511</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>compute_Tinv_y</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga8cb84cb8c56c5c2ef0d41d1806524e46</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, thrust::host_vector&lt; value_type &gt; &amp;x, const thrust::host_vector&lt; value_type &gt; &amp;y, value_type a=1., value_type d=0.)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga96c7965f8def0b610253e37f72281449</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>gad17a5b267a9fe93b60332ba34d580a4b</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>std::array&lt; value_type, 2 &gt;</type>
      <name>compute_extreme_EV</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga180496ec16ad057eeb2fad029e05c443</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::BESSELI0</name>
    <filename>structdg_1_1mat_1_1_b_e_s_s_e_l_i0.html</filename>
    <templarg>class T</templarg>
    <member kind="function">
      <type></type>
      <name>BESSELI0</name>
      <anchorfile>structdg_1_1mat_1_1_b_e_s_s_e_l_i0.html</anchorfile>
      <anchor>a7603389bb467b5094381e2b3aede9827</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_b_e_s_s_e_l_i0.html</anchorfile>
      <anchor>a114d1d2ac6f5e8aa68478e8e334512a5</anchor>
      <arglist>(T x) const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::DirectSqrtCauchy</name>
    <filename>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</filename>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>Container</type>
      <name>container_type</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>a4ac289ce8abb2b07e3ec796b80364ce4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>aff9447987a456910589ade8adbaf871d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DirectSqrtCauchy</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>acfe27470b5a9116cd558c2f8c8a6ac26</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DirectSqrtCauchy</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>ac0128f6a44ade23414c2b986f1d54d17</anchor>
      <arglist>(MatrixType &amp;A, const Container &amp;weights, value_type epsCG, unsigned iterCauchy, std::array&lt; value_type, 2 &gt; EVs, int exp)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>ac2ffdb9ec63d4bb78afa819709edfdde</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_direct_sqrt_cauchy.html</anchorfile>
      <anchor>a87c4810ca8a174e1715b5a04da1e8985</anchor>
      <arglist>(const Container &amp;b, Container &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::GAMMA0</name>
    <filename>structdg_1_1mat_1_1_g_a_m_m_a0.html</filename>
    <templarg>class T</templarg>
    <member kind="function">
      <type></type>
      <name>GAMMA0</name>
      <anchorfile>structdg_1_1mat_1_1_g_a_m_m_a0.html</anchorfile>
      <anchor>a380e515f5e611fb1d0c31c885aff39b2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_g_a_m_m_a0.html</anchorfile>
      <anchor>a707415547db021be3d707b2eb9bece36</anchor>
      <arglist>(T x) const</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::InvSqrtODE</name>
    <filename>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</filename>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>Container</type>
      <name>container_type</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>a4f2e5d6d389de1629438c18ab7544846</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>ad0d846ac8757d5ac85c969beac6cff27</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>InvSqrtODE</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>a799c441360dcf20802bc42a16a6970f1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>InvSqrtODE</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>aef4d53ce6d245919d45d94ff2f9a15ce</anchor>
      <arglist>(MatrixType &amp;A, const Container &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>a0d7b90cb9321e6cdfd8bc56b33eac166</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>const value_type &amp;</type>
      <name>time</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>af5c020a1ec9aaf19494348ba5a61e762</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_operator</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>af8d7c552ad4de0eb35de009909addafd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_inverse_operator</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>afa9cb6bef239b8968f74a9e664760e45</anchor>
      <arglist>(const MatrixType &amp;OpInv)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_inv_sqrt_o_d_e.html</anchorfile>
      <anchor>a6d97d9035316b9ce7e2ee51ba860b788</anchor>
      <arglist>(value_type t, const Container &amp;y, Container &amp;yp)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::MatrixSqrt</name>
    <filename>structdg_1_1mat_1_1_matrix_sqrt.html</filename>
    <templarg>class ContainerType</templarg>
    <member kind="typedef">
      <type>ContainerType</type>
      <name>container_type</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a50e9bab2c7f9dfc343e202b44c49a6e1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a446da3d9407473e38c1d4291c9a4d349</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixSqrt</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>af30f108bfaa595928a82bc0396da62fe</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MatrixSqrt</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>aa9a962de19cc80551dc38c90ecc86416</anchor>
      <arglist>(MatrixType &amp;A, int exp, const ContainerType &amp;weights, value_type eps_rel, value_type nrmb_correction=1., unsigned max_iter=500, unsigned cauchy_steps=40)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a19ddf836799708303fa198ba8af8611c</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_iter</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a46dccefc0d2a771183823baecf42a9ee</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_benchmark</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a5186e095076c5dcfcc27640737af7237</anchor>
      <arglist>(bool benchmark, std::string message=&quot;SQRT&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_matrix_sqrt.html</anchorfile>
      <anchor>a051d87916930be95c3b63aa70f7d50d0</anchor>
      <arglist>(const ContainerType0 b, ContainerType1 &amp;x)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::MCG</name>
    <filename>classdg_1_1mat_1_1_m_c_g.html</filename>
    <templarg>class ContainerType</templarg>
    <member kind="typedef">
      <type>dg::get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a6f0ca0749c9c796f2def9a36bf83cda2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HCooMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a6b22f08d8db48a0649f7dd8e3506c5a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HDiaMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a82307eba974f2a1e45719223c5bfd372</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::HVec</type>
      <name>HVec</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a6f2d2539cc7b7b4af316cb523e598f97</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MCG</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>aa31f0d1d1f8de49965949af316176dfd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MCG</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>ad5c17aaf8001837de28c6b8cc71abca6</anchor>
      <arglist>(const ContainerType &amp;copyable, unsigned max_iterations)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_max</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a8f168b1c591719ae51feea8fb7588316</anchor>
      <arglist>(unsigned new_max)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_max</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a29b95c39f2324441237783d78f109825</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_verbose</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a225770cffcf62afba92454392be71ad3</anchor>
      <arglist>(bool verbose)</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>get_bnorm</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a0fe8e82d5c91e76d478fd0540aadb38f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a7eb2fbb134fec5468e36b03dc61b23e7</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_iter</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>ae75f1e7860cb4f8ba4e9c5e22be0b2bc</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Ry</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a65a6bce8097ba9596705de0ecb765dce</anchor>
      <arglist>(MatrixType &amp;&amp;A, const DiaMatrixType &amp;T, const ContainerType0 &amp;y, ContainerType1 &amp;x, const ContainerType2 &amp;b)</arglist>
    </member>
    <member kind="function">
      <type>const HDiaMatrix &amp;</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>a543a74baae5345e68317a79940cb9f5b</anchor>
      <arglist>(MatrixType &amp;&amp;A, const ContainerType0 &amp;b, const ContainerType1 &amp;weights, value_type eps=1e-12, value_type nrmb_correction=1., value_type res_fac=1.)</arglist>
    </member>
    <member kind="function">
      <type>HVec</type>
      <name>make_e1</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g.html</anchorfile>
      <anchor>aea33dca57e69ee88dd93df1c5c434a2b</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::MCGFuncEigen</name>
    <filename>classdg_1_1mat_1_1_m_c_g_func_eigen.html</filename>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>dg::get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>a32fbab67cb186ade43806bed0be7711a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HDiaMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>a8e798821af536964337c0b1e318c2e20</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HCooMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>a5766afe944a155de6004a9de27bad5e1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::array2d&lt; value_type, cusp::host_memory &gt;</type>
      <name>HArray2d</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>aef9ea3bda3f0352a793bd832f65489d6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::array1d&lt; value_type, cusp::host_memory &gt;</type>
      <name>HArray1d</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>aa26410fa422cb6cb21021137ad3474cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::HVec</type>
      <name>HVec</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>a72ea3a23b49729ad1687955ff0ab350f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MCGFuncEigen</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>ad334170c77fc850aef00455f90c421a2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MCGFuncEigen</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>ae0510d5ce95c8e9e415c6b75cb96465a</anchor>
      <arglist>(const Container &amp;copyable, unsigned max_iterations)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>a9bbd013151ec5cfc762456968d48d3ab</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_m_c_g_func_eigen.html</anchorfile>
      <anchor>afe1a0a2a8293684603bb84ecc8dec1c5</anchor>
      <arglist>(ContainerType0 &amp;x, UnaryOp f, MatrixType &amp;&amp;A, const ContainerType1 &amp;b, const ContainerType2 &amp;weights, value_type eps, value_type nrmb_correction, value_type res_fac)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::PolCharge</name>
    <filename>classdg_1_1mat_1_1_pol_charge.html</filename>
    <templarg>class Geometry</templarg>
    <templarg>class Matrix</templarg>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a183e5d497e21262843d6342763b107ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolCharge</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a01fcf5e1c895d8c1eaee9e1093c93c95</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolCharge</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>afceb5f6a6a23e6fb8fb16916e77fc6fa</anchor>
      <arglist>(value_type alpha, std::vector&lt; value_type &gt; eps_gamma, const Geometry &amp;g, direction dir=forward, value_type jfactor=1., std::string mode=&quot;df&quot;, bool commute=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolCharge</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a007aee63c42fe3b5d60294088760510b</anchor>
      <arglist>(value_type alpha, std::vector&lt; value_type &gt; eps_gamma, const Geometry &amp;g, bc bcx, bc bcy, direction dir=forward, value_type jfactor=1., std::string mode=&quot;df&quot;, bool commute=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a8e9ba1fd6b745072b2c04a2152a9c7d0</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>ac86f1f66727cea55a87291db37bec516</anchor>
      <arglist>(const ContainerType0 &amp;sigma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a55749459fd4e66caa000842981cd2ae7</anchor>
      <arglist>(const SparseTensor&lt; ContainerType0 &gt; &amp;tau)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_iota</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a8c5c2edbce770f6240654880f58bb8c8</anchor>
      <arglist>(const ContainerType0 &amp;sigma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_commute</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>af2adc0da5b4afa914db13315c1ebc046</anchor>
      <arglist>(bool commute)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>get_commute</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a47be2dc1eb75714fae3d7c13126b2222</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>weights</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a12efe7bb2faeb0311b0a93fe7699f7d5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>precond</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>acf116a4ea4c3334e79f79281998c8d70</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>variation</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a56b8684f8d6f00365758cced498b8a65</anchor>
      <arglist>(const ContainerType0 &amp;phi, ContainerType1 &amp;varphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a7713d90d20888fcd259eb02897f155d2</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a6958e219152873d3eccf20a6901d3f74</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge.html</anchorfile>
      <anchor>a56f5c0cb3b8efba98c316e130333dc5a</anchor>
      <arglist>(value_type alpha, const ContainerType0 &amp;x, value_type beta, ContainerType1 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::PolChargeN</name>
    <filename>classdg_1_1mat_1_1_pol_charge_n.html</filename>
    <templarg>class Geometry</templarg>
    <templarg>class Matrix</templarg>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>Geometry</type>
      <name>geometry_type</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a16c6139771eeda35d603fccc58135593</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Matrix</type>
      <name>matrix_type</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a8065c9087b271a98aef7cef1af7307af</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Container</type>
      <name>container_type</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a4b767a38f330c0ab089a02ff901cd953</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a9d9c9c8c8848fef11427edfd0909fbe3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolChargeN</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a9c6a8440258289674c6eb36b8aa3a9bb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolChargeN</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>af5b275d9823f762e00f476238b2bd10f</anchor>
      <arglist>(const Geometry &amp;g, direction dir=forward, value_type jfactor=1.)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PolChargeN</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>af24ccac301df9b0a09ca94e139e08f18</anchor>
      <arglist>(const Geometry &amp;g, bc bcx, bc bcy, direction dir=forward, value_type jfactor=1.)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>ace931d4b38025bafb0cdf5a2570fbc5f</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_phi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a0e66661a90315383bdf188bd97a8ef0f</anchor>
      <arglist>(const ContainerType0 &amp;phi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dxphi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a6143097a0807ac306a06fbc07469b9ef</anchor>
      <arglist>(const ContainerType0 &amp;dxphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dyphi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a32a66c69c41d7679c93e025c832aedf9</anchor>
      <arglist>(const ContainerType0 &amp;dyphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_lapphi</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>aca4d69dd237167054073538eba1fb6ef</anchor>
      <arglist>(const ContainerType0 &amp;lapphi)</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>weights</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a68a92e57774140cc300d69df04579028</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>precond</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>abd3ffc30012e9571a09b8544a629660b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a392b6ca9b8edcced908d0352733d0ba5</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a9e83d1e8cd88e6f098cf8c2086290482</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>classdg_1_1mat_1_1_pol_charge_n.html</anchorfile>
      <anchor>a59a77bd9630d6f134171fd16dc35bfad</anchor>
      <arglist>(value_type alpha, const ContainerType0 &amp;x, value_type beta, ContainerType1 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::SqrtCauchyInt</name>
    <filename>structdg_1_1mat_1_1_sqrt_cauchy_int.html</filename>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>Container</type>
      <name>container_type</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>ae5d4f5d01a54c092456bbb0bc5ee5d05</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>a4a7816a96d1d3c42d5eeaab3f2e30b2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SqrtCauchyInt</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>acd9549d3210e9182d62f3047af9476ac</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SqrtCauchyInt</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>ab9e01d2e44b9f507b76bac3cc74e16fc</anchor>
      <arglist>(const Container &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>a0a38d44a50b268b4b47406c5f4a2508e</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>const double &amp;</type>
      <name>w</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>ad467a3c37f8cfa429628fe335c116f69</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_denominator</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>a7c10a3988d6861d75b063900aef497ba</anchor>
      <arglist>(MatrixType &amp;A) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_sqrt_cauchy_int.html</anchorfile>
      <anchor>a749ca76709c85f184f0f23f77b7e7daa</anchor>
      <arglist>(MatrixType0 &amp;&amp;A, MatrixType1 &amp;&amp;wAinv, const ContainerType0 &amp;b, ContainerType1 &amp;x, std::array&lt; value_type, 2 &gt; EVs, unsigned steps, int exp=+1)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::mat::TensorElliptic</name>
    <filename>structdg_1_1mat_1_1_tensor_elliptic.html</filename>
    <templarg>class Geometry</templarg>
    <templarg>class Matrix</templarg>
    <templarg>class Container</templarg>
    <member kind="typedef">
      <type>Container</type>
      <name>container_type</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a17e12c0b9a8ac65e3804fa1c420b1466</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Geometry</type>
      <name>geometry_type</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a44f446ae5356f5f1d5d26ea65479b7d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Matrix</type>
      <name>matrix_type</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>af75463ea4df7ed4e5c27e951c574632c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>get_value_type&lt; Container &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ad5a081c256c0888240071fb49205570a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TensorElliptic</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a585dcb0b1bc8759d3a27ec31c7625da5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TensorElliptic</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a241fe4af1df69ee5ae10d2da2a3da6cd</anchor>
      <arglist>(const Geometry &amp;g, direction dir=dg::centered, value_type jfactor=1.)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TensorElliptic</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ab83f6580cade86e401a1f8544122e9bd</anchor>
      <arglist>(const Geometry &amp;g, bc bcx, bc bcy, direction dir=dg::centered, value_type jfactor=1.)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a569394b77a421fe6b9b88330dc5960ca</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>weights</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a16dbc07540b3f45e40779c9eabbff1c6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const Container &amp;</type>
      <name>precond</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>aa738b70a5f2f517fecad565b049deb2f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_chi</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ac6c8d27ee186e2db22b6b6cc9460f3dc</anchor>
      <arglist>(const ContainerType0 &amp;chi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_iota</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a47dc52fac30be8dac614c3d9d8609554</anchor>
      <arglist>(const ContainerType0 &amp;iota)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>variation</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ad1a8c8197905f0b92c0c6bdb63a44205</anchor>
      <arglist>(const Container &amp;phi, const value_type &amp;alpha, const Container &amp;chi, Container &amp;varphi)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ac03f35cddf1d0c60555a5b51b6d61c79</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>ae4b009478277ff3494508a5a6656fe0f</anchor>
      <arglist>(const ContainerType0 &amp;x, ContainerType1 &amp;y)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>symv</name>
      <anchorfile>structdg_1_1mat_1_1_tensor_elliptic.html</anchorfile>
      <anchor>a0f7173ed982f6b0d6964b7e174fbd9b7</anchor>
      <arglist>(value_type alpha, const ContainerType0 &amp;x, value_type beta, ContainerType1 &amp;y)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>dg::TensorTraits&lt; mat::PolChargeN&lt; G, M, V &gt; &gt;</name>
    <filename>structdg_1_1_tensor_traits_3_01mat_1_1_pol_charge_n_3_01_g_00_01_m_00_01_v_01_4_01_4.html</filename>
    <templarg>class G</templarg>
    <templarg>class M</templarg>
    <templarg>class V</templarg>
    <member kind="typedef">
      <type>get_value_type&lt; V &gt;</type>
      <name>value_type</name>
      <anchorfile>structdg_1_1_tensor_traits_3_01mat_1_1_pol_charge_n_3_01_g_00_01_m_00_01_v_01_4_01_4.html</anchorfile>
      <anchor>addbcdcb434e68a936d7099ab8f0da1f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>SelfMadeMatrixTag</type>
      <name>tensor_category</name>
      <anchorfile>structdg_1_1_tensor_traits_3_01mat_1_1_pol_charge_n_3_01_g_00_01_m_00_01_v_01_4_01_4.html</anchorfile>
      <anchor>a5a56cac329fcc161ca887c6c64782a8b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::TridiagInvD</name>
    <filename>classdg_1_1mat_1_1_tridiag_inv_d.html</filename>
    <templarg>class ContainerType</templarg>
    <templarg>class DiaMatrix</templarg>
    <templarg>class CooMatrix</templarg>
    <member kind="typedef">
      <type>dg::get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>a47ecce49d053eda06161a96e5743a470</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvD</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>a142bbf8876cc8cb6ea82f99804c4481a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvD</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>a32824372bfe4f0f49865ddf9c62d6356</anchor>
      <arglist>(const ContainerType &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvD</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>afada62b52abed7d0bba5f2ab872442e9</anchor>
      <arglist>(unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resize</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>afb58e3703474e300b27d167fef11cee9</anchor>
      <arglist>(unsigned new_size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>a1247de1009876cac0c449d6b5b77fefd</anchor>
      <arglist>(const DiaMatrix &amp;T, CooMatrix &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>CooMatrix</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>ad3e55d510dec2f0a4b77cbbc1966d4bc</anchor>
      <arglist>(const DiaMatrix &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d.html</anchorfile>
      <anchor>ad3a0b130b227e84a3d0c5bae40f9c4b2</anchor>
      <arglist>(const ContainerType0 &amp;a, const ContainerType1 &amp;b, const ContainerType2 &amp;c, CooMatrix &amp;Tinv)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::TridiagInvDF</name>
    <filename>classdg_1_1mat_1_1_tridiag_inv_d_f.html</filename>
    <templarg>class ContainerType</templarg>
    <templarg>class DiaMatrix</templarg>
    <templarg>class CooMatrix</templarg>
    <member kind="typedef">
      <type>dg::get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>aa47956ba6d89c8e0158ebae91b6cff61</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvDF</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a790910db64840618c752647205211c6d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvDF</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a9ca8ef9118e0558c9497dac3810278fc</anchor>
      <arglist>(const ContainerType &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvDF</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a16cccc6fc461b7cc8207af1ac1e4e9ac</anchor>
      <arglist>(unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resize</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a03b0d8852c1a65a5885c071c76ed95b8</anchor>
      <arglist>(unsigned new_size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a5f731aefb44d951585f14ecc21eb51aa</anchor>
      <arglist>(const DiaMatrix &amp;T, CooMatrix &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>CooMatrix</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a433309a0e201805e93019b29c612f00b</anchor>
      <arglist>(const DiaMatrix &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_d_f.html</anchorfile>
      <anchor>a32365f2422eef68f8d4f1018290d8a7b</anchor>
      <arglist>(const ContainerType0 &amp;a, const ContainerType1 &amp;b, const ContainerType2 &amp;c, CooMatrix &amp;Tinv)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::TridiagInvHMGTI</name>
    <filename>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</filename>
    <templarg>class ContainerType</templarg>
    <templarg>class DiaMatrix</templarg>
    <templarg>class CooMatrix</templarg>
    <member kind="typedef">
      <type>dg::get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>a1529ed43a535d5ff572a5d14f8513f80</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvHMGTI</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>a1f576ec8edcf748504d50670424e26c3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvHMGTI</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>acd35c1cdbbd710c0ba10408f088db380</anchor>
      <arglist>(const ContainerType &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TridiagInvHMGTI</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>ac9d98adc7b87165c1f1794c8cdebe2ca</anchor>
      <arglist>(unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resize</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>a75ceb229dd41f860ef9123d808a8d159</anchor>
      <arglist>(unsigned new_size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>ad050646f0640e8f8d9207613b454901f</anchor>
      <arglist>(const DiaMatrix &amp;T, CooMatrix &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>CooMatrix</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>a797854633f0d21c5bbbee6ea6ad2d985</anchor>
      <arglist>(const DiaMatrix &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>classdg_1_1mat_1_1_tridiag_inv_h_m_g_t_i.html</anchorfile>
      <anchor>ab629f5ae4b0182ad875b8a992950af5d</anchor>
      <arglist>(const ContainerType0 &amp;a, const ContainerType1 &amp;b, const ContainerType2 &amp;c, CooMatrix &amp;Tinv)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>dg::mat::UniversalLanczos</name>
    <filename>classdg_1_1mat_1_1_universal_lanczos.html</filename>
    <templarg>class ContainerType</templarg>
    <member kind="typedef">
      <type>get_value_type&lt; ContainerType &gt;</type>
      <name>value_type</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a370305216d927c1cbffcfe8fe58ae685</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HCooMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a5a42fb69f4f5dc5a3fef1834916f6e25</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>HDiaMatrix</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a0708a962c7fd0a4f2efc043082c0a4b6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>dg::HVec</type>
      <name>HVec</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a83d82d6c3fc0b16d1f2651b2bd26f770</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>UniversalLanczos</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>aa044680e0ff1a7be7528235965c58363</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>UniversalLanczos</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a75567bfd54a7f388d3abe111ea25554c</anchor>
      <arglist>(const ContainerType &amp;copyable, unsigned max_iterations)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>aeb5ed88c774c43d92c8c9a42cf9a755e</anchor>
      <arglist>(Params &amp;&amp;...ps)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_max</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>ad367aeffd08562f5e557b633f51e7339</anchor>
      <arglist>(unsigned new_max)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_max</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a8c3263e23586f66cb758f8bbc94c3e44</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_verbose</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a7a4938f6a1f1d7a73852f7ba46a7dba8</anchor>
      <arglist>(bool verbose)</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>get_bnorm</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a2a2911d91ba236e25a10c9e01dff5bc1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>solve</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>aac8263710136f1baa907c32179d2ad60</anchor>
      <arglist>(ContainerType0 &amp;x, FuncTe1 f, MatrixType &amp;&amp;A, const ContainerType1 &amp;b, const ContainerType2 &amp;weights, value_type eps, value_type nrmb_correction=1., std::string error_norm=&quot;universal&quot;, value_type res_fac=1., unsigned q=1)</arglist>
    </member>
    <member kind="function">
      <type>const HDiaMatrix &amp;</type>
      <name>tridiag</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>ae857c517b27ae198b896852ac563e0a5</anchor>
      <arglist>(MatrixType &amp;&amp;A, const ContainerType0 &amp;b, const ContainerType1 &amp;weights, value_type eps=1e-12, value_type nrmb_correction=1., std::string error_norm=&quot;universal&quot;, value_type res_fac=1., unsigned q=1)</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>get_iter</name>
      <anchorfile>classdg_1_1mat_1_1_universal_lanczos.html</anchorfile>
      <anchor>a9911ecaf6fd13d1d4b7bcdf1691af335</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>dg</name>
    <filename>namespacedg.html</filename>
    <namespace>dg::mat</namespace>
    <class kind="struct">dg::TensorTraits&lt; mat::PolChargeN&lt; G, M, V &gt; &gt;</class>
  </compound>
  <compound kind="namespace">
    <name>dg::mat</name>
    <filename>namespacedg_1_1mat.html</filename>
    <class kind="struct">dg::mat::BESSELI0</class>
    <class kind="struct">dg::mat::DirectSqrtCauchy</class>
    <class kind="struct">dg::mat::GAMMA0</class>
    <class kind="struct">dg::mat::InvSqrtODE</class>
    <class kind="struct">dg::mat::MatrixSqrt</class>
    <class kind="class">dg::mat::MCG</class>
    <class kind="class">dg::mat::MCGFuncEigen</class>
    <class kind="class">dg::mat::PolCharge</class>
    <class kind="class">dg::mat::PolChargeN</class>
    <class kind="struct">dg::mat::SqrtCauchyInt</class>
    <class kind="struct">dg::mat::TensorElliptic</class>
    <class kind="class">dg::mat::TridiagInvD</class>
    <class kind="class">dg::mat::TridiagInvDF</class>
    <class kind="class">dg::mat::TridiagInvHMGTI</class>
    <class kind="class">dg::mat::UniversalLanczos</class>
    <member kind="function">
      <type>auto</type>
      <name>make_FuncEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga4a848690246725f758dbfaca0412b881</anchor>
      <arglist>(UnaryOp f)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchy_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga7a8d18ad1d50cc1ecb8c3cad6048b627</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchyEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gab28d4900057b7a9c53db4f80c2c0207d</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtODE_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gaa9cefff623540bc46612a9643ece3c63</anchor>
      <arglist>(int exp, std::string tableau, value_type rtol, value_type atol, unsigned &amp;number)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static auto</type>
      <name>make_Linear_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga6dba73c0e20f6b40bfd046726017e5c8</anchor>
      <arglist>(int exp)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_directODESolve</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>gadc96cca132705ee18a2c02dfb1b0cb36</anchor>
      <arglist>(ExplicitRHS &amp;&amp;ode, std::string tableau, value_type epsTimerel, value_type epsTimeabs, unsigned &amp;number, value_type t0=0., value_type t1=1.)</arglist>
    </member>
    <member kind="function">
      <type>InvSqrtODE&lt; Container &gt;</type>
      <name>make_inv_sqrtodeCG</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga4c9bb92436f2d161ca96ce4205edefe7</anchor>
      <arglist>(Matrix &amp;A, const Preconditioner &amp;P, const Container &amp;weights, dg::get_value_type&lt; Container &gt; epsCG)</arglist>
    </member>
    <member kind="function">
      <type>InvSqrtODE&lt; Container &gt;</type>
      <name>make_inv_sqrtodeTri</name>
      <anchorfile>namespacedg_1_1mat.html</anchorfile>
      <anchor>af203581057d74acbf141557a0f407bc9</anchor>
      <arglist>(const Matrix &amp;TH, const Container &amp;copyable)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_expode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga01fbaf572f56fac2c92900b7275e1a69</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_besselI0ode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga030adac2335f5353c03af46a7a295875</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>compute_Tinv_m1</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga1501fbced46ee2dc28e99e9babaf5511</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>compute_Tinv_y</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga8cb84cb8c56c5c2ef0d41d1806524e46</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, thrust::host_vector&lt; value_type &gt; &amp;x, const thrust::host_vector&lt; value_type &gt; &amp;y, value_type a=1., value_type d=0.)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga96c7965f8def0b610253e37f72281449</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>gad17a5b267a9fe93b60332ba34d580a4b</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>std::array&lt; value_type, 2 &gt;</type>
      <name>compute_extreme_EV</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga180496ec16ad057eeb2fad029e05c443</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>matrixnumerical0</name>
    <title>Level 2: Basic numerical algorithms</title>
    <filename>group__matrixnumerical0.html</filename>
    <subgroup>matrixinvert</subgroup>
    <subgroup>tridiagfunction</subgroup>
    <subgroup>matrixfunctionapproximation</subgroup>
  </compound>
  <compound kind="group">
    <name>matrixinvert</name>
    <title>Inversion of tridiagonal matrices</title>
    <filename>group__matrixinvert.html</filename>
    <class kind="class">dg::mat::TridiagInvHMGTI</class>
    <class kind="class">dg::mat::TridiagInvDF</class>
    <class kind="class">dg::mat::TridiagInvD</class>
    <member kind="function">
      <type>value_type</type>
      <name>compute_Tinv_m1</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga1501fbced46ee2dc28e99e9babaf5511</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, unsigned size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>compute_Tinv_y</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga8cb84cb8c56c5c2ef0d41d1806524e46</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, thrust::host_vector&lt; value_type &gt; &amp;x, const thrust::host_vector&lt; value_type &gt; &amp;y, value_type a=1., value_type d=0.)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga96c7965f8def0b610253e37f72281449</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T, cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;Tinv)</arglist>
    </member>
    <member kind="function">
      <type>cusp::coo_matrix&lt; int, value_type, cusp::host_memory &gt;</type>
      <name>invert</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>gad17a5b267a9fe93b60332ba34d580a4b</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
    <member kind="function">
      <type>std::array&lt; value_type, 2 &gt;</type>
      <name>compute_extreme_EV</name>
      <anchorfile>group__matrixinvert.html</anchorfile>
      <anchor>ga180496ec16ad057eeb2fad029e05c443</anchor>
      <arglist>(const cusp::dia_matrix&lt; int, value_type, cusp::host_memory &gt; &amp;T)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>tridiagfunction</name>
    <title>Tridiagonal Matrix-functions</title>
    <filename>group__tridiagfunction.html</filename>
    <member kind="function">
      <type>auto</type>
      <name>make_FuncEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga4a848690246725f758dbfaca0412b881</anchor>
      <arglist>(UnaryOp f)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchy_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga7a8d18ad1d50cc1ecb8c3cad6048b627</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtCauchyEigen_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gab28d4900057b7a9c53db4f80c2c0207d</anchor>
      <arglist>(int exp, std::array&lt; value_type, 2 &gt; EVs, unsigned stepsCauchy)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_SqrtODE_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>gaa9cefff623540bc46612a9643ece3c63</anchor>
      <arglist>(int exp, std::string tableau, value_type rtol, value_type atol, unsigned &amp;number)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static auto</type>
      <name>make_Linear_Te1</name>
      <anchorfile>group__tridiagfunction.html</anchorfile>
      <anchor>ga6dba73c0e20f6b40bfd046726017e5c8</anchor>
      <arglist>(int exp)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>matrixfunctionapproximation</name>
    <title>Matrix-functions</title>
    <filename>group__matrixfunctionapproximation.html</filename>
    <class kind="class">dg::mat::UniversalLanczos</class>
    <class kind="struct">dg::mat::MatrixSqrt</class>
    <class kind="class">dg::mat::MCG</class>
    <class kind="class">dg::mat::MCGFuncEigen</class>
    <class kind="struct">dg::mat::SqrtCauchyInt</class>
    <class kind="struct">dg::mat::DirectSqrtCauchy</class>
    <class kind="struct">dg::mat::InvSqrtODE</class>
    <member kind="function">
      <type>auto</type>
      <name>make_directODESolve</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>gadc96cca132705ee18a2c02dfb1b0cb36</anchor>
      <arglist>(ExplicitRHS &amp;&amp;ode, std::string tableau, value_type epsTimerel, value_type epsTimeabs, unsigned &amp;number, value_type t0=0., value_type t1=1.)</arglist>
    </member>
    <member kind="function">
      <type>InvSqrtODE&lt; Container &gt;</type>
      <name>make_inv_sqrtodeCG</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga4c9bb92436f2d161ca96ce4205edefe7</anchor>
      <arglist>(Matrix &amp;A, const Preconditioner &amp;P, const Container &amp;weights, dg::get_value_type&lt; Container &gt; epsCG)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_expode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga01fbaf572f56fac2c92900b7275e1a69</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>make_besselI0ode</name>
      <anchorfile>group__matrixfunctionapproximation.html</anchorfile>
      <anchor>ga030adac2335f5353c03af46a7a295875</anchor>
      <arglist>(MatrixType &amp;A)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>matrixnumerical1</name>
    <title>Level 4: Advanced numerical schemes</title>
    <filename>group__matrixnumerical1.html</filename>
    <subgroup>matrixmatrixoperators</subgroup>
  </compound>
  <compound kind="group">
    <name>matrixmatrixoperators</name>
    <title>Elliptic operators</title>
    <filename>group__matrixmatrixoperators.html</filename>
    <class kind="class">dg::mat::PolCharge</class>
    <class kind="class">dg::mat::PolChargeN</class>
    <class kind="struct">dg::mat::TensorElliptic</class>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Extension: Matrix functions</title>
    <filename>index.html</filename>
  </compound>
</tagfile>
