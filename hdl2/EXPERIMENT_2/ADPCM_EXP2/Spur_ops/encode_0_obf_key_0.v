
module encode
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  xin1,
  xin2,
  tqmf_address0,
  tqmf_ce0,
  tqmf_we0,
  tqmf_d0,
  tqmf_q0,
  tqmf_address1,
  tqmf_ce1,
  tqmf_we1,
  tqmf_d1,
  tqmf_q1,
  delay_bpl_address0,
  delay_bpl_ce0,
  delay_bpl_we0,
  delay_bpl_d0,
  delay_bpl_q0,
  delay_dltx_address0,
  delay_dltx_ce0,
  delay_dltx_we0,
  delay_dltx_d0,
  delay_dltx_q0,
  delay_dltx_address1,
  delay_dltx_ce1,
  delay_dltx_we1,
  delay_dltx_d1,
  delay_dltx_q1,
  rlt1_i,
  rlt1_o,
  rlt1_o_ap_vld,
  al1_i,
  al1_o,
  al1_o_ap_vld,
  rlt2_i,
  rlt2_o,
  rlt2_o_ap_vld,
  al2_i,
  al2_o,
  al2_o_ap_vld,
  detl_i,
  detl_o,
  detl_o_ap_vld,
  il_i,
  il_o,
  il_o_ap_vld,
  nbl_i,
  nbl_o,
  nbl_o_ap_vld,
  plt1_i,
  plt1_o,
  plt1_o_ap_vld,
  plt2_i,
  plt2_o,
  plt2_o_ap_vld,
  delay_bph_address0,
  delay_bph_ce0,
  delay_bph_we0,
  delay_bph_d0,
  delay_bph_q0,
  delay_dhx_address0,
  delay_dhx_ce0,
  delay_dhx_we0,
  delay_dhx_d0,
  delay_dhx_q0,
  delay_dhx_address1,
  delay_dhx_ce1,
  delay_dhx_we1,
  delay_dhx_d1,
  delay_dhx_q1,
  rh1_i,
  rh1_o,
  rh1_o_ap_vld,
  ah1_i,
  ah1_o,
  ah1_o_ap_vld,
  rh2_i,
  rh2_o,
  rh2_o_ap_vld,
  ah2_i,
  ah2_o,
  ah2_o_ap_vld,
  ih_i,
  ih_o,
  ih_o_ap_vld,
  deth_i,
  deth_o,
  deth_o_ap_vld,
  nbh_i,
  nbh_o,
  nbh_o_ap_vld,
  ph1_i,
  ph1_o,
  ph1_o_ap_vld,
  ph2_i,
  ph2_o,
  ph2_o_ap_vld,
  ap_return,
  working_key
);

  parameter ap_ST_fsm_state1 = 45'd1;
  parameter ap_ST_fsm_state2 = 45'd2;
  parameter ap_ST_fsm_state3 = 45'd4;
  parameter ap_ST_fsm_state4 = 45'd8;
  parameter ap_ST_fsm_state5 = 45'd16;
  parameter ap_ST_fsm_state6 = 45'd32;
  parameter ap_ST_fsm_state7 = 45'd64;
  parameter ap_ST_fsm_state8 = 45'd128;
  parameter ap_ST_fsm_state9 = 45'd256;
  parameter ap_ST_fsm_state10 = 45'd512;
  parameter ap_ST_fsm_state11 = 45'd1024;
  parameter ap_ST_fsm_state12 = 45'd2048;
  parameter ap_ST_fsm_state13 = 45'd4096;
  parameter ap_ST_fsm_state14 = 45'd8192;
  parameter ap_ST_fsm_state15 = 45'd16384;
  parameter ap_ST_fsm_state16 = 45'd32768;
  parameter ap_ST_fsm_state17 = 45'd65536;
  parameter ap_ST_fsm_state18 = 45'd131072;
  parameter ap_ST_fsm_state19 = 45'd262144;
  parameter ap_ST_fsm_state20 = 45'd524288;
  parameter ap_ST_fsm_state21 = 45'd1048576;
  parameter ap_ST_fsm_state22 = 45'd2097152;
  parameter ap_ST_fsm_state23 = 45'd4194304;
  parameter ap_ST_fsm_state24 = 45'd8388608;
  parameter ap_ST_fsm_state25 = 45'd16777216;
  parameter ap_ST_fsm_state26 = 45'd33554432;
  parameter ap_ST_fsm_state27 = 45'd67108864;
  parameter ap_ST_fsm_state28 = 45'd134217728;
  parameter ap_ST_fsm_state29 = 45'd268435456;
  parameter ap_ST_fsm_state30 = 45'd536870912;
  parameter ap_ST_fsm_state31 = 45'd1073741824;
  parameter ap_ST_fsm_state32 = 45'd2147483648;
  parameter ap_ST_fsm_state33 = 45'd4294967296;
  parameter ap_ST_fsm_state34 = 45'd8589934592;
  parameter ap_ST_fsm_state35 = 45'd17179869184;
  parameter ap_ST_fsm_state36 = 45'd34359738368;
  parameter ap_ST_fsm_state37 = 45'd68719476736;
  parameter ap_ST_fsm_state38 = 45'd137438953472;
  parameter ap_ST_fsm_state39 = 45'd274877906944;
  parameter ap_ST_fsm_state40 = 45'd549755813888;
  parameter ap_ST_fsm_state41 = 45'd1099511627776;
  parameter ap_ST_fsm_state42 = 45'd2199023255552;
  parameter ap_ST_fsm_state43 = 45'd4398046511104;
  parameter ap_ST_fsm_state44 = 45'd8796093022208;
  parameter ap_ST_fsm_state45 = 45'd17592186044416;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  input [45:0] working_key;
  output ap_ready;
  input [6:0] xin1;
  input [6:0] xin2;
  output [4:0] tqmf_address0;
  output tqmf_ce0;
  output tqmf_we0;
  output [6:0] tqmf_d0;
  input [6:0] tqmf_q0;
  output [4:0] tqmf_address1;
  output tqmf_ce1;
  output tqmf_we1;
  output [6:0] tqmf_d1;
  input [6:0] tqmf_q1;
  output [2:0] delay_bpl_address0;
  output delay_bpl_ce0;
  output delay_bpl_we0;
  output [31:0] delay_bpl_d0;
  input [31:0] delay_bpl_q0;
  output [2:0] delay_dltx_address0;
  output delay_dltx_ce0;
  output delay_dltx_we0;
  output [31:0] delay_dltx_d0;
  input [31:0] delay_dltx_q0;
  output [2:0] delay_dltx_address1;
  output delay_dltx_ce1;
  output delay_dltx_we1;
  output [31:0] delay_dltx_d1;
  input [31:0] delay_dltx_q1;
  input [31:0] rlt1_i;
  output [31:0] rlt1_o;
  output rlt1_o_ap_vld;
  input [31:0] al1_i;
  output [31:0] al1_o;
  output al1_o_ap_vld;
  input [31:0] rlt2_i;
  output [31:0] rlt2_o;
  output rlt2_o_ap_vld;
  input [31:0] al2_i;
  output [31:0] al2_o;
  output al2_o_ap_vld;
  input [31:0] detl_i;
  output [31:0] detl_o;
  output detl_o_ap_vld;
  input [5:0] il_i;
  output [5:0] il_o;
  output il_o_ap_vld;
  input [31:0] nbl_i;
  output [31:0] nbl_o;
  output nbl_o_ap_vld;
  input [31:0] plt1_i;
  output [31:0] plt1_o;
  output plt1_o_ap_vld;
  input [31:0] plt2_i;
  output [31:0] plt2_o;
  output plt2_o_ap_vld;
  output [2:0] delay_bph_address0;
  output delay_bph_ce0;
  output delay_bph_we0;
  output [31:0] delay_bph_d0;
  input [31:0] delay_bph_q0;
  output [2:0] delay_dhx_address0;
  output delay_dhx_ce0;
  output delay_dhx_we0;
  output [31:0] delay_dhx_d0;
  input [31:0] delay_dhx_q0;
  output [2:0] delay_dhx_address1;
  output delay_dhx_ce1;
  output delay_dhx_we1;
  output [31:0] delay_dhx_d1;
  input [31:0] delay_dhx_q1;
  input [31:0] rh1_i;
  output [31:0] rh1_o;
  output rh1_o_ap_vld;
  input [31:0] ah1_i;
  output [31:0] ah1_o;
  output ah1_o_ap_vld;
  input [31:0] rh2_i;
  output [31:0] rh2_o;
  output rh2_o_ap_vld;
  input [31:0] ah2_i;
  output [31:0] ah2_o;
  output ah2_o_ap_vld;
  input [31:0] ih_i;
  output [31:0] ih_o;
  output ih_o_ap_vld;
  input [14:0] deth_i;
  output [14:0] deth_o;
  output deth_o_ap_vld;
  input [31:0] nbh_i;
  output [31:0] nbh_o;
  output nbh_o_ap_vld;
  input [31:0] ph1_i;
  output [31:0] ph1_o;
  output ph1_o_ap_vld;
  input [31:0] ph2_i;
  output [31:0] ph2_o;
  output ph2_o_ap_vld;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [4:0] tqmf_address0;
  reg tqmf_ce0;
  reg tqmf_we0;
  reg [4:0] tqmf_address1;
  reg tqmf_ce1;
  reg tqmf_we1;
  reg [6:0] tqmf_d1;
  reg [2:0] delay_bpl_address0;
  reg delay_bpl_ce0;
  reg delay_bpl_we0;
  reg [2:0] delay_dltx_address0;
  reg delay_dltx_ce0;
  reg delay_dltx_we0;
  reg delay_dltx_ce1;
  reg delay_dltx_we1;
  reg [31:0] rlt1_o;
  reg rlt1_o_ap_vld;
  reg [31:0] al1_o;
  reg al1_o_ap_vld;
  reg [31:0] rlt2_o;
  reg rlt2_o_ap_vld;
  reg [31:0] al2_o;
  reg al2_o_ap_vld;
  reg [31:0] detl_o;
  reg detl_o_ap_vld;
  reg [5:0] il_o;
  reg il_o_ap_vld;
  reg [31:0] nbl_o;
  reg nbl_o_ap_vld;
  reg [31:0] plt1_o;
  reg plt1_o_ap_vld;
  reg [31:0] plt2_o;
  reg plt2_o_ap_vld;
  reg [2:0] delay_bph_address0;
  reg delay_bph_ce0;
  reg delay_bph_we0;
  reg [2:0] delay_dhx_address0;
  reg delay_dhx_ce0;
  reg delay_dhx_we0;
  reg delay_dhx_ce1;
  reg delay_dhx_we1;
  reg [31:0] rh1_o;
  reg rh1_o_ap_vld;
  reg [31:0] ah1_o;
  reg ah1_o_ap_vld;
  reg [31:0] rh2_o;
  reg rh2_o_ap_vld;
  reg [31:0] ah2_o;
  reg ah2_o_ap_vld;
  reg [31:0] ih_o;
  reg ih_o_ap_vld;
  reg [14:0] deth_o;
  reg deth_o_ap_vld;
  reg [31:0] nbh_o;
  reg nbh_o_ap_vld;
  reg [31:0] ph1_o;
  reg ph1_o_ap_vld;
  reg [31:0] ph2_o;
  reg ph2_o_ap_vld;
  reg [31:0] ap_return;
  reg [44:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [4:0] h_address0;
  reg h_ce0;
  wire [14:0] h_q0;
  wire [4:0] h_address1;
  reg h_ce1;
  wire [14:0] h_q1;
  reg [10:0] xh;
  reg [18:0] sl;
  wire [4:0] decis_levl_address0;
  reg decis_levl_ce0;
  wire [14:0] decis_levl_q0;
  wire [4:0] quant26bt_pos_address0;
  reg quant26bt_pos_ce0;
  wire [5:0] quant26bt_pos_q0;
  wire [4:0] quant26bt_neg_address0;
  reg quant26bt_neg_ce0;
  wire [5:0] quant26bt_neg_q0;
  wire [3:0] qq4_code4_table_address0;
  reg qq4_code4_table_ce0;
  wire [15:0] qq4_code4_table_q0;
  reg [31:0] dlt;
  wire [3:0] wl_code_table_address0;
  reg wl_code_table_ce0;
  wire [12:0] wl_code_table_q0;
  reg [4:0] ilb_table_address0;
  reg ilb_table_ce0;
  wire [11:0] ilb_table_q0;
  reg [31:0] plt;
  reg [18:0] sh;
  reg [31:0] dh;
  reg [31:0] ph;
  reg [6:0] reg_666;
  wire ap_CS_fsm_state4;
  wire ap_CS_fsm_state6;
  reg signed [31:0] reg_670;
  wire ap_CS_fsm_state10;
  wire ap_CS_fsm_state14;
  reg signed [31:0] reg_674;
  reg signed [31:0] reg_678;
  wire ap_CS_fsm_state29;
  wire ap_CS_fsm_state33;
  reg signed [31:0] reg_682;
  wire ap_CS_fsm_state2;
  wire signed [25:0] xa_cast_fu_722_p1;
  wire signed [25:0] xb_cast_fu_736_p1;
  wire ap_CS_fsm_state3;
  wire [3:0] i_8_fu_752_p2;
  reg [3:0] i_8_reg_2467;
  wire [0:0] exitcond2_fu_746_p2;
  wire [4:0] phitmp_fu_770_p2;
  reg [4:0] phitmp_reg_2482;
  reg signed [14:0] h_load_reg_2487;
  reg [6:0] tqmf_load_5_reg_2492;
  reg signed [14:0] h_ptr_load_reg_2497;
  wire signed [25:0] grp_fu_2403_p3;
  wire ap_CS_fsm_state5;
  wire signed [25:0] grp_fu_2411_p3;
  wire signed [25:0] grp_fu_2419_p3;
  reg signed [25:0] xa_1_reg_2512;
  wire ap_CS_fsm_state7;
  wire signed [26:0] xa_1_cast_fu_793_p1;
  reg signed [26:0] xa_1_cast_reg_2517;
  wire signed [25:0] xb_1_fu_830_p2;
  reg signed [25:0] xb_1_reg_2522;
  wire signed [26:0] xb_1_cast_fu_836_p1;
  reg signed [26:0] xb_1_cast_reg_2527;
  reg [4:0] tqmf_addr_2_reg_2532;
  wire ap_CS_fsm_state8;
  wire [5:0] tqmf_ptr1_0_rec_fu_851_p2;
  reg [5:0] tqmf_ptr1_0_rec_reg_2537;
  wire [4:0] i_9_fu_874_p2;
  reg [4:0] i_9_reg_2550;
  reg [11:0] tmp_2_reg_2555;
  wire [0:0] exitcond_fu_868_p2;
  wire [31:0] zl_fu_914_p2;
  reg [31:0] zl_reg_2560;
  wire ap_CS_fsm_state11;
  wire signed [18:0] tmp_19_cast_fu_920_p1;
  reg signed [18:0] tmp_19_cast_reg_2565;
  wire ap_CS_fsm_state12;
  wire [2:0] p_01_rec_i_fu_923_p2;
  reg [2:0] p_01_rec_i_reg_2570;
  wire ap_CS_fsm_state13;
  wire [31:0] pl_fu_945_p2;
  reg [31:0] pl_reg_2588;
  wire [0:0] exitcond5_fu_935_p2;
  wire [31:0] tmp_i8_fu_951_p2;
  reg [31:0] tmp_i8_reg_2593;
  wire [31:0] tmp_i_fu_957_p2;
  reg [31:0] tmp_i_reg_2598;
  wire ap_CS_fsm_state15;
  wire [31:0] zl_1_fu_963_p2;
  wire ap_CS_fsm_state16;
  reg [16:0] tmp_41_i_reg_2608;
  wire ap_CS_fsm_state17;
  wire signed [18:0] tmp_i_cast_fu_992_p1;
  reg signed [18:0] tmp_i_cast_reg_2613;
  wire ap_CS_fsm_state18;
  reg signed [31:0] detl_load_reg_2618;
  wire [0:0] tmp_12_fu_1020_p3;
  reg [0:0] tmp_12_reg_2624;
  wire [18:0] wd_fu_1034_p3;
  reg [18:0] wd_reg_2629;
  wire [0:0] tmp_i1_fu_1042_p2;
  reg [0:0] tmp_i1_reg_2634;
  wire ap_CS_fsm_state19;
  wire [4:0] mil_fu_1048_p2;
  reg [4:0] mil_reg_2638;
  reg [14:0] decis_levl_load_reg_2648;
  wire ap_CS_fsm_state20;
  reg [16:0] tmp_28_i_reg_2653;
  wire ap_CS_fsm_state21;
  wire ap_CS_fsm_state22;
  wire [0:0] tmp_14_i_fu_1080_p2;
  wire ap_CS_fsm_state23;
  reg [15:0] qq4_code4_table_load_reg_2681;
  wire ap_CS_fsm_state24;
  wire [24:0] nbl_assign_1_cast_fu_1164_p2;
  reg [24:0] nbl_assign_1_cast_reg_2686;
  reg [0:0] tmp_29_reg_2691;
  reg signed [16:0] tmp_21_reg_2696;
  wire ap_CS_fsm_state25;
  reg [3:0] wd2_cast_reg_2703;
  wire [31:0] tmp_i4_fu_1327_p2;
  reg [31:0] tmp_i4_reg_2713;
  wire ap_CS_fsm_state27;
  wire grp_upzero_fu_631_ap_ready;
  wire grp_upzero_fu_631_ap_done;
  wire [31:0] tmp_5_i_fu_1333_p2;
  reg [31:0] tmp_5_i_reg_2718;
  reg [0:0] tmp_52_reg_2723;
  wire [26:0] apl2_fu_1461_p2;
  reg [26:0] apl2_reg_2728;
  wire ap_CS_fsm_state28;
  reg [23:0] tmp_21_i_reg_2734;
  wire signed [14:0] apl2_assign_fu_1511_p3;
  reg signed [14:0] apl2_assign_reg_2739;
  wire [24:0] apl1_fu_1535_p2;
  reg [24:0] apl1_reg_2745;
  wire [15:0] tmp_53_fu_1575_p1;
  reg [15:0] tmp_53_reg_2751;
  wire ap_CS_fsm_state30;
  wire signed [15:0] apl1_2_fu_1579_p2;
  reg signed [15:0] apl1_2_reg_2756;
  wire [0:0] tmp_7_i_fu_1589_p2;
  reg [0:0] tmp_7_i_reg_2761;
  wire [31:0] grp_fu_686_p2;
  reg [31:0] zl_2_reg_2766;
  wire [2:0] p_01_rec_i1_fu_1640_p2;
  reg [2:0] p_01_rec_i1_reg_2771;
  wire ap_CS_fsm_state32;
  wire [31:0] pl_1_fu_1662_p2;
  reg [31:0] pl_1_reg_2789;
  wire [0:0] exitcond4_fu_1652_p2;
  wire [31:0] tmp_i4_28_fu_1668_p2;
  reg [31:0] tmp_i4_28_reg_2794;
  reg [31:0] tmp_i5_27_reg_2799;
  wire ap_CS_fsm_state34;
  wire [31:0] zl_3_fu_1674_p2;
  wire ap_CS_fsm_state35;
  wire signed [18:0] tmp_i6_cast_fu_1689_p1;
  reg signed [18:0] tmp_i6_cast_reg_2809;
  wire ap_CS_fsm_state36;
  wire [18:0] tmp_26_fu_1711_p2;
  reg [18:0] tmp_26_reg_2814;
  wire [26:0] tmp_28_fu_2428_p2;
  reg [26:0] tmp_28_reg_2824;
  wire [0:0] tmp_54_fu_1744_p3;
  reg [0:0] tmp_54_reg_2829;
  wire ap_CS_fsm_state37;
  wire [1:0] tmp_27_fu_1752_p3;
  wire [31:0] extLd1_fu_1774_p1;
  reg [31:0] extLd1_reg_2840;
  wire [0:0] tmp_31_fu_1816_p2;
  reg [0:0] tmp_31_reg_2845;
  wire signed [31:0] tmp_9_fu_1843_p6;
  reg signed [31:0] tmp_9_reg_2849;
  wire ap_CS_fsm_state38;
  wire [30:0] nbh_assign_1_cast_fu_1915_p2;
  reg [30:0] nbh_assign_1_cast_reg_2854;
  reg [0:0] tmp_59_reg_2859;
  reg signed [16:0] tmp_35_reg_2864;
  wire ap_CS_fsm_state39;
  reg [3:0] wd2_6_cast_reg_2871;
  wire [31:0] tmp_i3_fu_2070_p2;
  reg [31:0] tmp_i3_reg_2881;
  wire ap_CS_fsm_state41;
  wire [31:0] tmp_5_i2_fu_2076_p2;
  reg [31:0] tmp_5_i2_reg_2886;
  reg [0:0] tmp_67_reg_2891;
  wire [26:0] apl2_1_fu_2204_p2;
  reg [26:0] apl2_1_reg_2896;
  wire ap_CS_fsm_state42;
  reg [23:0] tmp_21_i1_reg_2902;
  wire signed [14:0] apl2_assign_1_fu_2254_p3;
  reg signed [14:0] apl2_assign_1_reg_2907;
  wire ap_CS_fsm_state43;
  wire [24:0] apl1_4_fu_2278_p2;
  reg [24:0] apl1_4_reg_2913;
  wire [15:0] tmp_68_fu_2318_p1;
  reg [15:0] tmp_68_reg_2919;
  wire ap_CS_fsm_state44;
  wire signed [15:0] apl1_6_fu_2322_p2;
  reg signed [15:0] apl1_6_reg_2924;
  wire [0:0] tmp_7_i1_fu_2332_p2;
  reg [0:0] tmp_7_i1_reg_2929;
  wire grp_upzero_fu_631_ap_start;
  wire grp_upzero_fu_631_ap_idle;
  reg [16:0] grp_upzero_fu_631_dlt;
  wire [2:0] grp_upzero_fu_631_dlti_address0;
  wire grp_upzero_fu_631_dlti_ce0;
  wire grp_upzero_fu_631_dlti_we0;
  wire [31:0] grp_upzero_fu_631_dlti_d0;
  reg [31:0] grp_upzero_fu_631_dlti_q0;
  wire [2:0] grp_upzero_fu_631_dlti_address1;
  wire grp_upzero_fu_631_dlti_ce1;
  wire grp_upzero_fu_631_dlti_we1;
  wire [31:0] grp_upzero_fu_631_dlti_d1;
  reg [31:0] grp_upzero_fu_631_dlti_q1;
  wire [2:0] grp_upzero_fu_631_bli_address0;
  wire grp_upzero_fu_631_bli_ce0;
  wire grp_upzero_fu_631_bli_we0;
  wire [31:0] grp_upzero_fu_631_bli_d0;
  reg [31:0] grp_upzero_fu_631_bli_q0;
  reg [4:0] tqmf_ptr_0_rec_reg_504;
  reg [3:0] i_reg_515;
  reg [25:0] xa1_reg_526;
  reg [25:0] xb1_reg_536;
  reg [5:0] tqmf_ptr_0_pn_rec_reg_546;
  wire ap_CS_fsm_state9;
  reg [4:0] i_1_reg_557;
  reg [31:0] zl1_i_reg_568;
  reg [2:0] dlt_pn_rec_i_reg_578;
  reg [4:0] mil_i_reg_589;
  reg [31:0] zl1_i1_reg_601;
  wire ap_CS_fsm_state31;
  reg [2:0] dlt_pn_rec_i1_reg_611;
  wire [1:0] tmp_32_fu_1822_p3;
  reg [1:0] ap_phi_mux_ih_assign_phi_fu_625_p4;
  reg [1:0] ih_assign_reg_622;
  reg grp_upzero_fu_631_ap_start_reg;
  wire ap_CS_fsm_state26;
  wire ap_CS_fsm_state40;
  wire [63:0] tqmf_ptr_0_rec_cast_fu_740_p1;
  wire [63:0] tqmf_ptr_0_sum1_cast_fu_764_p1;
  wire [63:0] p_sum_cast_fu_846_p1;
  wire [63:0] tqmf_ptr_0_sum_cast_fu_863_p1;
  wire [63:0] p_01_rec_i_cast_fu_929_p1;
  wire [63:0] tmp_i1_24_fu_1054_p1;
  wire [63:0] tmp_16_i_fu_1085_p1;
  wire [63:0] tmp_19_fu_1114_p1;
  wire [63:0] tmp_i2_25_fu_1250_p1;
  wire [63:0] p_01_rec_i1_cast_fu_1646_p1;
  wire [63:0] tmp_i7_30_fu_1997_p1;
  wire [18:0] tmp_17_fu_999_p2;
  wire signed [31:0] tmp_22_fu_1255_p1;
  wire signed [31:0] tmp_33_cast_fu_1305_p1;
  wire ap_CS_fsm_state45;
  wire signed [31:0] tmp_36_fu_2002_p1;
  wire signed [31:0] tmp_50_cast_fu_2048_p1;
  wire [5:0] ril_2_fu_1091_p3;
  wire [31:0] nbl_assign_2_cast_fu_1220_p1;
  wire [31:0] tmp_10_i_cast_fu_1290_p1;
  wire signed [31:0] apl2_assign_cast_fu_1541_p1;
  wire signed [31:0] apl1_3_cast_fu_1600_p1;
  wire [31:0] tmp_25_fu_1622_p2;
  wire [31:0] tmp_39_cast_cast_fu_1760_p3;
  wire [31:0] tmp_44_cast_cast_fu_1830_p3;
  wire [31:0] nbl_assign_3_cast_fu_1967_p1;
  wire [14:0] tmp_10_i1_fu_2029_p3;
  wire signed [31:0] apl2_assign_1_cast_fu_2284_p1;
  wire signed [31:0] apl1_7_cast_fu_2343_p1;
  wire [31:0] tmp_38_fu_2365_p2;
  wire [10:0] p_shl_fu_692_p3;
  wire [8:0] p_shl1_fu_704_p3;
  wire [11:0] p_shl_cast_fu_700_p1;
  wire [11:0] p_shl1_cast_fu_712_p1;
  wire [11:0] xa_fu_716_p2;
  wire [6:0] xb_fu_730_p0;
  wire [13:0] xb_fu_730_p2;
  wire [4:0] tqmf_ptr_0_sum1_fu_758_p2;
  wire [10:0] p_shl2_fu_796_p3;
  wire [8:0] p_shl3_fu_808_p3;
  wire [11:0] p_shl2_cast_fu_804_p1;
  wire [11:0] p_shl3_cast_fu_816_p1;
  wire [11:0] tmp_s_fu_820_p2;
  wire signed [25:0] tmp_cast_20_fu_826_p1;
  wire [5:0] p_sum_fu_840_p2;
  wire [5:0] tqmf_ptr_0_sum_fu_857_p2;
  wire [26:0] tmp_15_fu_880_p2;
  wire [25:0] tmp_16_fu_894_p2;
  wire signed [31:0] pl_fu_945_p0;
  wire signed [31:0] pl_fu_945_p1;
  wire signed [31:0] tmp_i8_fu_951_p0;
  wire signed [31:0] tmp_i8_fu_951_p1;
  wire [31:0] tmp_i9_fu_968_p2;
  wire [17:0] tmp_39_i_fu_982_p4;
  wire signed [18:0] tmp_20_i_cast_fu_996_p1;
  wire [18:0] el_assign_fu_1011_p2;
  wire [18:0] m_fu_1028_p2;
  wire [14:0] tmp_13_i_fu_1062_p0;
  wire [31:0] tmp_13_i_fu_1062_p2;
  wire signed [18:0] decis_1_cast_fu_1077_p1;
  wire [3:0] tmp_18_fu_1104_p4;
  wire [31:0] tmp_23_fu_1124_p2;
  wire [31:0] tmp_i2_fu_1130_p2;
  wire signed [24:0] tmp_32_i_fu_1136_p4;
  wire signed [12:0] wl_code_table_load_c_fu_1150_p0;
  wire signed [12:0] tmp_6_fu_1154_p0;
  wire signed [25:0] wd_1_cast_fu_1146_p1;
  wire signed [25:0] wl_code_table_load_c_fu_1150_p1;
  wire signed [24:0] tmp_6_fu_1154_p1;
  wire [25:0] nbl_assign_1_fu_1158_p2;
  wire signed [15:0] tmp_20_fu_1181_p1;
  wire [31:0] tmp_20_fu_1181_p2;
  wire [24:0] p_i_fu_1196_p3;
  wire [0:0] tmp_18_i_fu_1206_p2;
  wire [14:0] tmp_34_fu_1202_p1;
  wire [14:0] nbl_assign_2_fu_1212_p3;
  wire [4:0] wd1_fu_1230_p4;
  wire [3:0] tmp_9_i_fu_1267_p2;
  wire [11:0] tmp_9_i_cast_cast_fu_1272_p1;
  wire [11:0] wd3_fu_1276_p2;
  wire [14:0] tmp_10_i_fu_1282_p3;
  wire signed [18:0] tmp_32_cast_fu_1258_p1;
  wire [18:0] tmp_24_fu_1300_p2;
  wire signed [31:0] tmp_i4_fu_1327_p0;
  wire signed [31:0] tmp_i4_fu_1327_p1;
  wire signed [31:0] tmp_5_i_fu_1333_p0;
  wire signed [31:0] tmp_5_i_fu_1333_p1;
  wire [31:0] wd2_fu_1359_p2;
  wire [31:0] wd2_1_fu_1372_p2;
  wire [0:0] tmp_44_fu_1365_p3;
  wire [24:0] tmp_41_fu_1388_p4;
  wire [24:0] tmp_39_fu_1378_p4;
  wire [24:0] tmp_42_fu_1398_p3;
  wire [0:0] tmp_45_fu_1410_p3;
  wire [31:0] tmp_46_fu_1425_p2;
  wire [31:0] tmp_9_i1_fu_1431_p2;
  wire [24:0] tmp_19_i_fu_1437_p4;
  wire signed [25:0] wd2_4_cast_fu_1406_p1;
  wire signed [25:0] tmp_1_i_cast_fu_1447_p1;
  wire [25:0] tmp6_fu_1451_p2;
  wire [26:0] tmp_8_i_cast_cast_fu_1417_p3;
  wire signed [26:0] tmp6_cast_fu_1457_p1;
  wire [31:0] tmp_48_fu_1467_p2;
  wire [31:0] tmp_i5_fu_1473_p2;
  wire [0:0] tmp_2_i_fu_1489_p2;
  wire [26:0] p_i1_fu_1494_p3;
  wire [0:0] tmp_3_i_fu_1505_p2;
  wire [14:0] tmp_47_fu_1501_p1;
  wire signed [24:0] wd2_5_cast_fu_1519_p1;
  wire [24:0] tmp_4_i_cast_cast_fu_1522_p3;
  wire [24:0] tmp7_fu_1529_p2;
  wire [14:0] apl1_8_fu_1550_p2;
  wire [24:0] apl1_8_cast_fu_1559_p1;
  wire [0:0] tmp_6_i_fu_1563_p2;
  wire [24:0] wd3_0_apl1_i_fu_1568_p3;
  wire [15:0] apl1_8_cast1_fu_1555_p1;
  wire signed [24:0] apl1_2_cast_fu_1585_p1;
  wire [15:0] apl1_3_fu_1595_p3;
  wire signed [31:0] extLd_fu_1614_p1;
  wire signed [31:0] pl_1_fu_1662_p0;
  wire signed [31:0] pl_1_fu_1662_p1;
  wire signed [31:0] tmp_i4_28_fu_1668_p0;
  wire signed [31:0] tmp_i4_28_fu_1668_p1;
  wire [17:0] tmp_39_i1_fu_1679_p4;
  wire [31:0] tmp_i7_fu_1693_p2;
  wire [16:0] tmp_41_i1_fu_1697_p4;
  wire signed [18:0] tmp_20_i2_cast_fu_1707_p1;
  wire signed [18:0] xh_load_cast_fu_1735_p1;
  wire [18:0] n_assign_fu_1739_p2;
  wire [14:0] tmp_55_fu_1777_p4;
  wire [0:0] tmp_56_fu_1790_p3;
  wire [18:0] m_1_fu_1798_p2;
  wire [18:0] n_assign_2_fu_1804_p3;
  wire signed [19:0] n_assign_3_cast_fu_1812_p1;
  wire signed [19:0] tmp_30_fu_1786_p1;
  wire [31:0] tmp_57_fu_1861_p2;
  wire [31:0] tmp_i_29_fu_1867_p2;
  wire signed [24:0] tmp_36_i_fu_1873_p4;
  wire [31:0] tmp_10_fu_1887_p6;
  wire signed [31:0] wd_1_fu_1883_p1;
  wire signed [30:0] tmp_11_fu_1901_p1;
  wire [30:0] tmp_58_fu_1905_p1;
  wire [31:0] nbh_assign_1_fu_1909_p2;
  wire [14:0] tmp_33_fu_1929_p0;
  wire [31:0] tmp_33_fu_1929_p2;
  wire [30:0] p_i2_fu_1943_p3;
  wire [0:0] tmp_19_i1_fu_1953_p2;
  wire [14:0] tmp_60_fu_1949_p1;
  wire [14:0] nbl_assign_3_fu_1959_p3;
  wire [4:0] wd1_1_fu_1977_p4;
  wire [3:0] tmp_9_i2_fu_2014_p2;
  wire [11:0] tmp_9_i2_cast_cast_fu_2019_p1;
  wire [11:0] wd3_2_fu_2023_p2;
  wire signed [18:0] tmp_49_cast_fu_2005_p1;
  wire [18:0] tmp_37_fu_2043_p2;
  wire signed [31:0] tmp_i3_fu_2070_p0;
  wire signed [31:0] tmp_i3_fu_2070_p1;
  wire signed [31:0] tmp_5_i2_fu_2076_p0;
  wire signed [31:0] tmp_5_i2_fu_2076_p1;
  wire [31:0] wd2_2_fu_2102_p2;
  wire [31:0] wd2_3_fu_2115_p2;
  wire [0:0] tmp_62_fu_2108_p3;
  wire [24:0] tmp_49_fu_2131_p4;
  wire [24:0] tmp_43_fu_2121_p4;
  wire [24:0] tmp_50_fu_2141_p3;
  wire [0:0] tmp_63_fu_2153_p3;
  wire [31:0] tmp_64_fu_2168_p2;
  wire [31:0] tmp_9_i3_fu_2174_p2;
  wire [24:0] tmp_19_i2_fu_2180_p4;
  wire signed [25:0] tmp_1_i1_cast_fu_2190_p1;
  wire signed [25:0] wd2_10_cast_fu_2149_p1;
  wire [25:0] tmp8_fu_2194_p2;
  wire signed [26:0] tmp8_cast_fu_2200_p1;
  wire [26:0] tmp_8_i1_cast_cast_fu_2160_p3;
  wire [31:0] tmp_66_fu_2210_p2;
  wire [31:0] tmp_i6_fu_2216_p2;
  wire [0:0] tmp_2_i1_fu_2232_p2;
  wire [26:0] p_i3_fu_2237_p3;
  wire [0:0] tmp_3_i1_fu_2248_p2;
  wire [14:0] tmp_65_fu_2244_p1;
  wire signed [24:0] wd2_11_cast_fu_2262_p1;
  wire [24:0] tmp9_fu_2272_p2;
  wire [24:0] tmp_4_i1_cast_cast_fu_2265_p3;
  wire [14:0] apl1_9_fu_2293_p2;
  wire [24:0] apl1_9_cast_fu_2302_p1;
  wire [0:0] tmp_6_i1_fu_2306_p2;
  wire [24:0] wd3_0_apl1_i1_fu_2311_p3;
  wire [15:0] apl1_9_cast1_fu_2298_p1;
  wire signed [24:0] apl1_6_cast_fu_2328_p1;
  wire [15:0] apl1_7_fu_2338_p3;
  wire signed [31:0] extLd2_fu_2357_p1;
  wire [25:0] tmp_69_fu_2391_p1;
  wire [6:0] grp_fu_2403_p1;
  wire [6:0] grp_fu_2411_p1;
  wire [6:0] grp_fu_2419_p0;
  wire signed [6:0] grp_fu_2419_p1;
  wire [14:0] tmp_28_fu_2428_p0;
  wire [10:0] tmp_28_fu_2428_p1;
  wire [31:0] tmp_40_fu_2395_p3;
  reg [31:0] ap_return_preg;
  reg [44:0] ap_NS_fsm;
  wire [21:0] grp_fu_2403_p10;
  wire [21:0] grp_fu_2411_p10;
  wire [13:0] grp_fu_2419_p00;
  wire [31:0] tmp_13_i_fu_1062_p00;
  wire [26:0] tmp_28_fu_2428_p00;
  wire [13:0] xb_fu_730_p00;

  initial begin
    #0 ap_CS_fsm = 45'd1;
    #0 xh = 11'd0;
    #0 sl = 19'd0;
    #0 dlt = 32'd0;
    #0 plt = 32'd0;
    #0 sh = 19'd0;
    #0 dh = 32'd0;
    #0 ph = 32'd0;
    #0 grp_upzero_fu_631_ap_start_reg = 1'b0;
    #0 ap_return_preg = 32'd0;
  end


  encode_h
  #(
    .DataWidth(15),
    .AddressRange(24),
    .AddressWidth(5)
  )
  h_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(h_address0),
    .ce0(h_ce0),
    .q0(h_q0),
    .address1(h_address1),
    .ce1(h_ce1),
    .q1(h_q1)
  );


  encode_decis_levl
  #(
    .DataWidth(15),
    .AddressRange(30),
    .AddressWidth(5)
  )
  decis_levl_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(decis_levl_address0),
    .ce0(decis_levl_ce0),
    .q0(decis_levl_q0)
  );


  encode_quant26bt_bkb
  #(
    .DataWidth(6),
    .AddressRange(31),
    .AddressWidth(5)
  )
  quant26bt_pos_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(quant26bt_pos_address0),
    .ce0(quant26bt_pos_ce0),
    .q0(quant26bt_pos_q0)
  );


  encode_quant26bt_cud
  #(
    .DataWidth(6),
    .AddressRange(31),
    .AddressWidth(5)
  )
  quant26bt_neg_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(quant26bt_neg_address0),
    .ce0(quant26bt_neg_ce0),
    .q0(quant26bt_neg_q0)
  );


  encode_qq4_code4_dEe
  #(
    .DataWidth(16),
    .AddressRange(16),
    .AddressWidth(4)
  )
  qq4_code4_table_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(qq4_code4_table_address0),
    .ce0(qq4_code4_table_ce0),
    .q0(qq4_code4_table_q0)
  );


  encode_wl_code_taeOg
  #(
    .DataWidth(13),
    .AddressRange(16),
    .AddressWidth(4)
  )
  wl_code_table_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(wl_code_table_address0),
    .ce0(wl_code_table_ce0),
    .q0(wl_code_table_q0)
  );


  encode_ilb_table
  #(
    .DataWidth(12),
    .AddressRange(32),
    .AddressWidth(5)
  )
  ilb_table_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(ilb_table_address0),
    .ce0(ilb_table_ce0),
    .q0(ilb_table_q0)
  );


  upzero
  grp_upzero_fu_631
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_upzero_fu_631_ap_start),
    .ap_done(grp_upzero_fu_631_ap_done),
    .ap_idle(grp_upzero_fu_631_ap_idle),
    .ap_ready(grp_upzero_fu_631_ap_ready),
    .dlt(grp_upzero_fu_631_dlt),
    .dlti_address0(grp_upzero_fu_631_dlti_address0),
    .dlti_ce0(grp_upzero_fu_631_dlti_ce0),
    .dlti_we0(grp_upzero_fu_631_dlti_we0),
    .dlti_d0(grp_upzero_fu_631_dlti_d0),
    .dlti_q0(grp_upzero_fu_631_dlti_q0),
    .dlti_address1(grp_upzero_fu_631_dlti_address1),
    .dlti_ce1(grp_upzero_fu_631_dlti_ce1),
    .dlti_we1(grp_upzero_fu_631_dlti_we1),
    .dlti_d1(grp_upzero_fu_631_dlti_d1),
    .dlti_q1(grp_upzero_fu_631_dlti_q1),
    .bli_address0(grp_upzero_fu_631_bli_address0),
    .bli_ce0(grp_upzero_fu_631_bli_ce0),
    .bli_we0(grp_upzero_fu_631_bli_we0),
    .bli_d0(grp_upzero_fu_631_bli_d0),
    .bli_q0(grp_upzero_fu_631_bli_q0)
    .working_key(working_key)
  );


  adpcm_main_mux_42fYi
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .din2_WIDTH(32),
    .din3_WIDTH(32),
    .din4_WIDTH(2),
    .dout_WIDTH(32)
  )
  adpcm_main_mux_42fYi_U47
  (
    .din0(32'd4294959888),
    .din1(32'd4294965680),
    .din2(32'd7408),
    .din3(32'd1616),
    .din4(ap_phi_mux_ih_assign_phi_fu_625_p4),
    .dout(tmp_9_fu_1843_p6)
  );


  adpcm_main_mux_42fYi
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .din2_WIDTH(32),
    .din3_WIDTH(32),
    .din4_WIDTH(2),
    .dout_WIDTH(32)
  )
  adpcm_main_mux_42fYi_U48
  (
    .din0(32'd798),
    .din1(32'd4294967082),
    .din2(32'd798),
    .din3(32'd4294967082),
    .din4(ap_phi_mux_ih_assign_phi_fu_625_p4),
    .dout(tmp_10_fu_1887_p6)
  );


  adpcm_main_mac_mug8j
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(15),
    .din1_WIDTH(7),
    .din2_WIDTH(26),
    .dout_WIDTH(26)
  )
  adpcm_main_mac_mug8j_U49
  (
    .din0(h_load_reg_2487),
    .din1(grp_fu_2403_p1),
    .din2(xa1_reg_526),
    .dout(grp_fu_2403_p3)
  );


  adpcm_main_mac_mug8j
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(15),
    .din1_WIDTH(7),
    .din2_WIDTH(26),
    .dout_WIDTH(26)
  )
  adpcm_main_mac_mug8j_U50
  (
    .din0(h_ptr_load_reg_2497),
    .din1(grp_fu_2411_p1),
    .din2(xb1_reg_536),
    .dout(grp_fu_2411_p3)
  );


  adpcm_main_mac_muhbi
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(7),
    .din1_WIDTH(7),
    .din2_WIDTH(26),
    .dout_WIDTH(26)
  )
  adpcm_main_mac_muhbi_U51
  (
    .din0(grp_fu_2419_p0),
    .din1(grp_fu_2419_p1),
    .din2(xa1_reg_526),
    .dout(grp_fu_2419_p3)
  );


  adpcm_main_mul_muibs
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(15),
    .din1_WIDTH(11),
    .dout_WIDTH(27)
  )
  adpcm_main_mul_muibs_U52
  (
    .din0(tmp_28_fu_2428_p0),
    .din1(tmp_28_fu_2428_p1),
    .dout(tmp_28_fu_2428_p2)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_return_preg <= 32'd0;
    end else begin
      if(1'b1 == ap_CS_fsm_state45) begin
        ap_return_preg <= tmp_40_fu_2395_p3;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_upzero_fu_631_ap_start_reg <= 1'b0;
    end else begin
      if((1'b1 == ap_CS_fsm_state40) | (1'b1 == ap_CS_fsm_state26)) begin
        grp_upzero_fu_631_ap_start_reg <= 1'b1;
      end else if(grp_upzero_fu_631_ap_ready == 1'b1) begin
        grp_upzero_fu_631_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state35) begin
      if(working_key[19] == 1'b1) begin
        dlt_pn_rec_i1_reg_611 <= p_01_rec_i_fu_923_p2;
      end else begin
        dlt_pn_rec_i1_reg_611 <= p_01_rec_i1_reg_2771;
      end
    end else if(1'b1 == ap_CS_fsm_state31) begin
      dlt_pn_rec_i1_reg_611 <= 3'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      if(working_key[20] == 1'b1) begin
        dlt_pn_rec_i_reg_578 <= p_01_rec_i_reg_2570;
      end else begin
        dlt_pn_rec_i_reg_578 <= p_01_rec_i1_reg_2771;
      end
    end else if(1'b1 == ap_CS_fsm_state12) begin
      dlt_pn_rec_i_reg_578 <= 3'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      if(working_key[21] == 1'b1) begin
        i_1_reg_557 <= apl1_6_fu_2322_p2;
      end else begin
        i_1_reg_557 <= i_9_reg_2550;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      i_1_reg_557 <= 5'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[22] == 1'b1) begin
        i_reg_515 <= i_8_reg_2467;
      end else begin
        i_reg_515 <= apl1_6_fu_2322_p2;
      end
    end else if(1'b1 == ap_CS_fsm_state2) begin
      i_reg_515 <= 4'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_31_fu_1816_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state37)) begin
      if(working_key[23] == 1'b1) begin
        ih_assign_reg_622 <= grp_upzero_fu_631_bli_address0;
      end else begin
        ih_assign_reg_622 <= tmp_27_fu_1752_p3;
      end
    end else if((tmp_31_reg_2845 == 1'd1) & (1'b1 == ap_CS_fsm_state38)) begin
      ih_assign_reg_622 <= tmp_32_fu_1822_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_14_i_fu_1080_p2 == 1'd1) & (tmp_i1_reg_2634 == 1'd1) & (1'b1 == ap_CS_fsm_state22)) begin
      if(working_key[24] == 1'b1) begin
        mil_i_reg_589 <= mil_reg_2638;
      end else begin
        mil_i_reg_589 <= grp_fu_686_p2;
      end
    end else if(1'b1 == ap_CS_fsm_state18) begin
      mil_i_reg_589 <= 5'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      if(working_key[25] == 1'b1) begin
        tqmf_ptr_0_pn_rec_reg_546 <= tqmf_ptr1_0_rec_reg_2537;
      end else begin
        tqmf_ptr_0_pn_rec_reg_546 <= grp_fu_2403_p3;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      tqmf_ptr_0_pn_rec_reg_546 <= 6'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[26] == 1'b1) begin
        tqmf_ptr_0_rec_reg_504 <= tqmf_q1;
      end else begin
        tqmf_ptr_0_rec_reg_504 <= phitmp_reg_2482;
      end
    end else if(1'b1 == ap_CS_fsm_state2) begin
      tqmf_ptr_0_rec_reg_504 <= 5'd2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[27] == 1'b1) begin
        xa1_reg_526 <= p_01_rec_i_cast_fu_929_p1;
      end else begin
        xa1_reg_526 <= grp_fu_2403_p3;
      end
    end else if(1'b1 == ap_CS_fsm_state2) begin
      xa1_reg_526 <= xa_cast_fu_722_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[28] == 1'b1) begin
        xb1_reg_536 <= grp_fu_2411_p3;
      end else begin
        xb1_reg_536 <= grp_upzero_fu_631_bli_address0;
      end
    end else if(1'b1 == ap_CS_fsm_state2) begin
      xb1_reg_536 <= xb_cast_fu_736_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state35) begin
      if(working_key[29] == 1'b1) begin
        zl1_i1_reg_601 <= xa_1_cast_fu_793_p1;
      end else begin
        zl1_i1_reg_601 <= zl_3_fu_1674_p2;
      end
    end else if(1'b1 == ap_CS_fsm_state31) begin
      zl1_i1_reg_601 <= zl_2_reg_2766;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      if(working_key[30] == 1'b1) begin
        zl1_i_reg_568 <= zl_1_fu_963_p2;
      end else begin
        zl1_i_reg_568 <= tqmf_ptr_0_sum1_cast_fu_764_p1;
      end
    end else if(1'b1 == ap_CS_fsm_state12) begin
      zl1_i_reg_568 <= zl_reg_2560;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state30) begin
      if(working_key[31] == 1'b1) begin
        apl1_2_reg_2756 <= apl1_2_fu_1579_p2;
        tmp_53_reg_2751 <= tmp_53_fu_1575_p1;
        tmp_7_i_reg_2761 <= tmp_7_i_fu_1589_p2;
        zl_2_reg_2766 <= grp_fu_686_p2;
      end else begin
        apl1_2_reg_2756 <= delay_dhx_q0;
        tmp_53_reg_2751 <= grp_upzero_fu_631_bli_we0;
        tmp_7_i_reg_2761 <= tmp_21_reg_2696;
        zl_2_reg_2766 <= plt;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state43) begin
      if(working_key[32] == 1'b1) begin
        apl1_4_reg_2913 <= apl1_4_fu_2278_p2;
        apl2_assign_1_reg_2907 <= apl2_assign_1_fu_2254_p3;
      end else begin
        apl1_4_reg_2913 <= p_01_rec_i1_fu_1640_p2;
        apl2_assign_1_reg_2907 <= tmp_26_fu_1711_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state44) begin
      if(working_key[33] == 1'b1) begin
        apl1_6_reg_2924 <= grp_upzero_fu_631_dlti_ce0;
        tmp_68_reg_2919 <= tqmf_q1;
        tmp_7_i1_reg_2929 <= delay_dhx_q0;
      end else begin
        apl1_6_reg_2924 <= apl1_6_fu_2322_p2;
        tmp_68_reg_2919 <= tmp_68_fu_2318_p1;
        tmp_7_i1_reg_2929 <= tmp_7_i1_fu_2332_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state29) begin
      if(working_key[34] == 1'b1) begin
        apl1_reg_2745 <= apl1_fu_1535_p2;
        apl2_assign_reg_2739 <= apl2_assign_fu_1511_p3;
      end else begin
        apl1_reg_2745 <= tmp_i4_28_fu_1668_p2;
        apl2_assign_reg_2739 <= phitmp_reg_2482;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state42) begin
      apl2_1_reg_2896 <= apl2_1_fu_2204_p2;
      tmp_21_i1_reg_2902 <= { { tmp_i6_fu_2216_p2[31:8] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state28) begin
      apl2_reg_2728 <= apl2_fu_1461_p2;
      tmp_21_i_reg_2734 <= { { tmp_i5_fu_1473_p2[31:8] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state20) begin
      decis_levl_load_reg_2648 <= decis_levl_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state18) begin
      detl_load_reg_2618 <= detl_i;
      sl <= tmp_17_fu_999_p2;
      tmp_12_reg_2624 <= el_assign_fu_1011_p2[32'd18];
      tmp_i_cast_reg_2613 <= tmp_i_cast_fu_992_p1;
      wd_reg_2629 <= wd_fu_1034_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state40) begin
      dh <= tmp_36_fu_2002_p1;
      ph <= tmp_50_cast_fu_2048_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      dlt <= tmp_22_fu_1255_p1;
      plt <= tmp_33_cast_fu_1305_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state37) begin
      extLd1_reg_2840[14:0] <= extLd1_fu_1774_p1[14:0];
      tmp_31_reg_2845 <= tmp_31_fu_1816_p2;
      tmp_54_reg_2829 <= n_assign_fu_1739_p2[32'd18];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      h_load_reg_2487 <= h_q0;
      h_ptr_load_reg_2497 <= h_q1;
      tqmf_load_5_reg_2492 <= tqmf_q1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      i_8_reg_2467 <= i_8_fu_752_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      i_9_reg_2550 <= i_9_fu_874_p2;
      tqmf_addr_2_reg_2532 <= p_sum_cast_fu_846_p1;
      tqmf_ptr1_0_rec_reg_2537 <= tqmf_ptr1_0_rec_fu_851_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state19) begin
      mil_reg_2638 <= mil_fu_1048_p2;
      tmp_i1_reg_2634 <= tmp_i1_fu_1042_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state38) begin
      nbh_assign_1_cast_reg_2854 <= nbh_assign_1_cast_fu_1915_p2;
      tmp_59_reg_2859 <= nbh_assign_1_fu_1909_p2[32'd31];
      tmp_9_reg_2849 <= tmp_9_fu_1843_p6;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state24) begin
      nbl_assign_1_cast_reg_2686 <= nbl_assign_1_cast_fu_1164_p2;
      qq4_code4_table_load_reg_2681 <= qq4_code4_table_q0;
      tmp_29_reg_2691 <= nbl_assign_1_fu_1158_p2[32'd25];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state32) begin
      p_01_rec_i1_reg_2771 <= p_01_rec_i1_fu_1640_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      p_01_rec_i_reg_2570 <= p_01_rec_i_fu_923_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond2_fu_746_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      phitmp_reg_2482 <= phitmp_fu_770_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond4_fu_1652_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state32)) begin
      pl_1_reg_2789 <= pl_1_fu_1662_p2;
      tmp_i4_28_reg_2794 <= tmp_i4_28_fu_1668_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond5_fu_935_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state13)) begin
      pl_reg_2588 <= pl_fu_945_p2;
      tmp_i8_reg_2593 <= tmp_i8_fu_951_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4)) begin
      reg_666 <= tqmf_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state10)) begin
      reg_670 <= delay_bpl_q0;
      reg_674 <= delay_dltx_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state33) | (1'b1 == ap_CS_fsm_state29)) begin
      reg_678 <= delay_bph_q0;
      reg_682 <= delay_dhx_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state36) begin
      sh <= tmp_26_fu_1711_p2;
      tmp_26_reg_2814 <= tmp_26_fu_1711_p2;
      tmp_28_reg_2824 <= tmp_28_fu_2428_p2;
      tmp_i6_cast_reg_2809 <= tmp_i6_cast_fu_1689_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state12) begin
      tmp_19_cast_reg_2565 <= tmp_19_cast_fu_920_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state25) begin
      tmp_21_reg_2696 <= { { tmp_20_fu_1181_p2[31:15] } };
      wd2_cast_reg_2703 <= { { nbl_assign_2_fu_1212_p3[14:11] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state21) begin
      tmp_28_i_reg_2653 <= { { tmp_13_i_fu_1062_p2[31:15] } };
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_2_reg_2555 <= { { tmp_15_fu_880_p2[26:15] } };
      xh <= { { tmp_16_fu_894_p2[25:15] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state39) begin
      tmp_35_reg_2864 <= { { tmp_33_fu_1929_p2[31:15] } };
      wd2_6_cast_reg_2871 <= { { nbl_assign_3_fu_1959_p3[14:11] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state17) begin
      tmp_41_i_reg_2608 <= { { tmp_i9_fu_968_p2[30:14] } };
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
      tmp_52_reg_2723 <= tmp_i4_fu_1327_p2[32'd31];
      tmp_5_i_reg_2718 <= tmp_5_i_fu_1333_p2;
      tmp_i4_reg_2713 <= tmp_i4_fu_1327_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
      tmp_5_i2_reg_2886 <= tmp_5_i2_fu_2076_p2;
      tmp_67_reg_2891 <= tmp_i3_fu_2070_p2[32'd31];
      tmp_i3_reg_2881 <= tmp_i3_fu_2070_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state34) begin
      tmp_i5_27_reg_2799 <= grp_fu_686_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state15) begin
      tmp_i_reg_2598 <= tmp_i_fu_957_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state7) begin
      xa_1_cast_reg_2517 <= xa_1_cast_fu_793_p1;
      xa_1_reg_2512 <= grp_fu_2419_p3;
      xb_1_cast_reg_2527 <= xb_1_cast_fu_836_p1;
      xb_1_reg_2522 <= xb_1_fu_830_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state11) begin
      zl_reg_2560 <= zl_fu_914_p2;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      ah1_o = apl1_7_cast_fu_2343_p1;
    end else begin
      ah1_o = ah1_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      ah1_o_ap_vld = 1'b1;
    end else begin
      ah1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state44) begin
      ah2_o = apl2_assign_1_cast_fu_2284_p1;
    end else begin
      ah2_o = ah2_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state44) begin
      ah2_o_ap_vld = 1'b1;
    end else begin
      ah2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      al1_o = apl1_3_cast_fu_1600_p1;
    end else begin
      al1_o = al1_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      al1_o_ap_vld = 1'b1;
    end else begin
      al1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state30) begin
      al2_o = apl2_assign_cast_fu_1541_p1;
    end else begin
      al2_o = al2_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state30) begin
      al2_o_ap_vld = 1'b1;
    end else begin
      al2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state45) | (ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_done = 1'b1;
    end else begin
      ap_done = 1'b0;
    end
  end


  always @(*) begin
    if((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_idle = 1'b1;
    end else begin
      ap_idle = 1'b0;
    end
  end


  always @(*) begin
    if((tmp_31_reg_2845 == 1'd1) & (1'b1 == ap_CS_fsm_state38)) begin
      ap_phi_mux_ih_assign_phi_fu_625_p4 = tmp_32_fu_1822_p3;
    end else begin
      ap_phi_mux_ih_assign_phi_fu_625_p4 = ih_assign_reg_622;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      ap_return = tmp_40_fu_2395_p3;
    end else begin
      ap_return = ap_return_preg;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state19) begin
      decis_levl_ce0 = 1'b1;
    end else begin
      decis_levl_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state32) begin
      delay_bph_address0 = p_01_rec_i1_cast_fu_1646_p1;
    end else if(1'b1 == ap_CS_fsm_state28) begin
      delay_bph_address0 = 3'd0;
    end else if(1'b1 == ap_CS_fsm_state41) begin
      delay_bph_address0 = grp_upzero_fu_631_bli_address0;
    end else begin
      delay_bph_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state32) | (1'b1 == ap_CS_fsm_state28)) begin
      delay_bph_ce0 = 1'b1;
    end else if(1'b1 == ap_CS_fsm_state41) begin
      delay_bph_ce0 = grp_upzero_fu_631_bli_ce0;
    end else begin
      delay_bph_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      delay_bph_we0 = grp_upzero_fu_631_bli_we0;
    end else begin
      delay_bph_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      delay_bpl_address0 = p_01_rec_i_cast_fu_929_p1;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      delay_bpl_address0 = 3'd0;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      delay_bpl_address0 = grp_upzero_fu_631_bli_address0;
    end else begin
      delay_bpl_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state8)) begin
      delay_bpl_ce0 = 1'b1;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      delay_bpl_ce0 = grp_upzero_fu_631_bli_ce0;
    end else begin
      delay_bpl_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      delay_bpl_we0 = grp_upzero_fu_631_bli_we0;
    end else begin
      delay_bpl_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state32) begin
      delay_dhx_address0 = p_01_rec_i1_cast_fu_1646_p1;
    end else if(1'b1 == ap_CS_fsm_state28) begin
      delay_dhx_address0 = 3'd0;
    end else if(1'b1 == ap_CS_fsm_state41) begin
      delay_dhx_address0 = grp_upzero_fu_631_dlti_address0;
    end else begin
      delay_dhx_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state32) | (1'b1 == ap_CS_fsm_state28)) begin
      delay_dhx_ce0 = 1'b1;
    end else if(1'b1 == ap_CS_fsm_state41) begin
      delay_dhx_ce0 = grp_upzero_fu_631_dlti_ce0;
    end else begin
      delay_dhx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      delay_dhx_ce1 = grp_upzero_fu_631_dlti_ce1;
    end else begin
      delay_dhx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      delay_dhx_we0 = grp_upzero_fu_631_dlti_we0;
    end else begin
      delay_dhx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      delay_dhx_we1 = grp_upzero_fu_631_dlti_we1;
    end else begin
      delay_dhx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      delay_dltx_address0 = p_01_rec_i_cast_fu_929_p1;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      delay_dltx_address0 = 3'd0;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      delay_dltx_address0 = grp_upzero_fu_631_dlti_address0;
    end else begin
      delay_dltx_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state8)) begin
      delay_dltx_ce0 = 1'b1;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      delay_dltx_ce0 = grp_upzero_fu_631_dlti_ce0;
    end else begin
      delay_dltx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      delay_dltx_ce1 = grp_upzero_fu_631_dlti_ce1;
    end else begin
      delay_dltx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      delay_dltx_we0 = grp_upzero_fu_631_dlti_we0;
    end else begin
      delay_dltx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      delay_dltx_we1 = grp_upzero_fu_631_dlti_we1;
    end else begin
      delay_dltx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state40) begin
      deth_o = tmp_10_i1_fu_2029_p3;
    end else begin
      deth_o = deth_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state40) begin
      deth_o_ap_vld = 1'b1;
    end else begin
      deth_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      detl_o = tmp_10_i_cast_fu_1290_p1;
    end else begin
      detl_o = detl_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      detl_o_ap_vld = 1'b1;
    end else begin
      detl_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      grp_upzero_fu_631_bli_q0 = delay_bph_q0;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      grp_upzero_fu_631_bli_q0 = delay_bpl_q0;
    end else begin
      grp_upzero_fu_631_bli_q0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      grp_upzero_fu_631_dlt = tmp_35_reg_2864;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      grp_upzero_fu_631_dlt = tmp_21_reg_2696;
    end else begin
      grp_upzero_fu_631_dlt = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      grp_upzero_fu_631_dlti_q0 = delay_dhx_q0;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      grp_upzero_fu_631_dlti_q0 = delay_dltx_q0;
    end else begin
      grp_upzero_fu_631_dlti_q0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state41) begin
      grp_upzero_fu_631_dlti_q1 = delay_dhx_q1;
    end else if(1'b1 == ap_CS_fsm_state27) begin
      grp_upzero_fu_631_dlti_q1 = delay_dltx_q1;
    end else begin
      grp_upzero_fu_631_dlti_q1 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      h_ce0 = 1'b1;
    end else begin
      h_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      h_ce1 = 1'b1;
    end else begin
      h_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if((tmp_31_reg_2845 == 1'd1) & (1'b1 == ap_CS_fsm_state38)) begin
      ih_o = tmp_44_cast_cast_fu_1830_p3;
    end else if(1'b1 == ap_CS_fsm_state37) begin
      ih_o = tmp_39_cast_cast_fu_1760_p3;
    end else begin
      ih_o = ih_i;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state37) | (tmp_31_reg_2845 == 1'd1) & (1'b1 == ap_CS_fsm_state38)) begin
      ih_o_ap_vld = 1'b1;
    end else begin
      ih_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state23) begin
      il_o = ril_2_fu_1091_p3;
    end else begin
      il_o = il_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state23) begin
      il_o_ap_vld = 1'b1;
    end else begin
      il_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state39) begin
      ilb_table_address0 = tmp_i7_30_fu_1997_p1;
    end else if(1'b1 == ap_CS_fsm_state25) begin
      ilb_table_address0 = tmp_i2_25_fu_1250_p1;
    end else begin
      ilb_table_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state39) | (1'b1 == ap_CS_fsm_state25)) begin
      ilb_table_ce0 = 1'b1;
    end else begin
      ilb_table_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state39) begin
      nbh_o = nbl_assign_3_cast_fu_1967_p1;
    end else begin
      nbh_o = nbh_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state39) begin
      nbh_o_ap_vld = 1'b1;
    end else begin
      nbh_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state25) begin
      nbl_o = nbl_assign_2_cast_fu_1220_p1;
    end else begin
      nbl_o = nbl_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state25) begin
      nbl_o_ap_vld = 1'b1;
    end else begin
      nbl_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
      ph1_o = ph;
    end else begin
      ph1_o = ph1_i;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
      ph1_o_ap_vld = 1'b1;
    end else begin
      ph1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
      ph2_o = ph1_i;
    end else begin
      ph2_o = ph2_i;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
      ph2_o_ap_vld = 1'b1;
    end else begin
      ph2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
      plt1_o = plt;
    end else begin
      plt1_o = plt1_i;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
      plt1_o_ap_vld = 1'b1;
    end else begin
      plt1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
      plt2_o = plt1_i;
    end else begin
      plt2_o = plt2_i;
    end
  end


  always @(*) begin
    if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
      plt2_o_ap_vld = 1'b1;
    end else begin
      plt2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state23) begin
      qq4_code4_table_ce0 = 1'b1;
    end else begin
      qq4_code4_table_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state22) begin
      quant26bt_neg_ce0 = 1'b1;
    end else begin
      quant26bt_neg_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state22) begin
      quant26bt_pos_ce0 = 1'b1;
    end else begin
      quant26bt_pos_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      rh1_o = tmp_38_fu_2365_p2;
    end else begin
      rh1_o = rh1_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      rh1_o_ap_vld = 1'b1;
    end else begin
      rh1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      rh2_o = rh1_i;
    end else begin
      rh2_o = rh2_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state45) begin
      rh2_o_ap_vld = 1'b1;
    end else begin
      rh2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      rlt1_o = tmp_25_fu_1622_p2;
    end else begin
      rlt1_o = rlt1_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      rlt1_o_ap_vld = 1'b1;
    end else begin
      rlt1_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      rlt2_o = rlt1_i;
    end else begin
      rlt2_o = rlt2_i;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state31) begin
      rlt2_o_ap_vld = 1'b1;
    end else begin
      rlt2_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if((exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) begin
      tqmf_address0 = 5'd1;
    end else if((exitcond_fu_868_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8)) begin
      tqmf_address0 = tqmf_ptr_0_sum_cast_fu_863_p1;
    end else if((exitcond2_fu_746_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
      tqmf_address0 = 5'd22;
    end else if((exitcond2_fu_746_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      tqmf_address0 = tqmf_ptr_0_rec_cast_fu_740_p1;
    end else if(1'b1 == ap_CS_fsm_state1) begin
      tqmf_address0 = 5'd0;
    end else begin
      tqmf_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      tqmf_address1 = tqmf_addr_2_reg_2532;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      tqmf_address1 = 5'd0;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      tqmf_address1 = 5'd23;
    end else if(1'b1 == ap_CS_fsm_state3) begin
      tqmf_address1 = tqmf_ptr_0_sum1_cast_fu_764_p1;
    end else if(1'b1 == ap_CS_fsm_state1) begin
      tqmf_address1 = 5'd1;
    end else begin
      tqmf_address1 = 'bx;
    end
  end


  always @(*) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) | (exitcond_fu_868_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state8) | (exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8) | (exitcond2_fu_746_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3) | (exitcond2_fu_746_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      tqmf_ce0 = 1'b1;
    end else begin
      tqmf_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state6) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      tqmf_ce1 = 1'b1;
    end else begin
      tqmf_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      tqmf_d1 = tqmf_q0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      tqmf_d1 = xin2;
    end else begin
      tqmf_d1 = 'bx;
    end
  end


  always @(*) begin
    if((exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) begin
      tqmf_we0 = 1'b1;
    end else begin
      tqmf_we0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) begin
      tqmf_we1 = 1'b1;
    end else begin
      tqmf_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state23) begin
      wl_code_table_ce0 = 1'b1;
    end else begin
      wl_code_table_ce0 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        if((exitcond2_fu_746_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        if((exitcond_fu_868_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state8)) begin
          ap_NS_fsm = ap_ST_fsm_state10;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state9;
        end
      end
      ap_ST_fsm_state9: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state10: begin
        ap_NS_fsm = ap_ST_fsm_state11;
      end
      ap_ST_fsm_state11: begin
        ap_NS_fsm = ap_ST_fsm_state12;
      end
      ap_ST_fsm_state12: begin
        ap_NS_fsm = ap_ST_fsm_state13;
      end
      ap_ST_fsm_state13: begin
        if((exitcond5_fu_935_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state13)) begin
          ap_NS_fsm = ap_ST_fsm_state17;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state14;
        end
      end
      ap_ST_fsm_state14: begin
        ap_NS_fsm = ap_ST_fsm_state15;
      end
      ap_ST_fsm_state15: begin
        ap_NS_fsm = ap_ST_fsm_state16;
      end
      ap_ST_fsm_state16: begin
        ap_NS_fsm = ap_ST_fsm_state13;
      end
      ap_ST_fsm_state17: begin
        ap_NS_fsm = ap_ST_fsm_state18;
      end
      ap_ST_fsm_state18: begin
        ap_NS_fsm = ap_ST_fsm_state19;
      end
      ap_ST_fsm_state19: begin
        if((tmp_i1_fu_1042_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state19)) begin
          ap_NS_fsm = ap_ST_fsm_state22;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state20;
        end
      end
      ap_ST_fsm_state20: begin
        ap_NS_fsm = ap_ST_fsm_state21;
      end
      ap_ST_fsm_state21: begin
        ap_NS_fsm = ap_ST_fsm_state22;
      end
      ap_ST_fsm_state22: begin
        if((1'b1 == ap_CS_fsm_state22) & ((tmp_14_i_fu_1080_p2 == 1'd0) | (tmp_i1_reg_2634 == 1'd0))) begin
          ap_NS_fsm = ap_ST_fsm_state23;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state19;
        end
      end
      ap_ST_fsm_state23: begin
        ap_NS_fsm = ap_ST_fsm_state24;
      end
      ap_ST_fsm_state24: begin
        ap_NS_fsm = ap_ST_fsm_state25;
      end
      ap_ST_fsm_state25: begin
        ap_NS_fsm = ap_ST_fsm_state26;
      end
      ap_ST_fsm_state26: begin
        ap_NS_fsm = ap_ST_fsm_state27;
      end
      ap_ST_fsm_state27: begin
        if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state27)) begin
          ap_NS_fsm = ap_ST_fsm_state28;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state27;
        end
      end
      ap_ST_fsm_state28: begin
        ap_NS_fsm = ap_ST_fsm_state29;
      end
      ap_ST_fsm_state29: begin
        ap_NS_fsm = ap_ST_fsm_state30;
      end
      ap_ST_fsm_state30: begin
        ap_NS_fsm = ap_ST_fsm_state31;
      end
      ap_ST_fsm_state31: begin
        ap_NS_fsm = ap_ST_fsm_state32;
      end
      ap_ST_fsm_state32: begin
        if((exitcond4_fu_1652_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state32)) begin
          ap_NS_fsm = ap_ST_fsm_state36;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state33;
        end
      end
      ap_ST_fsm_state33: begin
        ap_NS_fsm = ap_ST_fsm_state34;
      end
      ap_ST_fsm_state34: begin
        ap_NS_fsm = ap_ST_fsm_state35;
      end
      ap_ST_fsm_state35: begin
        ap_NS_fsm = ap_ST_fsm_state32;
      end
      ap_ST_fsm_state36: begin
        ap_NS_fsm = ap_ST_fsm_state37;
      end
      ap_ST_fsm_state37: begin
        ap_NS_fsm = ap_ST_fsm_state38;
      end
      ap_ST_fsm_state38: begin
        ap_NS_fsm = ap_ST_fsm_state39;
      end
      ap_ST_fsm_state39: begin
        ap_NS_fsm = ap_ST_fsm_state40;
      end
      ap_ST_fsm_state40: begin
        ap_NS_fsm = ap_ST_fsm_state41;
      end
      ap_ST_fsm_state41: begin
        if((grp_upzero_fu_631_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state41)) begin
          ap_NS_fsm = ap_ST_fsm_state42;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state41;
        end
      end
      ap_ST_fsm_state42: begin
        ap_NS_fsm = ap_ST_fsm_state43;
      end
      ap_ST_fsm_state43: begin
        ap_NS_fsm = ap_ST_fsm_state44;
      end
      ap_ST_fsm_state44: begin
        ap_NS_fsm = ap_ST_fsm_state45;
      end
      ap_ST_fsm_state45: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
  assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];
  assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];
  assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];
  assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];
  assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];
  assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];
  assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];
  assign ap_CS_fsm_state23 = ap_CS_fsm[32'd22];
  assign ap_CS_fsm_state24 = ap_CS_fsm[32'd23];
  assign ap_CS_fsm_state25 = ap_CS_fsm[32'd24];
  assign ap_CS_fsm_state26 = ap_CS_fsm[32'd25];
  assign ap_CS_fsm_state27 = ap_CS_fsm[32'd26];
  assign ap_CS_fsm_state28 = ap_CS_fsm[32'd27];
  assign ap_CS_fsm_state29 = ap_CS_fsm[32'd28];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state30 = ap_CS_fsm[32'd29];
  assign ap_CS_fsm_state31 = ap_CS_fsm[32'd30];
  assign ap_CS_fsm_state32 = ap_CS_fsm[32'd31];
  assign ap_CS_fsm_state33 = ap_CS_fsm[32'd32];
  assign ap_CS_fsm_state34 = ap_CS_fsm[32'd33];
  assign ap_CS_fsm_state35 = ap_CS_fsm[32'd34];
  assign ap_CS_fsm_state36 = ap_CS_fsm[32'd35];
  assign ap_CS_fsm_state37 = ap_CS_fsm[32'd36];
  assign ap_CS_fsm_state38 = ap_CS_fsm[32'd37];
  assign ap_CS_fsm_state39 = ap_CS_fsm[32'd38];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state40 = ap_CS_fsm[32'd39];
  assign ap_CS_fsm_state41 = ap_CS_fsm[32'd40];
  assign ap_CS_fsm_state42 = ap_CS_fsm[32'd41];
  assign ap_CS_fsm_state43 = ap_CS_fsm[32'd42];
  assign ap_CS_fsm_state44 = ap_CS_fsm[32'd43];
  assign ap_CS_fsm_state45 = ap_CS_fsm[32'd44];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign apl1_2_cast_fu_1585_p1 = apl1_2_fu_1579_p2;
  assign apl1_2_fu_1579_p2 = 16'd0 - apl1_8_cast1_fu_1555_p1;
  assign apl1_3_cast_fu_1600_p1 = $signed(apl1_3_fu_1595_p3);
  assign apl1_3_fu_1595_p3 = (tmp_7_i_reg_2761[0:0] === 1'b1)? apl1_2_reg_2756 : tmp_53_reg_2751;
  assign apl1_4_fu_2278_p2 = tmp9_fu_2272_p2 + tmp_4_i1_cast_cast_fu_2265_p3;
  assign apl1_6_cast_fu_2328_p1 = apl1_6_fu_2322_p2;
  assign apl1_6_fu_2322_p2 = 16'd0 - apl1_9_cast1_fu_2298_p1;
  assign apl1_7_cast_fu_2343_p1 = $signed(apl1_7_fu_2338_p3);
  assign apl1_7_fu_2338_p3 = (tmp_7_i1_reg_2929[0:0] === 1'b1)? apl1_6_reg_2924 : tmp_68_reg_2919;
  assign apl1_8_cast1_fu_1555_p1 = apl1_8_fu_1550_p2;
  assign apl1_8_cast_fu_1559_p1 = apl1_8_fu_1550_p2;
  assign apl1_8_fu_1550_p2 = $signed(15'd15360) - $signed(apl2_assign_reg_2739);
  assign apl1_9_cast1_fu_2298_p1 = apl1_9_fu_2293_p2;
  assign apl1_9_cast_fu_2302_p1 = apl1_9_fu_2293_p2;
  assign apl1_9_fu_2293_p2 = $signed(15'd15360) - $signed(apl2_assign_1_reg_2907);
  assign apl1_fu_1535_p2 = tmp_4_i_cast_cast_fu_1522_p3 + tmp7_fu_1529_p2;
  assign apl2_1_fu_2204_p2 = $signed(tmp8_cast_fu_2200_p1) + $signed(tmp_8_i1_cast_cast_fu_2160_p3);
  assign apl2_assign_1_cast_fu_2284_p1 = apl2_assign_1_reg_2907;
  assign apl2_assign_1_fu_2254_p3 = (tmp_3_i1_fu_2248_p2[0:0] === 1'b1)? 15'd20480 : tmp_65_fu_2244_p1;
  assign apl2_assign_cast_fu_1541_p1 = apl2_assign_reg_2739;
  assign apl2_assign_fu_1511_p3 = (tmp_3_i_fu_1505_p2[0:0] === 1'b1)? 15'd20480 : tmp_47_fu_1501_p1;
  assign apl2_fu_1461_p2 = $signed(tmp_8_i_cast_cast_fu_1417_p3) + $signed(tmp6_cast_fu_1457_p1);
  assign decis_1_cast_fu_1077_p1 = $signed(tmp_28_i_reg_2653);
  assign decis_levl_address0 = tmp_i1_24_fu_1054_p1;
  assign delay_bph_d0 = grp_upzero_fu_631_bli_d0;
  assign delay_bpl_d0 = grp_upzero_fu_631_bli_d0;
  assign delay_dhx_address1 = grp_upzero_fu_631_dlti_address1;
  assign delay_dhx_d0 = grp_upzero_fu_631_dlti_d0;
  assign delay_dhx_d1 = grp_upzero_fu_631_dlti_d1;
  assign delay_dltx_address1 = grp_upzero_fu_631_dlti_address1;
  assign delay_dltx_d0 = grp_upzero_fu_631_dlti_d0;
  assign delay_dltx_d1 = grp_upzero_fu_631_dlti_d1;
  assign el_assign_fu_1011_p2 = $signed(tmp_19_cast_reg_2565) - $signed(tmp_17_fu_999_p2);
  assign exitcond2_fu_746_p2 = (i_reg_515 == 4'd10)? 1'b1 : 1'b0;
  assign exitcond4_fu_1652_p2 = (dlt_pn_rec_i1_reg_611 == 3'd5)? 1'b1 : 1'b0;
  assign exitcond5_fu_935_p2 = (dlt_pn_rec_i_reg_578 == 3'd5)? 1'b1 : 1'b0;
  assign exitcond_fu_868_p2 = (i_1_reg_557 == 5'd22)? 1'b1 : 1'b0;
  assign extLd1_fu_1774_p1 = deth_i;
  assign extLd2_fu_2357_p1 = $signed(sh);
  assign extLd_fu_1614_p1 = $signed(sl);
  assign grp_fu_2403_p1 = grp_fu_2403_p10;
  assign grp_fu_2403_p10 = reg_666;
  assign grp_fu_2411_p1 = grp_fu_2411_p10;
  assign grp_fu_2411_p10 = tqmf_load_5_reg_2492;
  assign grp_fu_2419_p0 = grp_fu_2419_p00;
  assign grp_fu_2419_p00 = reg_666;
  assign grp_fu_2419_p1 = 14'd16340;
  assign grp_fu_686_p2 = $signed(reg_682) * $signed(reg_678);
  assign grp_upzero_fu_631_ap_start = grp_upzero_fu_631_ap_start_reg;
  assign h_address0 = tqmf_ptr_0_rec_cast_fu_740_p1;
  assign h_address1 = tqmf_ptr_0_sum1_cast_fu_764_p1;
  assign i_8_fu_752_p2 = i_reg_515 + 4'd1;
  assign i_9_fu_874_p2 = i_1_reg_557 + 5'd1;
  assign m_1_fu_1798_p2 = 19'd0 - n_assign_fu_1739_p2;
  assign m_fu_1028_p2 = 19'd0 - el_assign_fu_1011_p2;
  assign mil_fu_1048_p2 = mil_i_reg_589 + 5'd1;
  assign n_assign_2_fu_1804_p3 = (tmp_56_fu_1790_p3[0:0] === 1'b1)? m_1_fu_1798_p2 : n_assign_fu_1739_p2;
  assign n_assign_3_cast_fu_1812_p1 = $signed(n_assign_2_fu_1804_p3);
  assign n_assign_fu_1739_p2 = $signed(xh_load_cast_fu_1735_p1) - $signed(tmp_26_reg_2814);
  assign nbh_assign_1_cast_fu_1915_p2 = $signed(tmp_11_fu_1901_p1) + $signed(tmp_58_fu_1905_p1);
  assign nbh_assign_1_fu_1909_p2 = $signed(tmp_10_fu_1887_p6) + $signed(wd_1_fu_1883_p1);
  assign nbl_assign_1_cast_fu_1164_p2 = $signed(tmp_6_fu_1154_p1) + $signed(tmp_32_i_fu_1136_p4);
  assign nbl_assign_1_fu_1158_p2 = $signed(wd_1_cast_fu_1146_p1) + $signed(wl_code_table_load_c_fu_1150_p1);
  assign nbl_assign_2_cast_fu_1220_p1 = nbl_assign_2_fu_1212_p3;
  assign nbl_assign_2_fu_1212_p3 = (tmp_18_i_fu_1206_p2[0:0] === 1'b1)? 15'd18432 : tmp_34_fu_1202_p1;
  assign nbl_assign_3_cast_fu_1967_p1 = nbl_assign_3_fu_1959_p3;
  assign nbl_assign_3_fu_1959_p3 = (tmp_19_i1_fu_1953_p2[0:0] === 1'b1)? 15'd22528 : tmp_60_fu_1949_p1;
  assign p_01_rec_i1_cast_fu_1646_p1 = p_01_rec_i1_fu_1640_p2;
  assign p_01_rec_i1_fu_1640_p2 = dlt_pn_rec_i1_reg_611 + 3'd1;
  assign p_01_rec_i_cast_fu_929_p1 = p_01_rec_i_fu_923_p2;
  assign p_01_rec_i_fu_923_p2 = dlt_pn_rec_i_reg_578 + 3'd1;
  assign p_i1_fu_1494_p3 = (tmp_2_i_fu_1489_p2[0:0] === 1'b1)? 27'd12288 : apl2_reg_2728;
  assign p_i2_fu_1943_p3 = (tmp_59_reg_2859[0:0] === 1'b1)? 31'd0 : nbh_assign_1_cast_reg_2854;
  assign p_i3_fu_2237_p3 = (tmp_2_i1_fu_2232_p2[0:0] === 1'b1)? 27'd12288 : apl2_1_reg_2896;
  assign p_i_fu_1196_p3 = (tmp_29_reg_2691[0:0] === 1'b1)? 25'd0 : nbl_assign_1_cast_reg_2686;
  assign p_shl1_cast_fu_712_p1 = p_shl1_fu_704_p3;
  assign p_shl1_fu_704_p3 = { { tqmf_q0 }, { 2'd0 } };
  assign p_shl2_cast_fu_804_p1 = p_shl2_fu_796_p3;
  assign p_shl2_fu_796_p3 = { { tqmf_q1 }, { 4'd0 } };
  assign p_shl3_cast_fu_816_p1 = p_shl3_fu_808_p3;
  assign p_shl3_fu_808_p3 = { { tqmf_q1 }, { 2'd0 } };
  assign p_shl_cast_fu_700_p1 = p_shl_fu_692_p3;
  assign p_shl_fu_692_p3 = { { tqmf_q0 }, { 4'd0 } };
  assign p_sum_cast_fu_846_p1 = p_sum_fu_840_p2;
  assign p_sum_fu_840_p2 = tqmf_ptr_0_pn_rec_reg_546 + 6'd23;
  assign phitmp_fu_770_p2 = tqmf_ptr_0_rec_reg_504 + 5'd2;
  assign pl_1_fu_1662_p0 = ah1_i;
  assign pl_1_fu_1662_p1 = rh1_i;
  assign pl_1_fu_1662_p2 = $signed(pl_1_fu_1662_p0) * $signed(pl_1_fu_1662_p1);
  assign pl_fu_945_p0 = al1_i;
  assign pl_fu_945_p1 = rlt1_i;
  assign pl_fu_945_p2 = $signed(pl_fu_945_p0) * $signed(pl_fu_945_p1);
  assign qq4_code4_table_address0 = tmp_19_fu_1114_p1;
  assign quant26bt_neg_address0 = tmp_16_i_fu_1085_p1;
  assign quant26bt_pos_address0 = tmp_16_i_fu_1085_p1;
  assign ril_2_fu_1091_p3 = (tmp_12_reg_2624[0:0] === 1'b1)? quant26bt_neg_q0 : quant26bt_pos_q0;
  assign tmp6_cast_fu_1457_p1 = $signed(tmp6_fu_1451_p2);
  assign tmp6_fu_1451_p2 = $signed(wd2_4_cast_fu_1406_p1) + $signed(tmp_1_i_cast_fu_1447_p1);
  assign tmp7_fu_1529_p2 = $signed(25'd192) + $signed(wd2_5_cast_fu_1519_p1);
  assign tmp8_cast_fu_2200_p1 = $signed(tmp8_fu_2194_p2);
  assign tmp8_fu_2194_p2 = $signed(tmp_1_i1_cast_fu_2190_p1) + $signed(wd2_10_cast_fu_2149_p1);
  assign tmp9_fu_2272_p2 = $signed(25'd192) + $signed(wd2_11_cast_fu_2262_p1);
  assign tmp_10_i1_fu_2029_p3 = { { wd3_2_fu_2023_p2 }, { 3'd0 } };
  assign tmp_10_i_cast_fu_1290_p1 = tmp_10_i_fu_1282_p3;
  assign tmp_10_i_fu_1282_p3 = { { wd3_fu_1276_p2 }, { 3'd0 } };
  assign tmp_11_fu_1901_p1 = tmp_36_i_fu_1873_p4;
  assign tmp_12_fu_1020_p3 = el_assign_fu_1011_p2[32'd18];
  assign tmp_13_i_fu_1062_p0 = tmp_13_i_fu_1062_p00;
  assign tmp_13_i_fu_1062_p00 = decis_levl_load_reg_2648;
  assign tmp_13_i_fu_1062_p2 = $signed({ { 1'b0 }, { tmp_13_i_fu_1062_p0 } }) * $signed(detl_load_reg_2618);
  assign tmp_14_i_fu_1080_p2 = ($signed(wd_reg_2629) > $signed(decis_1_cast_fu_1077_p1))? 1'b1 : 1'b0;
  assign tmp_15_fu_880_p2 = $signed(xb_1_cast_reg_2527) + $signed(xa_1_cast_reg_2517);
  assign tmp_16_fu_894_p2 = $signed(xa_1_reg_2512) - $signed(xb_1_reg_2522);
  assign tmp_16_i_fu_1085_p1 = mil_i_reg_589;
  assign tmp_17_fu_999_p2 = $signed(tmp_20_i_cast_fu_996_p1) + $signed(tmp_i_cast_fu_992_p1);
  assign tmp_18_fu_1104_p4 = { { ril_2_fu_1091_p3[5:2] } };
  assign tmp_18_i_fu_1206_p2 = (p_i_fu_1196_p3 > 25'd18432)? 1'b1 : 1'b0;
  assign tmp_19_cast_fu_920_p1 = $signed(tmp_2_reg_2555);
  assign tmp_19_fu_1114_p1 = tmp_18_fu_1104_p4;
  assign tmp_19_i1_fu_1953_p2 = (p_i2_fu_1943_p3 > 31'd22528)? 1'b1 : 1'b0;
  assign tmp_19_i2_fu_2180_p4 = { { tmp_9_i3_fu_2174_p2[31:7] } };
  assign tmp_19_i_fu_1437_p4 = { { tmp_9_i1_fu_1431_p2[31:7] } };
  assign tmp_1_i1_cast_fu_2190_p1 = $signed(tmp_19_i2_fu_2180_p4);
  assign tmp_1_i_cast_fu_1447_p1 = $signed(tmp_19_i_fu_1437_p4);
  assign tmp_20_fu_1181_p1 = qq4_code4_table_load_reg_2681;
  assign tmp_20_fu_1181_p2 = $signed(detl_load_reg_2618) * $signed(tmp_20_fu_1181_p1);
  assign tmp_20_i2_cast_fu_1707_p1 = $signed(tmp_41_i1_fu_1697_p4);
  assign tmp_20_i_cast_fu_996_p1 = $signed(tmp_41_i_reg_2608);
  assign tmp_22_fu_1255_p1 = tmp_21_reg_2696;
  assign tmp_23_fu_1124_p2 = nbl_i << 32'd7;
  assign tmp_24_fu_1300_p2 = $signed(tmp_32_cast_fu_1258_p1) + $signed(tmp_i_cast_reg_2613);
  assign tmp_25_fu_1622_p2 = $signed(extLd_fu_1614_p1) + $signed(dlt);
  assign tmp_26_fu_1711_p2 = $signed(tmp_20_i2_cast_fu_1707_p1) + $signed(tmp_i6_cast_fu_1689_p1);
  assign tmp_27_fu_1752_p3 = (tmp_54_fu_1744_p3[0:0] === 1'b1)? 2'd1 : 2'd3;
  assign tmp_28_fu_2428_p0 = tmp_28_fu_2428_p00;
  assign tmp_28_fu_2428_p00 = deth_i;
  assign tmp_28_fu_2428_p1 = 27'd564;
  assign tmp_2_i1_fu_2232_p2 = ($signed(apl2_1_reg_2896) > $signed(27'd12288))? 1'b1 : 1'b0;
  assign tmp_2_i_fu_1489_p2 = ($signed(apl2_reg_2728) > $signed(27'd12288))? 1'b1 : 1'b0;
  assign tmp_30_fu_1786_p1 = $signed(tmp_55_fu_1777_p4);
  assign tmp_31_fu_1816_p2 = ($signed(n_assign_3_cast_fu_1812_p1) > $signed(tmp_30_fu_1786_p1))? 1'b1 : 1'b0;
  assign tmp_32_cast_fu_1258_p1 = tmp_21_reg_2696;
  assign tmp_32_fu_1822_p3 = (tmp_54_reg_2829[0:0] === 1'b1)? 2'd0 : 2'd2;
  assign tmp_32_i_fu_1136_p4 = { { tmp_i2_fu_1130_p2[31:7] } };
  assign tmp_33_cast_fu_1305_p1 = $signed(tmp_24_fu_1300_p2);
  assign tmp_33_fu_1929_p0 = extLd1_reg_2840;
  assign tmp_33_fu_1929_p2 = $signed({ { 1'b0 }, { tmp_33_fu_1929_p0 } }) * $signed(tmp_9_reg_2849);
  assign tmp_34_fu_1202_p1 = p_i_fu_1196_p3[14:0];
  assign tmp_36_fu_2002_p1 = tmp_35_reg_2864;
  assign tmp_36_i_fu_1873_p4 = { { tmp_i_29_fu_1867_p2[31:7] } };
  assign tmp_37_fu_2043_p2 = $signed(tmp_i6_cast_reg_2809) + $signed(tmp_49_cast_fu_2005_p1);
  assign tmp_38_fu_2365_p2 = $signed(dh) + $signed(extLd2_fu_2357_p1);
  assign tmp_39_cast_cast_fu_1760_p3 = (tmp_54_fu_1744_p3[0:0] === 1'b1)? 32'd1 : 32'd3;
  assign tmp_39_fu_1378_p4 = { { wd2_1_fu_1372_p2[31:7] } };
  assign tmp_39_i1_fu_1679_p4 = { { zl1_i1_reg_601[31:14] } };
  assign tmp_39_i_fu_982_p4 = { { zl1_i_reg_568[31:14] } };
  assign tmp_3_i1_fu_2248_p2 = ($signed(p_i3_fu_2237_p3) < $signed(27'd134205440))? 1'b1 : 1'b0;
  assign tmp_3_i_fu_1505_p2 = ($signed(p_i1_fu_1494_p3) < $signed(27'd134205440))? 1'b1 : 1'b0;
  assign tmp_40_fu_2395_p3 = { { tmp_69_fu_2391_p1 }, { il_i } };
  assign tmp_41_fu_1388_p4 = { { al1_i[29:5] } };
  assign tmp_41_i1_fu_1697_p4 = { { tmp_i7_fu_1693_p2[30:14] } };
  assign tmp_42_fu_1398_p3 = (tmp_44_fu_1365_p3[0:0] === 1'b1)? tmp_41_fu_1388_p4 : tmp_39_fu_1378_p4;
  assign tmp_43_fu_2121_p4 = { { wd2_3_fu_2115_p2[31:7] } };
  assign tmp_44_cast_cast_fu_1830_p3 = (tmp_54_reg_2829[0:0] === 1'b1)? 32'd0 : 32'd2;
  assign tmp_44_fu_1365_p3 = tmp_i4_reg_2713[32'd31];
  assign tmp_45_fu_1410_p3 = tmp_5_i_reg_2718[32'd31];
  assign tmp_46_fu_1425_p2 = al2_i << 32'd7;
  assign tmp_47_fu_1501_p1 = p_i1_fu_1494_p3[14:0];
  assign tmp_48_fu_1467_p2 = al1_i << 32'd8;
  assign tmp_49_cast_fu_2005_p1 = tmp_35_reg_2864;
  assign tmp_49_fu_2131_p4 = { { ah1_i[29:5] } };
  assign tmp_4_i1_cast_cast_fu_2265_p3 = (tmp_67_reg_2891[0:0] === 1'b1)? 25'd33554048 : 25'd0;
  assign tmp_4_i_cast_cast_fu_1522_p3 = (tmp_52_reg_2723[0:0] === 1'b1)? 25'd33554048 : 25'd0;
  assign tmp_50_cast_fu_2048_p1 = $signed(tmp_37_fu_2043_p2);
  assign tmp_50_fu_2141_p3 = (tmp_62_fu_2108_p3[0:0] === 1'b1)? tmp_49_fu_2131_p4 : tmp_43_fu_2121_p4;
  assign tmp_53_fu_1575_p1 = wd3_0_apl1_i_fu_1568_p3[15:0];
  assign tmp_54_fu_1744_p3 = n_assign_fu_1739_p2[32'd18];
  assign tmp_55_fu_1777_p4 = { { tmp_28_reg_2824[26:12] } };
  assign tmp_56_fu_1790_p3 = n_assign_fu_1739_p2[32'd18];
  assign tmp_57_fu_1861_p2 = nbh_i << 32'd7;
  assign tmp_58_fu_1905_p1 = tmp_10_fu_1887_p6[30:0];
  assign tmp_5_i2_fu_2076_p0 = ph;
  assign tmp_5_i2_fu_2076_p1 = ph2_i;
  assign tmp_5_i2_fu_2076_p2 = $signed(tmp_5_i2_fu_2076_p0) * $signed(tmp_5_i2_fu_2076_p1);
  assign tmp_5_i_fu_1333_p0 = plt2_i;
  assign tmp_5_i_fu_1333_p1 = plt;
  assign tmp_5_i_fu_1333_p2 = $signed(tmp_5_i_fu_1333_p0) * $signed(tmp_5_i_fu_1333_p1);
  assign tmp_60_fu_1949_p1 = p_i2_fu_1943_p3[14:0];
  assign tmp_62_fu_2108_p3 = tmp_i3_reg_2881[32'd31];
  assign tmp_63_fu_2153_p3 = tmp_5_i2_reg_2886[32'd31];
  assign tmp_64_fu_2168_p2 = ah2_i << 32'd7;
  assign tmp_65_fu_2244_p1 = p_i3_fu_2237_p3[14:0];
  assign tmp_66_fu_2210_p2 = ah1_i << 32'd8;
  assign tmp_68_fu_2318_p1 = wd3_0_apl1_i1_fu_2311_p3[15:0];
  assign tmp_69_fu_2391_p1 = ih_i[25:0];
  assign tmp_6_fu_1154_p0 = wl_code_table_q0;
  assign tmp_6_fu_1154_p1 = tmp_6_fu_1154_p0;
  assign tmp_6_i1_fu_2306_p2 = ($signed(apl1_4_reg_2913) > $signed(apl1_9_cast_fu_2302_p1))? 1'b1 : 1'b0;
  assign tmp_6_i_fu_1563_p2 = ($signed(apl1_reg_2745) > $signed(apl1_8_cast_fu_1559_p1))? 1'b1 : 1'b0;
  assign tmp_7_i1_fu_2332_p2 = ($signed(wd3_0_apl1_i1_fu_2311_p3) < $signed(apl1_6_cast_fu_2328_p1))? 1'b1 : 1'b0;
  assign tmp_7_i_fu_1589_p2 = ($signed(wd3_0_apl1_i_fu_1568_p3) < $signed(apl1_2_cast_fu_1585_p1))? 1'b1 : 1'b0;
  assign tmp_8_i1_cast_cast_fu_2160_p3 = (tmp_63_fu_2153_p3[0:0] === 1'b1)? 27'd134217600 : 27'd128;
  assign tmp_8_i_cast_cast_fu_1417_p3 = (tmp_45_fu_1410_p3[0:0] === 1'b1)? 27'd134217600 : 27'd128;
  assign tmp_9_i1_fu_1431_p2 = tmp_46_fu_1425_p2 - al2_i;
  assign tmp_9_i2_cast_cast_fu_2019_p1 = tmp_9_i2_fu_2014_p2;
  assign tmp_9_i2_fu_2014_p2 = $signed(4'd11) - $signed(wd2_6_cast_reg_2871);
  assign tmp_9_i3_fu_2174_p2 = tmp_64_fu_2168_p2 - ah2_i;
  assign tmp_9_i_cast_cast_fu_1272_p1 = tmp_9_i_fu_1267_p2;
  assign tmp_9_i_fu_1267_p2 = $signed(4'd9) - $signed(wd2_cast_reg_2703);
  assign tmp_cast_20_fu_826_p1 = $signed(tmp_s_fu_820_p2);
  assign tmp_i1_24_fu_1054_p1 = mil_i_reg_589;
  assign tmp_i1_fu_1042_p2 = (mil_i_reg_589 < 5'd30)? 1'b1 : 1'b0;
  assign tmp_i2_25_fu_1250_p1 = wd1_fu_1230_p4;
  assign tmp_i2_fu_1130_p2 = tmp_23_fu_1124_p2 - nbl_i;
  assign tmp_i3_fu_2070_p0 = ph;
  assign tmp_i3_fu_2070_p1 = ph1_i;
  assign tmp_i3_fu_2070_p2 = $signed(tmp_i3_fu_2070_p0) * $signed(tmp_i3_fu_2070_p1);
  assign tmp_i4_28_fu_1668_p0 = ah2_i;
  assign tmp_i4_28_fu_1668_p1 = rh2_i;
  assign tmp_i4_28_fu_1668_p2 = $signed(tmp_i4_28_fu_1668_p0) * $signed(tmp_i4_28_fu_1668_p1);
  assign tmp_i4_fu_1327_p0 = plt1_i;
  assign tmp_i4_fu_1327_p1 = plt;
  assign tmp_i4_fu_1327_p2 = $signed(tmp_i4_fu_1327_p0) * $signed(tmp_i4_fu_1327_p1);
  assign tmp_i5_fu_1473_p2 = tmp_48_fu_1467_p2 - al1_i;
  assign tmp_i6_cast_fu_1689_p1 = $signed(tmp_39_i1_fu_1679_p4);
  assign tmp_i6_fu_2216_p2 = tmp_66_fu_2210_p2 - ah1_i;
  assign tmp_i7_30_fu_1997_p1 = wd1_1_fu_1977_p4;
  assign tmp_i7_fu_1693_p2 = tmp_i4_28_reg_2794 + pl_1_reg_2789;
  assign tmp_i8_fu_951_p0 = al2_i;
  assign tmp_i8_fu_951_p1 = rlt2_i;
  assign tmp_i8_fu_951_p2 = $signed(tmp_i8_fu_951_p0) * $signed(tmp_i8_fu_951_p1);
  assign tmp_i9_fu_968_p2 = tmp_i8_reg_2593 + pl_reg_2588;
  assign tmp_i_29_fu_1867_p2 = tmp_57_fu_1861_p2 - nbh_i;
  assign tmp_i_cast_fu_992_p1 = $signed(tmp_39_i_fu_982_p4);
  assign tmp_i_fu_957_p2 = $signed(reg_674) * $signed(reg_670);
  assign tmp_s_fu_820_p2 = p_shl2_cast_fu_804_p1 - p_shl3_cast_fu_816_p1;
  assign tqmf_d0 = xin1;
  assign tqmf_ptr1_0_rec_fu_851_p2 = $signed(tqmf_ptr_0_pn_rec_reg_546) + $signed(6'd63);
  assign tqmf_ptr_0_rec_cast_fu_740_p1 = tqmf_ptr_0_rec_reg_504;
  assign tqmf_ptr_0_sum1_cast_fu_764_p1 = tqmf_ptr_0_sum1_fu_758_p2;
  assign tqmf_ptr_0_sum1_fu_758_p2 = tqmf_ptr_0_rec_reg_504 | 5'd1;
  assign tqmf_ptr_0_sum_cast_fu_863_p1 = tqmf_ptr_0_sum_fu_857_p2;
  assign tqmf_ptr_0_sum_fu_857_p2 = tqmf_ptr_0_pn_rec_reg_546 + 6'd21;
  assign wd1_1_fu_1977_p4 = { { nbl_assign_3_fu_1959_p3[10:6] } };
  assign wd1_fu_1230_p4 = { { nbl_assign_2_fu_1212_p3[10:6] } };
  assign wd2_10_cast_fu_2149_p1 = $signed(tmp_50_fu_2141_p3);
  assign wd2_11_cast_fu_2262_p1 = $signed(tmp_21_i1_reg_2902);
  assign wd2_1_fu_1372_p2 = 32'd0 - wd2_fu_1359_p2;
  assign wd2_2_fu_2102_p2 = ah1_i << 32'd2;
  assign wd2_3_fu_2115_p2 = 32'd0 - wd2_2_fu_2102_p2;
  assign wd2_4_cast_fu_1406_p1 = $signed(tmp_42_fu_1398_p3);
  assign wd2_5_cast_fu_1519_p1 = $signed(tmp_21_i_reg_2734);
  assign wd2_fu_1359_p2 = al1_i << 32'd2;
  assign wd3_0_apl1_i1_fu_2311_p3 = (tmp_6_i1_fu_2306_p2[0:0] === 1'b1)? apl1_9_cast_fu_2302_p1 : apl1_4_reg_2913;
  assign wd3_0_apl1_i_fu_1568_p3 = (tmp_6_i_fu_1563_p2[0:0] === 1'b1)? apl1_8_cast_fu_1559_p1 : apl1_reg_2745;
  assign wd3_2_fu_2023_p2 = ilb_table_q0 >> tmp_9_i2_cast_cast_fu_2019_p1;
  assign wd3_fu_1276_p2 = ilb_table_q0 >> tmp_9_i_cast_cast_fu_1272_p1;
  assign wd_1_cast_fu_1146_p1 = tmp_32_i_fu_1136_p4;
  assign wd_1_fu_1883_p1 = tmp_36_i_fu_1873_p4;
  assign wd_fu_1034_p3 = (tmp_12_fu_1020_p3[0:0] === 1'b1)? m_fu_1028_p2 : el_assign_fu_1011_p2;
  assign wl_code_table_address0 = tmp_19_fu_1114_p1;
  assign wl_code_table_load_c_fu_1150_p0 = wl_code_table_q0;
  assign wl_code_table_load_c_fu_1150_p1 = wl_code_table_load_c_fu_1150_p0;
  assign xa_1_cast_fu_793_p1 = grp_fu_2419_p3;
  assign xa_cast_fu_722_p1 = $signed(xa_fu_716_p2);
  assign xa_fu_716_p2 = p_shl_cast_fu_700_p1 - p_shl1_cast_fu_712_p1;
  assign xb_1_cast_fu_836_p1 = xb_1_fu_830_p2;
  assign xb_1_fu_830_p2 = $signed(tmp_cast_20_fu_826_p1) + $signed(xb1_reg_536);
  assign xb_cast_fu_736_p1 = $signed(xb_fu_730_p2);
  assign xb_fu_730_p0 = xb_fu_730_p00;
  assign xb_fu_730_p00 = tqmf_q1;
  assign xb_fu_730_p2 = $signed({ { 1'b0 }, { xb_fu_730_p0 } }) * $signed((-'h2C));
  assign xh_load_cast_fu_1735_p1 = $signed(xh);
  assign zl_1_fu_963_p2 = tmp_i_reg_2598 + zl1_i_reg_568;
  assign zl_3_fu_1674_p2 = tmp_i5_27_reg_2799 + zl1_i1_reg_601;
  assign zl_fu_914_p2 = $signed(reg_670) * $signed(reg_674);

  always @(posedge ap_clk) begin
    extLd1_reg_2840[31:15] <= 17'b00000000000000000;
  end


endmodule

