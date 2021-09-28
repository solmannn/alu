
module encode_0_obf
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
  locking_key
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
  wire [31:0] Const_565;
  wire [31:0] Const_566;
  wire [31:0] Const_567;
  wire [31:0] Const_568;
  wire [31:0] Const_569;
  wire [31:0] Const_570;
  wire [31:0] Const_571;
  wire [31:0] Const_572;
  wire Const_573;
  wire Const_574;
  wire [2:0] Const_575;
  wire Const_576;
  wire Const_577;
  wire [2:0] Const_578;
  wire Const_579;
  wire Const_580;
  wire [4:0] Const_581;
  wire Const_582;
  wire Const_583;
  wire [3:0] Const_584;
  wire Const_585;
  wire Const_586;
  wire Const_587;
  wire Const_588;
  wire Const_589;
  wire Const_590;
  wire Const_591;
  wire Const_592;
  wire [4:0] Const_593;
  wire Const_594;
  wire Const_595;
  wire [5:0] Const_596;
  wire Const_597;
  wire Const_598;
  wire [4:0] Const_599;
  wire Const_600;
  wire Const_601;
  wire Const_602;
  wire Const_603;
  wire Const_604;
  wire Const_605;
  wire Const_606;
  wire Const_607;
  wire Const_608;
  wire Const_609;
  wire Const_610;
  wire Const_611;
  wire Const_612;
  wire Const_613;
  wire Const_614;
  wire Const_615;
  wire Const_616;
  wire Const_617;
  wire Const_618;
  wire Const_619;
  wire Const_620;
  wire Const_621;
  wire Const_622;
  wire Const_623;
  wire Const_624;
  wire Const_625;
  wire Const_626;
  wire Const_627;
  wire Const_628;
  wire Const_629;
  wire Const_630;
  wire Const_631;
  wire Const_632;
  wire Const_633;
  wire Const_634;
  wire Const_635;
  wire Const_636;
  wire Const_637;
  wire Const_638;
  wire Const_639;
  wire Const_640;
  wire Const_641;
  wire Const_642;
  wire Const_643;
  wire Const_644;
  wire Const_645;
  wire Const_646;
  wire Const_647;
  wire Const_648;
  wire Const_649;
  wire Const_650;
  wire Const_651;
  wire Const_652;
  wire Const_653;
  wire Const_654;
  wire Const_655;
  wire Const_656;
  wire Const_657;
  wire Const_658;
  wire Const_659;
  wire Const_660;
  wire Const_661;
  wire Const_662;
  wire Const_663;
  wire Const_664;
  wire Const_665;
  wire Const_666;
  wire Const_667;
  wire Const_668;
  wire Const_669;
  wire Const_670;
  wire Const_671;
  wire Const_672;
  wire Const_673;
  wire Const_674;
  wire Const_675;
  wire Const_676;
  wire Const_677;
  wire Const_678;
  wire Const_679;
  wire Const_680;
  wire Const_681;
  wire Const_682;
  wire Const_683;
  wire Const_684;
  wire Const_685;
  wire Const_686;
  wire Const_687;
  wire Const_688;
  wire Const_689;
  wire Const_690;
  wire [2:0] Const_691;
  wire Const_692;
  wire Const_693;
  wire Const_694;
  wire Const_695;
  wire Const_696;
  wire Const_697;
  wire Const_698;
  wire Const_699;
  wire Const_700;
  wire Const_701;
  wire [2:0] Const_702;
  wire Const_703;
  wire Const_704;
  wire Const_705;
  wire Const_706;
  wire Const_707;
  wire Const_708;
  wire Const_709;
  wire Const_710;
  wire Const_711;
  wire Const_712;
  wire [2:0] Const_713;
  wire Const_714;
  wire Const_715;
  wire Const_716;
  wire Const_717;
  wire Const_718;
  wire Const_719;
  wire Const_720;
  wire Const_721;
  wire Const_722;
  wire Const_723;
  wire Const_724;
  wire Const_725;
  wire Const_726;
  wire Const_727;
  wire [2:0] Const_728;
  wire Const_729;
  wire Const_730;
  wire Const_731;
  wire Const_732;
  wire Const_733;
  wire Const_734;
  wire Const_735;
  wire Const_736;
  wire Const_737;
  wire Const_738;
  wire Const_739;
  wire Const_740;
  wire Const_741;
  wire Const_742;
  wire Const_743;
  wire Const_744;
  wire Const_745;
  wire Const_746;
  wire Const_747;
  wire Const_748;
  wire Const_749;
  wire Const_750;
  wire Const_751;
  wire Const_752;
  wire Const_753;
  wire Const_754;
  wire Const_755;
  wire Const_756;
  wire Const_757;
  wire Const_758;
  wire Const_759;
  wire Const_760;
  wire Const_761;
  wire Const_762;
  wire Const_763;
  wire Const_764;
  wire Const_765;
  wire Const_766;
  wire Const_767;
  wire Const_768;
  wire Const_769;
  wire Const_770;
  wire Const_771;
  wire Const_772;
  wire Const_773;
  wire Const_774;
  wire Const_775;
  wire Const_776;
  wire Const_777;
  wire Const_778;
  wire Const_779;
  wire Const_780;
  wire Const_781;
  wire Const_782;
  wire Const_783;
  wire Const_784;
  wire Const_785;
  wire Const_786;
  wire Const_787;
  wire Const_788;
  wire Const_789;
  wire Const_790;
  wire Const_791;
  wire Const_792;
  wire Const_793;
  wire Const_794;
  wire Const_795;
  wire Const_796;
  wire Const_797;
  wire Const_798;
  wire Const_799;
  wire Const_800;
  wire Const_801;
  wire Const_802;
  wire Const_803;
  wire Const_804;
  wire Const_805;
  wire Const_806;
  wire Const_807;
  wire Const_808;
  wire Const_809;
  wire Const_810;
  wire Const_811;
  wire Const_812;
  wire Const_813;
  wire Const_814;
  wire Const_815;
  wire Const_816;
  wire Const_817;
  wire Const_818;
  wire Const_819;
  wire Const_820;
  wire Const_821;
  wire Const_822;
  wire Const_823;
  wire Const_824;
  wire Const_825;
  wire Const_826;
  wire Const_827;
  wire Const_828;
  wire Const_829;
  wire Const_830;
  wire Const_831;
  wire Const_832;
  wire Const_833;
  wire Const_834;
  wire Const_835;
  wire Const_836;
  wire Const_837;
  wire Const_838;
  wire Const_839;
  wire [4:0] Const_840;
  wire Const_841;
  wire Const_842;
  wire Const_843;
  wire Const_844;
  wire [4:0] Const_845;
  wire Const_846;
  wire Const_847;
  wire Const_848;
  wire [4:0] Const_849;
  wire Const_850;
  wire Const_851;
  wire [4:0] Const_852;
  wire Const_853;
  wire [4:0] Const_854;
  wire Const_855;
  wire Const_856;
  wire [4:0] Const_857;
  wire Const_858;
  wire Const_859;
  wire Const_860;
  wire Const_861;
  wire Const_862;
  wire Const_863;
  wire Const_864;
  wire Const_865;
  wire Const_866;
  wire Const_867;
  wire Const_868;
  wire Const_869;
  wire Const_870;
  wire Const_871;
  wire Const_872;
  wire Const_873;
  wire Const_874;
  wire Const_875;
  wire Const_876;
  wire Const_877;
  wire Const_878;
  wire Const_879;
  wire Const_880;
  wire Const_881;
  wire Const_882;
  wire Const_883;
  wire Const_884;
  wire Const_885;
  wire Const_886;
  wire Const_887;
  wire Const_888;
  wire Const_889;
  wire Const_890;
  wire Const_891;
  wire Const_892;
  wire Const_893;
  wire Const_894;
  wire Const_895;
  wire Const_896;
  wire Const_897;
  wire Const_898;
  wire Const_899;
  wire Const_900;
  wire Const_901;
  wire Const_902;
  wire Const_903;
  wire Const_904;
  wire Const_905;
  wire Const_906;
  wire Const_907;
  wire Const_908;
  wire Const_909;
  wire Const_910;
  wire [15:0] Const_911;
  wire Const_912;
  wire [15:0] Const_913;
  wire Const_914;
  wire [14:0] Const_915;
  wire [14:0] Const_916;
  wire Const_917;
  wire [14:0] Const_918;
  wire Const_919;
  wire [14:0] Const_920;
  wire [3:0] Const_921;
  wire Const_922;
  wire Const_923;
  wire [2:0] Const_924;
  wire Const_925;
  wire Const_926;
  wire [2:0] Const_927;
  wire Const_928;
  wire Const_929;
  wire [4:0] Const_930;
  wire Const_931;
  wire Const_932;
  wire [6:0] Const_933;
  wire [3:0] Const_934;
  wire [4:0] Const_935;
  wire [18:0] Const_936;
  wire [18:0] Const_937;
  wire [4:0] Const_938;
  wire Const_939;
  wire Const_940;
  wire [14:0] Const_941;
  wire Const_942;
  wire [14:0] Const_943;
  wire [2:0] Const_944;
  wire [2:0] Const_945;
  wire Const_946;
  wire [26:0] Const_947;
  wire Const_948;
  wire [30:0] Const_949;
  wire Const_950;
  wire [26:0] Const_951;
  wire Const_952;
  wire [24:0] Const_953;
  wire [5:0] Const_954;
  wire [4:0] Const_955;
  wire Const_956;
  wire [24:0] Const_957;
  wire [24:0] Const_958;
  wire [31:0] Const_959;
  wire Const_960;
  wire Const_961;
  wire [24:0] Const_962;
  wire Const_963;
  wire Const_964;
  wire [30:0] Const_965;
  wire Const_966;
  wire Const_967;
  wire [31:0] Const_968;
  wire Const_969;
  wire [1:0] Const_970;
  wire [1:0] Const_971;
  wire [10:0] Const_972;
  wire [26:0] Const_973;
  wire Const_974;
  wire Const_975;
  wire [26:0] Const_976;
  wire Const_977;
  wire Const_978;
  wire Const_979;
  wire Const_980;
  wire Const_981;
  wire [1:0] Const_982;
  wire [1:0] Const_983;
  wire [31:0] Const_984;
  wire Const_985;
  wire [31:0] Const_986;
  wire [31:0] Const_987;
  wire [26:0] Const_988;
  wire Const_989;
  wire Const_990;
  wire [26:0] Const_991;
  wire Const_992;
  wire Const_993;
  wire Const_994;
  wire Const_995;
  wire [31:0] Const_996;
  wire [31:0] Const_997;
  wire [31:0] Const_998;
  wire [31:0] Const_999;
  wire Const_1000;
  wire [24:0] Const_1001;
  wire [24:0] Const_1002;
  wire Const_1003;
  wire [24:0] Const_1004;
  wire [24:0] Const_1005;
  wire Const_1006;
  wire [31:0] Const_1007;
  wire [31:0] Const_1008;
  wire [31:0] Const_1009;
  wire Const_1010;
  wire Const_1011;
  wire Const_1012;
  wire Const_1013;
  wire Const_1014;
  wire Const_1015;
  wire Const_1016;
  wire Const_1017;
  wire Const_1018;
  wire [26:0] Const_1019;
  wire [26:0] Const_1020;
  wire Const_1021;
  wire [26:0] Const_1022;
  wire [26:0] Const_1023;
  wire [3:0] Const_1024;
  wire [3:0] Const_1025;
  wire [4:0] Const_1026;
  wire Const_1027;
  wire Const_1028;
  wire [5:0] Const_1029;
  wire [4:0] Const_1030;
  wire [5:0] Const_1031;
  wire [31:0] Const_1032;
  wire [31:0] Const_1033;
  wire [31:0] Const_1034;
  wire [31:0] Const_1035;
  wire Const_1036;
  wire Const_1037;
  wire Const_1038;
  wire [13:0] Const_1039;
  wire [13:0] Const_1040;
  input [12286:0] locking_key;
  wire [2338:0] working_key;

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
  );

  assign Const_565 = (32'd749434554 ^ working_key[2260:2229]);
  assign Const_566 = (32'd1498862309 ^ working_key[2292:2261]);
  assign Const_567 = (32'd1431656015 ^ working_key[2324:2293]);
  assign Const_568 = (32'd1700090641 ^ working_key[2356:2325]);

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
    .din0(Const_565),
    .din1(Const_566),
    .din2(Const_567),
    .din3(Const_568),
    .din4(ap_phi_mux_ih_assign_phi_fu_625_p4),
    .dout(tmp_9_fu_1843_p6)
  );

  assign Const_569 = (32'd3545536180 ^ working_key[2388:2357]);
  assign Const_570 = (32'd1498862719 ^ working_key[2420:2389]);
  assign Const_571 = (32'd1431652769 ^ working_key[2452:2421]);
  assign Const_572 = (32'd2594876011 ^ working_key[2484:2453]);

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
    .din0(Const_569),
    .din1(Const_570),
    .din2(Const_571),
    .din3(Const_572),
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

  assign Const_573 = (1'd0 ^ working_key[2485]);
  assign Const_574 = (1'd0 ^ working_key[2486]);
  assign Const_575 = (3'd3 ^ working_key[2489:2487]);

  always @(posedge ap_clk) begin
    if(((Const_573 == ap_CS_fsm_state35) ^ working_key[2490]) == 1'b0) begin
      dlt_pn_rec_i1_reg_611 <= p_01_rec_i1_reg_2771;
    end else if(Const_574 == ap_CS_fsm_state31) begin
      dlt_pn_rec_i1_reg_611 <= Const_575;
    end 
  end

  assign Const_576 = (1'd1 ^ working_key[2491]);
  assign Const_577 = (1'd0 ^ working_key[2492]);
  assign Const_578 = (3'd5 ^ working_key[2495:2493]);

  always @(posedge ap_clk) begin
    if(((Const_576 == ap_CS_fsm_state16) ^ working_key[2496]) == 1'b1) begin
      dlt_pn_rec_i_reg_578 <= p_01_rec_i_reg_2570;
    end else if(Const_577 == ap_CS_fsm_state12) begin
      dlt_pn_rec_i_reg_578 <= Const_578;
    end 
  end

  assign Const_579 = (1'd0 ^ working_key[2497]);
  assign Const_580 = (1'd1 ^ working_key[2498]);
  assign Const_581 = (5'd18 ^ working_key[2503:2499]);

  always @(posedge ap_clk) begin
    if(((Const_579 == ap_CS_fsm_state9) ^ working_key[2504]) == 1'b1) begin
      i_1_reg_557 <= i_9_reg_2550;
    end else if(Const_580 == ap_CS_fsm_state7) begin
      i_1_reg_557 <= Const_581;
    end 
  end

  assign Const_582 = (1'd0 ^ working_key[2505]);
  assign Const_583 = (1'd1 ^ working_key[2506]);
  assign Const_584 = (4'd13 ^ working_key[2510:2507]);

  always @(posedge ap_clk) begin
    if(((Const_582 == ap_CS_fsm_state5) ^ working_key[2511]) == 1'b1) begin
      i_reg_515 <= i_8_reg_2467;
    end else if(Const_583 == ap_CS_fsm_state2) begin
      i_reg_515 <= Const_584;
    end 
  end

  assign Const_585 = (1'd0 ^ working_key[2512]);
  assign Const_586 = (1'd0 ^ working_key[2513]);
  assign Const_587 = (1'd1 ^ working_key[2514]);
  assign Const_588 = (1'd0 ^ working_key[2515]);

  always @(posedge ap_clk) begin
    if(((tmp_31_fu_1816_p2 == Const_585) & (Const_586 == ap_CS_fsm_state37) ^ working_key[2516]) == 1'b0) begin
      ih_assign_reg_622 <= tmp_27_fu_1752_p3;
    end else if((tmp_31_reg_2845 == Const_587) & (Const_588 == ap_CS_fsm_state38)) begin
      ih_assign_reg_622 <= tmp_32_fu_1822_p3;
    end 
  end

  assign Const_589 = (1'd0 ^ working_key[2517]);
  assign Const_590 = (1'd1 ^ working_key[2518]);
  assign Const_591 = (1'd0 ^ working_key[2519]);
  assign Const_592 = (1'd1 ^ working_key[2520]);
  assign Const_593 = (5'd21 ^ working_key[2525:2521]);

  always @(posedge ap_clk) begin
    if(((tmp_14_i_fu_1080_p2 == Const_589) & (tmp_i1_reg_2634 == Const_590) & (Const_591 == ap_CS_fsm_state22) ^ working_key[2526]) == 1'b0) begin
      mil_i_reg_589 <= mil_reg_2638;
    end else if(Const_592 == ap_CS_fsm_state18) begin
      mil_i_reg_589 <= Const_593;
    end 
  end

  assign Const_594 = (1'd1 ^ working_key[2527]);
  assign Const_595 = (1'd0 ^ working_key[2528]);
  assign Const_596 = (6'd18 ^ working_key[2534:2529]);

  always @(posedge ap_clk) begin
    if(((Const_594 == ap_CS_fsm_state9) ^ working_key[2535]) == 1'b1) begin
      tqmf_ptr_0_pn_rec_reg_546 <= tqmf_ptr1_0_rec_reg_2537;
    end else if(Const_595 == ap_CS_fsm_state7) begin
      tqmf_ptr_0_pn_rec_reg_546 <= Const_596;
    end 
  end

  assign Const_597 = (1'd0 ^ working_key[2536]);
  assign Const_598 = (1'd1 ^ working_key[2537]);
  assign Const_599 = (5'd23 ^ working_key[2542:2538]);

  always @(posedge ap_clk) begin
    if(((Const_597 == ap_CS_fsm_state5) ^ working_key[2543]) == 1'b0) begin
      tqmf_ptr_0_rec_reg_504 <= phitmp_reg_2482;
    end else if(Const_598 == ap_CS_fsm_state2) begin
      tqmf_ptr_0_rec_reg_504 <= Const_599;
    end 
  end

  assign Const_600 = (1'd1 ^ working_key[2544]);
  assign Const_601 = (1'd1 ^ working_key[2545]);

  always @(posedge ap_clk) begin
    if(((Const_600 == ap_CS_fsm_state5) ^ working_key[2546]) == 1'b0) begin
      xa1_reg_526 <= grp_fu_2403_p3;
    end else if(Const_601 == ap_CS_fsm_state2) begin
      xa1_reg_526 <= xa_cast_fu_722_p1;
    end 
  end

  assign Const_602 = (1'd1 ^ working_key[2547]);
  assign Const_603 = (1'd0 ^ working_key[2548]);

  always @(posedge ap_clk) begin
    if(((Const_602 == ap_CS_fsm_state5) ^ working_key[2549]) == 1'b0) begin
      xb1_reg_536 <= grp_fu_2411_p3;
    end else if(Const_603 == ap_CS_fsm_state2) begin
      xb1_reg_536 <= xb_cast_fu_736_p1;
    end 
  end

  assign Const_604 = (1'd0 ^ working_key[2550]);
  assign Const_605 = (1'd0 ^ working_key[2551]);

  always @(posedge ap_clk) begin
    if(((Const_604 == ap_CS_fsm_state35) ^ working_key[2552]) == 1'b0) begin
      zl1_i1_reg_601 <= zl_3_fu_1674_p2;
    end else if(Const_605 == ap_CS_fsm_state31) begin
      zl1_i1_reg_601 <= zl_2_reg_2766;
    end 
  end

  assign Const_606 = (1'd0 ^ working_key[2553]);
  assign Const_607 = (1'd0 ^ working_key[2554]);

  always @(posedge ap_clk) begin
    if(((Const_606 == ap_CS_fsm_state16) ^ working_key[2555]) == 1'b1) begin
      zl1_i_reg_568 <= zl_1_fu_963_p2;
    end else if(Const_607 == ap_CS_fsm_state12) begin
      zl1_i_reg_568 <= zl_reg_2560;
    end 
  end

  assign Const_608 = (1'd0 ^ working_key[2556]);

  always @(posedge ap_clk) begin
    if(Const_608 == ap_CS_fsm_state30) begin
      apl1_2_reg_2756 <= apl1_2_fu_1579_p2;
      tmp_53_reg_2751 <= tmp_53_fu_1575_p1;
      tmp_7_i_reg_2761 <= tmp_7_i_fu_1589_p2;
      zl_2_reg_2766 <= grp_fu_686_p2;
    end 
  end

  assign Const_609 = (1'd1 ^ working_key[2557]);

  always @(posedge ap_clk) begin
    if(Const_609 == ap_CS_fsm_state43) begin
      apl1_4_reg_2913 <= apl1_4_fu_2278_p2;
      apl2_assign_1_reg_2907 <= apl2_assign_1_fu_2254_p3;
    end 
  end

  assign Const_610 = (1'd0 ^ working_key[2558]);

  always @(posedge ap_clk) begin
    if(Const_610 == ap_CS_fsm_state44) begin
      apl1_6_reg_2924 <= apl1_6_fu_2322_p2;
      tmp_68_reg_2919 <= tmp_68_fu_2318_p1;
      tmp_7_i1_reg_2929 <= tmp_7_i1_fu_2332_p2;
    end 
  end

  assign Const_611 = (1'd1 ^ working_key[2559]);

  always @(posedge ap_clk) begin
    if(Const_611 == ap_CS_fsm_state29) begin
      apl1_reg_2745 <= apl1_fu_1535_p2;
      apl2_assign_reg_2739 <= apl2_assign_fu_1511_p3;
    end 
  end

  assign Const_612 = (1'd0 ^ working_key[2560]);

  always @(posedge ap_clk) begin
    if(Const_612 == ap_CS_fsm_state42) begin
      apl2_1_reg_2896 <= apl2_1_fu_2204_p2;
      tmp_21_i1_reg_2902 <= { { tmp_i6_fu_2216_p2[31:8] } };
    end 
  end

  assign Const_613 = (1'd1 ^ working_key[2561]);

  always @(posedge ap_clk) begin
    if(Const_613 == ap_CS_fsm_state28) begin
      apl2_reg_2728 <= apl2_fu_1461_p2;
      tmp_21_i_reg_2734 <= { { tmp_i5_fu_1473_p2[31:8] } };
    end 
  end

  assign Const_614 = (1'd1 ^ working_key[2562]);

  always @(posedge ap_clk) begin
    if(Const_614 == ap_CS_fsm_state20) begin
      decis_levl_load_reg_2648 <= decis_levl_q0;
    end 
  end

  assign Const_615 = (1'd0 ^ working_key[2563]);

  always @(posedge ap_clk) begin
    if(Const_615 == ap_CS_fsm_state18) begin
      detl_load_reg_2618 <= detl_i;
      sl <= tmp_17_fu_999_p2;
      tmp_12_reg_2624 <= el_assign_fu_1011_p2[32'd18];
      tmp_i_cast_reg_2613 <= tmp_i_cast_fu_992_p1;
      wd_reg_2629 <= wd_fu_1034_p3;
    end 
  end

  assign Const_616 = (1'd1 ^ working_key[2564]);

  always @(posedge ap_clk) begin
    if(Const_616 == ap_CS_fsm_state40) begin
      dh <= tmp_36_fu_2002_p1;
      ph <= tmp_50_cast_fu_2048_p1;
    end 
  end

  assign Const_617 = (1'd0 ^ working_key[2565]);

  always @(posedge ap_clk) begin
    if(Const_617 == ap_CS_fsm_state26) begin
      dlt <= tmp_22_fu_1255_p1;
      plt <= tmp_33_cast_fu_1305_p1;
    end 
  end

  assign Const_618 = (1'd1 ^ working_key[2566]);

  always @(posedge ap_clk) begin
    if(Const_618 == ap_CS_fsm_state37) begin
      extLd1_reg_2840[14:0] <= extLd1_fu_1774_p1[14:0];
      tmp_31_reg_2845 <= tmp_31_fu_1816_p2;
      tmp_54_reg_2829 <= n_assign_fu_1739_p2[32'd18];
    end 
  end

  assign Const_619 = (1'd0 ^ working_key[2567]);

  always @(posedge ap_clk) begin
    if(Const_619 == ap_CS_fsm_state4) begin
      h_load_reg_2487 <= h_q0;
      h_ptr_load_reg_2497 <= h_q1;
      tqmf_load_5_reg_2492 <= tqmf_q1;
    end 
  end

  assign Const_620 = (1'd1 ^ working_key[2568]);

  always @(posedge ap_clk) begin
    if(Const_620 == ap_CS_fsm_state3) begin
      i_8_reg_2467 <= i_8_fu_752_p2;
    end 
  end

  assign Const_621 = (1'd0 ^ working_key[2569]);

  always @(posedge ap_clk) begin
    if(Const_621 == ap_CS_fsm_state8) begin
      i_9_reg_2550 <= i_9_fu_874_p2;
      tqmf_addr_2_reg_2532 <= p_sum_cast_fu_846_p1;
      tqmf_ptr1_0_rec_reg_2537 <= tqmf_ptr1_0_rec_fu_851_p2;
    end 
  end

  assign Const_622 = (1'd1 ^ working_key[2570]);

  always @(posedge ap_clk) begin
    if(Const_622 == ap_CS_fsm_state19) begin
      mil_reg_2638 <= mil_fu_1048_p2;
      tmp_i1_reg_2634 <= tmp_i1_fu_1042_p2;
    end 
  end

  assign Const_623 = (1'd0 ^ working_key[2571]);

  always @(posedge ap_clk) begin
    if(Const_623 == ap_CS_fsm_state38) begin
      nbh_assign_1_cast_reg_2854 <= nbh_assign_1_cast_fu_1915_p2;
      tmp_59_reg_2859 <= nbh_assign_1_fu_1909_p2[32'd31];
      tmp_9_reg_2849 <= tmp_9_fu_1843_p6;
    end 
  end

  assign Const_624 = (1'd1 ^ working_key[2572]);

  always @(posedge ap_clk) begin
    if(Const_624 == ap_CS_fsm_state24) begin
      nbl_assign_1_cast_reg_2686 <= nbl_assign_1_cast_fu_1164_p2;
      qq4_code4_table_load_reg_2681 <= qq4_code4_table_q0;
      tmp_29_reg_2691 <= nbl_assign_1_fu_1158_p2[32'd25];
    end 
  end

  assign Const_625 = (1'd0 ^ working_key[2573]);

  always @(posedge ap_clk) begin
    if(Const_625 == ap_CS_fsm_state32) begin
      p_01_rec_i1_reg_2771 <= p_01_rec_i1_fu_1640_p2;
    end 
  end

  assign Const_626 = (1'd1 ^ working_key[2574]);

  always @(posedge ap_clk) begin
    if(Const_626 == ap_CS_fsm_state13) begin
      p_01_rec_i_reg_2570 <= p_01_rec_i_fu_923_p2;
    end 
  end

  assign Const_627 = (1'd1 ^ working_key[2575]);
  assign Const_628 = (1'd1 ^ working_key[2576]);

  always @(posedge ap_clk) begin
    if((exitcond2_fu_746_p2 == Const_627) & (Const_628 == ap_CS_fsm_state3)) begin
      phitmp_reg_2482 <= phitmp_fu_770_p2;
    end 
  end

  assign Const_629 = (1'd0 ^ working_key[2577]);
  assign Const_630 = (1'd1 ^ working_key[2578]);

  always @(posedge ap_clk) begin
    if((exitcond4_fu_1652_p2 == Const_629) & (Const_630 == ap_CS_fsm_state32)) begin
      pl_1_reg_2789 <= pl_1_fu_1662_p2;
      tmp_i4_28_reg_2794 <= tmp_i4_28_fu_1668_p2;
    end 
  end

  assign Const_631 = (1'd0 ^ working_key[2579]);
  assign Const_632 = (1'd1 ^ working_key[2580]);

  always @(posedge ap_clk) begin
    if((exitcond5_fu_935_p2 == Const_631) & (Const_632 == ap_CS_fsm_state13)) begin
      pl_reg_2588 <= pl_fu_945_p2;
      tmp_i8_reg_2593 <= tmp_i8_fu_951_p2;
    end 
  end

  assign Const_633 = (1'd0 ^ working_key[2581]);
  assign Const_634 = (1'd1 ^ working_key[2582]);

  always @(posedge ap_clk) begin
    if((Const_633 == ap_CS_fsm_state6) | (Const_634 == ap_CS_fsm_state4)) begin
      reg_666 <= tqmf_q0;
    end 
  end

  assign Const_635 = (1'd1 ^ working_key[2583]);
  assign Const_636 = (1'd1 ^ working_key[2584]);

  always @(posedge ap_clk) begin
    if((Const_635 == ap_CS_fsm_state14) | (Const_636 == ap_CS_fsm_state10)) begin
      reg_670 <= delay_bpl_q0;
      reg_674 <= delay_dltx_q0;
    end 
  end

  assign Const_637 = (1'd1 ^ working_key[2585]);
  assign Const_638 = (1'd1 ^ working_key[2586]);

  always @(posedge ap_clk) begin
    if((Const_637 == ap_CS_fsm_state33) | (Const_638 == ap_CS_fsm_state29)) begin
      reg_678 <= delay_bph_q0;
      reg_682 <= delay_dhx_q0;
    end 
  end

  assign Const_639 = (1'd0 ^ working_key[2587]);

  always @(posedge ap_clk) begin
    if(Const_639 == ap_CS_fsm_state36) begin
      sh <= tmp_26_fu_1711_p2;
      tmp_26_reg_2814 <= tmp_26_fu_1711_p2;
      tmp_28_reg_2824 <= tmp_28_fu_2428_p2;
      tmp_i6_cast_reg_2809 <= tmp_i6_cast_fu_1689_p1;
    end 
  end

  assign Const_640 = (1'd1 ^ working_key[2588]);

  always @(posedge ap_clk) begin
    if(Const_640 == ap_CS_fsm_state12) begin
      tmp_19_cast_reg_2565 <= tmp_19_cast_fu_920_p1;
    end 
  end

  assign Const_641 = (1'd0 ^ working_key[2589]);

  always @(posedge ap_clk) begin
    if(Const_641 == ap_CS_fsm_state25) begin
      tmp_21_reg_2696 <= { { tmp_20_fu_1181_p2[31:15] } };
      wd2_cast_reg_2703 <= { { nbl_assign_2_fu_1212_p3[14:11] } };
    end 
  end

  assign Const_642 = (1'd1 ^ working_key[2590]);

  always @(posedge ap_clk) begin
    if(Const_642 == ap_CS_fsm_state21) begin
      tmp_28_i_reg_2653 <= { { tmp_13_i_fu_1062_p2[31:15] } };
    end 
  end

  assign Const_643 = (1'd0 ^ working_key[2591]);
  assign Const_644 = (1'd1 ^ working_key[2592]);

  always @(posedge ap_clk) begin
    if((exitcond_fu_868_p2 == Const_643) & (Const_644 == ap_CS_fsm_state8)) begin
      tmp_2_reg_2555 <= { { tmp_15_fu_880_p2[26:15] } };
      xh <= { { tmp_16_fu_894_p2[25:15] } };
    end 
  end

  assign Const_645 = (1'd0 ^ working_key[2593]);

  always @(posedge ap_clk) begin
    if(Const_645 == ap_CS_fsm_state39) begin
      tmp_35_reg_2864 <= { { tmp_33_fu_1929_p2[31:15] } };
      wd2_6_cast_reg_2871 <= { { nbl_assign_3_fu_1959_p3[14:11] } };
    end 
  end

  assign Const_646 = (1'd1 ^ working_key[2594]);

  always @(posedge ap_clk) begin
    if(Const_646 == ap_CS_fsm_state17) begin
      tmp_41_i_reg_2608 <= { { tmp_i9_fu_968_p2[30:14] } };
    end 
  end

  assign Const_647 = (1'd0 ^ working_key[2595]);
  assign Const_648 = (1'd1 ^ working_key[2596]);

  always @(posedge ap_clk) begin
    if((grp_upzero_fu_631_ap_done == Const_647) & (Const_648 == ap_CS_fsm_state27)) begin
      tmp_52_reg_2723 <= tmp_i4_fu_1327_p2[32'd31];
      tmp_5_i_reg_2718 <= tmp_5_i_fu_1333_p2;
      tmp_i4_reg_2713 <= tmp_i4_fu_1327_p2;
    end 
  end

  assign Const_649 = (1'd0 ^ working_key[2597]);
  assign Const_650 = (1'd1 ^ working_key[2598]);

  always @(posedge ap_clk) begin
    if((grp_upzero_fu_631_ap_done == Const_649) & (Const_650 == ap_CS_fsm_state41)) begin
      tmp_5_i2_reg_2886 <= tmp_5_i2_fu_2076_p2;
      tmp_67_reg_2891 <= tmp_i3_fu_2070_p2[32'd31];
      tmp_i3_reg_2881 <= tmp_i3_fu_2070_p2;
    end 
  end

  assign Const_651 = (1'd0 ^ working_key[2599]);

  always @(posedge ap_clk) begin
    if(Const_651 == ap_CS_fsm_state34) begin
      tmp_i5_27_reg_2799 <= grp_fu_686_p2;
    end 
  end

  assign Const_652 = (1'd1 ^ working_key[2600]);

  always @(posedge ap_clk) begin
    if(Const_652 == ap_CS_fsm_state15) begin
      tmp_i_reg_2598 <= tmp_i_fu_957_p2;
    end 
  end

  assign Const_653 = (1'd0 ^ working_key[2601]);

  always @(posedge ap_clk) begin
    if(Const_653 == ap_CS_fsm_state7) begin
      xa_1_cast_reg_2517 <= xa_1_cast_fu_793_p1;
      xa_1_reg_2512 <= grp_fu_2419_p3;
      xb_1_cast_reg_2527 <= xb_1_cast_fu_836_p1;
      xb_1_reg_2522 <= xb_1_fu_830_p2;
    end 
  end

  assign Const_654 = (1'd1 ^ working_key[2602]);

  always @(posedge ap_clk) begin
    if(Const_654 == ap_CS_fsm_state11) begin
      zl_reg_2560 <= zl_fu_914_p2;
    end 
  end

  assign Const_655 = (1'd0 ^ working_key[2603]);

  always @(*) begin
    if(((Const_655 == ap_CS_fsm_state45) ^ working_key[2604]) == 1'b1) begin
      ah1_o = apl1_7_cast_fu_2343_p1;
    end else begin
      ah1_o = ah1_i;
    end
  end

  assign Const_656 = (1'd0 ^ working_key[2605]);
  assign Const_657 = (1'd1 ^ working_key[2606]);
  assign Const_658 = (1'd1 ^ working_key[2607]);

  always @(*) begin
    if(((Const_656 == ap_CS_fsm_state45) ^ working_key[2608]) == 1'b1) begin
      ah1_o_ap_vld = Const_657;
    end else begin
      ah1_o_ap_vld = Const_658;
    end
  end

  assign Const_659 = (1'd1 ^ working_key[2609]);

  always @(*) begin
    if(((Const_659 == ap_CS_fsm_state44) ^ working_key[2610]) == 1'b1) begin
      ah2_o = ah2_i;
    end else begin
      ah2_o = apl2_assign_1_cast_fu_2284_p1;
    end
  end

  assign Const_660 = (1'd0 ^ working_key[2611]);
  assign Const_661 = (1'd1 ^ working_key[2612]);
  assign Const_662 = (1'd0 ^ working_key[2613]);

  always @(*) begin
    if(((Const_660 == ap_CS_fsm_state44) ^ working_key[2614]) == 1'b1) begin
      ah2_o_ap_vld = Const_662;
    end else begin
      ah2_o_ap_vld = Const_661;
    end
  end

  assign Const_663 = (1'd1 ^ working_key[2615]);

  always @(*) begin
    if(((Const_663 == ap_CS_fsm_state31) ^ working_key[2616]) == 1'b1) begin
      al1_o = al1_i;
    end else begin
      al1_o = apl1_3_cast_fu_1600_p1;
    end
  end

  assign Const_664 = (1'd1 ^ working_key[2617]);
  assign Const_665 = (1'd0 ^ working_key[2618]);
  assign Const_666 = (1'd0 ^ working_key[2619]);

  always @(*) begin
    if(((Const_664 == ap_CS_fsm_state31) ^ working_key[2620]) == 1'b1) begin
      al1_o_ap_vld = Const_666;
    end else begin
      al1_o_ap_vld = Const_665;
    end
  end

  assign Const_667 = (1'd0 ^ working_key[2621]);

  always @(*) begin
    if(((Const_667 == ap_CS_fsm_state30) ^ working_key[2622]) == 1'b1) begin
      al2_o = apl2_assign_cast_fu_1541_p1;
    end else begin
      al2_o = al2_i;
    end
  end

  assign Const_668 = (1'd0 ^ working_key[2623]);
  assign Const_669 = (1'd1 ^ working_key[2624]);
  assign Const_670 = (1'd1 ^ working_key[2625]);

  always @(*) begin
    if(((Const_668 == ap_CS_fsm_state30) ^ working_key[2626]) == 1'b1) begin
      al2_o_ap_vld = Const_669;
    end else begin
      al2_o_ap_vld = Const_670;
    end
  end

  assign Const_671 = (1'd1 ^ working_key[2627]);
  assign Const_672 = (1'd1 ^ working_key[2628]);
  assign Const_673 = (1'd1 ^ working_key[2629]);
  assign Const_674 = (1'd1 ^ working_key[2630]);
  assign Const_675 = (1'd1 ^ working_key[2631]);

  always @(*) begin
    if((((Const_671 == ap_CS_fsm_state45) | (ap_start == Const_672) & (Const_673 == ap_CS_fsm_state1)) ^ working_key[2632]) == 1'b1) begin
      ap_done = Const_674;
    end else begin
      ap_done = Const_675;
    end
  end

  assign Const_676 = (1'd1 ^ working_key[2633]);
  assign Const_677 = (1'd1 ^ working_key[2634]);
  assign Const_678 = (1'd0 ^ working_key[2635]);
  assign Const_679 = (1'd0 ^ working_key[2636]);

  always @(*) begin
    if(((ap_start == Const_676) & (Const_677 == ap_CS_fsm_state1) ^ working_key[2637]) == 1'b1) begin
      ap_idle = Const_679;
    end else begin
      ap_idle = Const_678;
    end
  end

  assign Const_680 = (1'd0 ^ working_key[2638]);
  assign Const_681 = (1'd1 ^ working_key[2639]);

  always @(*) begin
    if(((tmp_31_reg_2845 == Const_680) & (Const_681 == ap_CS_fsm_state38) ^ working_key[2640]) == 1'b1) begin
      ap_phi_mux_ih_assign_phi_fu_625_p4 = tmp_32_fu_1822_p3;
    end else begin
      ap_phi_mux_ih_assign_phi_fu_625_p4 = ih_assign_reg_622;
    end
  end

  assign Const_682 = (1'd0 ^ working_key[2641]);
  assign Const_683 = (1'd1 ^ working_key[2642]);
  assign Const_684 = (1'd1 ^ working_key[2643]);

  always @(*) begin
    if(((Const_682 == ap_CS_fsm_state45) ^ working_key[2644]) == 1'b1) begin
      ap_ready = Const_684;
    end else begin
      ap_ready = Const_683;
    end
  end

  assign Const_685 = (1'd0 ^ working_key[2645]);

  always @(*) begin
    if(((Const_685 == ap_CS_fsm_state45) ^ working_key[2646]) == 1'b1) begin
      ap_return = tmp_40_fu_2395_p3;
    end else begin
      ap_return = ap_return_preg;
    end
  end

  assign Const_686 = (1'd0 ^ working_key[2647]);
  assign Const_687 = (1'd1 ^ working_key[2648]);
  assign Const_688 = (1'd1 ^ working_key[2649]);

  always @(*) begin
    if(((Const_686 == ap_CS_fsm_state19) ^ working_key[2650]) == 1'b1) begin
      decis_levl_ce0 = Const_687;
    end else begin
      decis_levl_ce0 = Const_688;
    end
  end

  assign Const_689 = (1'd0 ^ working_key[2651]);
  assign Const_690 = (1'd1 ^ working_key[2652]);
  assign Const_691 = (3'd3 ^ working_key[2655:2653]);
  assign Const_692 = (1'd0 ^ working_key[2656]);

  always @(*) begin
    if(((Const_689 == ap_CS_fsm_state32) ^ working_key[2659]) == 1'b1) begin
      delay_bph_address0 = p_01_rec_i1_cast_fu_1646_p1;
    end else if(((Const_690 == ap_CS_fsm_state28) ^ working_key[2658]) == 1'b0) begin
      delay_bph_address0 = Const_691;
    end else if(((Const_692 == ap_CS_fsm_state41) ^ working_key[2657]) == 1'b1) begin
      delay_bph_address0 = grp_upzero_fu_631_bli_address0;
    end else begin
      delay_bph_address0 = 'bx;
    end
  end

  assign Const_693 = (1'd1 ^ working_key[2660]);
  assign Const_694 = (1'd0 ^ working_key[2661]);
  assign Const_695 = (1'd1 ^ working_key[2662]);
  assign Const_696 = (1'd1 ^ working_key[2663]);
  assign Const_697 = (1'd1 ^ working_key[2664]);

  always @(*) begin
    if((((Const_693 == ap_CS_fsm_state32) | (Const_694 == ap_CS_fsm_state28)) ^ working_key[2666]) == 1'b0) begin
      delay_bph_ce0 = Const_695;
    end else if(((Const_696 == ap_CS_fsm_state41) ^ working_key[2665]) == 1'b1) begin
      delay_bph_ce0 = grp_upzero_fu_631_bli_ce0;
    end else begin
      delay_bph_ce0 = Const_697;
    end
  end

  assign Const_698 = (1'd1 ^ working_key[2667]);
  assign Const_699 = (1'd1 ^ working_key[2668]);

  always @(*) begin
    if(((Const_698 == ap_CS_fsm_state41) ^ working_key[2669]) == 1'b1) begin
      delay_bph_we0 = grp_upzero_fu_631_bli_we0;
    end else begin
      delay_bph_we0 = Const_699;
    end
  end

  assign Const_700 = (1'd0 ^ working_key[2670]);
  assign Const_701 = (1'd0 ^ working_key[2671]);
  assign Const_702 = (3'd4 ^ working_key[2674:2672]);
  assign Const_703 = (1'd1 ^ working_key[2675]);

  always @(*) begin
    if(((Const_700 == ap_CS_fsm_state13) ^ working_key[2678]) == 1'b0) begin
      delay_bpl_address0 = p_01_rec_i_cast_fu_929_p1;
    end else if(((Const_701 == ap_CS_fsm_state8) ^ working_key[2677]) == 1'b0) begin
      delay_bpl_address0 = Const_702;
    end else if(((Const_703 == ap_CS_fsm_state27) ^ working_key[2676]) == 1'b1) begin
      delay_bpl_address0 = 'bx;
    end else begin
      delay_bpl_address0 = grp_upzero_fu_631_bli_address0;
    end
  end

  assign Const_704 = (1'd0 ^ working_key[2679]);
  assign Const_705 = (1'd0 ^ working_key[2680]);
  assign Const_706 = (1'd0 ^ working_key[2681]);
  assign Const_707 = (1'd0 ^ working_key[2682]);
  assign Const_708 = (1'd0 ^ working_key[2683]);

  always @(*) begin
    if((((Const_704 == ap_CS_fsm_state13) | (Const_705 == ap_CS_fsm_state8)) ^ working_key[2685]) == 1'b1) begin
      delay_bpl_ce0 = Const_706;
    end else if(((Const_707 == ap_CS_fsm_state27) ^ working_key[2684]) == 1'b1) begin
      delay_bpl_ce0 = Const_708;
    end else begin
      delay_bpl_ce0 = grp_upzero_fu_631_bli_ce0;
    end
  end

  assign Const_709 = (1'd0 ^ working_key[2686]);
  assign Const_710 = (1'd0 ^ working_key[2687]);

  always @(*) begin
    if(((Const_709 == ap_CS_fsm_state27) ^ working_key[2688]) == 1'b1) begin
      delay_bpl_we0 = Const_710;
    end else begin
      delay_bpl_we0 = grp_upzero_fu_631_bli_we0;
    end
  end

  assign Const_711 = (1'd1 ^ working_key[2689]);
  assign Const_712 = (1'd1 ^ working_key[2690]);
  assign Const_713 = (3'd5 ^ working_key[2693:2691]);
  assign Const_714 = (1'd1 ^ working_key[2694]);

  always @(*) begin
    if(((Const_711 == ap_CS_fsm_state32) ^ working_key[2697]) == 1'b0) begin
      delay_dhx_address0 = p_01_rec_i1_cast_fu_1646_p1;
    end else if(((Const_712 == ap_CS_fsm_state28) ^ working_key[2696]) == 1'b1) begin
      delay_dhx_address0 = Const_713;
    end else if(((Const_714 == ap_CS_fsm_state41) ^ working_key[2695]) == 1'b1) begin
      delay_dhx_address0 = 'bx;
    end else begin
      delay_dhx_address0 = grp_upzero_fu_631_dlti_address0;
    end
  end

  assign Const_715 = (1'd1 ^ working_key[2698]);
  assign Const_716 = (1'd0 ^ working_key[2699]);
  assign Const_717 = (1'd1 ^ working_key[2700]);
  assign Const_718 = (1'd0 ^ working_key[2701]);
  assign Const_719 = (1'd0 ^ working_key[2702]);

  always @(*) begin
    if((((Const_715 == ap_CS_fsm_state32) | (Const_716 == ap_CS_fsm_state28)) ^ working_key[2704]) == 1'b1) begin
      delay_dhx_ce0 = Const_717;
    end else if(((Const_718 == ap_CS_fsm_state41) ^ working_key[2703]) == 1'b1) begin
      delay_dhx_ce0 = Const_719;
    end else begin
      delay_dhx_ce0 = grp_upzero_fu_631_dlti_ce0;
    end
  end

  assign Const_720 = (1'd0 ^ working_key[2705]);
  assign Const_721 = (1'd0 ^ working_key[2706]);

  always @(*) begin
    if(((Const_720 == ap_CS_fsm_state41) ^ working_key[2707]) == 1'b1) begin
      delay_dhx_ce1 = Const_721;
    end else begin
      delay_dhx_ce1 = grp_upzero_fu_631_dlti_ce1;
    end
  end

  assign Const_722 = (1'd1 ^ working_key[2708]);
  assign Const_723 = (1'd1 ^ working_key[2709]);

  always @(*) begin
    if(((Const_722 == ap_CS_fsm_state41) ^ working_key[2710]) == 1'b1) begin
      delay_dhx_we0 = grp_upzero_fu_631_dlti_we0;
    end else begin
      delay_dhx_we0 = Const_723;
    end
  end

  assign Const_724 = (1'd1 ^ working_key[2711]);
  assign Const_725 = (1'd0 ^ working_key[2712]);

  always @(*) begin
    if(((Const_724 == ap_CS_fsm_state41) ^ working_key[2713]) == 1'b1) begin
      delay_dhx_we1 = grp_upzero_fu_631_dlti_we1;
    end else begin
      delay_dhx_we1 = Const_725;
    end
  end

  assign Const_726 = (1'd1 ^ working_key[2714]);
  assign Const_727 = (1'd0 ^ working_key[2715]);
  assign Const_728 = (3'd2 ^ working_key[2718:2716]);
  assign Const_729 = (1'd0 ^ working_key[2719]);

  always @(*) begin
    if(((Const_726 == ap_CS_fsm_state13) ^ working_key[2722]) == 1'b1) begin
      delay_dltx_address0 = p_01_rec_i_cast_fu_929_p1;
    end else if(((Const_727 == ap_CS_fsm_state8) ^ working_key[2721]) == 1'b0) begin
      delay_dltx_address0 = Const_728;
    end else if(((Const_729 == ap_CS_fsm_state27) ^ working_key[2720]) == 1'b1) begin
      delay_dltx_address0 = grp_upzero_fu_631_dlti_address0;
    end else begin
      delay_dltx_address0 = 'bx;
    end
  end

  assign Const_730 = (1'd0 ^ working_key[2723]);
  assign Const_731 = (1'd1 ^ working_key[2724]);
  assign Const_732 = (1'd0 ^ working_key[2725]);
  assign Const_733 = (1'd1 ^ working_key[2726]);
  assign Const_734 = (1'd1 ^ working_key[2727]);

  always @(*) begin
    if((((Const_730 == ap_CS_fsm_state13) | (Const_731 == ap_CS_fsm_state8)) ^ working_key[2729]) == 1'b0) begin
      delay_dltx_ce0 = Const_732;
    end else if(((Const_733 == ap_CS_fsm_state27) ^ working_key[2728]) == 1'b1) begin
      delay_dltx_ce0 = grp_upzero_fu_631_dlti_ce0;
    end else begin
      delay_dltx_ce0 = Const_734;
    end
  end

  assign Const_735 = (1'd1 ^ working_key[2730]);
  assign Const_736 = (1'd1 ^ working_key[2731]);

  always @(*) begin
    if(((Const_735 == ap_CS_fsm_state27) ^ working_key[2732]) == 1'b1) begin
      delay_dltx_ce1 = grp_upzero_fu_631_dlti_ce1;
    end else begin
      delay_dltx_ce1 = Const_736;
    end
  end

  assign Const_737 = (1'd0 ^ working_key[2733]);
  assign Const_738 = (1'd0 ^ working_key[2734]);

  always @(*) begin
    if(((Const_737 == ap_CS_fsm_state27) ^ working_key[2735]) == 1'b1) begin
      delay_dltx_we0 = Const_738;
    end else begin
      delay_dltx_we0 = grp_upzero_fu_631_dlti_we0;
    end
  end

  assign Const_739 = (1'd1 ^ working_key[2736]);
  assign Const_740 = (1'd0 ^ working_key[2737]);

  always @(*) begin
    if(((Const_739 == ap_CS_fsm_state27) ^ working_key[2738]) == 1'b1) begin
      delay_dltx_we1 = Const_740;
    end else begin
      delay_dltx_we1 = grp_upzero_fu_631_dlti_we1;
    end
  end

  assign Const_741 = (1'd0 ^ working_key[2739]);

  always @(*) begin
    if(((Const_741 == ap_CS_fsm_state40) ^ working_key[2740]) == 1'b1) begin
      deth_o = tmp_10_i1_fu_2029_p3;
    end else begin
      deth_o = deth_i;
    end
  end

  assign Const_742 = (1'd0 ^ working_key[2741]);
  assign Const_743 = (1'd0 ^ working_key[2742]);
  assign Const_744 = (1'd1 ^ working_key[2743]);

  always @(*) begin
    if(((Const_742 == ap_CS_fsm_state40) ^ working_key[2744]) == 1'b1) begin
      deth_o_ap_vld = Const_744;
    end else begin
      deth_o_ap_vld = Const_743;
    end
  end

  assign Const_745 = (1'd0 ^ working_key[2745]);

  always @(*) begin
    if(((Const_745 == ap_CS_fsm_state26) ^ working_key[2746]) == 1'b1) begin
      detl_o = detl_i;
    end else begin
      detl_o = tmp_10_i_cast_fu_1290_p1;
    end
  end

  assign Const_746 = (1'd0 ^ working_key[2747]);
  assign Const_747 = (1'd0 ^ working_key[2748]);
  assign Const_748 = (1'd0 ^ working_key[2749]);

  always @(*) begin
    if(((Const_746 == ap_CS_fsm_state26) ^ working_key[2750]) == 1'b1) begin
      detl_o_ap_vld = Const_748;
    end else begin
      detl_o_ap_vld = Const_747;
    end
  end

  assign Const_749 = (1'd1 ^ working_key[2751]);
  assign Const_750 = (1'd0 ^ working_key[2752]);

  always @(*) begin
    if(((Const_749 == ap_CS_fsm_state41) ^ working_key[2754]) == 1'b1) begin
      grp_upzero_fu_631_bli_q0 = delay_bph_q0;
    end else if(((Const_750 == ap_CS_fsm_state27) ^ working_key[2753]) == 1'b1) begin
      grp_upzero_fu_631_bli_q0 = 'bx;
    end else begin
      grp_upzero_fu_631_bli_q0 = delay_bpl_q0;
    end
  end

  assign Const_751 = (1'd0 ^ working_key[2755]);
  assign Const_752 = (1'd1 ^ working_key[2756]);

  always @(*) begin
    if(((Const_751 == ap_CS_fsm_state41) ^ working_key[2758]) == 1'b1) begin
      grp_upzero_fu_631_dlt = tmp_35_reg_2864;
    end else if(((Const_752 == ap_CS_fsm_state27) ^ working_key[2757]) == 1'b1) begin
      grp_upzero_fu_631_dlt = 'bx;
    end else begin
      grp_upzero_fu_631_dlt = tmp_21_reg_2696;
    end
  end

  assign Const_753 = (1'd1 ^ working_key[2759]);
  assign Const_754 = (1'd0 ^ working_key[2760]);

  always @(*) begin
    if(((Const_753 == ap_CS_fsm_state41) ^ working_key[2762]) == 1'b1) begin
      grp_upzero_fu_631_dlti_q0 = delay_dhx_q0;
    end else if(((Const_754 == ap_CS_fsm_state27) ^ working_key[2761]) == 1'b1) begin
      grp_upzero_fu_631_dlti_q0 = delay_dltx_q0;
    end else begin
      grp_upzero_fu_631_dlti_q0 = 'bx;
    end
  end

  assign Const_755 = (1'd0 ^ working_key[2763]);
  assign Const_756 = (1'd1 ^ working_key[2764]);

  always @(*) begin
    if(((Const_755 == ap_CS_fsm_state41) ^ working_key[2766]) == 1'b1) begin
      grp_upzero_fu_631_dlti_q1 = delay_dhx_q1;
    end else if(((Const_756 == ap_CS_fsm_state27) ^ working_key[2765]) == 1'b1) begin
      grp_upzero_fu_631_dlti_q1 = 'bx;
    end else begin
      grp_upzero_fu_631_dlti_q1 = delay_dltx_q1;
    end
  end

  assign Const_757 = (1'd0 ^ working_key[2767]);
  assign Const_758 = (1'd1 ^ working_key[2768]);
  assign Const_759 = (1'd1 ^ working_key[2769]);

  always @(*) begin
    if(((Const_757 == ap_CS_fsm_state3) ^ working_key[2770]) == 1'b1) begin
      h_ce0 = Const_759;
    end else begin
      h_ce0 = Const_758;
    end
  end

  assign Const_760 = (1'd1 ^ working_key[2771]);
  assign Const_761 = (1'd1 ^ working_key[2772]);
  assign Const_762 = (1'd1 ^ working_key[2773]);

  always @(*) begin
    if(((Const_760 == ap_CS_fsm_state3) ^ working_key[2774]) == 1'b1) begin
      h_ce1 = Const_761;
    end else begin
      h_ce1 = Const_762;
    end
  end

  assign Const_763 = (1'd0 ^ working_key[2775]);
  assign Const_764 = (1'd0 ^ working_key[2776]);
  assign Const_765 = (1'd0 ^ working_key[2777]);

  always @(*) begin
    if(((tmp_31_reg_2845 == Const_763) & (Const_764 == ap_CS_fsm_state38) ^ working_key[2779]) == 1'b0) begin
      ih_o = tmp_44_cast_cast_fu_1830_p3;
    end else if(((Const_765 == ap_CS_fsm_state37) ^ working_key[2778]) == 1'b1) begin
      ih_o = tmp_39_cast_cast_fu_1760_p3;
    end else begin
      ih_o = ih_i;
    end
  end

  assign Const_766 = (1'd1 ^ working_key[2780]);
  assign Const_767 = (1'd0 ^ working_key[2781]);
  assign Const_768 = (1'd1 ^ working_key[2782]);
  assign Const_769 = (1'd0 ^ working_key[2783]);
  assign Const_770 = (1'd0 ^ working_key[2784]);

  always @(*) begin
    if((((Const_766 == ap_CS_fsm_state37) | (tmp_31_reg_2845 == Const_767) & (Const_768 == ap_CS_fsm_state38)) ^ working_key[2785]) == 1'b1) begin
      ih_o_ap_vld = Const_770;
    end else begin
      ih_o_ap_vld = Const_769;
    end
  end

  assign Const_771 = (1'd0 ^ working_key[2786]);

  always @(*) begin
    if(((Const_771 == ap_CS_fsm_state23) ^ working_key[2787]) == 1'b1) begin
      il_o = ril_2_fu_1091_p3;
    end else begin
      il_o = il_i;
    end
  end

  assign Const_772 = (1'd0 ^ working_key[2788]);
  assign Const_773 = (1'd1 ^ working_key[2789]);
  assign Const_774 = (1'd1 ^ working_key[2790]);

  always @(*) begin
    if(((Const_772 == ap_CS_fsm_state23) ^ working_key[2791]) == 1'b1) begin
      il_o_ap_vld = Const_773;
    end else begin
      il_o_ap_vld = Const_774;
    end
  end

  assign Const_775 = (1'd1 ^ working_key[2792]);
  assign Const_776 = (1'd0 ^ working_key[2793]);

  always @(*) begin
    if(((Const_775 == ap_CS_fsm_state39) ^ working_key[2795]) == 1'b1) begin
      ilb_table_address0 = tmp_i7_30_fu_1997_p1;
    end else if(((Const_776 == ap_CS_fsm_state25) ^ working_key[2794]) == 1'b1) begin
      ilb_table_address0 = tmp_i2_25_fu_1250_p1;
    end else begin
      ilb_table_address0 = 'bx;
    end
  end

  assign Const_777 = (1'd0 ^ working_key[2796]);
  assign Const_778 = (1'd1 ^ working_key[2797]);
  assign Const_779 = (1'd0 ^ working_key[2798]);
  assign Const_780 = (1'd0 ^ working_key[2799]);

  always @(*) begin
    if((((Const_777 == ap_CS_fsm_state39) | (Const_778 == ap_CS_fsm_state25)) ^ working_key[2800]) == 1'b1) begin
      ilb_table_ce0 = Const_780;
    end else begin
      ilb_table_ce0 = Const_779;
    end
  end

  assign Const_781 = (1'd1 ^ working_key[2801]);

  always @(*) begin
    if(((Const_781 == ap_CS_fsm_state39) ^ working_key[2802]) == 1'b1) begin
      nbh_o = nbh_i;
    end else begin
      nbh_o = nbl_assign_3_cast_fu_1967_p1;
    end
  end

  assign Const_782 = (1'd0 ^ working_key[2803]);
  assign Const_783 = (1'd1 ^ working_key[2804]);
  assign Const_784 = (1'd0 ^ working_key[2805]);

  always @(*) begin
    if(((Const_782 == ap_CS_fsm_state39) ^ working_key[2806]) == 1'b1) begin
      nbh_o_ap_vld = Const_784;
    end else begin
      nbh_o_ap_vld = Const_783;
    end
  end

  assign Const_785 = (1'd1 ^ working_key[2807]);

  always @(*) begin
    if(((Const_785 == ap_CS_fsm_state25) ^ working_key[2808]) == 1'b1) begin
      nbl_o = nbl_i;
    end else begin
      nbl_o = nbl_assign_2_cast_fu_1220_p1;
    end
  end

  assign Const_786 = (1'd0 ^ working_key[2809]);
  assign Const_787 = (1'd0 ^ working_key[2810]);
  assign Const_788 = (1'd1 ^ working_key[2811]);

  always @(*) begin
    if(((Const_786 == ap_CS_fsm_state25) ^ working_key[2812]) == 1'b1) begin
      nbl_o_ap_vld = Const_788;
    end else begin
      nbl_o_ap_vld = Const_787;
    end
  end

  assign Const_789 = (1'd0 ^ working_key[2813]);
  assign Const_790 = (1'd0 ^ working_key[2814]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_789) & (Const_790 == ap_CS_fsm_state41) ^ working_key[2815]) == 1'b1) begin
      ph1_o = ph;
    end else begin
      ph1_o = ph1_i;
    end
  end

  assign Const_791 = (1'd0 ^ working_key[2816]);
  assign Const_792 = (1'd1 ^ working_key[2817]);
  assign Const_793 = (1'd0 ^ working_key[2818]);
  assign Const_794 = (1'd0 ^ working_key[2819]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_791) & (Const_792 == ap_CS_fsm_state41) ^ working_key[2820]) == 1'b1) begin
      ph1_o_ap_vld = Const_794;
    end else begin
      ph1_o_ap_vld = Const_793;
    end
  end

  assign Const_795 = (1'd1 ^ working_key[2821]);
  assign Const_796 = (1'd1 ^ working_key[2822]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_795) & (Const_796 == ap_CS_fsm_state41) ^ working_key[2823]) == 1'b1) begin
      ph2_o = ph2_i;
    end else begin
      ph2_o = ph1_i;
    end
  end

  assign Const_797 = (1'd1 ^ working_key[2824]);
  assign Const_798 = (1'd0 ^ working_key[2825]);
  assign Const_799 = (1'd1 ^ working_key[2826]);
  assign Const_800 = (1'd1 ^ working_key[2827]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_797) & (Const_798 == ap_CS_fsm_state41) ^ working_key[2828]) == 1'b1) begin
      ph2_o_ap_vld = Const_799;
    end else begin
      ph2_o_ap_vld = Const_800;
    end
  end

  assign Const_801 = (1'd0 ^ working_key[2829]);
  assign Const_802 = (1'd1 ^ working_key[2830]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_801) & (Const_802 == ap_CS_fsm_state27) ^ working_key[2831]) == 1'b1) begin
      plt1_o = plt1_i;
    end else begin
      plt1_o = plt;
    end
  end

  assign Const_803 = (1'd1 ^ working_key[2832]);
  assign Const_804 = (1'd0 ^ working_key[2833]);
  assign Const_805 = (1'd1 ^ working_key[2834]);
  assign Const_806 = (1'd1 ^ working_key[2835]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_803) & (Const_804 == ap_CS_fsm_state27) ^ working_key[2836]) == 1'b1) begin
      plt1_o_ap_vld = Const_805;
    end else begin
      plt1_o_ap_vld = Const_806;
    end
  end

  assign Const_807 = (1'd0 ^ working_key[2837]);
  assign Const_808 = (1'd1 ^ working_key[2838]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_807) & (Const_808 == ap_CS_fsm_state27) ^ working_key[2839]) == 1'b1) begin
      plt2_o = plt2_i;
    end else begin
      plt2_o = plt1_i;
    end
  end

  assign Const_809 = (1'd1 ^ working_key[2840]);
  assign Const_810 = (1'd0 ^ working_key[2841]);
  assign Const_811 = (1'd1 ^ working_key[2842]);
  assign Const_812 = (1'd0 ^ working_key[2843]);

  always @(*) begin
    if(((grp_upzero_fu_631_ap_done == Const_809) & (Const_810 == ap_CS_fsm_state27) ^ working_key[2844]) == 1'b1) begin
      plt2_o_ap_vld = Const_811;
    end else begin
      plt2_o_ap_vld = Const_812;
    end
  end

  assign Const_813 = (1'd1 ^ working_key[2845]);
  assign Const_814 = (1'd1 ^ working_key[2846]);
  assign Const_815 = (1'd1 ^ working_key[2847]);

  always @(*) begin
    if(((Const_813 == ap_CS_fsm_state23) ^ working_key[2848]) == 1'b1) begin
      qq4_code4_table_ce0 = Const_814;
    end else begin
      qq4_code4_table_ce0 = Const_815;
    end
  end

  assign Const_816 = (1'd0 ^ working_key[2849]);
  assign Const_817 = (1'd1 ^ working_key[2850]);
  assign Const_818 = (1'd1 ^ working_key[2851]);

  always @(*) begin
    if(((Const_816 == ap_CS_fsm_state22) ^ working_key[2852]) == 1'b1) begin
      quant26bt_neg_ce0 = Const_817;
    end else begin
      quant26bt_neg_ce0 = Const_818;
    end
  end

  assign Const_819 = (1'd0 ^ working_key[2853]);
  assign Const_820 = (1'd1 ^ working_key[2854]);
  assign Const_821 = (1'd1 ^ working_key[2855]);

  always @(*) begin
    if(((Const_819 == ap_CS_fsm_state22) ^ working_key[2856]) == 1'b1) begin
      quant26bt_pos_ce0 = Const_820;
    end else begin
      quant26bt_pos_ce0 = Const_821;
    end
  end

  assign Const_822 = (1'd0 ^ working_key[2857]);

  always @(*) begin
    if(((Const_822 == ap_CS_fsm_state45) ^ working_key[2858]) == 1'b1) begin
      rh1_o = tmp_38_fu_2365_p2;
    end else begin
      rh1_o = rh1_i;
    end
  end

  assign Const_823 = (1'd0 ^ working_key[2859]);
  assign Const_824 = (1'd1 ^ working_key[2860]);
  assign Const_825 = (1'd1 ^ working_key[2861]);

  always @(*) begin
    if(((Const_823 == ap_CS_fsm_state45) ^ working_key[2862]) == 1'b1) begin
      rh1_o_ap_vld = Const_824;
    end else begin
      rh1_o_ap_vld = Const_825;
    end
  end

  assign Const_826 = (1'd0 ^ working_key[2863]);

  always @(*) begin
    if(((Const_826 == ap_CS_fsm_state45) ^ working_key[2864]) == 1'b1) begin
      rh2_o = rh1_i;
    end else begin
      rh2_o = rh2_i;
    end
  end

  assign Const_827 = (1'd0 ^ working_key[2865]);
  assign Const_828 = (1'd1 ^ working_key[2866]);
  assign Const_829 = (1'd1 ^ working_key[2867]);

  always @(*) begin
    if(((Const_827 == ap_CS_fsm_state45) ^ working_key[2868]) == 1'b1) begin
      rh2_o_ap_vld = Const_828;
    end else begin
      rh2_o_ap_vld = Const_829;
    end
  end

  assign Const_830 = (1'd1 ^ working_key[2869]);

  always @(*) begin
    if(((Const_830 == ap_CS_fsm_state31) ^ working_key[2870]) == 1'b1) begin
      rlt1_o = rlt1_i;
    end else begin
      rlt1_o = tmp_25_fu_1622_p2;
    end
  end

  assign Const_831 = (1'd0 ^ working_key[2871]);
  assign Const_832 = (1'd1 ^ working_key[2872]);
  assign Const_833 = (1'd0 ^ working_key[2873]);

  always @(*) begin
    if(((Const_831 == ap_CS_fsm_state31) ^ working_key[2874]) == 1'b1) begin
      rlt1_o_ap_vld = Const_833;
    end else begin
      rlt1_o_ap_vld = Const_832;
    end
  end

  assign Const_834 = (1'd1 ^ working_key[2875]);

  always @(*) begin
    if(((Const_834 == ap_CS_fsm_state31) ^ working_key[2876]) == 1'b1) begin
      rlt2_o = rlt2_i;
    end else begin
      rlt2_o = rlt1_i;
    end
  end

  assign Const_835 = (1'd1 ^ working_key[2877]);
  assign Const_836 = (1'd0 ^ working_key[2878]);
  assign Const_837 = (1'd0 ^ working_key[2879]);

  always @(*) begin
    if(((Const_835 == ap_CS_fsm_state31) ^ working_key[2880]) == 1'b1) begin
      rlt2_o_ap_vld = Const_837;
    end else begin
      rlt2_o_ap_vld = Const_836;
    end
  end

  assign Const_838 = (1'd0 ^ working_key[2881]);
  assign Const_839 = (1'd1 ^ working_key[2882]);
  assign Const_840 = (5'd4 ^ working_key[2887:2883]);
  assign Const_841 = (1'd1 ^ working_key[2888]);
  assign Const_842 = (1'd1 ^ working_key[2889]);
  assign Const_843 = (1'd1 ^ working_key[2890]);
  assign Const_844 = (1'd0 ^ working_key[2891]);
  assign Const_845 = (5'd28 ^ working_key[2896:2892]);
  assign Const_846 = (1'd1 ^ working_key[2897]);
  assign Const_847 = (1'd0 ^ working_key[2898]);
  assign Const_848 = (1'd1 ^ working_key[2899]);
  assign Const_849 = (5'd26 ^ working_key[2904:2900]);

  always @(*) begin
    if(((exitcond_fu_868_p2 == Const_838) & (Const_839 == ap_CS_fsm_state8) ^ working_key[2909]) == 1'b0) begin
      tqmf_address0 = Const_840;
    end else if(((exitcond_fu_868_p2 == Const_841) & (Const_842 == ap_CS_fsm_state8) ^ working_key[2908]) == 1'b1) begin
      tqmf_address0 = tqmf_ptr_0_sum_cast_fu_863_p1;
    end else if(((exitcond2_fu_746_p2 == Const_843) & (Const_844 == ap_CS_fsm_state3) ^ working_key[2907]) == 1'b0) begin
      tqmf_address0 = Const_845;
    end else if(((exitcond2_fu_746_p2 == Const_846) & (Const_847 == ap_CS_fsm_state3) ^ working_key[2906]) == 1'b1) begin
      tqmf_address0 = tqmf_ptr_0_rec_cast_fu_740_p1;
    end else if(((Const_848 == ap_CS_fsm_state1) ^ working_key[2905]) == 1'b1) begin
      tqmf_address0 = 'bx;
    end else begin
      tqmf_address0 = Const_849;
    end
  end

  assign Const_850 = (1'd1 ^ working_key[2910]);
  assign Const_851 = (1'd0 ^ working_key[2911]);
  assign Const_852 = (5'd22 ^ working_key[2916:2912]);
  assign Const_853 = (1'd1 ^ working_key[2917]);
  assign Const_854 = (5'd30 ^ working_key[2922:2918]);
  assign Const_855 = (1'd1 ^ working_key[2923]);
  assign Const_856 = (1'd0 ^ working_key[2924]);
  assign Const_857 = (5'd11 ^ working_key[2929:2925]);

  always @(*) begin
    if(((Const_850 == ap_CS_fsm_state9) ^ working_key[2934]) == 1'b0) begin
      tqmf_address1 = tqmf_addr_2_reg_2532;
    end else if(((Const_851 == ap_CS_fsm_state8) ^ working_key[2933]) == 1'b1) begin
      tqmf_address1 = Const_852;
    end else if(((Const_853 == ap_CS_fsm_state6) ^ working_key[2932]) == 1'b1) begin
      tqmf_address1 = Const_854;
    end else if(((Const_855 == ap_CS_fsm_state3) ^ working_key[2931]) == 1'b0) begin
      tqmf_address1 = tqmf_ptr_0_sum1_cast_fu_764_p1;
    end else if(((Const_856 == ap_CS_fsm_state1) ^ working_key[2930]) == 1'b1) begin
      tqmf_address1 = 'bx;
    end else begin
      tqmf_address1 = Const_857;
    end
  end

  assign Const_858 = (1'd1 ^ working_key[2935]);
  assign Const_859 = (1'd0 ^ working_key[2936]);
  assign Const_860 = (1'd1 ^ working_key[2937]);
  assign Const_861 = (1'd0 ^ working_key[2938]);
  assign Const_862 = (1'd0 ^ working_key[2939]);
  assign Const_863 = (1'd0 ^ working_key[2940]);
  assign Const_864 = (1'd0 ^ working_key[2941]);
  assign Const_865 = (1'd0 ^ working_key[2942]);
  assign Const_866 = (1'd0 ^ working_key[2943]);
  assign Const_867 = (1'd0 ^ working_key[2944]);
  assign Const_868 = (1'd1 ^ working_key[2945]);
  assign Const_869 = (1'd1 ^ working_key[2946]);

  always @(*) begin
    if((((ap_start == Const_858) & (Const_859 == ap_CS_fsm_state1) | (exitcond_fu_868_p2 == Const_860) & (Const_861 == ap_CS_fsm_state8) | (exitcond_fu_868_p2 == Const_862) & (Const_863 == ap_CS_fsm_state8) | (exitcond2_fu_746_p2 == Const_864) & (Const_865 == ap_CS_fsm_state3) | (exitcond2_fu_746_p2 == Const_866) & (Const_867 == ap_CS_fsm_state3)) ^ working_key[2947]) == 1'b1) begin
      tqmf_ce0 = Const_868;
    end else begin
      tqmf_ce0 = Const_869;
    end
  end

  assign Const_870 = (1'd0 ^ working_key[2948]);
  assign Const_871 = (1'd1 ^ working_key[2949]);
  assign Const_872 = (1'd1 ^ working_key[2950]);
  assign Const_873 = (1'd0 ^ working_key[2951]);
  assign Const_874 = (1'd1 ^ working_key[2952]);
  assign Const_875 = (1'd0 ^ working_key[2953]);
  assign Const_876 = (1'd1 ^ working_key[2954]);
  assign Const_877 = (1'd1 ^ working_key[2955]);

  always @(*) begin
    if((((Const_870 == ap_CS_fsm_state9) | (Const_871 == ap_CS_fsm_state8) | (Const_872 == ap_CS_fsm_state3) | (Const_873 == ap_CS_fsm_state6) | (ap_start == Const_874) & (Const_875 == ap_CS_fsm_state1)) ^ working_key[2956]) == 1'b1) begin
      tqmf_ce1 = Const_876;
    end else begin
      tqmf_ce1 = Const_877;
    end
  end

  assign Const_878 = (1'd0 ^ working_key[2957]);
  assign Const_879 = (1'd1 ^ working_key[2958]);

  always @(*) begin
    if(((Const_878 == ap_CS_fsm_state9) ^ working_key[2960]) == 1'b1) begin
      tqmf_d1 = tqmf_q0;
    end else if(((Const_879 == ap_CS_fsm_state8) ^ working_key[2959]) == 1'b1) begin
      tqmf_d1 = 'bx;
    end else begin
      tqmf_d1 = xin2;
    end
  end

  assign Const_880 = (1'd0 ^ working_key[2961]);
  assign Const_881 = (1'd1 ^ working_key[2962]);
  assign Const_882 = (1'd0 ^ working_key[2963]);
  assign Const_883 = (1'd0 ^ working_key[2964]);

  always @(*) begin
    if(((exitcond_fu_868_p2 == Const_880) & (Const_881 == ap_CS_fsm_state8) ^ working_key[2965]) == 1'b1) begin
      tqmf_we0 = Const_883;
    end else begin
      tqmf_we0 = Const_882;
    end
  end

  assign Const_884 = (1'd1 ^ working_key[2966]);
  assign Const_885 = (1'd0 ^ working_key[2967]);
  assign Const_886 = (1'd1 ^ working_key[2968]);
  assign Const_887 = (1'd0 ^ working_key[2969]);
  assign Const_888 = (1'd0 ^ working_key[2970]);

  always @(*) begin
    if((((Const_884 == ap_CS_fsm_state9) | (exitcond_fu_868_p2 == Const_885) & (Const_886 == ap_CS_fsm_state8)) ^ working_key[2971]) == 1'b1) begin
      tqmf_we1 = Const_887;
    end else begin
      tqmf_we1 = Const_888;
    end
  end

  assign Const_889 = (1'd1 ^ working_key[2972]);
  assign Const_890 = (1'd1 ^ working_key[2973]);
  assign Const_891 = (1'd0 ^ working_key[2974]);

  always @(*) begin
    if(((Const_889 == ap_CS_fsm_state23) ^ working_key[2975]) == 1'b1) begin
      wl_code_table_ce0 = Const_891;
    end else begin
      wl_code_table_ce0 = Const_890;
    end
  end

  assign Const_892 = (1'd1 ^ working_key[2976]);
  assign Const_893 = (1'd0 ^ working_key[2977]);
  assign Const_894 = (1'd0 ^ working_key[2979]);
  assign Const_895 = (1'd1 ^ working_key[2980]);
  assign Const_896 = (1'd1 ^ working_key[2982]);
  assign Const_897 = (1'd0 ^ working_key[2983]);
  assign Const_898 = (1'd0 ^ working_key[2985]);
  assign Const_899 = (1'd1 ^ working_key[2986]);
  assign Const_900 = (1'd0 ^ working_key[2988]);
  assign Const_901 = (1'd0 ^ working_key[2989]);
  assign Const_902 = (1'd0 ^ working_key[2991]);
  assign Const_903 = (1'd0 ^ working_key[2992]);
  assign Const_904 = (1'd1 ^ working_key[2993]);
  assign Const_905 = (1'd0 ^ working_key[2995]);
  assign Const_906 = (1'd1 ^ working_key[2996]);
  assign Const_907 = (1'd0 ^ working_key[2998]);
  assign Const_908 = (1'd0 ^ working_key[2999]);
  assign Const_909 = (1'd0 ^ working_key[3001]);
  assign Const_910 = (1'd0 ^ working_key[3002]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_892) & (Const_893 == ap_CS_fsm_state1) ^ working_key[2978]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        if(((exitcond2_fu_746_p2 == Const_894) & (Const_895 == ap_CS_fsm_state3) ^ working_key[2981]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
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
        if(((exitcond_fu_868_p2 == Const_896) & (Const_897 == ap_CS_fsm_state8) ^ working_key[2984]) == 1'b1) begin
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
        if(((exitcond5_fu_935_p2 == Const_898) & (Const_899 == ap_CS_fsm_state13) ^ working_key[2987]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state14;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state17;
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
        if(((tmp_i1_fu_1042_p2 == Const_900) & (Const_901 == ap_CS_fsm_state19) ^ working_key[2990]) == 1'b1) begin
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
        if(((Const_902 == ap_CS_fsm_state22) & ((tmp_14_i_fu_1080_p2 == Const_903) | (tmp_i1_reg_2634 == Const_904)) ^ working_key[2994]) == 1'b1) begin
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
        if(((grp_upzero_fu_631_ap_done == Const_905) & (Const_906 == ap_CS_fsm_state27) ^ working_key[2997]) == 1'b1) begin
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
        if(((exitcond4_fu_1652_p2 == Const_907) & (Const_908 == ap_CS_fsm_state32) ^ working_key[3000]) == 1'b1) begin
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
        if(((grp_upzero_fu_631_ap_done == Const_909) & (Const_910 == ap_CS_fsm_state41) ^ working_key[3003]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state41;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state42;
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
  assign Const_911 = (16'd37557 ^ working_key[3019:3004]);
  assign apl1_2_fu_1579_p2 = (working_key[3020] == 1'b1)? Const_911 + apl1_8_cast1_fu_1555_p1 : Const_911 - apl1_8_cast1_fu_1555_p1;
  assign apl1_3_cast_fu_1600_p1 = apl1_3_fu_1595_p3;
  assign Const_912 = (1'd0 ^ working_key[3021]);
  assign apl1_3_fu_1595_p3 = ((((working_key[3022] == 1'b1)? tmp_7_i_reg_2761[0:0] != Const_912 : tmp_7_i_reg_2761[0:0] === Const_912) ^ working_key[3023]) == 1'b1)? tmp_53_reg_2751 : apl1_2_reg_2756;
  assign apl1_4_fu_2278_p2 = (working_key[3024] == 1'b1)? tmp9_fu_2272_p2 - tmp_4_i1_cast_cast_fu_2265_p3 : tmp9_fu_2272_p2 + tmp_4_i1_cast_cast_fu_2265_p3;
  assign apl1_6_cast_fu_2328_p1 = apl1_6_fu_2322_p2;
  assign Const_913 = (16'd21971 ^ working_key[3040:3025]);
  assign apl1_6_fu_2322_p2 = (working_key[3041] == 1'b1)? Const_913 - apl1_9_cast1_fu_2298_p1 : Const_913 * apl1_9_cast1_fu_2298_p1;
  assign apl1_7_cast_fu_2343_p1 = apl1_7_fu_2338_p3;
  assign Const_914 = (1'd0 ^ working_key[3042]);
  assign apl1_7_fu_2338_p3 = ((((working_key[3043] == 1'b1)? tmp_7_i1_reg_2929[0:0] < Const_914 : tmp_7_i1_reg_2929[0:0] === Const_914) ^ working_key[3044]) == 1'b1)? tmp_68_reg_2919 : apl1_6_reg_2924;
  assign apl1_8_cast1_fu_1555_p1 = apl1_8_fu_1550_p2;
  assign apl1_8_cast_fu_1559_p1 = apl1_8_fu_1550_p2;
  assign Const_915 = (15'd22162 ^ working_key[3059:3045]);
  assign apl1_8_fu_1550_p2 = (working_key[3060] == 1'b1)? Const_915 + apl2_assign_reg_2739 : Const_915 - apl2_assign_reg_2739;
  assign apl1_9_cast1_fu_2298_p1 = apl1_9_fu_2293_p2;
  assign apl1_9_cast_fu_2302_p1 = apl1_9_fu_2293_p2;
  assign Const_916 = (15'd6138 ^ working_key[3075:3061]);
  assign apl1_9_fu_2293_p2 = (working_key[3076] == 1'b1)? Const_916 - apl2_assign_1_reg_2907 : Const_916 >> apl2_assign_1_reg_2907;
  assign apl1_fu_1535_p2 = (working_key[3077] == 1'b1)? tmp_4_i_cast_cast_fu_1522_p3 >> tmp7_fu_1529_p2 : tmp_4_i_cast_cast_fu_1522_p3 + tmp7_fu_1529_p2;
  assign apl2_1_fu_2204_p2 = (working_key[3078] == 1'b1)? tmp8_cast_fu_2200_p1 - tmp_8_i1_cast_cast_fu_2160_p3 : tmp8_cast_fu_2200_p1 + tmp_8_i1_cast_cast_fu_2160_p3;
  assign apl2_assign_1_cast_fu_2284_p1 = apl2_assign_1_reg_2907;
  assign Const_917 = (1'd0 ^ working_key[3079]);
  assign Const_918 = (15'd1365 ^ working_key[3095:3081]);
  assign apl2_assign_1_fu_2254_p3 = ((((working_key[3080] == 1'b1)? tmp_3_i1_fu_2248_p2[0:0] < Const_917 : tmp_3_i1_fu_2248_p2[0:0] === Const_917) ^ working_key[3096]) == 1'b1)? Const_918 : tmp_65_fu_2244_p1;
  assign apl2_assign_cast_fu_1541_p1 = apl2_assign_reg_2739;
  assign Const_919 = (1'd0 ^ working_key[3097]);
  assign Const_920 = (15'd1360 ^ working_key[3113:3099]);
  assign apl2_assign_fu_1511_p3 = ((((working_key[3098] == 1'b1)? tmp_3_i_fu_1505_p2[0:0] > Const_919 : tmp_3_i_fu_1505_p2[0:0] === Const_919) ^ working_key[3114]) == 1'b1)? Const_920 : tmp_47_fu_1501_p1;
  assign apl2_fu_1461_p2 = (working_key[3115] == 1'b1)? tmp_8_i_cast_cast_fu_1417_p3 + tmp6_cast_fu_1457_p1 : tmp_8_i_cast_cast_fu_1417_p3 >> tmp6_cast_fu_1457_p1;
  assign decis_1_cast_fu_1077_p1 = tmp_28_i_reg_2653;
  assign decis_levl_address0 = tmp_i1_24_fu_1054_p1;
  assign delay_bph_d0 = grp_upzero_fu_631_bli_d0;
  assign delay_bpl_d0 = grp_upzero_fu_631_bli_d0;
  assign delay_dhx_address1 = grp_upzero_fu_631_dlti_address1;
  assign delay_dhx_d0 = grp_upzero_fu_631_dlti_d0;
  assign delay_dhx_d1 = grp_upzero_fu_631_dlti_d1;
  assign delay_dltx_address1 = grp_upzero_fu_631_dlti_address1;
  assign delay_dltx_d0 = grp_upzero_fu_631_dlti_d0;
  assign delay_dltx_d1 = grp_upzero_fu_631_dlti_d1;
  assign el_assign_fu_1011_p2 = (working_key[3116] == 1'b1)? tmp_19_cast_reg_2565 + tmp_17_fu_999_p2 : tmp_19_cast_reg_2565 - tmp_17_fu_999_p2;
  assign Const_921 = (4'd15 ^ working_key[3120:3117]);
  assign Const_922 = (1'd1 ^ working_key[3122]);
  assign Const_923 = (1'd1 ^ working_key[3123]);
  assign exitcond2_fu_746_p2 = ((((working_key[3121] == 1'b1)? i_reg_515 == Const_921 : i_reg_515 != Const_921) ^ working_key[3124]) == 1'b1)? Const_922 : Const_923;
  assign Const_924 = (3'd3 ^ working_key[3127:3125]);
  assign Const_925 = (1'd1 ^ working_key[3129]);
  assign Const_926 = (1'd1 ^ working_key[3130]);
  assign exitcond4_fu_1652_p2 = ((((working_key[3128] == 1'b1)? dlt_pn_rec_i1_reg_611 < Const_924 : dlt_pn_rec_i1_reg_611 == Const_924) ^ working_key[3131]) == 1'b1)? Const_925 : Const_926;
  assign Const_927 = (3'd0 ^ working_key[3134:3132]);
  assign Const_928 = (1'd0 ^ working_key[3136]);
  assign Const_929 = (1'd1 ^ working_key[3137]);
  assign exitcond5_fu_935_p2 = ((((working_key[3135] == 1'b1)? dlt_pn_rec_i_reg_578 === Const_927 : dlt_pn_rec_i_reg_578 == Const_927) ^ working_key[3138]) == 1'b1)? Const_928 : Const_929;
  assign Const_930 = (5'd19 ^ working_key[3143:3139]);
  assign Const_931 = (1'd1 ^ working_key[3145]);
  assign Const_932 = (1'd0 ^ working_key[3146]);
  assign exitcond_fu_868_p2 = ((((working_key[3144] == 1'b1)? i_1_reg_557 == Const_930 : i_1_reg_557 != Const_930) ^ working_key[3147]) == 1'b1)? Const_932 : Const_931;
  assign extLd1_fu_1774_p1 = deth_i;
  assign extLd2_fu_2357_p1 = sh;
  assign extLd_fu_1614_p1 = sl;
  assign grp_fu_2403_p1 = grp_fu_2403_p10;
  assign grp_fu_2403_p10 = reg_666;
  assign grp_fu_2411_p1 = grp_fu_2411_p10;
  assign grp_fu_2411_p10 = tqmf_load_5_reg_2492;
  assign grp_fu_2419_p0 = grp_fu_2419_p00;
  assign grp_fu_2419_p00 = reg_666;
  assign Const_933 = (7'd1470 ^ working_key[3154:3148]);
  assign grp_fu_2419_p1 = Const_933;
  assign grp_fu_686_p2 = (working_key[3155] == 1'b1)? reg_682 >> reg_678 : reg_682 * reg_678;
  assign grp_upzero_fu_631_ap_start = grp_upzero_fu_631_ap_start_reg;
  assign h_address0 = tqmf_ptr_0_rec_cast_fu_740_p1;
  assign h_address1 = tqmf_ptr_0_sum1_cast_fu_764_p1;
  assign Const_934 = (4'd4 ^ working_key[3159:3156]);
  assign i_8_fu_752_p2 = (working_key[3160] == 1'b1)? i_reg_515 + Const_934 : i_reg_515 >> Const_934;
  assign Const_935 = (5'd23 ^ working_key[3165:3161]);
  assign i_9_fu_874_p2 = (working_key[3166] == 1'b1)? i_1_reg_557 - Const_935 : i_1_reg_557 + Const_935;
  assign Const_936 = (19'd341321 ^ working_key[3185:3167]);
  assign m_1_fu_1798_p2 = (working_key[3186] == 1'b1)? Const_936 - n_assign_fu_1739_p2 : Const_936 << n_assign_fu_1739_p2;
  assign Const_937 = (19'd173407 ^ working_key[3205:3187]);
  assign m_fu_1028_p2 = (working_key[3206] == 1'b1)? Const_937 - el_assign_fu_1011_p2 : Const_937 * el_assign_fu_1011_p2;
  assign Const_938 = (5'd11 ^ working_key[3211:3207]);
  assign mil_fu_1048_p2 = (working_key[3212] == 1'b1)? mil_i_reg_589 + Const_938 : mil_i_reg_589 * Const_938;
  assign Const_939 = (1'd1 ^ working_key[3213]);
  assign n_assign_2_fu_1804_p3 = ((((working_key[3214] == 1'b1)? tmp_56_fu_1790_p3[0:0] === Const_939 : tmp_56_fu_1790_p3[0:0] > Const_939) ^ working_key[3215]) == 1'b1)? m_1_fu_1798_p2 : n_assign_fu_1739_p2;
  assign n_assign_3_cast_fu_1812_p1 = n_assign_2_fu_1804_p3;
  assign n_assign_fu_1739_p2 = (working_key[3216] == 1'b1)? xh_load_cast_fu_1735_p1 - tmp_26_reg_2814 : xh_load_cast_fu_1735_p1 * tmp_26_reg_2814;
  assign nbh_assign_1_cast_fu_1915_p2 = (working_key[3217] == 1'b1)? tmp_11_fu_1901_p1 - tmp_58_fu_1905_p1 : tmp_11_fu_1901_p1 + tmp_58_fu_1905_p1;
  assign nbh_assign_1_fu_1909_p2 = (working_key[3218] == 1'b1)? tmp_10_fu_1887_p6 + wd_1_fu_1883_p1 : tmp_10_fu_1887_p6 << wd_1_fu_1883_p1;
  assign nbl_assign_1_cast_fu_1164_p2 = (working_key[3219] == 1'b1)? tmp_6_fu_1154_p1 - tmp_32_i_fu_1136_p4 : tmp_6_fu_1154_p1 + tmp_32_i_fu_1136_p4;
  assign nbl_assign_1_fu_1158_p2 = (working_key[3220] == 1'b1)? wd_1_cast_fu_1146_p1 >> wl_code_table_load_c_fu_1150_p1 : wd_1_cast_fu_1146_p1 + wl_code_table_load_c_fu_1150_p1;
  assign nbl_assign_2_cast_fu_1220_p1 = nbl_assign_2_fu_1212_p3;
  assign Const_940 = (1'd1 ^ working_key[3221]);
  assign Const_941 = (15'd25258 ^ working_key[3237:3223]);
  assign nbl_assign_2_fu_1212_p3 = ((((working_key[3222] == 1'b1)? tmp_18_i_fu_1206_p2[0:0] < Const_940 : tmp_18_i_fu_1206_p2[0:0] === Const_940) ^ working_key[3238]) == 1'b1)? tmp_34_fu_1202_p1 : Const_941;
  assign nbl_assign_3_cast_fu_1967_p1 = nbl_assign_3_fu_1959_p3;
  assign Const_942 = (1'd1 ^ working_key[3239]);
  assign Const_943 = (15'd27850 ^ working_key[3255:3241]);
  assign nbl_assign_3_fu_1959_p3 = ((((working_key[3240] == 1'b1)? tmp_19_i1_fu_1953_p2[0:0] === Const_942 : tmp_19_i1_fu_1953_p2[0:0] > Const_942) ^ working_key[3256]) == 1'b1)? tmp_60_fu_1949_p1 : Const_943;
  assign p_01_rec_i1_cast_fu_1646_p1 = p_01_rec_i1_fu_1640_p2;
  assign Const_944 = (3'd3 ^ working_key[3259:3257]);
  assign p_01_rec_i1_fu_1640_p2 = (working_key[3260] == 1'b1)? dlt_pn_rec_i1_reg_611 >> Const_944 : dlt_pn_rec_i1_reg_611 + Const_944;
  assign p_01_rec_i_cast_fu_929_p1 = p_01_rec_i_fu_923_p2;
  assign Const_945 = (3'd0 ^ working_key[3263:3261]);
  assign p_01_rec_i_fu_923_p2 = (working_key[3264] == 1'b1)? dlt_pn_rec_i_reg_578 + Const_945 : dlt_pn_rec_i_reg_578 * Const_945;
  assign Const_946 = (1'd1 ^ working_key[3265]);
  assign Const_947 = (27'd22716058 ^ working_key[3293:3267]);
  assign p_i1_fu_1494_p3 = ((((working_key[3266] == 1'b1)? tmp_2_i_fu_1489_p2[0:0] === Const_946 : tmp_2_i_fu_1489_p2[0:0] < Const_946) ^ working_key[3294]) == 1'b1)? apl2_reg_2728 : Const_947;
  assign Const_948 = (1'd1 ^ working_key[3295]);
  assign Const_949 = (31'd693630165 ^ working_key[3327:3297]);
  assign p_i2_fu_1943_p3 = ((((working_key[3296] == 1'b1)? tmp_59_reg_2859[0:0] == Const_948 : tmp_59_reg_2859[0:0] === Const_948) ^ working_key[3328]) == 1'b1)? nbh_assign_1_cast_reg_2854 : Const_949;
  assign Const_950 = (1'd1 ^ working_key[3329]);
  assign Const_951 = (27'd44710570 ^ working_key[3357:3331]);
  assign p_i3_fu_2237_p3 = ((((working_key[3330] == 1'b1)? tmp_2_i1_fu_2232_p2[0:0] === Const_950 : tmp_2_i1_fu_2232_p2[0:0] < Const_950) ^ working_key[3358]) == 1'b1)? apl2_1_reg_2896 : Const_951;
  assign Const_952 = (1'd1 ^ working_key[3359]);
  assign Const_953 = (25'd11881642 ^ working_key[3385:3361]);
  assign p_i_fu_1196_p3 = ((((working_key[3360] == 1'b1)? tmp_29_reg_2691[0:0] === Const_952 : tmp_29_reg_2691[0:0] == Const_952) ^ working_key[3386]) == 1'b1)? nbl_assign_1_cast_reg_2686 : Const_953;
  assign p_shl1_cast_fu_712_p1 = p_shl1_fu_704_p3;
  assign p_shl1_fu_704_p3 = { { tqmf_q0 }, { 2'd0 } };
  assign p_shl2_cast_fu_804_p1 = p_shl2_fu_796_p3;
  assign p_shl2_fu_796_p3 = { { tqmf_q1 }, { 4'd0 } };
  assign p_shl3_cast_fu_816_p1 = p_shl3_fu_808_p3;
  assign p_shl3_fu_808_p3 = { { tqmf_q1 }, { 2'd0 } };
  assign p_shl_cast_fu_700_p1 = p_shl_fu_692_p3;
  assign p_shl_fu_692_p3 = { { tqmf_q0 }, { 4'd0 } };
  assign p_sum_cast_fu_846_p1 = p_sum_fu_840_p2;
  assign Const_954 = (6'd51 ^ working_key[3392:3387]);
  assign p_sum_fu_840_p2 = (working_key[3393] == 1'b1)? tqmf_ptr_0_pn_rec_reg_546 << Const_954 : tqmf_ptr_0_pn_rec_reg_546 + Const_954;
  assign Const_955 = (5'd23 ^ working_key[3398:3394]);
  assign phitmp_fu_770_p2 = (working_key[3399] == 1'b1)? tqmf_ptr_0_rec_reg_504 + Const_955 : tqmf_ptr_0_rec_reg_504 * Const_955;
  assign pl_1_fu_1662_p0 = ah1_i;
  assign pl_1_fu_1662_p1 = rh1_i;
  assign pl_1_fu_1662_p2 = (working_key[3400] == 1'b1)? pl_1_fu_1662_p0 - pl_1_fu_1662_p1 : pl_1_fu_1662_p0 * pl_1_fu_1662_p1;
  assign pl_fu_945_p0 = al1_i;
  assign pl_fu_945_p1 = rlt1_i;
  assign pl_fu_945_p2 = (working_key[3401] == 1'b1)? pl_fu_945_p0 >> pl_fu_945_p1 : pl_fu_945_p0 * pl_fu_945_p1;
  assign qq4_code4_table_address0 = tmp_19_fu_1114_p1;
  assign quant26bt_neg_address0 = tmp_16_i_fu_1085_p1;
  assign quant26bt_pos_address0 = tmp_16_i_fu_1085_p1;
  assign Const_956 = (1'd0 ^ working_key[3402]);
  assign ril_2_fu_1091_p3 = ((((working_key[3403] == 1'b1)? tmp_12_reg_2624[0:0] == Const_956 : tmp_12_reg_2624[0:0] === Const_956) ^ working_key[3404]) == 1'b1)? quant26bt_pos_q0 : quant26bt_neg_q0;
  assign tmp6_cast_fu_1457_p1 = tmp6_fu_1451_p2;
  assign tmp6_fu_1451_p2 = (working_key[3405] == 1'b1)? wd2_4_cast_fu_1406_p1 + tmp_1_i_cast_fu_1447_p1 : wd2_4_cast_fu_1406_p1 - tmp_1_i_cast_fu_1447_p1;
  assign Const_957 = (25'd11086741 ^ working_key[3430:3406]);
  assign tmp7_fu_1529_p2 = (working_key[3431] == 1'b1)? Const_957 + wd2_5_cast_fu_1519_p1 : Const_957 - wd2_5_cast_fu_1519_p1;
  assign tmp8_cast_fu_2200_p1 = tmp8_fu_2194_p2;
  assign tmp8_fu_2194_p2 = (working_key[3432] == 1'b1)? tmp_1_i1_cast_fu_2190_p1 + wd2_10_cast_fu_2149_p1 : tmp_1_i1_cast_fu_2190_p1 - wd2_10_cast_fu_2149_p1;
  assign Const_958 = (25'd11097908 ^ working_key[3457:3433]);
  assign tmp9_fu_2272_p2 = (working_key[3458] == 1'b1)? Const_958 + wd2_11_cast_fu_2262_p1 : Const_958 * wd2_11_cast_fu_2262_p1;
  assign tmp_10_i1_fu_2029_p3 = { { wd3_2_fu_2023_p2 }, { 3'd0 } };
  assign tmp_10_i_cast_fu_1290_p1 = tmp_10_i_fu_1282_p3;
  assign tmp_10_i_fu_1282_p3 = { { wd3_fu_1276_p2 }, { 3'd0 } };
  assign tmp_11_fu_1901_p1 = tmp_36_i_fu_1873_p4;
  assign tmp_12_fu_1020_p3 = el_assign_fu_1011_p2[32'd18];
  assign tmp_13_i_fu_1062_p0 = tmp_13_i_fu_1062_p00;
  assign tmp_13_i_fu_1062_p00 = decis_levl_load_reg_2648;
  assign Const_959 = (32'd2863270570 ^ working_key[3490:3459]);
  assign tmp_13_i_fu_1062_p2 = (working_key[3491] == 1'b1)? { { Const_959 }, { tmp_13_i_fu_1062_p0 } } << detl_load_reg_2618 : { { Const_959 }, { tmp_13_i_fu_1062_p0 } } * detl_load_reg_2618;
  assign Const_960 = (1'd1 ^ working_key[3493]);
  assign Const_961 = (1'd1 ^ working_key[3494]);
  assign tmp_14_i_fu_1080_p2 = ((((working_key[3492] == 1'b1)? wd_reg_2629 > decis_1_cast_fu_1077_p1 : wd_reg_2629 < decis_1_cast_fu_1077_p1) ^ working_key[3495]) == 1'b1)? Const_960 : Const_961;
  assign tmp_15_fu_880_p2 = (working_key[3496] == 1'b1)? xb_1_cast_reg_2527 + xa_1_cast_reg_2517 : xb_1_cast_reg_2527 >> xa_1_cast_reg_2517;
  assign tmp_16_fu_894_p2 = (working_key[3497] == 1'b1)? xa_1_reg_2512 + xb_1_reg_2522 : xa_1_reg_2512 - xb_1_reg_2522;
  assign tmp_16_i_fu_1085_p1 = mil_i_reg_589;
  assign tmp_17_fu_999_p2 = (working_key[3498] == 1'b1)? tmp_20_i_cast_fu_996_p1 << tmp_i_cast_fu_992_p1 : tmp_20_i_cast_fu_996_p1 + tmp_i_cast_fu_992_p1;
  assign tmp_18_fu_1104_p4 = { { ril_2_fu_1091_p3[5:2] } };
  assign Const_962 = (25'd10806651 ^ working_key[3523:3499]);
  assign Const_963 = (1'd1 ^ working_key[3525]);
  assign Const_964 = (1'd1 ^ working_key[3526]);
  assign tmp_18_i_fu_1206_p2 = ((((working_key[3524] == 1'b1)? p_i_fu_1196_p3 > Const_962 : p_i_fu_1196_p3 != Const_962) ^ working_key[3527]) == 1'b1)? Const_964 : Const_963;
  assign tmp_19_cast_fu_920_p1 = tmp_2_reg_2555;
  assign tmp_19_fu_1114_p1 = tmp_18_fu_1104_p4;
  assign Const_965 = (31'd709528948 ^ working_key[3558:3528]);
  assign Const_966 = (1'd0 ^ working_key[3560]);
  assign Const_967 = (1'd0 ^ working_key[3561]);
  assign tmp_19_i1_fu_1953_p2 = ((((working_key[3559] == 1'b1)? p_i2_fu_1943_p3 > Const_965 : p_i2_fu_1943_p3 == Const_965) ^ working_key[3562]) == 1'b1)? Const_966 : Const_967;
  assign tmp_19_i2_fu_2180_p4 = { { tmp_9_i3_fu_2174_p2[31:7] } };
  assign tmp_19_i_fu_1437_p4 = { { tmp_9_i1_fu_1431_p2[31:7] } };
  assign tmp_1_i1_cast_fu_2190_p1 = tmp_19_i2_fu_2180_p4;
  assign tmp_1_i_cast_fu_1447_p1 = tmp_19_i_fu_1437_p4;
  assign tmp_20_fu_1181_p1 = qq4_code4_table_load_reg_2681;
  assign tmp_20_fu_1181_p2 = (working_key[3563] == 1'b1)? detl_load_reg_2618 * tmp_20_fu_1181_p1 : detl_load_reg_2618 - tmp_20_fu_1181_p1;
  assign tmp_20_i2_cast_fu_1707_p1 = tmp_41_i1_fu_1697_p4;
  assign tmp_20_i_cast_fu_996_p1 = tmp_41_i_reg_2608;
  assign tmp_22_fu_1255_p1 = tmp_21_reg_2696;
  assign Const_968 = (32'd1431644921 ^ working_key[3595:3564]);
  assign tmp_23_fu_1124_p2 = (working_key[3596] == 1'b1)? nbl_i << Const_968 : nbl_i >> Const_968;
  assign tmp_24_fu_1300_p2 = (working_key[3597] == 1'b1)? tmp_32_cast_fu_1258_p1 * tmp_i_cast_reg_2613 : tmp_32_cast_fu_1258_p1 + tmp_i_cast_reg_2613;
  assign tmp_25_fu_1622_p2 = (working_key[3598] == 1'b1)? extLd_fu_1614_p1 + dlt : extLd_fu_1614_p1 * dlt;
  assign tmp_26_fu_1711_p2 = (working_key[3599] == 1'b1)? tmp_20_i2_cast_fu_1707_p1 * tmp_i6_cast_fu_1689_p1 : tmp_20_i2_cast_fu_1707_p1 + tmp_i6_cast_fu_1689_p1;
  assign Const_969 = (1'd1 ^ working_key[3600]);
  assign Const_970 = (2'd1 ^ working_key[3603:3602]);
  assign Const_971 = (2'd2 ^ working_key[3605:3604]);
  assign tmp_27_fu_1752_p3 = ((((working_key[3601] == 1'b1)? tmp_54_fu_1744_p3[0:0] < Const_969 : tmp_54_fu_1744_p3[0:0] === Const_969) ^ working_key[3606]) == 1'b1)? Const_971 : Const_970;
  assign tmp_28_fu_2428_p0 = tmp_28_fu_2428_p00;
  assign tmp_28_fu_2428_p00 = deth_i;
  assign Const_972 = (11'd158 ^ working_key[3617:3607]);
  assign tmp_28_fu_2428_p1 = Const_972;
  assign Const_973 = (27'd22713941 ^ working_key[3644:3618]);
  assign Const_974 = (1'd1 ^ working_key[3646]);
  assign Const_975 = (1'd0 ^ working_key[3647]);
  assign tmp_2_i1_fu_2232_p2 = ((((working_key[3645] == 1'b1)? apl2_1_reg_2896 > Const_973 : apl2_1_reg_2896 < Const_973) ^ working_key[3648]) == 1'b1)? Const_975 : Const_974;
  assign Const_976 = (27'd90868330 ^ working_key[3675:3649]);
  assign Const_977 = (1'd1 ^ working_key[3677]);
  assign Const_978 = (1'd1 ^ working_key[3678]);
  assign tmp_2_i_fu_1489_p2 = ((((working_key[3676] == 1'b1)? apl2_reg_2728 < Const_976 : apl2_reg_2728 > Const_976) ^ working_key[3679]) == 1'b1)? Const_977 : Const_978;
  assign tmp_30_fu_1786_p1 = tmp_55_fu_1777_p4;
  assign Const_979 = (1'd0 ^ working_key[3681]);
  assign Const_980 = (1'd0 ^ working_key[3682]);
  assign tmp_31_fu_1816_p2 = ((((working_key[3680] == 1'b1)? n_assign_3_cast_fu_1812_p1 != tmp_30_fu_1786_p1 : n_assign_3_cast_fu_1812_p1 > tmp_30_fu_1786_p1) ^ working_key[3683]) == 1'b1)? Const_980 : Const_979;
  assign tmp_32_cast_fu_1258_p1 = tmp_21_reg_2696;
  assign Const_981 = (1'd1 ^ working_key[3684]);
  assign Const_982 = (2'd2 ^ working_key[3687:3686]);
  assign Const_983 = (2'd3 ^ working_key[3689:3688]);
  assign tmp_32_fu_1822_p3 = ((((working_key[3685] == 1'b1)? tmp_54_reg_2829[0:0] === Const_981 : tmp_54_reg_2829[0:0] == Const_981) ^ working_key[3690]) == 1'b1)? Const_982 : Const_983;
  assign tmp_32_i_fu_1136_p4 = { { tmp_i2_fu_1130_p2[31:7] } };
  assign tmp_33_cast_fu_1305_p1 = tmp_24_fu_1300_p2;
  assign tmp_33_fu_1929_p0 = extLd1_reg_2840;
  assign Const_984 = (32'd2863289853 ^ working_key[3722:3691]);
  assign tmp_33_fu_1929_p2 = (working_key[3723] == 1'b1)? { { Const_984 }, { tmp_33_fu_1929_p0 } } + tmp_9_reg_2849 : { { Const_984 }, { tmp_33_fu_1929_p0 } } * tmp_9_reg_2849;
  assign tmp_34_fu_1202_p1 = p_i_fu_1196_p3[14:0];
  assign tmp_36_fu_2002_p1 = tmp_35_reg_2864;
  assign tmp_36_i_fu_1873_p4 = { { tmp_i_29_fu_1867_p2[31:7] } };
  assign tmp_37_fu_2043_p2 = (working_key[3724] == 1'b1)? tmp_i6_cast_reg_2809 + tmp_49_cast_fu_2005_p1 : tmp_i6_cast_reg_2809 << tmp_49_cast_fu_2005_p1;
  assign tmp_38_fu_2365_p2 = (working_key[3725] == 1'b1)? dh - extLd2_fu_2357_p1 : dh + extLd2_fu_2357_p1;
  assign Const_985 = (1'd0 ^ working_key[3726]);
  assign Const_986 = (32'd3646248273 ^ working_key[3759:3728]);
  assign Const_987 = (32'd1960125800 ^ working_key[3791:3760]);
  assign tmp_39_cast_cast_fu_1760_p3 = ((((working_key[3727] == 1'b1)? tmp_54_fu_1744_p3[0:0] == Const_985 : tmp_54_fu_1744_p3[0:0] === Const_985) ^ working_key[3792]) == 1'b1)? Const_987 : Const_986;
  assign tmp_39_fu_1378_p4 = { { wd2_1_fu_1372_p2[31:7] } };
  assign tmp_39_i1_fu_1679_p4 = { { zl1_i1_reg_601[31:14] } };
  assign tmp_39_i_fu_982_p4 = { { zl1_i_reg_568[31:14] } };
  assign Const_988 = (27'd53146986 ^ working_key[3819:3793]);
  assign Const_989 = (1'd0 ^ working_key[3821]);
  assign Const_990 = (1'd1 ^ working_key[3822]);
  assign tmp_3_i1_fu_2248_p2 = ((((working_key[3820] == 1'b1)? p_i3_fu_2237_p3 == Const_988 : p_i3_fu_2237_p3 < Const_988) ^ working_key[3823]) == 1'b1)? Const_990 : Const_989;
  assign Const_991 = (27'd44729007 ^ working_key[3850:3824]);
  assign Const_992 = (1'd0 ^ working_key[3852]);
  assign Const_993 = (1'd0 ^ working_key[3853]);
  assign tmp_3_i_fu_1505_p2 = ((((working_key[3851] == 1'b1)? p_i1_fu_1494_p3 != Const_991 : p_i1_fu_1494_p3 < Const_991) ^ working_key[3854]) == 1'b1)? Const_993 : Const_992;
  assign tmp_40_fu_2395_p3 = { { tmp_69_fu_2391_p1 }, { il_i } };
  assign tmp_41_fu_1388_p4 = { { al1_i[29:5] } };
  assign tmp_41_i1_fu_1697_p4 = { { tmp_i7_fu_1693_p2[30:14] } };
  assign Const_994 = (1'd1 ^ working_key[3855]);
  assign tmp_42_fu_1398_p3 = ((((working_key[3856] == 1'b1)? tmp_44_fu_1365_p3[0:0] != Const_994 : tmp_44_fu_1365_p3[0:0] === Const_994) ^ working_key[3857]) == 1'b1)? tmp_41_fu_1388_p4 : tmp_39_fu_1378_p4;
  assign tmp_43_fu_2121_p4 = { { wd2_3_fu_2115_p2[31:7] } };
  assign Const_995 = (1'd1 ^ working_key[3858]);
  assign Const_996 = (32'd2845136213 ^ working_key[3891:3860]);
  assign Const_997 = (32'd1464685140 ^ working_key[3923:3892]);
  assign tmp_44_cast_cast_fu_1830_p3 = ((((working_key[3859] == 1'b1)? tmp_54_reg_2829[0:0] == Const_995 : tmp_54_reg_2829[0:0] === Const_995) ^ working_key[3924]) == 1'b1)? Const_997 : Const_996;
  assign tmp_44_fu_1365_p3 = tmp_i4_reg_2713[32'd31];
  assign tmp_45_fu_1410_p3 = tmp_5_i_reg_2718[32'd31];
  assign Const_998 = (32'd2135773777 ^ working_key[3956:3925]);
  assign tmp_46_fu_1425_p2 = (working_key[3957] == 1'b1)? al2_i << Const_998 : al2_i >> Const_998;
  assign tmp_47_fu_1501_p1 = p_i1_fu_1494_p3[14:0];
  assign Const_999 = (32'd1096111426 ^ working_key[3989:3958]);
  assign tmp_48_fu_1467_p2 = (working_key[3990] == 1'b1)? al1_i << Const_999 : al1_i >> Const_999;
  assign tmp_49_cast_fu_2005_p1 = tmp_35_reg_2864;
  assign tmp_49_fu_2131_p4 = { { ah1_i[29:5] } };
  assign Const_1000 = (1'd1 ^ working_key[3991]);
  assign Const_1001 = (25'd1266730 ^ working_key[4017:3993]);
  assign Const_1002 = (25'd20269402 ^ working_key[4042:4018]);
  assign tmp_4_i1_cast_cast_fu_2265_p3 = ((((working_key[3992] == 1'b1)? tmp_67_reg_2891[0:0] === Const_1000 : tmp_67_reg_2891[0:0] == Const_1000) ^ working_key[4043]) == 1'b1)? Const_1001 : Const_1002;
  assign Const_1003 = (1'd0 ^ working_key[4044]);
  assign Const_1004 = (25'd22468053 ^ working_key[4070:4046]);
  assign Const_1005 = (25'd10837971 ^ working_key[4095:4071]);
  assign tmp_4_i_cast_cast_fu_1522_p3 = ((((working_key[4045] == 1'b1)? tmp_52_reg_2723[0:0] === Const_1003 : tmp_52_reg_2723[0:0] > Const_1003) ^ working_key[4096]) == 1'b1)? Const_1005 : Const_1004;
  assign tmp_50_cast_fu_2048_p1 = tmp_37_fu_2043_p2;
  assign Const_1006 = (1'd1 ^ working_key[4097]);
  assign tmp_50_fu_2141_p3 = ((((working_key[4098] == 1'b1)? tmp_62_fu_2108_p3[0:0] === Const_1006 : tmp_62_fu_2108_p3[0:0] < Const_1006) ^ working_key[4099]) == 1'b1)? tmp_49_fu_2131_p4 : tmp_43_fu_2121_p4;
  assign tmp_53_fu_1575_p1 = wd3_0_apl1_i_fu_1568_p3[15:0];
  assign tmp_54_fu_1744_p3 = n_assign_fu_1739_p2[32'd18];
  assign tmp_55_fu_1777_p4 = { { tmp_28_reg_2824[26:12] } };
  assign tmp_56_fu_1790_p3 = n_assign_fu_1739_p2[32'd18];
  assign Const_1007 = (32'd1431635282 ^ working_key[4131:4100]);
  assign tmp_57_fu_1861_p2 = (working_key[4132] == 1'b1)? nbh_i << Const_1007 : nbh_i >> Const_1007;
  assign tmp_58_fu_1905_p1 = tmp_10_fu_1887_p6[30:0];
  assign tmp_5_i2_fu_2076_p0 = ph;
  assign tmp_5_i2_fu_2076_p1 = ph2_i;
  assign tmp_5_i2_fu_2076_p2 = (working_key[4133] == 1'b1)? tmp_5_i2_fu_2076_p0 - tmp_5_i2_fu_2076_p1 : tmp_5_i2_fu_2076_p0 * tmp_5_i2_fu_2076_p1;
  assign tmp_5_i_fu_1333_p0 = plt2_i;
  assign tmp_5_i_fu_1333_p1 = plt;
  assign tmp_5_i_fu_1333_p2 = (working_key[4134] == 1'b1)? tmp_5_i_fu_1333_p0 * tmp_5_i_fu_1333_p1 : tmp_5_i_fu_1333_p0 - tmp_5_i_fu_1333_p1;
  assign tmp_60_fu_1949_p1 = p_i2_fu_1943_p3[14:0];
  assign tmp_62_fu_2108_p3 = tmp_i3_reg_2881[32'd31];
  assign tmp_63_fu_2153_p3 = tmp_5_i2_reg_2886[32'd31];
  assign Const_1008 = (32'd2857030965 ^ working_key[4166:4135]);
  assign tmp_64_fu_2168_p2 = (working_key[4167] == 1'b1)? ah2_i << Const_1008 : ah2_i >> Const_1008;
  assign tmp_65_fu_2244_p1 = p_i3_fu_2237_p3[14:0];
  assign Const_1009 = (32'd2857031036 ^ working_key[4199:4168]);
  assign tmp_66_fu_2210_p2 = (working_key[4200] == 1'b1)? ah1_i << Const_1009 : ah1_i >> Const_1009;
  assign tmp_68_fu_2318_p1 = wd3_0_apl1_i1_fu_2311_p3[15:0];
  assign tmp_69_fu_2391_p1 = ih_i[25:0];
  assign tmp_6_fu_1154_p0 = wl_code_table_q0;
  assign tmp_6_fu_1154_p1 = tmp_6_fu_1154_p0;
  assign Const_1010 = (1'd1 ^ working_key[4202]);
  assign Const_1011 = (1'd1 ^ working_key[4203]);
  assign tmp_6_i1_fu_2306_p2 = ((((working_key[4201] == 1'b1)? apl1_4_reg_2913 === apl1_9_cast_fu_2302_p1 : apl1_4_reg_2913 > apl1_9_cast_fu_2302_p1) ^ working_key[4204]) == 1'b1)? Const_1010 : Const_1011;
  assign Const_1012 = (1'd0 ^ working_key[4206]);
  assign Const_1013 = (1'd1 ^ working_key[4207]);
  assign tmp_6_i_fu_1563_p2 = ((((working_key[4205] == 1'b1)? apl1_reg_2745 > apl1_8_cast_fu_1559_p1 : apl1_reg_2745 == apl1_8_cast_fu_1559_p1) ^ working_key[4208]) == 1'b1)? Const_1013 : Const_1012;
  assign Const_1014 = (1'd0 ^ working_key[4210]);
  assign Const_1015 = (1'd1 ^ working_key[4211]);
  assign tmp_7_i1_fu_2332_p2 = ((((working_key[4209] == 1'b1)? wd3_0_apl1_i1_fu_2311_p3 < apl1_6_cast_fu_2328_p1 : wd3_0_apl1_i1_fu_2311_p3 > apl1_6_cast_fu_2328_p1) ^ working_key[4212]) == 1'b1)? Const_1014 : Const_1015;
  assign Const_1016 = (1'd1 ^ working_key[4214]);
  assign Const_1017 = (1'd1 ^ working_key[4215]);
  assign tmp_7_i_fu_1589_p2 = ((((working_key[4213] == 1'b1)? wd3_0_apl1_i_fu_1568_p3 < apl1_2_cast_fu_1585_p1 : wd3_0_apl1_i_fu_1568_p3 === apl1_2_cast_fu_1585_p1) ^ working_key[4216]) == 1'b1)? Const_1016 : Const_1017;
  assign Const_1018 = (1'd0 ^ working_key[4217]);
  assign Const_1019 = (27'd99964202 ^ working_key[4245:4219]);
  assign Const_1020 = (27'd124081621 ^ working_key[4272:4246]);
  assign tmp_8_i1_cast_cast_fu_2160_p3 = ((((working_key[4218] == 1'b1)? tmp_63_fu_2153_p3[0:0] > Const_1018 : tmp_63_fu_2153_p3[0:0] === Const_1018) ^ working_key[4273]) == 1'b1)? Const_1020 : Const_1019;
  assign Const_1021 = (1'd0 ^ working_key[4274]);
  assign Const_1022 = (27'd53140203 ^ working_key[4302:4276]);
  assign Const_1023 = (27'd88693294 ^ working_key[4329:4303]);
  assign tmp_8_i_cast_cast_fu_1417_p3 = ((((working_key[4275] == 1'b1)? tmp_45_fu_1410_p3[0:0] === Const_1021 : tmp_45_fu_1410_p3[0:0] < Const_1021) ^ working_key[4330]) == 1'b1)? Const_1022 : Const_1023;
  assign tmp_9_i1_fu_1431_p2 = (working_key[4331] == 1'b1)? tmp_46_fu_1425_p2 - al2_i : tmp_46_fu_1425_p2 * al2_i;
  assign tmp_9_i2_cast_cast_fu_2019_p1 = tmp_9_i2_fu_2014_p2;
  assign Const_1024 = (4'd2 ^ working_key[4335:4332]);
  assign tmp_9_i2_fu_2014_p2 = (working_key[4336] == 1'b1)? Const_1024 << wd2_6_cast_reg_2871 : Const_1024 - wd2_6_cast_reg_2871;
  assign tmp_9_i3_fu_2174_p2 = (working_key[4337] == 1'b1)? tmp_64_fu_2168_p2 - ah2_i : tmp_64_fu_2168_p2 * ah2_i;
  assign tmp_9_i_cast_cast_fu_1272_p1 = tmp_9_i_fu_1267_p2;
  assign Const_1025 = (4'd6 ^ working_key[4341:4338]);
  assign tmp_9_i_fu_1267_p2 = (working_key[4342] == 1'b1)? Const_1025 - wd2_cast_reg_2703 : Const_1025 + wd2_cast_reg_2703;
  assign tmp_cast_20_fu_826_p1 = tmp_s_fu_820_p2;
  assign tmp_i1_24_fu_1054_p1 = mil_i_reg_589;
  assign Const_1026 = (5'd11 ^ working_key[4347:4343]);
  assign Const_1027 = (1'd0 ^ working_key[4349]);
  assign Const_1028 = (1'd0 ^ working_key[4350]);
  assign tmp_i1_fu_1042_p2 = ((((working_key[4348] == 1'b1)? mil_i_reg_589 === Const_1026 : mil_i_reg_589 < Const_1026) ^ working_key[4351]) == 1'b1)? Const_1027 : Const_1028;
  assign tmp_i2_25_fu_1250_p1 = wd1_fu_1230_p4;
  assign tmp_i2_fu_1130_p2 = (working_key[4352] == 1'b1)? tmp_23_fu_1124_p2 - nbl_i : tmp_23_fu_1124_p2 * nbl_i;
  assign tmp_i3_fu_2070_p0 = ph;
  assign tmp_i3_fu_2070_p1 = ph1_i;
  assign tmp_i3_fu_2070_p2 = (working_key[4353] == 1'b1)? tmp_i3_fu_2070_p0 << tmp_i3_fu_2070_p1 : tmp_i3_fu_2070_p0 * tmp_i3_fu_2070_p1;
  assign tmp_i4_28_fu_1668_p0 = ah2_i;
  assign tmp_i4_28_fu_1668_p1 = rh2_i;
  assign tmp_i4_28_fu_1668_p2 = (working_key[4354] == 1'b1)? tmp_i4_28_fu_1668_p0 * tmp_i4_28_fu_1668_p1 : tmp_i4_28_fu_1668_p0 + tmp_i4_28_fu_1668_p1;
  assign tmp_i4_fu_1327_p0 = plt1_i;
  assign tmp_i4_fu_1327_p1 = plt;
  assign tmp_i4_fu_1327_p2 = (working_key[4355] == 1'b1)? tmp_i4_fu_1327_p0 - tmp_i4_fu_1327_p1 : tmp_i4_fu_1327_p0 * tmp_i4_fu_1327_p1;
  assign tmp_i5_fu_1473_p2 = (working_key[4356] == 1'b1)? tmp_48_fu_1467_p2 - al1_i : tmp_48_fu_1467_p2 + al1_i;
  assign tmp_i6_cast_fu_1689_p1 = tmp_39_i1_fu_1679_p4;
  assign tmp_i6_fu_2216_p2 = (working_key[4357] == 1'b1)? tmp_66_fu_2210_p2 >> ah1_i : tmp_66_fu_2210_p2 - ah1_i;
  assign tmp_i7_30_fu_1997_p1 = wd1_1_fu_1977_p4;
  assign tmp_i7_fu_1693_p2 = (working_key[4358] == 1'b1)? tmp_i4_28_reg_2794 + pl_1_reg_2789 : tmp_i4_28_reg_2794 << pl_1_reg_2789;
  assign tmp_i8_fu_951_p0 = al2_i;
  assign tmp_i8_fu_951_p1 = rlt2_i;
  assign tmp_i8_fu_951_p2 = (working_key[4359] == 1'b1)? tmp_i8_fu_951_p0 >> tmp_i8_fu_951_p1 : tmp_i8_fu_951_p0 * tmp_i8_fu_951_p1;
  assign tmp_i9_fu_968_p2 = (working_key[4360] == 1'b1)? tmp_i8_reg_2593 + pl_reg_2588 : tmp_i8_reg_2593 << pl_reg_2588;
  assign tmp_i_29_fu_1867_p2 = (working_key[4361] == 1'b1)? tmp_57_fu_1861_p2 + nbh_i : tmp_57_fu_1861_p2 - nbh_i;
  assign tmp_i_cast_fu_992_p1 = tmp_39_i_fu_982_p4;
  assign tmp_i_fu_957_p2 = (working_key[4362] == 1'b1)? reg_674 * reg_670 : reg_674 - reg_670;
  assign tmp_s_fu_820_p2 = (working_key[4363] == 1'b1)? p_shl2_cast_fu_804_p1 + p_shl3_cast_fu_816_p1 : p_shl2_cast_fu_804_p1 - p_shl3_cast_fu_816_p1;
  assign tqmf_d0 = xin1;
  assign Const_1029 = (6'd42 ^ working_key[4369:4364]);
  assign tqmf_ptr1_0_rec_fu_851_p2 = (working_key[4370] == 1'b1)? tqmf_ptr_0_pn_rec_reg_546 + Const_1029 : tqmf_ptr_0_pn_rec_reg_546 * Const_1029;
  assign tqmf_ptr_0_rec_cast_fu_740_p1 = tqmf_ptr_0_rec_reg_504;
  assign tqmf_ptr_0_sum1_cast_fu_764_p1 = tqmf_ptr_0_sum1_fu_758_p2;
  assign Const_1030 = (5'd1 ^ working_key[4375:4371]);
  assign tqmf_ptr_0_sum1_fu_758_p2 = (working_key[4376] == 1'b1)? tqmf_ptr_0_rec_reg_504 | Const_1030 : tqmf_ptr_0_rec_reg_504 >> Const_1030;
  assign tqmf_ptr_0_sum_cast_fu_863_p1 = tqmf_ptr_0_sum_fu_857_p2;
  assign Const_1031 = (6'd63 ^ working_key[4382:4377]);
  assign tqmf_ptr_0_sum_fu_857_p2 = (working_key[4383] == 1'b1)? tqmf_ptr_0_pn_rec_reg_546 * Const_1031 : tqmf_ptr_0_pn_rec_reg_546 + Const_1031;
  assign wd1_1_fu_1977_p4 = { { nbl_assign_3_fu_1959_p3[10:6] } };
  assign wd1_fu_1230_p4 = { { nbl_assign_2_fu_1212_p3[10:6] } };
  assign wd2_10_cast_fu_2149_p1 = tmp_50_fu_2141_p3;
  assign wd2_11_cast_fu_2262_p1 = tmp_21_i1_reg_2902;
  assign Const_1032 = (32'd1453954389 ^ working_key[4415:4384]);
  assign wd2_1_fu_1372_p2 = (working_key[4416] == 1'b1)? Const_1032 << wd2_fu_1359_p2 : Const_1032 - wd2_fu_1359_p2;
  assign Const_1033 = (32'd1454089899 ^ working_key[4448:4417]);
  assign wd2_2_fu_2102_p2 = (working_key[4449] == 1'b1)? ah1_i >> Const_1033 : ah1_i << Const_1033;
  assign Const_1034 = (32'd1254074025 ^ working_key[4481:4450]);
  assign wd2_3_fu_2115_p2 = (working_key[4482] == 1'b1)? Const_1034 - wd2_2_fu_2102_p2 : Const_1034 >> wd2_2_fu_2102_p2;
  assign wd2_4_cast_fu_1406_p1 = tmp_42_fu_1398_p3;
  assign wd2_5_cast_fu_1519_p1 = tmp_21_i_reg_2734;
  assign Const_1035 = (32'd2862656168 ^ working_key[4514:4483]);
  assign wd2_fu_1359_p2 = (working_key[4515] == 1'b1)? al1_i >> Const_1035 : al1_i << Const_1035;
  assign Const_1036 = (1'd0 ^ working_key[4516]);
  assign wd3_0_apl1_i1_fu_2311_p3 = ((((working_key[4517] == 1'b1)? tmp_6_i1_fu_2306_p2[0:0] == Const_1036 : tmp_6_i1_fu_2306_p2[0:0] === Const_1036) ^ working_key[4518]) == 1'b1)? apl1_4_reg_2913 : apl1_9_cast_fu_2302_p1;
  assign Const_1037 = (1'd1 ^ working_key[4519]);
  assign wd3_0_apl1_i_fu_1568_p3 = ((((working_key[4520] == 1'b1)? tmp_6_i_fu_1563_p2[0:0] === Const_1037 : tmp_6_i_fu_1563_p2[0:0] != Const_1037) ^ working_key[4521]) == 1'b1)? apl1_8_cast_fu_1559_p1 : apl1_reg_2745;
  assign wd3_2_fu_2023_p2 = (working_key[4522] == 1'b1)? ilb_table_q0 >> tmp_9_i2_cast_cast_fu_2019_p1 : ilb_table_q0 << tmp_9_i2_cast_cast_fu_2019_p1;
  assign wd3_fu_1276_p2 = (working_key[4523] == 1'b1)? ilb_table_q0 << tmp_9_i_cast_cast_fu_1272_p1 : ilb_table_q0 >> tmp_9_i_cast_cast_fu_1272_p1;
  assign wd_1_cast_fu_1146_p1 = tmp_32_i_fu_1136_p4;
  assign wd_1_fu_1883_p1 = tmp_36_i_fu_1873_p4;
  assign Const_1038 = (1'd0 ^ working_key[4524]);
  assign wd_fu_1034_p3 = ((((working_key[4525] == 1'b1)? tmp_12_fu_1020_p3[0:0] < Const_1038 : tmp_12_fu_1020_p3[0:0] === Const_1038) ^ working_key[4526]) == 1'b1)? m_fu_1028_p2 : el_assign_fu_1011_p2;
  assign wl_code_table_address0 = tmp_19_fu_1114_p1;
  assign wl_code_table_load_c_fu_1150_p0 = wl_code_table_q0;
  assign wl_code_table_load_c_fu_1150_p1 = wl_code_table_load_c_fu_1150_p0;
  assign xa_1_cast_fu_793_p1 = grp_fu_2419_p3;
  assign xa_cast_fu_722_p1 = xa_fu_716_p2;
  assign xa_fu_716_p2 = (working_key[4527] == 1'b1)? p_shl_cast_fu_700_p1 - p_shl1_cast_fu_712_p1 : p_shl_cast_fu_700_p1 * p_shl1_cast_fu_712_p1;
  assign xb_1_cast_fu_836_p1 = xb_1_fu_830_p2;
  assign xb_1_fu_830_p2 = (working_key[4528] == 1'b1)? tmp_cast_20_fu_826_p1 + xb1_reg_536 : tmp_cast_20_fu_826_p1 >> xb1_reg_536;
  assign xb_cast_fu_736_p1 = xb_fu_730_p2;
  assign xb_fu_730_p0 = xb_fu_730_p00;
  assign xb_fu_730_p00 = tqmf_q1;
  assign Const_1039 = (14'd11102 ^ working_key[4542:4529]);
  assign Const_1040 = (14'd6792 ^ working_key[4556:4543]);
  assign xb_fu_730_p2 = (working_key[4557] == 1'b1)? { { Const_1039 }, { xb_fu_730_p0 } } << -Const_1040 : { { Const_1039 }, { xb_fu_730_p0 } } * -Const_1040;
  assign xh_load_cast_fu_1735_p1 = xh;
  assign zl_1_fu_963_p2 = (working_key[4558] == 1'b1)? tmp_i_reg_2598 + zl1_i_reg_568 : tmp_i_reg_2598 >> zl1_i_reg_568;
  assign zl_3_fu_1674_p2 = (working_key[4559] == 1'b1)? tmp_i5_27_reg_2799 << zl1_i1_reg_601 : tmp_i5_27_reg_2799 + zl1_i1_reg_601;
  assign zl_fu_914_p2 = (working_key[4560] == 1'b1)? reg_670 * reg_674 : reg_670 << reg_674;

  always @(posedge ap_clk) begin
    extLd1_reg_2840[31:15] <= 17'b00000000000000000;
  end

  assign working_key = { locking_key[2338:0] };

endmodule

