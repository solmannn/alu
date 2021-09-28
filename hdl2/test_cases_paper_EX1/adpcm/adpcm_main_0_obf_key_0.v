
module adpcm_main_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  locking_key
);

  parameter ap_ST_fsm_state1 = 8'd1;
  parameter ap_ST_fsm_state2 = 8'd2;
  parameter ap_ST_fsm_state3 = 8'd4;
  parameter ap_ST_fsm_state4 = 8'd8;
  parameter ap_ST_fsm_state5 = 8'd16;
  parameter ap_ST_fsm_state6 = 8'd32;
  parameter ap_ST_fsm_state7 = 8'd64;
  parameter ap_ST_fsm_state8 = 8'd128;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [7:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [14:0] dec_detl;
  reg [31:0] detl;
  reg [14:0] dec_deth;
  reg [14:0] deth;
  reg [31:0] rlt2;
  reg [31:0] rlt1;
  reg [31:0] plt2;
  reg [31:0] plt1;
  reg [31:0] al2;
  reg [31:0] al1;
  reg [31:0] nbl;
  reg [31:0] rh2;
  reg [31:0] rh1;
  reg [31:0] ph2;
  reg [31:0] ph1;
  reg [31:0] ah2;
  reg [31:0] ah1;
  reg [31:0] nbh;
  reg [31:0] dec_rlt2;
  reg [31:0] dec_rlt1;
  reg [31:0] dec_plt2;
  reg [31:0] dec_plt1;
  reg [31:0] dec_al2;
  reg [31:0] dec_al1;
  reg [31:0] dec_nbl;
  reg [31:0] dec_rh2;
  reg [31:0] dec_rh1;
  reg [31:0] dec_ph2;
  reg [31:0] dec_ph1;
  reg [31:0] dec_ah2;
  reg [31:0] dec_ah1;
  reg [31:0] dec_nbh;
  reg [2:0] delay_dltx_address0;
  reg delay_dltx_ce0;
  reg delay_dltx_we0;
  reg [31:0] delay_dltx_d0;
  wire [31:0] delay_dltx_q0;
  reg delay_dltx_ce1;
  reg delay_dltx_we1;
  wire [31:0] delay_dltx_q1;
  reg [2:0] delay_dhx_address0;
  reg delay_dhx_ce0;
  reg delay_dhx_we0;
  reg [31:0] delay_dhx_d0;
  wire [31:0] delay_dhx_q0;
  reg delay_dhx_ce1;
  reg delay_dhx_we1;
  wire [31:0] delay_dhx_q1;
  reg [2:0] dec_del_dltx_address0;
  reg dec_del_dltx_ce0;
  reg dec_del_dltx_we0;
  reg [31:0] dec_del_dltx_d0;
  wire [31:0] dec_del_dltx_q0;
  reg dec_del_dltx_ce1;
  reg dec_del_dltx_we1;
  wire [31:0] dec_del_dltx_q1;
  reg [2:0] dec_del_dhx_address0;
  reg dec_del_dhx_ce0;
  reg dec_del_dhx_we0;
  reg [31:0] dec_del_dhx_d0;
  wire [31:0] dec_del_dhx_q0;
  reg dec_del_dhx_ce1;
  reg dec_del_dhx_we1;
  wire [31:0] dec_del_dhx_q1;
  reg [2:0] delay_bpl_address0;
  reg delay_bpl_ce0;
  reg delay_bpl_we0;
  reg [31:0] delay_bpl_d0;
  wire [31:0] delay_bpl_q0;
  reg [2:0] delay_bph_address0;
  reg delay_bph_ce0;
  reg delay_bph_we0;
  reg [31:0] delay_bph_d0;
  wire [31:0] delay_bph_q0;
  reg [2:0] dec_del_bpl_address0;
  reg dec_del_bpl_ce0;
  reg dec_del_bpl_we0;
  reg [31:0] dec_del_bpl_d0;
  wire [31:0] dec_del_bpl_q0;
  reg [2:0] dec_del_bph_address0;
  reg dec_del_bph_ce0;
  reg dec_del_bph_we0;
  reg [31:0] dec_del_bph_d0;
  wire [31:0] dec_del_bph_q0;
  reg [4:0] tqmf_address0;
  reg tqmf_ce0;
  reg tqmf_we0;
  reg [6:0] tqmf_d0;
  wire [6:0] tqmf_q0;
  reg tqmf_ce1;
  reg tqmf_we1;
  wire [6:0] tqmf_q1;
  reg [3:0] accumc_address0;
  reg accumc_ce0;
  reg accumc_we0;
  reg [31:0] accumc_d0;
  wire [31:0] accumc_q0;
  reg [3:0] accumd_address0;
  reg accumd_ce0;
  reg accumd_we0;
  reg [31:0] accumd_d0;
  wire [31:0] accumd_q0;
  wire [6:0] test_data_address0;
  reg test_data_ce0;
  wire [6:0] test_data_q0;
  wire [6:0] test_data_address1;
  reg test_data_ce1;
  wire [6:0] test_data_q1;
  reg [5:0] il;
  reg [31:0] ih;
  reg [6:0] compressed_address0;
  reg compressed_ce0;
  reg compressed_we0;
  wire [31:0] compressed_q0;
  wire ap_CS_fsm_state3;
  wire [0:0] tmp_fu_477_p2;
  reg [5:0] p_lshr_f_cast_reg_559;
  wire [6:0] i_10_fu_509_p2;
  reg [6:0] i_10_reg_564;
  reg [6:0] test_data_load_reg_569;
  wire ap_CS_fsm_state4;
  reg [6:0] test_data_load_1_reg_574;
  wire ap_CS_fsm_state6;
  wire [0:0] tmp_57_fu_519_p2;
  wire [6:0] i_11_fu_540_p2;
  reg [6:0] i_11_reg_587;
  reg [31:0] compressed_load_reg_592;
  wire ap_CS_fsm_state7;
  wire grp_encode_fu_232_ap_start;
  wire grp_encode_fu_232_ap_done;
  wire grp_encode_fu_232_ap_idle;
  wire grp_encode_fu_232_ap_ready;
  wire [4:0] grp_encode_fu_232_tqmf_address0;
  wire grp_encode_fu_232_tqmf_ce0;
  wire grp_encode_fu_232_tqmf_we0;
  wire [6:0] grp_encode_fu_232_tqmf_d0;
  wire [4:0] grp_encode_fu_232_tqmf_address1;
  wire grp_encode_fu_232_tqmf_ce1;
  wire grp_encode_fu_232_tqmf_we1;
  wire [6:0] grp_encode_fu_232_tqmf_d1;
  wire [2:0] grp_encode_fu_232_delay_bpl_address0;
  wire grp_encode_fu_232_delay_bpl_ce0;
  wire grp_encode_fu_232_delay_bpl_we0;
  wire [31:0] grp_encode_fu_232_delay_bpl_d0;
  wire [2:0] grp_encode_fu_232_delay_dltx_address0;
  wire grp_encode_fu_232_delay_dltx_ce0;
  wire grp_encode_fu_232_delay_dltx_we0;
  wire [31:0] grp_encode_fu_232_delay_dltx_d0;
  wire [2:0] grp_encode_fu_232_delay_dltx_address1;
  wire grp_encode_fu_232_delay_dltx_ce1;
  wire grp_encode_fu_232_delay_dltx_we1;
  wire [31:0] grp_encode_fu_232_delay_dltx_d1;
  wire [31:0] grp_encode_fu_232_rlt1_o;
  wire grp_encode_fu_232_rlt1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_al1_o;
  wire grp_encode_fu_232_al1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_rlt2_o;
  wire grp_encode_fu_232_rlt2_o_ap_vld;
  wire [31:0] grp_encode_fu_232_al2_o;
  wire grp_encode_fu_232_al2_o_ap_vld;
  wire [31:0] grp_encode_fu_232_detl_o;
  wire grp_encode_fu_232_detl_o_ap_vld;
  wire [5:0] grp_encode_fu_232_il_o;
  wire grp_encode_fu_232_il_o_ap_vld;
  wire [31:0] grp_encode_fu_232_nbl_o;
  wire grp_encode_fu_232_nbl_o_ap_vld;
  wire [31:0] grp_encode_fu_232_plt1_o;
  wire grp_encode_fu_232_plt1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_plt2_o;
  wire grp_encode_fu_232_plt2_o_ap_vld;
  wire [2:0] grp_encode_fu_232_delay_bph_address0;
  wire grp_encode_fu_232_delay_bph_ce0;
  wire grp_encode_fu_232_delay_bph_we0;
  wire [31:0] grp_encode_fu_232_delay_bph_d0;
  wire [2:0] grp_encode_fu_232_delay_dhx_address0;
  wire grp_encode_fu_232_delay_dhx_ce0;
  wire grp_encode_fu_232_delay_dhx_we0;
  wire [31:0] grp_encode_fu_232_delay_dhx_d0;
  wire [2:0] grp_encode_fu_232_delay_dhx_address1;
  wire grp_encode_fu_232_delay_dhx_ce1;
  wire grp_encode_fu_232_delay_dhx_we1;
  wire [31:0] grp_encode_fu_232_delay_dhx_d1;
  wire [31:0] grp_encode_fu_232_rh1_o;
  wire grp_encode_fu_232_rh1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ah1_o;
  wire grp_encode_fu_232_ah1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_rh2_o;
  wire grp_encode_fu_232_rh2_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ah2_o;
  wire grp_encode_fu_232_ah2_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ih_o;
  wire grp_encode_fu_232_ih_o_ap_vld;
  wire [14:0] grp_encode_fu_232_deth_o;
  wire grp_encode_fu_232_deth_o_ap_vld;
  wire [31:0] grp_encode_fu_232_nbh_o;
  wire grp_encode_fu_232_nbh_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ph1_o;
  wire grp_encode_fu_232_ph1_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ph2_o;
  wire grp_encode_fu_232_ph2_o_ap_vld;
  wire [31:0] grp_encode_fu_232_ap_return;
  wire grp_decode_fu_315_ap_start;
  wire grp_decode_fu_315_ap_done;
  wire grp_decode_fu_315_ap_idle;
  wire grp_decode_fu_315_ap_ready;
  wire [31:0] grp_decode_fu_315_ih_o;
  wire grp_decode_fu_315_ih_o_ap_vld;
  wire [2:0] grp_decode_fu_315_dec_del_bpl_address0;
  wire grp_decode_fu_315_dec_del_bpl_ce0;
  wire grp_decode_fu_315_dec_del_bpl_we0;
  wire [31:0] grp_decode_fu_315_dec_del_bpl_d0;
  wire [2:0] grp_decode_fu_315_dec_del_dltx_address0;
  wire grp_decode_fu_315_dec_del_dltx_ce0;
  wire grp_decode_fu_315_dec_del_dltx_we0;
  wire [31:0] grp_decode_fu_315_dec_del_dltx_d0;
  wire [2:0] grp_decode_fu_315_dec_del_dltx_address1;
  wire grp_decode_fu_315_dec_del_dltx_ce1;
  wire grp_decode_fu_315_dec_del_dltx_we1;
  wire [31:0] grp_decode_fu_315_dec_del_dltx_d1;
  wire [31:0] grp_decode_fu_315_dec_rlt1_o;
  wire grp_decode_fu_315_dec_rlt1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_al1_o;
  wire grp_decode_fu_315_dec_al1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_rlt2_o;
  wire grp_decode_fu_315_dec_rlt2_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_al2_o;
  wire grp_decode_fu_315_dec_al2_o_ap_vld;
  wire [14:0] grp_decode_fu_315_dec_detl_o;
  wire grp_decode_fu_315_dec_detl_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_nbl_o;
  wire grp_decode_fu_315_dec_nbl_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_plt1_o;
  wire grp_decode_fu_315_dec_plt1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_plt2_o;
  wire grp_decode_fu_315_dec_plt2_o_ap_vld;
  wire [2:0] grp_decode_fu_315_dec_del_bph_address0;
  wire grp_decode_fu_315_dec_del_bph_ce0;
  wire grp_decode_fu_315_dec_del_bph_we0;
  wire [31:0] grp_decode_fu_315_dec_del_bph_d0;
  wire [2:0] grp_decode_fu_315_dec_del_dhx_address0;
  wire grp_decode_fu_315_dec_del_dhx_ce0;
  wire grp_decode_fu_315_dec_del_dhx_we0;
  wire [31:0] grp_decode_fu_315_dec_del_dhx_d0;
  wire [2:0] grp_decode_fu_315_dec_del_dhx_address1;
  wire grp_decode_fu_315_dec_del_dhx_ce1;
  wire grp_decode_fu_315_dec_del_dhx_we1;
  wire [31:0] grp_decode_fu_315_dec_del_dhx_d1;
  wire [31:0] grp_decode_fu_315_dec_rh1_o;
  wire grp_decode_fu_315_dec_rh1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_ah1_o;
  wire grp_decode_fu_315_dec_ah1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_rh2_o;
  wire grp_decode_fu_315_dec_rh2_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_ah2_o;
  wire grp_decode_fu_315_dec_ah2_o_ap_vld;
  wire [14:0] grp_decode_fu_315_dec_deth_o;
  wire grp_decode_fu_315_dec_deth_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_nbh_o;
  wire grp_decode_fu_315_dec_nbh_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_ph1_o;
  wire grp_decode_fu_315_dec_ph1_o_ap_vld;
  wire [31:0] grp_decode_fu_315_dec_ph2_o;
  wire grp_decode_fu_315_dec_ph2_o_ap_vld;
  wire [3:0] grp_decode_fu_315_accumc_address0;
  wire grp_decode_fu_315_accumc_ce0;
  wire grp_decode_fu_315_accumc_we0;
  wire [31:0] grp_decode_fu_315_accumc_d0;
  wire [3:0] grp_decode_fu_315_accumd_address0;
  wire grp_decode_fu_315_accumd_ce0;
  wire grp_decode_fu_315_accumd_we0;
  wire [31:0] grp_decode_fu_315_accumd_d0;
  wire grp_reset_fu_387_ap_start;
  wire grp_reset_fu_387_ap_done;
  wire grp_reset_fu_387_ap_idle;
  wire grp_reset_fu_387_ap_ready;
  wire [14:0] grp_reset_fu_387_dec_detl;
  wire grp_reset_fu_387_dec_detl_ap_vld;
  wire [31:0] grp_reset_fu_387_detl;
  wire grp_reset_fu_387_detl_ap_vld;
  wire [14:0] grp_reset_fu_387_dec_deth;
  wire grp_reset_fu_387_dec_deth_ap_vld;
  wire [14:0] grp_reset_fu_387_deth;
  wire grp_reset_fu_387_deth_ap_vld;
  wire [31:0] grp_reset_fu_387_rlt2;
  wire grp_reset_fu_387_rlt2_ap_vld;
  wire [31:0] grp_reset_fu_387_rlt1;
  wire grp_reset_fu_387_rlt1_ap_vld;
  wire [31:0] grp_reset_fu_387_plt2;
  wire grp_reset_fu_387_plt2_ap_vld;
  wire [31:0] grp_reset_fu_387_plt1;
  wire grp_reset_fu_387_plt1_ap_vld;
  wire [31:0] grp_reset_fu_387_al2;
  wire grp_reset_fu_387_al2_ap_vld;
  wire [31:0] grp_reset_fu_387_al1;
  wire grp_reset_fu_387_al1_ap_vld;
  wire [31:0] grp_reset_fu_387_nbl;
  wire grp_reset_fu_387_nbl_ap_vld;
  wire [31:0] grp_reset_fu_387_rh2;
  wire grp_reset_fu_387_rh2_ap_vld;
  wire [31:0] grp_reset_fu_387_rh1;
  wire grp_reset_fu_387_rh1_ap_vld;
  wire [31:0] grp_reset_fu_387_ph2;
  wire grp_reset_fu_387_ph2_ap_vld;
  wire [31:0] grp_reset_fu_387_ph1;
  wire grp_reset_fu_387_ph1_ap_vld;
  wire [31:0] grp_reset_fu_387_ah2;
  wire grp_reset_fu_387_ah2_ap_vld;
  wire [31:0] grp_reset_fu_387_ah1;
  wire grp_reset_fu_387_ah1_ap_vld;
  wire [31:0] grp_reset_fu_387_nbh;
  wire grp_reset_fu_387_nbh_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_rlt2;
  wire grp_reset_fu_387_dec_rlt2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_rlt1;
  wire grp_reset_fu_387_dec_rlt1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_plt2;
  wire grp_reset_fu_387_dec_plt2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_plt1;
  wire grp_reset_fu_387_dec_plt1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_al2;
  wire grp_reset_fu_387_dec_al2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_al1;
  wire grp_reset_fu_387_dec_al1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_nbl;
  wire grp_reset_fu_387_dec_nbl_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_rh2;
  wire grp_reset_fu_387_dec_rh2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_rh1;
  wire grp_reset_fu_387_dec_rh1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_ph2;
  wire grp_reset_fu_387_dec_ph2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_ph1;
  wire grp_reset_fu_387_dec_ph1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_ah2;
  wire grp_reset_fu_387_dec_ah2_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_ah1;
  wire grp_reset_fu_387_dec_ah1_ap_vld;
  wire [31:0] grp_reset_fu_387_dec_nbh;
  wire grp_reset_fu_387_dec_nbh_ap_vld;
  wire [2:0] grp_reset_fu_387_delay_dltx_address0;
  wire grp_reset_fu_387_delay_dltx_ce0;
  wire grp_reset_fu_387_delay_dltx_we0;
  wire [31:0] grp_reset_fu_387_delay_dltx_d0;
  wire [2:0] grp_reset_fu_387_delay_dhx_address0;
  wire grp_reset_fu_387_delay_dhx_ce0;
  wire grp_reset_fu_387_delay_dhx_we0;
  wire [31:0] grp_reset_fu_387_delay_dhx_d0;
  wire [2:0] grp_reset_fu_387_dec_del_dltx_address0;
  wire grp_reset_fu_387_dec_del_dltx_ce0;
  wire grp_reset_fu_387_dec_del_dltx_we0;
  wire [31:0] grp_reset_fu_387_dec_del_dltx_d0;
  wire [2:0] grp_reset_fu_387_dec_del_dhx_address0;
  wire grp_reset_fu_387_dec_del_dhx_ce0;
  wire grp_reset_fu_387_dec_del_dhx_we0;
  wire [31:0] grp_reset_fu_387_dec_del_dhx_d0;
  wire [2:0] grp_reset_fu_387_delay_bpl_address0;
  wire grp_reset_fu_387_delay_bpl_ce0;
  wire grp_reset_fu_387_delay_bpl_we0;
  wire [31:0] grp_reset_fu_387_delay_bpl_d0;
  wire [2:0] grp_reset_fu_387_delay_bph_address0;
  wire grp_reset_fu_387_delay_bph_ce0;
  wire grp_reset_fu_387_delay_bph_we0;
  wire [31:0] grp_reset_fu_387_delay_bph_d0;
  wire [2:0] grp_reset_fu_387_dec_del_bpl_address0;
  wire grp_reset_fu_387_dec_del_bpl_ce0;
  wire grp_reset_fu_387_dec_del_bpl_we0;
  wire [31:0] grp_reset_fu_387_dec_del_bpl_d0;
  wire [2:0] grp_reset_fu_387_dec_del_bph_address0;
  wire grp_reset_fu_387_dec_del_bph_ce0;
  wire grp_reset_fu_387_dec_del_bph_we0;
  wire [31:0] grp_reset_fu_387_dec_del_bph_d0;
  wire [4:0] grp_reset_fu_387_tqmf_address0;
  wire grp_reset_fu_387_tqmf_ce0;
  wire grp_reset_fu_387_tqmf_we0;
  wire [6:0] grp_reset_fu_387_tqmf_d0;
  wire [3:0] grp_reset_fu_387_accumc_address0;
  wire grp_reset_fu_387_accumc_ce0;
  wire grp_reset_fu_387_accumc_we0;
  wire [31:0] grp_reset_fu_387_accumc_d0;
  wire [3:0] grp_reset_fu_387_accumd_address0;
  wire grp_reset_fu_387_accumd_ce0;
  wire grp_reset_fu_387_accumd_we0;
  wire [31:0] grp_reset_fu_387_accumd_d0;
  reg [6:0] i_reg_210;
  wire ap_CS_fsm_state2;
  wire ap_CS_fsm_state5;
  reg [6:0] i_1_reg_221;
  wire ap_CS_fsm_state8;
  reg grp_encode_fu_232_ap_start_reg;
  reg grp_decode_fu_315_ap_start_reg;
  reg grp_reset_fu_387_ap_start_reg;
  wire [63:0] tmp_s_fu_483_p1;
  wire [63:0] tmp_54_fu_494_p1;
  wire [63:0] tmp_56_fu_515_p1;
  wire [63:0] tmp_58_fu_535_p1;
  wire [6:0] tmp_53_fu_488_p2;
  wire [5:0] p_lshr_f6_cast_fu_525_p4;
  reg [7:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire [6:0] Const_2;
  wire Const_3;
  wire Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire Const_9;
  wire Const_10;
  wire Const_11;
  wire Const_12;
  wire Const_13;
  wire Const_14;
  wire Const_15;
  wire Const_16;
  wire Const_17;
  wire Const_18;
  wire Const_19;
  wire Const_20;
  wire Const_21;
  wire Const_22;
  wire Const_23;
  wire Const_24;
  wire Const_25;
  wire Const_26;
  wire Const_27;
  wire Const_28;
  wire Const_29;
  wire Const_30;
  wire Const_31;
  wire Const_32;
  wire Const_33;
  wire Const_34;
  wire Const_35;
  wire Const_36;
  wire Const_37;
  wire Const_38;
  wire Const_39;
  wire Const_40;
  wire Const_41;
  wire Const_42;
  wire Const_43;
  wire Const_44;
  wire Const_45;
  wire Const_46;
  wire Const_47;
  wire Const_48;
  wire Const_49;
  wire Const_50;
  wire Const_51;
  wire Const_52;
  wire Const_53;
  wire Const_54;
  wire Const_55;
  wire Const_56;
  wire Const_57;
  wire Const_58;
  wire Const_59;
  wire Const_60;
  wire Const_61;
  wire Const_62;
  wire Const_63;
  wire Const_64;
  wire Const_65;
  wire Const_66;
  wire Const_67;
  wire Const_68;
  wire Const_69;
  wire Const_70;
  wire Const_71;
  wire Const_72;
  wire Const_73;
  wire Const_74;
  wire Const_75;
  wire Const_76;
  wire Const_77;
  wire Const_78;
  wire Const_79;
  wire Const_80;
  wire Const_81;
  wire Const_82;
  wire Const_83;
  wire Const_84;
  wire Const_85;
  wire Const_86;
  wire Const_87;
  wire Const_88;
  wire Const_89;
  wire Const_90;
  wire Const_91;
  wire Const_92;
  wire Const_93;
  wire Const_94;
  wire Const_95;
  wire Const_96;
  wire Const_97;
  wire Const_98;
  wire Const_99;
  wire Const_100;
  wire Const_101;
  wire Const_102;
  wire Const_103;
  wire Const_104;
  wire Const_105;
  wire Const_106;
  wire Const_107;
  wire Const_108;
  wire Const_109;
  wire Const_110;
  wire Const_111;
  wire Const_112;
  wire Const_113;
  wire Const_114;
  wire Const_115;
  wire Const_116;
  wire Const_117;
  wire Const_118;
  wire Const_119;
  wire Const_120;
  wire Const_121;
  wire Const_122;
  wire Const_123;
  wire Const_124;
  wire Const_125;
  wire Const_126;
  wire Const_127;
  wire Const_128;
  wire Const_129;
  wire Const_130;
  wire Const_131;
  wire Const_132;
  wire Const_133;
  wire Const_134;
  wire Const_135;
  wire Const_136;
  wire Const_137;
  wire Const_138;
  wire Const_139;
  wire Const_140;
  wire Const_141;
  wire Const_142;
  wire Const_143;
  wire Const_144;
  wire Const_145;
  wire Const_146;
  wire Const_147;
  wire Const_148;
  wire Const_149;
  wire Const_150;
  wire Const_151;
  wire Const_152;
  wire Const_153;
  wire Const_154;
  wire Const_155;
  wire Const_156;
  wire Const_157;
  wire Const_158;
  wire Const_159;
  wire Const_160;
  wire Const_161;
  wire Const_162;
  wire Const_163;
  wire Const_164;
  wire Const_165;
  wire Const_166;
  wire Const_167;
  wire Const_168;
  wire Const_169;
  wire Const_170;
  wire Const_171;
  wire Const_172;
  wire Const_173;
  wire Const_174;
  wire Const_175;
  wire Const_176;
  wire Const_177;
  wire Const_178;
  wire Const_179;
  wire Const_180;
  wire Const_181;
  wire Const_182;
  wire Const_183;
  wire Const_184;
  wire Const_185;
  wire Const_186;
  wire Const_187;
  wire [6:0] Const_188;
  wire [6:0] Const_189;
  wire [6:0] Const_190;
  wire [6:0] Const_191;
  wire Const_192;
  wire Const_193;
  wire [6:0] Const_194;
  wire Const_195;
  wire Const_196;
  input [12286:0] locking_key;
  wire [354:0] working_key;

  initial begin
    #0 ap_CS_fsm = 8'd1;
    #0 dec_detl = 15'd0;
    #0 detl = 32'd0;
    #0 dec_deth = 15'd0;
    #0 deth = 15'd0;
    #0 rlt2 = 32'd0;
    #0 rlt1 = 32'd0;
    #0 plt2 = 32'd0;
    #0 plt1 = 32'd0;
    #0 al2 = 32'd0;
    #0 al1 = 32'd0;
    #0 nbl = 32'd0;
    #0 rh2 = 32'd0;
    #0 rh1 = 32'd0;
    #0 ph2 = 32'd0;
    #0 ph1 = 32'd0;
    #0 ah2 = 32'd0;
    #0 ah1 = 32'd0;
    #0 nbh = 32'd0;
    #0 dec_rlt2 = 32'd0;
    #0 dec_rlt1 = 32'd0;
    #0 dec_plt2 = 32'd0;
    #0 dec_plt1 = 32'd0;
    #0 dec_al2 = 32'd0;
    #0 dec_al1 = 32'd0;
    #0 dec_nbl = 32'd0;
    #0 dec_rh2 = 32'd0;
    #0 dec_rh1 = 32'd0;
    #0 dec_ph2 = 32'd0;
    #0 dec_ph1 = 32'd0;
    #0 dec_ah2 = 32'd0;
    #0 dec_ah1 = 32'd0;
    #0 dec_nbh = 32'd0;
    #0 il = 6'd0;
    #0 ih = 32'd0;
    #0 grp_encode_fu_232_ap_start_reg = 1'b0;
    #0 grp_decode_fu_315_ap_start_reg = 1'b0;
    #0 grp_reset_fu_387_ap_start_reg = 1'b0;
  end


  adpcm_main_delay_ncg
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  delay_dltx_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(delay_dltx_address0),
    .ce0(delay_dltx_ce0),
    .we0(delay_dltx_we0),
    .d0(delay_dltx_d0),
    .q0(delay_dltx_q0),
    .address1(grp_encode_fu_232_delay_dltx_address1),
    .ce1(delay_dltx_ce1),
    .we1(delay_dltx_we1),
    .d1(grp_encode_fu_232_delay_dltx_d1),
    .q1(delay_dltx_q1)
  );


  adpcm_main_delay_ncg
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  delay_dhx_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(delay_dhx_address0),
    .ce0(delay_dhx_ce0),
    .we0(delay_dhx_we0),
    .d0(delay_dhx_d0),
    .q0(delay_dhx_q0),
    .address1(grp_encode_fu_232_delay_dhx_address1),
    .ce1(delay_dhx_ce1),
    .we1(delay_dhx_we1),
    .d1(grp_encode_fu_232_delay_dhx_d1),
    .q1(delay_dhx_q1)
  );


  adpcm_main_delay_ncg
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  dec_del_dltx_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dec_del_dltx_address0),
    .ce0(dec_del_dltx_ce0),
    .we0(dec_del_dltx_we0),
    .d0(dec_del_dltx_d0),
    .q0(dec_del_dltx_q0),
    .address1(grp_decode_fu_315_dec_del_dltx_address1),
    .ce1(dec_del_dltx_ce1),
    .we1(dec_del_dltx_we1),
    .d1(grp_decode_fu_315_dec_del_dltx_d1),
    .q1(dec_del_dltx_q1)
  );


  adpcm_main_delay_ncg
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  dec_del_dhx_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dec_del_dhx_address0),
    .ce0(dec_del_dhx_ce0),
    .we0(dec_del_dhx_we0),
    .d0(dec_del_dhx_d0),
    .q0(dec_del_dhx_q0),
    .address1(grp_decode_fu_315_dec_del_dhx_address1),
    .ce1(dec_del_dhx_ce1),
    .we1(dec_del_dhx_we1),
    .d1(grp_decode_fu_315_dec_del_dhx_d1),
    .q1(dec_del_dhx_q1)
  );


  adpcm_main_delay_rcU
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  delay_bpl_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(delay_bpl_address0),
    .ce0(delay_bpl_ce0),
    .we0(delay_bpl_we0),
    .d0(delay_bpl_d0),
    .q0(delay_bpl_q0)
  );


  adpcm_main_delay_rcU
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  delay_bph_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(delay_bph_address0),
    .ce0(delay_bph_ce0),
    .we0(delay_bph_we0),
    .d0(delay_bph_d0),
    .q0(delay_bph_q0)
  );


  adpcm_main_delay_rcU
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  dec_del_bpl_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dec_del_bpl_address0),
    .ce0(dec_del_bpl_ce0),
    .we0(dec_del_bpl_we0),
    .d0(dec_del_bpl_d0),
    .q0(dec_del_bpl_q0)
  );


  adpcm_main_delay_rcU
  #(
    .DataWidth(32),
    .AddressRange(6),
    .AddressWidth(3)
  )
  dec_del_bph_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dec_del_bph_address0),
    .ce0(dec_del_bph_ce0),
    .we0(dec_del_bph_we0),
    .d0(dec_del_bph_d0),
    .q0(dec_del_bph_q0)
  );


  adpcm_main_tqmf
  #(
    .DataWidth(7),
    .AddressRange(24),
    .AddressWidth(5)
  )
  tqmf_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(tqmf_address0),
    .ce0(tqmf_ce0),
    .we0(tqmf_we0),
    .d0(tqmf_d0),
    .q0(tqmf_q0),
    .address1(grp_encode_fu_232_tqmf_address1),
    .ce1(tqmf_ce1),
    .we1(tqmf_we1),
    .d1(grp_encode_fu_232_tqmf_d1),
    .q1(tqmf_q1)
  );


  adpcm_main_accumc
  #(
    .DataWidth(32),
    .AddressRange(11),
    .AddressWidth(4)
  )
  accumc_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(accumc_address0),
    .ce0(accumc_ce0),
    .we0(accumc_we0),
    .d0(accumc_d0),
    .q0(accumc_q0)
  );


  adpcm_main_accumc
  #(
    .DataWidth(32),
    .AddressRange(11),
    .AddressWidth(4)
  )
  accumd_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(accumd_address0),
    .ce0(accumd_ce0),
    .we0(accumd_we0),
    .d0(accumd_d0),
    .q0(accumd_q0)
  );


  adpcm_main_test_dvdy
  #(
    .DataWidth(7),
    .AddressRange(100),
    .AddressWidth(7)
  )
  test_data_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(test_data_address0),
    .ce0(test_data_ce0),
    .q0(test_data_q0),
    .address1(test_data_address1),
    .ce1(test_data_ce1),
    .q1(test_data_q1)
  );


  adpcm_main_comprewdI
  #(
    .DataWidth(32),
    .AddressRange(100),
    .AddressWidth(7)
  )
  compressed_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(compressed_address0),
    .ce0(compressed_ce0),
    .we0(compressed_we0),
    .d0(grp_encode_fu_232_ap_return),
    .q0(compressed_q0)
  );


  encode
  grp_encode_fu_232
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_encode_fu_232_ap_start),
    .ap_done(grp_encode_fu_232_ap_done),
    .ap_idle(grp_encode_fu_232_ap_idle),
    .ap_ready(grp_encode_fu_232_ap_ready),
    .xin1(test_data_load_reg_569),
    .xin2(test_data_load_1_reg_574),
    .tqmf_address0(grp_encode_fu_232_tqmf_address0),
    .tqmf_ce0(grp_encode_fu_232_tqmf_ce0),
    .tqmf_we0(grp_encode_fu_232_tqmf_we0),
    .tqmf_d0(grp_encode_fu_232_tqmf_d0),
    .tqmf_q0(tqmf_q0),
    .tqmf_address1(grp_encode_fu_232_tqmf_address1),
    .tqmf_ce1(grp_encode_fu_232_tqmf_ce1),
    .tqmf_we1(grp_encode_fu_232_tqmf_we1),
    .tqmf_d1(grp_encode_fu_232_tqmf_d1),
    .tqmf_q1(tqmf_q1),
    .delay_bpl_address0(grp_encode_fu_232_delay_bpl_address0),
    .delay_bpl_ce0(grp_encode_fu_232_delay_bpl_ce0),
    .delay_bpl_we0(grp_encode_fu_232_delay_bpl_we0),
    .delay_bpl_d0(grp_encode_fu_232_delay_bpl_d0),
    .delay_bpl_q0(delay_bpl_q0),
    .delay_dltx_address0(grp_encode_fu_232_delay_dltx_address0),
    .delay_dltx_ce0(grp_encode_fu_232_delay_dltx_ce0),
    .delay_dltx_we0(grp_encode_fu_232_delay_dltx_we0),
    .delay_dltx_d0(grp_encode_fu_232_delay_dltx_d0),
    .delay_dltx_q0(delay_dltx_q0),
    .delay_dltx_address1(grp_encode_fu_232_delay_dltx_address1),
    .delay_dltx_ce1(grp_encode_fu_232_delay_dltx_ce1),
    .delay_dltx_we1(grp_encode_fu_232_delay_dltx_we1),
    .delay_dltx_d1(grp_encode_fu_232_delay_dltx_d1),
    .delay_dltx_q1(delay_dltx_q1),
    .rlt1_i(rlt1),
    .rlt1_o(grp_encode_fu_232_rlt1_o),
    .rlt1_o_ap_vld(grp_encode_fu_232_rlt1_o_ap_vld),
    .al1_i(al1),
    .al1_o(grp_encode_fu_232_al1_o),
    .al1_o_ap_vld(grp_encode_fu_232_al1_o_ap_vld),
    .rlt2_i(rlt2),
    .rlt2_o(grp_encode_fu_232_rlt2_o),
    .rlt2_o_ap_vld(grp_encode_fu_232_rlt2_o_ap_vld),
    .al2_i(al2),
    .al2_o(grp_encode_fu_232_al2_o),
    .al2_o_ap_vld(grp_encode_fu_232_al2_o_ap_vld),
    .detl_i(detl),
    .detl_o(grp_encode_fu_232_detl_o),
    .detl_o_ap_vld(grp_encode_fu_232_detl_o_ap_vld),
    .il_i(il),
    .il_o(grp_encode_fu_232_il_o),
    .il_o_ap_vld(grp_encode_fu_232_il_o_ap_vld),
    .nbl_i(nbl),
    .nbl_o(grp_encode_fu_232_nbl_o),
    .nbl_o_ap_vld(grp_encode_fu_232_nbl_o_ap_vld),
    .plt1_i(plt1),
    .plt1_o(grp_encode_fu_232_plt1_o),
    .plt1_o_ap_vld(grp_encode_fu_232_plt1_o_ap_vld),
    .plt2_i(plt2),
    .plt2_o(grp_encode_fu_232_plt2_o),
    .plt2_o_ap_vld(grp_encode_fu_232_plt2_o_ap_vld),
    .delay_bph_address0(grp_encode_fu_232_delay_bph_address0),
    .delay_bph_ce0(grp_encode_fu_232_delay_bph_ce0),
    .delay_bph_we0(grp_encode_fu_232_delay_bph_we0),
    .delay_bph_d0(grp_encode_fu_232_delay_bph_d0),
    .delay_bph_q0(delay_bph_q0),
    .delay_dhx_address0(grp_encode_fu_232_delay_dhx_address0),
    .delay_dhx_ce0(grp_encode_fu_232_delay_dhx_ce0),
    .delay_dhx_we0(grp_encode_fu_232_delay_dhx_we0),
    .delay_dhx_d0(grp_encode_fu_232_delay_dhx_d0),
    .delay_dhx_q0(delay_dhx_q0),
    .delay_dhx_address1(grp_encode_fu_232_delay_dhx_address1),
    .delay_dhx_ce1(grp_encode_fu_232_delay_dhx_ce1),
    .delay_dhx_we1(grp_encode_fu_232_delay_dhx_we1),
    .delay_dhx_d1(grp_encode_fu_232_delay_dhx_d1),
    .delay_dhx_q1(delay_dhx_q1),
    .rh1_i(rh1),
    .rh1_o(grp_encode_fu_232_rh1_o),
    .rh1_o_ap_vld(grp_encode_fu_232_rh1_o_ap_vld),
    .ah1_i(ah1),
    .ah1_o(grp_encode_fu_232_ah1_o),
    .ah1_o_ap_vld(grp_encode_fu_232_ah1_o_ap_vld),
    .rh2_i(rh2),
    .rh2_o(grp_encode_fu_232_rh2_o),
    .rh2_o_ap_vld(grp_encode_fu_232_rh2_o_ap_vld),
    .ah2_i(ah2),
    .ah2_o(grp_encode_fu_232_ah2_o),
    .ah2_o_ap_vld(grp_encode_fu_232_ah2_o_ap_vld),
    .ih_i(ih),
    .ih_o(grp_encode_fu_232_ih_o),
    .ih_o_ap_vld(grp_encode_fu_232_ih_o_ap_vld),
    .deth_i(deth),
    .deth_o(grp_encode_fu_232_deth_o),
    .deth_o_ap_vld(grp_encode_fu_232_deth_o_ap_vld),
    .nbh_i(nbh),
    .nbh_o(grp_encode_fu_232_nbh_o),
    .nbh_o_ap_vld(grp_encode_fu_232_nbh_o_ap_vld),
    .ph1_i(ph1),
    .ph1_o(grp_encode_fu_232_ph1_o),
    .ph1_o_ap_vld(grp_encode_fu_232_ph1_o_ap_vld),
    .ph2_i(ph2),
    .ph2_o(grp_encode_fu_232_ph2_o),
    .ph2_o_ap_vld(grp_encode_fu_232_ph2_o_ap_vld),
    .ap_return(grp_encode_fu_232_ap_return)
  );


  decode
  grp_decode_fu_315
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_decode_fu_315_ap_start),
    .ap_done(grp_decode_fu_315_ap_done),
    .ap_idle(grp_decode_fu_315_ap_idle),
    .ap_ready(grp_decode_fu_315_ap_ready),
    .input_r(compressed_load_reg_592),
    .ih_i(ih),
    .ih_o(grp_decode_fu_315_ih_o),
    .ih_o_ap_vld(grp_decode_fu_315_ih_o_ap_vld),
    .dec_del_bpl_address0(grp_decode_fu_315_dec_del_bpl_address0),
    .dec_del_bpl_ce0(grp_decode_fu_315_dec_del_bpl_ce0),
    .dec_del_bpl_we0(grp_decode_fu_315_dec_del_bpl_we0),
    .dec_del_bpl_d0(grp_decode_fu_315_dec_del_bpl_d0),
    .dec_del_bpl_q0(dec_del_bpl_q0),
    .dec_del_dltx_address0(grp_decode_fu_315_dec_del_dltx_address0),
    .dec_del_dltx_ce0(grp_decode_fu_315_dec_del_dltx_ce0),
    .dec_del_dltx_we0(grp_decode_fu_315_dec_del_dltx_we0),
    .dec_del_dltx_d0(grp_decode_fu_315_dec_del_dltx_d0),
    .dec_del_dltx_q0(dec_del_dltx_q0),
    .dec_del_dltx_address1(grp_decode_fu_315_dec_del_dltx_address1),
    .dec_del_dltx_ce1(grp_decode_fu_315_dec_del_dltx_ce1),
    .dec_del_dltx_we1(grp_decode_fu_315_dec_del_dltx_we1),
    .dec_del_dltx_d1(grp_decode_fu_315_dec_del_dltx_d1),
    .dec_del_dltx_q1(dec_del_dltx_q1),
    .dec_rlt1_i(dec_rlt1),
    .dec_rlt1_o(grp_decode_fu_315_dec_rlt1_o),
    .dec_rlt1_o_ap_vld(grp_decode_fu_315_dec_rlt1_o_ap_vld),
    .dec_al1_i(dec_al1),
    .dec_al1_o(grp_decode_fu_315_dec_al1_o),
    .dec_al1_o_ap_vld(grp_decode_fu_315_dec_al1_o_ap_vld),
    .dec_rlt2_i(dec_rlt2),
    .dec_rlt2_o(grp_decode_fu_315_dec_rlt2_o),
    .dec_rlt2_o_ap_vld(grp_decode_fu_315_dec_rlt2_o_ap_vld),
    .dec_al2_i(dec_al2),
    .dec_al2_o(grp_decode_fu_315_dec_al2_o),
    .dec_al2_o_ap_vld(grp_decode_fu_315_dec_al2_o_ap_vld),
    .dec_detl_i(dec_detl),
    .dec_detl_o(grp_decode_fu_315_dec_detl_o),
    .dec_detl_o_ap_vld(grp_decode_fu_315_dec_detl_o_ap_vld),
    .il(il),
    .dec_nbl_i(dec_nbl),
    .dec_nbl_o(grp_decode_fu_315_dec_nbl_o),
    .dec_nbl_o_ap_vld(grp_decode_fu_315_dec_nbl_o_ap_vld),
    .dec_plt1_i(dec_plt1),
    .dec_plt1_o(grp_decode_fu_315_dec_plt1_o),
    .dec_plt1_o_ap_vld(grp_decode_fu_315_dec_plt1_o_ap_vld),
    .dec_plt2_i(dec_plt2),
    .dec_plt2_o(grp_decode_fu_315_dec_plt2_o),
    .dec_plt2_o_ap_vld(grp_decode_fu_315_dec_plt2_o_ap_vld),
    .dec_del_bph_address0(grp_decode_fu_315_dec_del_bph_address0),
    .dec_del_bph_ce0(grp_decode_fu_315_dec_del_bph_ce0),
    .dec_del_bph_we0(grp_decode_fu_315_dec_del_bph_we0),
    .dec_del_bph_d0(grp_decode_fu_315_dec_del_bph_d0),
    .dec_del_bph_q0(dec_del_bph_q0),
    .dec_del_dhx_address0(grp_decode_fu_315_dec_del_dhx_address0),
    .dec_del_dhx_ce0(grp_decode_fu_315_dec_del_dhx_ce0),
    .dec_del_dhx_we0(grp_decode_fu_315_dec_del_dhx_we0),
    .dec_del_dhx_d0(grp_decode_fu_315_dec_del_dhx_d0),
    .dec_del_dhx_q0(dec_del_dhx_q0),
    .dec_del_dhx_address1(grp_decode_fu_315_dec_del_dhx_address1),
    .dec_del_dhx_ce1(grp_decode_fu_315_dec_del_dhx_ce1),
    .dec_del_dhx_we1(grp_decode_fu_315_dec_del_dhx_we1),
    .dec_del_dhx_d1(grp_decode_fu_315_dec_del_dhx_d1),
    .dec_del_dhx_q1(dec_del_dhx_q1),
    .dec_rh1_i(dec_rh1),
    .dec_rh1_o(grp_decode_fu_315_dec_rh1_o),
    .dec_rh1_o_ap_vld(grp_decode_fu_315_dec_rh1_o_ap_vld),
    .dec_ah1_i(dec_ah1),
    .dec_ah1_o(grp_decode_fu_315_dec_ah1_o),
    .dec_ah1_o_ap_vld(grp_decode_fu_315_dec_ah1_o_ap_vld),
    .dec_rh2_i(dec_rh2),
    .dec_rh2_o(grp_decode_fu_315_dec_rh2_o),
    .dec_rh2_o_ap_vld(grp_decode_fu_315_dec_rh2_o_ap_vld),
    .dec_ah2_i(dec_ah2),
    .dec_ah2_o(grp_decode_fu_315_dec_ah2_o),
    .dec_ah2_o_ap_vld(grp_decode_fu_315_dec_ah2_o_ap_vld),
    .dec_deth_i(dec_deth),
    .dec_deth_o(grp_decode_fu_315_dec_deth_o),
    .dec_deth_o_ap_vld(grp_decode_fu_315_dec_deth_o_ap_vld),
    .dec_nbh_i(dec_nbh),
    .dec_nbh_o(grp_decode_fu_315_dec_nbh_o),
    .dec_nbh_o_ap_vld(grp_decode_fu_315_dec_nbh_o_ap_vld),
    .dec_ph1_i(dec_ph1),
    .dec_ph1_o(grp_decode_fu_315_dec_ph1_o),
    .dec_ph1_o_ap_vld(grp_decode_fu_315_dec_ph1_o_ap_vld),
    .dec_ph2_i(dec_ph2),
    .dec_ph2_o(grp_decode_fu_315_dec_ph2_o),
    .dec_ph2_o_ap_vld(grp_decode_fu_315_dec_ph2_o_ap_vld),
    .accumc_address0(grp_decode_fu_315_accumc_address0),
    .accumc_ce0(grp_decode_fu_315_accumc_ce0),
    .accumc_we0(grp_decode_fu_315_accumc_we0),
    .accumc_d0(grp_decode_fu_315_accumc_d0),
    .accumc_q0(accumc_q0),
    .accumd_address0(grp_decode_fu_315_accumd_address0),
    .accumd_ce0(grp_decode_fu_315_accumd_ce0),
    .accumd_we0(grp_decode_fu_315_accumd_we0),
    .accumd_d0(grp_decode_fu_315_accumd_d0),
    .accumd_q0(accumd_q0)
  );


  reset
  grp_reset_fu_387
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_reset_fu_387_ap_start),
    .ap_done(grp_reset_fu_387_ap_done),
    .ap_idle(grp_reset_fu_387_ap_idle),
    .ap_ready(grp_reset_fu_387_ap_ready),
    .dec_detl(grp_reset_fu_387_dec_detl),
    .dec_detl_ap_vld(grp_reset_fu_387_dec_detl_ap_vld),
    .detl(grp_reset_fu_387_detl),
    .detl_ap_vld(grp_reset_fu_387_detl_ap_vld),
    .dec_deth(grp_reset_fu_387_dec_deth),
    .dec_deth_ap_vld(grp_reset_fu_387_dec_deth_ap_vld),
    .deth(grp_reset_fu_387_deth),
    .deth_ap_vld(grp_reset_fu_387_deth_ap_vld),
    .rlt2(grp_reset_fu_387_rlt2),
    .rlt2_ap_vld(grp_reset_fu_387_rlt2_ap_vld),
    .rlt1(grp_reset_fu_387_rlt1),
    .rlt1_ap_vld(grp_reset_fu_387_rlt1_ap_vld),
    .plt2(grp_reset_fu_387_plt2),
    .plt2_ap_vld(grp_reset_fu_387_plt2_ap_vld),
    .plt1(grp_reset_fu_387_plt1),
    .plt1_ap_vld(grp_reset_fu_387_plt1_ap_vld),
    .al2(grp_reset_fu_387_al2),
    .al2_ap_vld(grp_reset_fu_387_al2_ap_vld),
    .al1(grp_reset_fu_387_al1),
    .al1_ap_vld(grp_reset_fu_387_al1_ap_vld),
    .nbl(grp_reset_fu_387_nbl),
    .nbl_ap_vld(grp_reset_fu_387_nbl_ap_vld),
    .rh2(grp_reset_fu_387_rh2),
    .rh2_ap_vld(grp_reset_fu_387_rh2_ap_vld),
    .rh1(grp_reset_fu_387_rh1),
    .rh1_ap_vld(grp_reset_fu_387_rh1_ap_vld),
    .ph2(grp_reset_fu_387_ph2),
    .ph2_ap_vld(grp_reset_fu_387_ph2_ap_vld),
    .ph1(grp_reset_fu_387_ph1),
    .ph1_ap_vld(grp_reset_fu_387_ph1_ap_vld),
    .ah2(grp_reset_fu_387_ah2),
    .ah2_ap_vld(grp_reset_fu_387_ah2_ap_vld),
    .ah1(grp_reset_fu_387_ah1),
    .ah1_ap_vld(grp_reset_fu_387_ah1_ap_vld),
    .nbh(grp_reset_fu_387_nbh),
    .nbh_ap_vld(grp_reset_fu_387_nbh_ap_vld),
    .dec_rlt2(grp_reset_fu_387_dec_rlt2),
    .dec_rlt2_ap_vld(grp_reset_fu_387_dec_rlt2_ap_vld),
    .dec_rlt1(grp_reset_fu_387_dec_rlt1),
    .dec_rlt1_ap_vld(grp_reset_fu_387_dec_rlt1_ap_vld),
    .dec_plt2(grp_reset_fu_387_dec_plt2),
    .dec_plt2_ap_vld(grp_reset_fu_387_dec_plt2_ap_vld),
    .dec_plt1(grp_reset_fu_387_dec_plt1),
    .dec_plt1_ap_vld(grp_reset_fu_387_dec_plt1_ap_vld),
    .dec_al2(grp_reset_fu_387_dec_al2),
    .dec_al2_ap_vld(grp_reset_fu_387_dec_al2_ap_vld),
    .dec_al1(grp_reset_fu_387_dec_al1),
    .dec_al1_ap_vld(grp_reset_fu_387_dec_al1_ap_vld),
    .dec_nbl(grp_reset_fu_387_dec_nbl),
    .dec_nbl_ap_vld(grp_reset_fu_387_dec_nbl_ap_vld),
    .dec_rh2(grp_reset_fu_387_dec_rh2),
    .dec_rh2_ap_vld(grp_reset_fu_387_dec_rh2_ap_vld),
    .dec_rh1(grp_reset_fu_387_dec_rh1),
    .dec_rh1_ap_vld(grp_reset_fu_387_dec_rh1_ap_vld),
    .dec_ph2(grp_reset_fu_387_dec_ph2),
    .dec_ph2_ap_vld(grp_reset_fu_387_dec_ph2_ap_vld),
    .dec_ph1(grp_reset_fu_387_dec_ph1),
    .dec_ph1_ap_vld(grp_reset_fu_387_dec_ph1_ap_vld),
    .dec_ah2(grp_reset_fu_387_dec_ah2),
    .dec_ah2_ap_vld(grp_reset_fu_387_dec_ah2_ap_vld),
    .dec_ah1(grp_reset_fu_387_dec_ah1),
    .dec_ah1_ap_vld(grp_reset_fu_387_dec_ah1_ap_vld),
    .dec_nbh(grp_reset_fu_387_dec_nbh),
    .dec_nbh_ap_vld(grp_reset_fu_387_dec_nbh_ap_vld),
    .delay_dltx_address0(grp_reset_fu_387_delay_dltx_address0),
    .delay_dltx_ce0(grp_reset_fu_387_delay_dltx_ce0),
    .delay_dltx_we0(grp_reset_fu_387_delay_dltx_we0),
    .delay_dltx_d0(grp_reset_fu_387_delay_dltx_d0),
    .delay_dhx_address0(grp_reset_fu_387_delay_dhx_address0),
    .delay_dhx_ce0(grp_reset_fu_387_delay_dhx_ce0),
    .delay_dhx_we0(grp_reset_fu_387_delay_dhx_we0),
    .delay_dhx_d0(grp_reset_fu_387_delay_dhx_d0),
    .dec_del_dltx_address0(grp_reset_fu_387_dec_del_dltx_address0),
    .dec_del_dltx_ce0(grp_reset_fu_387_dec_del_dltx_ce0),
    .dec_del_dltx_we0(grp_reset_fu_387_dec_del_dltx_we0),
    .dec_del_dltx_d0(grp_reset_fu_387_dec_del_dltx_d0),
    .dec_del_dhx_address0(grp_reset_fu_387_dec_del_dhx_address0),
    .dec_del_dhx_ce0(grp_reset_fu_387_dec_del_dhx_ce0),
    .dec_del_dhx_we0(grp_reset_fu_387_dec_del_dhx_we0),
    .dec_del_dhx_d0(grp_reset_fu_387_dec_del_dhx_d0),
    .delay_bpl_address0(grp_reset_fu_387_delay_bpl_address0),
    .delay_bpl_ce0(grp_reset_fu_387_delay_bpl_ce0),
    .delay_bpl_we0(grp_reset_fu_387_delay_bpl_we0),
    .delay_bpl_d0(grp_reset_fu_387_delay_bpl_d0),
    .delay_bph_address0(grp_reset_fu_387_delay_bph_address0),
    .delay_bph_ce0(grp_reset_fu_387_delay_bph_ce0),
    .delay_bph_we0(grp_reset_fu_387_delay_bph_we0),
    .delay_bph_d0(grp_reset_fu_387_delay_bph_d0),
    .dec_del_bpl_address0(grp_reset_fu_387_dec_del_bpl_address0),
    .dec_del_bpl_ce0(grp_reset_fu_387_dec_del_bpl_ce0),
    .dec_del_bpl_we0(grp_reset_fu_387_dec_del_bpl_we0),
    .dec_del_bpl_d0(grp_reset_fu_387_dec_del_bpl_d0),
    .dec_del_bph_address0(grp_reset_fu_387_dec_del_bph_address0),
    .dec_del_bph_ce0(grp_reset_fu_387_dec_del_bph_ce0),
    .dec_del_bph_we0(grp_reset_fu_387_dec_del_bph_we0),
    .dec_del_bph_d0(grp_reset_fu_387_dec_del_bph_d0),
    .tqmf_address0(grp_reset_fu_387_tqmf_address0),
    .tqmf_ce0(grp_reset_fu_387_tqmf_ce0),
    .tqmf_we0(grp_reset_fu_387_tqmf_we0),
    .tqmf_d0(grp_reset_fu_387_tqmf_d0),
    .accumc_address0(grp_reset_fu_387_accumc_address0),
    .accumc_ce0(grp_reset_fu_387_accumc_ce0),
    .accumc_we0(grp_reset_fu_387_accumc_we0),
    .accumc_d0(grp_reset_fu_387_accumc_d0),
    .accumd_address0(grp_reset_fu_387_accumd_address0),
    .accumd_ce0(grp_reset_fu_387_accumd_ce0),
    .accumd_we0(grp_reset_fu_387_accumd_we0),
    .accumd_d0(grp_reset_fu_387_accumd_d0)
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
      grp_decode_fu_315_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state7) begin
        grp_decode_fu_315_ap_start_reg <= 1'b1;
      end else if(grp_decode_fu_315_ap_ready == 1'b1) begin
        grp_decode_fu_315_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_encode_fu_232_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state4) begin
        grp_encode_fu_232_ap_start_reg <= 1'b1;
      end else if(grp_encode_fu_232_ap_ready == 1'b1) begin
        grp_encode_fu_232_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_reset_fu_387_ap_start_reg <= 1'b0;
    end else begin
      if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
        grp_reset_fu_387_ap_start_reg <= 1'b1;
      end else if(grp_reset_fu_387_ap_ready == 1'b1) begin
        grp_reset_fu_387_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_ah1_ap_vld == 1'b1)) begin
      ah1 <= grp_reset_fu_387_ah1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_ah1_o_ap_vld == 1'b1)) begin
      ah1 <= grp_encode_fu_232_ah1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_ah2_ap_vld == 1'b1)) begin
      ah2 <= grp_reset_fu_387_ah2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_ah2_o_ap_vld == 1'b1)) begin
      ah2 <= grp_encode_fu_232_ah2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_al1_ap_vld == 1'b1)) begin
      al1 <= grp_reset_fu_387_al1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_al1_o_ap_vld == 1'b1)) begin
      al1 <= grp_encode_fu_232_al1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_al2_ap_vld == 1'b1)) begin
      al2 <= grp_reset_fu_387_al2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_al2_o_ap_vld == 1'b1)) begin
      al2 <= grp_encode_fu_232_al2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_ah1_ap_vld == 1'b1)) begin
      dec_ah1 <= grp_reset_fu_387_dec_ah1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_ah1_o_ap_vld == 1'b1)) begin
      dec_ah1 <= grp_decode_fu_315_dec_ah1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_ah2_ap_vld == 1'b1)) begin
      dec_ah2 <= grp_reset_fu_387_dec_ah2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_ah2_o_ap_vld == 1'b1)) begin
      dec_ah2 <= grp_decode_fu_315_dec_ah2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_al1_ap_vld == 1'b1)) begin
      dec_al1 <= grp_reset_fu_387_dec_al1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_al1_o_ap_vld == 1'b1)) begin
      dec_al1 <= grp_decode_fu_315_dec_al1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_al2_ap_vld == 1'b1)) begin
      dec_al2 <= grp_reset_fu_387_dec_al2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_al2_o_ap_vld == 1'b1)) begin
      dec_al2 <= grp_decode_fu_315_dec_al2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_deth_ap_vld == 1'b1)) begin
      dec_deth <= grp_reset_fu_387_dec_deth;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_deth_o_ap_vld == 1'b1)) begin
      dec_deth <= grp_decode_fu_315_dec_deth_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_detl_ap_vld == 1'b1)) begin
      dec_detl <= grp_reset_fu_387_dec_detl;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_detl_o_ap_vld == 1'b1)) begin
      dec_detl <= grp_decode_fu_315_dec_detl_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_nbh_ap_vld == 1'b1)) begin
      dec_nbh <= grp_reset_fu_387_dec_nbh;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_nbh_o_ap_vld == 1'b1)) begin
      dec_nbh <= grp_decode_fu_315_dec_nbh_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_nbl_ap_vld == 1'b1)) begin
      dec_nbl <= grp_reset_fu_387_dec_nbl;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_nbl_o_ap_vld == 1'b1)) begin
      dec_nbl <= grp_decode_fu_315_dec_nbl_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_ph1_ap_vld == 1'b1)) begin
      dec_ph1 <= grp_reset_fu_387_dec_ph1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_ph1_o_ap_vld == 1'b1)) begin
      dec_ph1 <= grp_decode_fu_315_dec_ph1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_ph2_ap_vld == 1'b1)) begin
      dec_ph2 <= grp_reset_fu_387_dec_ph2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_ph2_o_ap_vld == 1'b1)) begin
      dec_ph2 <= grp_decode_fu_315_dec_ph2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_plt1_ap_vld == 1'b1)) begin
      dec_plt1 <= grp_reset_fu_387_dec_plt1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_plt1_o_ap_vld == 1'b1)) begin
      dec_plt1 <= grp_decode_fu_315_dec_plt1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_plt2_ap_vld == 1'b1)) begin
      dec_plt2 <= grp_reset_fu_387_dec_plt2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_plt2_o_ap_vld == 1'b1)) begin
      dec_plt2 <= grp_decode_fu_315_dec_plt2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_rh1_ap_vld == 1'b1)) begin
      dec_rh1 <= grp_reset_fu_387_dec_rh1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_rh1_o_ap_vld == 1'b1)) begin
      dec_rh1 <= grp_decode_fu_315_dec_rh1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_rh2_ap_vld == 1'b1)) begin
      dec_rh2 <= grp_reset_fu_387_dec_rh2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_rh2_o_ap_vld == 1'b1)) begin
      dec_rh2 <= grp_decode_fu_315_dec_rh2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_rlt1_ap_vld == 1'b1)) begin
      dec_rlt1 <= grp_reset_fu_387_dec_rlt1;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_rlt1_o_ap_vld == 1'b1)) begin
      dec_rlt1 <= grp_decode_fu_315_dec_rlt1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_dec_rlt2_ap_vld == 1'b1)) begin
      dec_rlt2 <= grp_reset_fu_387_dec_rlt2;
    end else if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_dec_rlt2_o_ap_vld == 1'b1)) begin
      dec_rlt2 <= grp_decode_fu_315_dec_rlt2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_deth_ap_vld == 1'b1)) begin
      deth <= grp_reset_fu_387_deth;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_deth_o_ap_vld == 1'b1)) begin
      deth <= grp_encode_fu_232_deth_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_detl_ap_vld == 1'b1)) begin
      detl <= grp_reset_fu_387_detl;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_detl_o_ap_vld == 1'b1)) begin
      detl <= grp_encode_fu_232_detl_o;
    end 
  end

  assign Const_0 = (1'd0 ^ working_key[0]);
  assign Const_1 = (1'd0 ^ working_key[1]);
  assign Const_2 = (7'd106 ^ working_key[8:2]);
  assign Const_3 = (1'd1 ^ working_key[9]);
  assign Const_4 = (1'd0 ^ working_key[10]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_477_p2 == Const_0) & (Const_1 == ap_CS_fsm_state3) ^ working_key[11]) == 1'b1) begin
      i_1_reg_221 <= Const_2;
    end else if((grp_decode_fu_315_ap_done == Const_3) & (Const_4 == ap_CS_fsm_state8)) begin
      i_1_reg_221 <= i_11_reg_587;
    end 
  end

  assign Const_5 = (1'd0 ^ working_key[12]);
  assign Const_6 = (1'd1 ^ working_key[13]);

  always @(posedge ap_clk) begin
    if(((grp_encode_fu_232_ap_done == Const_5) & (Const_6 == ap_CS_fsm_state5) ^ working_key[14]) == 1'b1) begin
      i_reg_210 <= i_10_reg_564;
    end else if((grp_reset_fu_387_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)) begin
      i_reg_210 <= 7'd0;
    end 
  end

  assign Const_7 = (1'd0 ^ working_key[15]);
  assign Const_8 = (1'd1 ^ working_key[16]);
  assign Const_9 = (1'd1 ^ working_key[17]);
  assign Const_10 = (1'd0 ^ working_key[18]);

  always @(posedge ap_clk) begin
    if(((Const_7 == ap_CS_fsm_state8) & (grp_decode_fu_315_ih_o_ap_vld == Const_8) ^ working_key[19]) == 1'b1) begin
      ih <= grp_decode_fu_315_ih_o;
    end else if((Const_9 == ap_CS_fsm_state5) & (grp_encode_fu_232_ih_o_ap_vld == Const_10)) begin
      ih <= grp_encode_fu_232_ih_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_nbh_ap_vld == 1'b1)) begin
      nbh <= grp_reset_fu_387_nbh;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_nbh_o_ap_vld == 1'b1)) begin
      nbh <= grp_encode_fu_232_nbh_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_nbl_ap_vld == 1'b1)) begin
      nbl <= grp_reset_fu_387_nbl;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_nbl_o_ap_vld == 1'b1)) begin
      nbl <= grp_encode_fu_232_nbl_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_ph1_ap_vld == 1'b1)) begin
      ph1 <= grp_reset_fu_387_ph1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_ph1_o_ap_vld == 1'b1)) begin
      ph1 <= grp_encode_fu_232_ph1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_ph2_ap_vld == 1'b1)) begin
      ph2 <= grp_reset_fu_387_ph2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_ph2_o_ap_vld == 1'b1)) begin
      ph2 <= grp_encode_fu_232_ph2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_plt1_ap_vld == 1'b1)) begin
      plt1 <= grp_reset_fu_387_plt1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_plt1_o_ap_vld == 1'b1)) begin
      plt1 <= grp_encode_fu_232_plt1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_plt2_ap_vld == 1'b1)) begin
      plt2 <= grp_reset_fu_387_plt2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_plt2_o_ap_vld == 1'b1)) begin
      plt2 <= grp_encode_fu_232_plt2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_rh1_ap_vld == 1'b1)) begin
      rh1 <= grp_reset_fu_387_rh1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_rh1_o_ap_vld == 1'b1)) begin
      rh1 <= grp_encode_fu_232_rh1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_rh2_ap_vld == 1'b1)) begin
      rh2 <= grp_reset_fu_387_rh2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_rh2_o_ap_vld == 1'b1)) begin
      rh2 <= grp_encode_fu_232_rh2_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_rlt1_ap_vld == 1'b1)) begin
      rlt1 <= grp_reset_fu_387_rlt1;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_rlt1_o_ap_vld == 1'b1)) begin
      rlt1 <= grp_encode_fu_232_rlt1_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (grp_reset_fu_387_rlt2_ap_vld == 1'b1)) begin
      rlt2 <= grp_reset_fu_387_rlt2;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_rlt2_o_ap_vld == 1'b1)) begin
      rlt2 <= grp_encode_fu_232_rlt2_o;
    end 
  end

  assign Const_11 = (1'd0 ^ working_key[20]);

  always @(posedge ap_clk) begin
    if(Const_11 == ap_CS_fsm_state7) begin
      compressed_load_reg_592 <= compressed_q0;
    end 
  end

  assign Const_12 = (1'd1 ^ working_key[21]);
  assign Const_13 = (1'd0 ^ working_key[22]);

  always @(posedge ap_clk) begin
    if((tmp_fu_477_p2 == Const_12) & (Const_13 == ap_CS_fsm_state3)) begin
      i_10_reg_564 <= i_10_fu_509_p2;
      p_lshr_f_cast_reg_559 <= { { i_reg_210[6:1] } };
    end 
  end

  assign Const_14 = (1'd1 ^ working_key[23]);
  assign Const_15 = (1'd0 ^ working_key[24]);

  always @(posedge ap_clk) begin
    if((tmp_57_fu_519_p2 == Const_14) & (Const_15 == ap_CS_fsm_state6)) begin
      i_11_reg_587 <= i_11_fu_540_p2;
    end 
  end

  assign Const_16 = (1'd0 ^ working_key[25]);
  assign Const_17 = (1'd1 ^ working_key[26]);

  always @(posedge ap_clk) begin
    if((Const_16 == ap_CS_fsm_state5) & (grp_encode_fu_232_il_o_ap_vld == Const_17)) begin
      il <= grp_encode_fu_232_il_o;
    end 
  end

  assign Const_18 = (1'd1 ^ working_key[27]);

  always @(posedge ap_clk) begin
    if(Const_18 == ap_CS_fsm_state4) begin
      test_data_load_1_reg_574 <= test_data_q1;
      test_data_load_reg_569 <= test_data_q0;
    end 
  end

  assign Const_19 = (1'd0 ^ working_key[28]);
  assign Const_20 = (1'd1 ^ working_key[29]);

  always @(*) begin
    if(((Const_19 == ap_CS_fsm_state2) ^ working_key[31]) == 1'b0) begin
      accumc_address0 = grp_reset_fu_387_accumc_address0;
    end else if(((Const_20 == ap_CS_fsm_state8) ^ working_key[30]) == 1'b1) begin
      accumc_address0 = 'bx;
    end else begin
      accumc_address0 = grp_decode_fu_315_accumc_address0;
    end
  end

  assign Const_21 = (1'd0 ^ working_key[32]);
  assign Const_22 = (1'd1 ^ working_key[33]);
  assign Const_23 = (1'd1 ^ working_key[34]);

  always @(*) begin
    if(((Const_21 == ap_CS_fsm_state2) ^ working_key[36]) == 1'b0) begin
      accumc_ce0 = grp_reset_fu_387_accumc_ce0;
    end else if(((Const_22 == ap_CS_fsm_state8) ^ working_key[35]) == 1'b1) begin
      accumc_ce0 = grp_decode_fu_315_accumc_ce0;
    end else begin
      accumc_ce0 = Const_23;
    end
  end

  assign Const_24 = (1'd1 ^ working_key[37]);
  assign Const_25 = (1'd0 ^ working_key[38]);

  always @(*) begin
    if(((Const_24 == ap_CS_fsm_state2) ^ working_key[40]) == 1'b0) begin
      accumc_d0 = grp_reset_fu_387_accumc_d0;
    end else if(((Const_25 == ap_CS_fsm_state8) ^ working_key[39]) == 1'b1) begin
      accumc_d0 = grp_decode_fu_315_accumc_d0;
    end else begin
      accumc_d0 = 'bx;
    end
  end

  assign Const_26 = (1'd0 ^ working_key[41]);
  assign Const_27 = (1'd1 ^ working_key[42]);
  assign Const_28 = (1'd1 ^ working_key[43]);

  always @(*) begin
    if(((Const_26 == ap_CS_fsm_state2) ^ working_key[45]) == 1'b0) begin
      accumc_we0 = grp_reset_fu_387_accumc_we0;
    end else if(((Const_27 == ap_CS_fsm_state8) ^ working_key[44]) == 1'b1) begin
      accumc_we0 = grp_decode_fu_315_accumc_we0;
    end else begin
      accumc_we0 = Const_28;
    end
  end

  assign Const_29 = (1'd1 ^ working_key[46]);
  assign Const_30 = (1'd1 ^ working_key[47]);

  always @(*) begin
    if(((Const_29 == ap_CS_fsm_state2) ^ working_key[49]) == 1'b1) begin
      accumd_address0 = grp_reset_fu_387_accumd_address0;
    end else if(((Const_30 == ap_CS_fsm_state8) ^ working_key[48]) == 1'b1) begin
      accumd_address0 = 'bx;
    end else begin
      accumd_address0 = grp_decode_fu_315_accumd_address0;
    end
  end

  assign Const_31 = (1'd1 ^ working_key[50]);
  assign Const_32 = (1'd0 ^ working_key[51]);
  assign Const_33 = (1'd0 ^ working_key[52]);

  always @(*) begin
    if(((Const_31 == ap_CS_fsm_state2) ^ working_key[54]) == 1'b1) begin
      accumd_ce0 = grp_reset_fu_387_accumd_ce0;
    end else if(((Const_32 == ap_CS_fsm_state8) ^ working_key[53]) == 1'b1) begin
      accumd_ce0 = Const_33;
    end else begin
      accumd_ce0 = grp_decode_fu_315_accumd_ce0;
    end
  end

  assign Const_34 = (1'd0 ^ working_key[55]);
  assign Const_35 = (1'd1 ^ working_key[56]);

  always @(*) begin
    if(((Const_34 == ap_CS_fsm_state2) ^ working_key[58]) == 1'b0) begin
      accumd_d0 = grp_reset_fu_387_accumd_d0;
    end else if(((Const_35 == ap_CS_fsm_state8) ^ working_key[57]) == 1'b1) begin
      accumd_d0 = 'bx;
    end else begin
      accumd_d0 = grp_decode_fu_315_accumd_d0;
    end
  end

  assign Const_36 = (1'd1 ^ working_key[59]);
  assign Const_37 = (1'd1 ^ working_key[60]);
  assign Const_38 = (1'd1 ^ working_key[61]);

  always @(*) begin
    if(((Const_36 == ap_CS_fsm_state2) ^ working_key[63]) == 1'b0) begin
      accumd_we0 = grp_reset_fu_387_accumd_we0;
    end else if(((Const_37 == ap_CS_fsm_state8) ^ working_key[62]) == 1'b1) begin
      accumd_we0 = grp_decode_fu_315_accumd_we0;
    end else begin
      accumd_we0 = Const_38;
    end
  end

  assign Const_39 = (1'd1 ^ working_key[64]);
  assign Const_40 = (1'd0 ^ working_key[65]);
  assign Const_41 = (1'd0 ^ working_key[66]);
  assign Const_42 = (1'd1 ^ working_key[67]);

  always @(*) begin
    if(((tmp_57_fu_519_p2 == Const_39) & (Const_40 == ap_CS_fsm_state6) ^ working_key[68]) == 1'b1) begin
      ap_done = Const_42;
    end else begin
      ap_done = Const_41;
    end
  end

  assign Const_43 = (1'd1 ^ working_key[69]);
  assign Const_44 = (1'd1 ^ working_key[70]);
  assign Const_45 = (1'd0 ^ working_key[71]);
  assign Const_46 = (1'd0 ^ working_key[72]);

  always @(*) begin
    if(((ap_start == Const_43) & (Const_44 == ap_CS_fsm_state1) ^ working_key[73]) == 1'b1) begin
      ap_idle = Const_46;
    end else begin
      ap_idle = Const_45;
    end
  end

  assign Const_47 = (1'd0 ^ working_key[74]);
  assign Const_48 = (1'd0 ^ working_key[75]);
  assign Const_49 = (1'd1 ^ working_key[76]);
  assign Const_50 = (1'd0 ^ working_key[77]);

  always @(*) begin
    if(((tmp_57_fu_519_p2 == Const_47) & (Const_48 == ap_CS_fsm_state6) ^ working_key[78]) == 1'b1) begin
      ap_ready = Const_50;
    end else begin
      ap_ready = Const_49;
    end
  end

  assign Const_51 = (1'd1 ^ working_key[79]);
  assign Const_52 = (1'd0 ^ working_key[80]);

  always @(*) begin
    if(((Const_51 == ap_CS_fsm_state6) ^ working_key[82]) == 1'b0) begin
      compressed_address0 = tmp_58_fu_535_p1;
    end else if(((Const_52 == ap_CS_fsm_state5) ^ working_key[81]) == 1'b1) begin
      compressed_address0 = tmp_56_fu_515_p1;
    end else begin
      compressed_address0 = 'bx;
    end
  end

  assign Const_53 = (1'd1 ^ working_key[83]);
  assign Const_54 = (1'd0 ^ working_key[84]);
  assign Const_55 = (1'd1 ^ working_key[85]);
  assign Const_56 = (1'd0 ^ working_key[86]);
  assign Const_57 = (1'd0 ^ working_key[87]);

  always @(*) begin
    if((((Const_53 == ap_CS_fsm_state6) | (grp_encode_fu_232_ap_done == Const_54) & (Const_55 == ap_CS_fsm_state5)) ^ working_key[88]) == 1'b1) begin
      compressed_ce0 = Const_57;
    end else begin
      compressed_ce0 = Const_56;
    end
  end

  assign Const_58 = (1'd1 ^ working_key[89]);
  assign Const_59 = (1'd0 ^ working_key[90]);
  assign Const_60 = (1'd1 ^ working_key[91]);
  assign Const_61 = (1'd1 ^ working_key[92]);

  always @(*) begin
    if(((grp_encode_fu_232_ap_done == Const_58) & (Const_59 == ap_CS_fsm_state5) ^ working_key[93]) == 1'b1) begin
      compressed_we0 = Const_60;
    end else begin
      compressed_we0 = Const_61;
    end
  end

  assign Const_62 = (1'd0 ^ working_key[94]);
  assign Const_63 = (1'd1 ^ working_key[95]);

  always @(*) begin
    if(((Const_62 == ap_CS_fsm_state2) ^ working_key[97]) == 1'b1) begin
      dec_del_bph_address0 = grp_reset_fu_387_dec_del_bph_address0;
    end else if(((Const_63 == ap_CS_fsm_state8) ^ working_key[96]) == 1'b1) begin
      dec_del_bph_address0 = 'bx;
    end else begin
      dec_del_bph_address0 = grp_decode_fu_315_dec_del_bph_address0;
    end
  end

  assign Const_64 = (1'd1 ^ working_key[98]);
  assign Const_65 = (1'd1 ^ working_key[99]);
  assign Const_66 = (1'd0 ^ working_key[100]);

  always @(*) begin
    if(((Const_64 == ap_CS_fsm_state2) ^ working_key[102]) == 1'b0) begin
      dec_del_bph_ce0 = grp_reset_fu_387_dec_del_bph_ce0;
    end else if(((Const_65 == ap_CS_fsm_state8) ^ working_key[101]) == 1'b1) begin
      dec_del_bph_ce0 = grp_decode_fu_315_dec_del_bph_ce0;
    end else begin
      dec_del_bph_ce0 = Const_66;
    end
  end

  assign Const_67 = (1'd1 ^ working_key[103]);
  assign Const_68 = (1'd0 ^ working_key[104]);

  always @(*) begin
    if(((Const_67 == ap_CS_fsm_state2) ^ working_key[106]) == 1'b0) begin
      dec_del_bph_d0 = grp_reset_fu_387_dec_del_bph_d0;
    end else if(((Const_68 == ap_CS_fsm_state8) ^ working_key[105]) == 1'b1) begin
      dec_del_bph_d0 = grp_decode_fu_315_dec_del_bph_d0;
    end else begin
      dec_del_bph_d0 = 'bx;
    end
  end

  assign Const_69 = (1'd1 ^ working_key[107]);
  assign Const_70 = (1'd0 ^ working_key[108]);
  assign Const_71 = (1'd0 ^ working_key[109]);

  always @(*) begin
    if(((Const_69 == ap_CS_fsm_state2) ^ working_key[111]) == 1'b1) begin
      dec_del_bph_we0 = grp_reset_fu_387_dec_del_bph_we0;
    end else if(((Const_70 == ap_CS_fsm_state8) ^ working_key[110]) == 1'b1) begin
      dec_del_bph_we0 = Const_71;
    end else begin
      dec_del_bph_we0 = grp_decode_fu_315_dec_del_bph_we0;
    end
  end

  assign Const_72 = (1'd0 ^ working_key[112]);
  assign Const_73 = (1'd1 ^ working_key[113]);

  always @(*) begin
    if(((Const_72 == ap_CS_fsm_state2) ^ working_key[115]) == 1'b1) begin
      dec_del_bpl_address0 = grp_reset_fu_387_dec_del_bpl_address0;
    end else if(((Const_73 == ap_CS_fsm_state8) ^ working_key[114]) == 1'b1) begin
      dec_del_bpl_address0 = 'bx;
    end else begin
      dec_del_bpl_address0 = grp_decode_fu_315_dec_del_bpl_address0;
    end
  end

  assign Const_74 = (1'd0 ^ working_key[116]);
  assign Const_75 = (1'd1 ^ working_key[117]);
  assign Const_76 = (1'd1 ^ working_key[118]);

  always @(*) begin
    if(((Const_74 == ap_CS_fsm_state2) ^ working_key[120]) == 1'b0) begin
      dec_del_bpl_ce0 = grp_reset_fu_387_dec_del_bpl_ce0;
    end else if(((Const_75 == ap_CS_fsm_state8) ^ working_key[119]) == 1'b1) begin
      dec_del_bpl_ce0 = grp_decode_fu_315_dec_del_bpl_ce0;
    end else begin
      dec_del_bpl_ce0 = Const_76;
    end
  end

  assign Const_77 = (1'd1 ^ working_key[121]);
  assign Const_78 = (1'd0 ^ working_key[122]);

  always @(*) begin
    if(((Const_77 == ap_CS_fsm_state2) ^ working_key[124]) == 1'b1) begin
      dec_del_bpl_d0 = grp_reset_fu_387_dec_del_bpl_d0;
    end else if(((Const_78 == ap_CS_fsm_state8) ^ working_key[123]) == 1'b1) begin
      dec_del_bpl_d0 = grp_decode_fu_315_dec_del_bpl_d0;
    end else begin
      dec_del_bpl_d0 = 'bx;
    end
  end

  assign Const_79 = (1'd0 ^ working_key[125]);
  assign Const_80 = (1'd0 ^ working_key[126]);
  assign Const_81 = (1'd0 ^ working_key[127]);

  always @(*) begin
    if(((Const_79 == ap_CS_fsm_state2) ^ working_key[129]) == 1'b0) begin
      dec_del_bpl_we0 = grp_reset_fu_387_dec_del_bpl_we0;
    end else if(((Const_80 == ap_CS_fsm_state8) ^ working_key[128]) == 1'b1) begin
      dec_del_bpl_we0 = grp_decode_fu_315_dec_del_bpl_we0;
    end else begin
      dec_del_bpl_we0 = Const_81;
    end
  end

  assign Const_82 = (1'd1 ^ working_key[130]);
  assign Const_83 = (1'd0 ^ working_key[131]);

  always @(*) begin
    if(((Const_82 == ap_CS_fsm_state2) ^ working_key[133]) == 1'b0) begin
      dec_del_dhx_address0 = grp_reset_fu_387_dec_del_dhx_address0;
    end else if(((Const_83 == ap_CS_fsm_state8) ^ working_key[132]) == 1'b1) begin
      dec_del_dhx_address0 = grp_decode_fu_315_dec_del_dhx_address0;
    end else begin
      dec_del_dhx_address0 = 'bx;
    end
  end

  assign Const_84 = (1'd1 ^ working_key[134]);
  assign Const_85 = (1'd0 ^ working_key[135]);
  assign Const_86 = (1'd1 ^ working_key[136]);

  always @(*) begin
    if(((Const_84 == ap_CS_fsm_state2) ^ working_key[138]) == 1'b0) begin
      dec_del_dhx_ce0 = grp_reset_fu_387_dec_del_dhx_ce0;
    end else if(((Const_85 == ap_CS_fsm_state8) ^ working_key[137]) == 1'b1) begin
      dec_del_dhx_ce0 = grp_decode_fu_315_dec_del_dhx_ce0;
    end else begin
      dec_del_dhx_ce0 = Const_86;
    end
  end

  assign Const_87 = (1'd1 ^ working_key[139]);
  assign Const_88 = (1'd1 ^ working_key[140]);

  always @(*) begin
    if(((Const_87 == ap_CS_fsm_state8) ^ working_key[141]) == 1'b1) begin
      dec_del_dhx_ce1 = grp_decode_fu_315_dec_del_dhx_ce1;
    end else begin
      dec_del_dhx_ce1 = Const_88;
    end
  end

  assign Const_89 = (1'd1 ^ working_key[142]);
  assign Const_90 = (1'd0 ^ working_key[143]);

  always @(*) begin
    if(((Const_89 == ap_CS_fsm_state2) ^ working_key[145]) == 1'b1) begin
      dec_del_dhx_d0 = grp_reset_fu_387_dec_del_dhx_d0;
    end else if(((Const_90 == ap_CS_fsm_state8) ^ working_key[144]) == 1'b1) begin
      dec_del_dhx_d0 = grp_decode_fu_315_dec_del_dhx_d0;
    end else begin
      dec_del_dhx_d0 = 'bx;
    end
  end

  assign Const_91 = (1'd0 ^ working_key[146]);
  assign Const_92 = (1'd1 ^ working_key[147]);
  assign Const_93 = (1'd1 ^ working_key[148]);

  always @(*) begin
    if(((Const_91 == ap_CS_fsm_state2) ^ working_key[150]) == 1'b0) begin
      dec_del_dhx_we0 = grp_reset_fu_387_dec_del_dhx_we0;
    end else if(((Const_92 == ap_CS_fsm_state8) ^ working_key[149]) == 1'b1) begin
      dec_del_dhx_we0 = grp_decode_fu_315_dec_del_dhx_we0;
    end else begin
      dec_del_dhx_we0 = Const_93;
    end
  end

  assign Const_94 = (1'd1 ^ working_key[151]);
  assign Const_95 = (1'd1 ^ working_key[152]);

  always @(*) begin
    if(((Const_94 == ap_CS_fsm_state8) ^ working_key[153]) == 1'b1) begin
      dec_del_dhx_we1 = Const_95;
    end else begin
      dec_del_dhx_we1 = grp_decode_fu_315_dec_del_dhx_we1;
    end
  end

  assign Const_96 = (1'd1 ^ working_key[154]);
  assign Const_97 = (1'd1 ^ working_key[155]);

  always @(*) begin
    if(((Const_96 == ap_CS_fsm_state2) ^ working_key[157]) == 1'b1) begin
      dec_del_dltx_address0 = grp_reset_fu_387_dec_del_dltx_address0;
    end else if(((Const_97 == ap_CS_fsm_state8) ^ working_key[156]) == 1'b1) begin
      dec_del_dltx_address0 = 'bx;
    end else begin
      dec_del_dltx_address0 = grp_decode_fu_315_dec_del_dltx_address0;
    end
  end

  assign Const_98 = (1'd0 ^ working_key[158]);
  assign Const_99 = (1'd0 ^ working_key[159]);
  assign Const_100 = (1'd1 ^ working_key[160]);

  always @(*) begin
    if(((Const_98 == ap_CS_fsm_state2) ^ working_key[162]) == 1'b0) begin
      dec_del_dltx_ce0 = grp_reset_fu_387_dec_del_dltx_ce0;
    end else if(((Const_99 == ap_CS_fsm_state8) ^ working_key[161]) == 1'b1) begin
      dec_del_dltx_ce0 = grp_decode_fu_315_dec_del_dltx_ce0;
    end else begin
      dec_del_dltx_ce0 = Const_100;
    end
  end

  assign Const_101 = (1'd1 ^ working_key[163]);
  assign Const_102 = (1'd1 ^ working_key[164]);

  always @(*) begin
    if(((Const_101 == ap_CS_fsm_state8) ^ working_key[165]) == 1'b1) begin
      dec_del_dltx_ce1 = grp_decode_fu_315_dec_del_dltx_ce1;
    end else begin
      dec_del_dltx_ce1 = Const_102;
    end
  end

  assign Const_103 = (1'd0 ^ working_key[166]);
  assign Const_104 = (1'd1 ^ working_key[167]);

  always @(*) begin
    if(((Const_103 == ap_CS_fsm_state2) ^ working_key[169]) == 1'b0) begin
      dec_del_dltx_d0 = grp_reset_fu_387_dec_del_dltx_d0;
    end else if(((Const_104 == ap_CS_fsm_state8) ^ working_key[168]) == 1'b1) begin
      dec_del_dltx_d0 = 'bx;
    end else begin
      dec_del_dltx_d0 = grp_decode_fu_315_dec_del_dltx_d0;
    end
  end

  assign Const_105 = (1'd1 ^ working_key[170]);
  assign Const_106 = (1'd0 ^ working_key[171]);
  assign Const_107 = (1'd0 ^ working_key[172]);

  always @(*) begin
    if(((Const_105 == ap_CS_fsm_state2) ^ working_key[174]) == 1'b1) begin
      dec_del_dltx_we0 = grp_reset_fu_387_dec_del_dltx_we0;
    end else if(((Const_106 == ap_CS_fsm_state8) ^ working_key[173]) == 1'b1) begin
      dec_del_dltx_we0 = Const_107;
    end else begin
      dec_del_dltx_we0 = grp_decode_fu_315_dec_del_dltx_we0;
    end
  end

  assign Const_108 = (1'd1 ^ working_key[175]);
  assign Const_109 = (1'd1 ^ working_key[176]);

  always @(*) begin
    if(((Const_108 == ap_CS_fsm_state8) ^ working_key[177]) == 1'b1) begin
      dec_del_dltx_we1 = grp_decode_fu_315_dec_del_dltx_we1;
    end else begin
      dec_del_dltx_we1 = Const_109;
    end
  end

  assign Const_110 = (1'd1 ^ working_key[178]);
  assign Const_111 = (1'd0 ^ working_key[179]);

  always @(*) begin
    if(((Const_110 == ap_CS_fsm_state2) ^ working_key[181]) == 1'b0) begin
      delay_bph_address0 = grp_reset_fu_387_delay_bph_address0;
    end else if(((Const_111 == ap_CS_fsm_state5) ^ working_key[180]) == 1'b1) begin
      delay_bph_address0 = grp_encode_fu_232_delay_bph_address0;
    end else begin
      delay_bph_address0 = 'bx;
    end
  end

  assign Const_112 = (1'd1 ^ working_key[182]);
  assign Const_113 = (1'd0 ^ working_key[183]);
  assign Const_114 = (1'd0 ^ working_key[184]);

  always @(*) begin
    if(((Const_112 == ap_CS_fsm_state2) ^ working_key[186]) == 1'b0) begin
      delay_bph_ce0 = grp_reset_fu_387_delay_bph_ce0;
    end else if(((Const_113 == ap_CS_fsm_state5) ^ working_key[185]) == 1'b1) begin
      delay_bph_ce0 = Const_114;
    end else begin
      delay_bph_ce0 = grp_encode_fu_232_delay_bph_ce0;
    end
  end

  assign Const_115 = (1'd1 ^ working_key[187]);
  assign Const_116 = (1'd1 ^ working_key[188]);

  always @(*) begin
    if(((Const_115 == ap_CS_fsm_state2) ^ working_key[190]) == 1'b1) begin
      delay_bph_d0 = grp_reset_fu_387_delay_bph_d0;
    end else if(((Const_116 == ap_CS_fsm_state5) ^ working_key[189]) == 1'b1) begin
      delay_bph_d0 = 'bx;
    end else begin
      delay_bph_d0 = grp_encode_fu_232_delay_bph_d0;
    end
  end

  assign Const_117 = (1'd0 ^ working_key[191]);
  assign Const_118 = (1'd0 ^ working_key[192]);
  assign Const_119 = (1'd1 ^ working_key[193]);

  always @(*) begin
    if(((Const_117 == ap_CS_fsm_state2) ^ working_key[195]) == 1'b0) begin
      delay_bph_we0 = grp_reset_fu_387_delay_bph_we0;
    end else if(((Const_118 == ap_CS_fsm_state5) ^ working_key[194]) == 1'b1) begin
      delay_bph_we0 = Const_119;
    end else begin
      delay_bph_we0 = grp_encode_fu_232_delay_bph_we0;
    end
  end

  assign Const_120 = (1'd0 ^ working_key[196]);
  assign Const_121 = (1'd0 ^ working_key[197]);

  always @(*) begin
    if(((Const_120 == ap_CS_fsm_state2) ^ working_key[199]) == 1'b0) begin
      delay_bpl_address0 = grp_reset_fu_387_delay_bpl_address0;
    end else if(((Const_121 == ap_CS_fsm_state5) ^ working_key[198]) == 1'b1) begin
      delay_bpl_address0 = grp_encode_fu_232_delay_bpl_address0;
    end else begin
      delay_bpl_address0 = 'bx;
    end
  end

  assign Const_122 = (1'd1 ^ working_key[200]);
  assign Const_123 = (1'd0 ^ working_key[201]);
  assign Const_124 = (1'd0 ^ working_key[202]);

  always @(*) begin
    if(((Const_122 == ap_CS_fsm_state2) ^ working_key[204]) == 1'b1) begin
      delay_bpl_ce0 = grp_reset_fu_387_delay_bpl_ce0;
    end else if(((Const_123 == ap_CS_fsm_state5) ^ working_key[203]) == 1'b1) begin
      delay_bpl_ce0 = Const_124;
    end else begin
      delay_bpl_ce0 = grp_encode_fu_232_delay_bpl_ce0;
    end
  end

  assign Const_125 = (1'd1 ^ working_key[205]);
  assign Const_126 = (1'd0 ^ working_key[206]);

  always @(*) begin
    if(((Const_125 == ap_CS_fsm_state2) ^ working_key[208]) == 1'b0) begin
      delay_bpl_d0 = grp_reset_fu_387_delay_bpl_d0;
    end else if(((Const_126 == ap_CS_fsm_state5) ^ working_key[207]) == 1'b1) begin
      delay_bpl_d0 = grp_encode_fu_232_delay_bpl_d0;
    end else begin
      delay_bpl_d0 = 'bx;
    end
  end

  assign Const_127 = (1'd1 ^ working_key[209]);
  assign Const_128 = (1'd0 ^ working_key[210]);
  assign Const_129 = (1'd0 ^ working_key[211]);

  always @(*) begin
    if(((Const_127 == ap_CS_fsm_state2) ^ working_key[213]) == 1'b1) begin
      delay_bpl_we0 = grp_reset_fu_387_delay_bpl_we0;
    end else if(((Const_128 == ap_CS_fsm_state5) ^ working_key[212]) == 1'b1) begin
      delay_bpl_we0 = Const_129;
    end else begin
      delay_bpl_we0 = grp_encode_fu_232_delay_bpl_we0;
    end
  end

  assign Const_130 = (1'd0 ^ working_key[214]);
  assign Const_131 = (1'd1 ^ working_key[215]);

  always @(*) begin
    if(((Const_130 == ap_CS_fsm_state2) ^ working_key[217]) == 1'b1) begin
      delay_dhx_address0 = grp_reset_fu_387_delay_dhx_address0;
    end else if(((Const_131 == ap_CS_fsm_state5) ^ working_key[216]) == 1'b1) begin
      delay_dhx_address0 = 'bx;
    end else begin
      delay_dhx_address0 = grp_encode_fu_232_delay_dhx_address0;
    end
  end

  assign Const_132 = (1'd0 ^ working_key[218]);
  assign Const_133 = (1'd1 ^ working_key[219]);
  assign Const_134 = (1'd1 ^ working_key[220]);

  always @(*) begin
    if(((Const_132 == ap_CS_fsm_state2) ^ working_key[222]) == 1'b0) begin
      delay_dhx_ce0 = grp_reset_fu_387_delay_dhx_ce0;
    end else if(((Const_133 == ap_CS_fsm_state5) ^ working_key[221]) == 1'b1) begin
      delay_dhx_ce0 = grp_encode_fu_232_delay_dhx_ce0;
    end else begin
      delay_dhx_ce0 = Const_134;
    end
  end

  assign Const_135 = (1'd1 ^ working_key[223]);
  assign Const_136 = (1'd1 ^ working_key[224]);

  always @(*) begin
    if(((Const_135 == ap_CS_fsm_state5) ^ working_key[225]) == 1'b1) begin
      delay_dhx_ce1 = grp_encode_fu_232_delay_dhx_ce1;
    end else begin
      delay_dhx_ce1 = Const_136;
    end
  end

  assign Const_137 = (1'd1 ^ working_key[226]);
  assign Const_138 = (1'd1 ^ working_key[227]);

  always @(*) begin
    if(((Const_137 == ap_CS_fsm_state2) ^ working_key[229]) == 1'b1) begin
      delay_dhx_d0 = grp_reset_fu_387_delay_dhx_d0;
    end else if(((Const_138 == ap_CS_fsm_state5) ^ working_key[228]) == 1'b1) begin
      delay_dhx_d0 = grp_encode_fu_232_delay_dhx_d0;
    end else begin
      delay_dhx_d0 = 'bx;
    end
  end

  assign Const_139 = (1'd0 ^ working_key[230]);
  assign Const_140 = (1'd1 ^ working_key[231]);
  assign Const_141 = (1'd1 ^ working_key[232]);

  always @(*) begin
    if(((Const_139 == ap_CS_fsm_state2) ^ working_key[234]) == 1'b0) begin
      delay_dhx_we0 = grp_reset_fu_387_delay_dhx_we0;
    end else if(((Const_140 == ap_CS_fsm_state5) ^ working_key[233]) == 1'b1) begin
      delay_dhx_we0 = grp_encode_fu_232_delay_dhx_we0;
    end else begin
      delay_dhx_we0 = Const_141;
    end
  end

  assign Const_142 = (1'd1 ^ working_key[235]);
  assign Const_143 = (1'd1 ^ working_key[236]);

  always @(*) begin
    if(((Const_142 == ap_CS_fsm_state5) ^ working_key[237]) == 1'b1) begin
      delay_dhx_we1 = grp_encode_fu_232_delay_dhx_we1;
    end else begin
      delay_dhx_we1 = Const_143;
    end
  end

  assign Const_144 = (1'd0 ^ working_key[238]);
  assign Const_145 = (1'd1 ^ working_key[239]);

  always @(*) begin
    if(((Const_144 == ap_CS_fsm_state2) ^ working_key[241]) == 1'b1) begin
      delay_dltx_address0 = grp_reset_fu_387_delay_dltx_address0;
    end else if(((Const_145 == ap_CS_fsm_state5) ^ working_key[240]) == 1'b1) begin
      delay_dltx_address0 = 'bx;
    end else begin
      delay_dltx_address0 = grp_encode_fu_232_delay_dltx_address0;
    end
  end

  assign Const_146 = (1'd0 ^ working_key[242]);
  assign Const_147 = (1'd1 ^ working_key[243]);
  assign Const_148 = (1'd1 ^ working_key[244]);

  always @(*) begin
    if(((Const_146 == ap_CS_fsm_state2) ^ working_key[246]) == 1'b0) begin
      delay_dltx_ce0 = grp_reset_fu_387_delay_dltx_ce0;
    end else if(((Const_147 == ap_CS_fsm_state5) ^ working_key[245]) == 1'b1) begin
      delay_dltx_ce0 = grp_encode_fu_232_delay_dltx_ce0;
    end else begin
      delay_dltx_ce0 = Const_148;
    end
  end

  assign Const_149 = (1'd1 ^ working_key[247]);
  assign Const_150 = (1'd1 ^ working_key[248]);

  always @(*) begin
    if(((Const_149 == ap_CS_fsm_state5) ^ working_key[249]) == 1'b1) begin
      delay_dltx_ce1 = grp_encode_fu_232_delay_dltx_ce1;
    end else begin
      delay_dltx_ce1 = Const_150;
    end
  end

  assign Const_151 = (1'd0 ^ working_key[250]);
  assign Const_152 = (1'd1 ^ working_key[251]);

  always @(*) begin
    if(((Const_151 == ap_CS_fsm_state2) ^ working_key[253]) == 1'b0) begin
      delay_dltx_d0 = grp_reset_fu_387_delay_dltx_d0;
    end else if(((Const_152 == ap_CS_fsm_state5) ^ working_key[252]) == 1'b1) begin
      delay_dltx_d0 = grp_encode_fu_232_delay_dltx_d0;
    end else begin
      delay_dltx_d0 = 'bx;
    end
  end

  assign Const_153 = (1'd0 ^ working_key[254]);
  assign Const_154 = (1'd1 ^ working_key[255]);
  assign Const_155 = (1'd1 ^ working_key[256]);

  always @(*) begin
    if(((Const_153 == ap_CS_fsm_state2) ^ working_key[258]) == 1'b0) begin
      delay_dltx_we0 = grp_reset_fu_387_delay_dltx_we0;
    end else if(((Const_154 == ap_CS_fsm_state5) ^ working_key[257]) == 1'b1) begin
      delay_dltx_we0 = Const_155;
    end else begin
      delay_dltx_we0 = grp_encode_fu_232_delay_dltx_we0;
    end
  end

  assign Const_156 = (1'd0 ^ working_key[259]);
  assign Const_157 = (1'd0 ^ working_key[260]);

  always @(*) begin
    if(((Const_156 == ap_CS_fsm_state5) ^ working_key[261]) == 1'b1) begin
      delay_dltx_we1 = Const_157;
    end else begin
      delay_dltx_we1 = grp_encode_fu_232_delay_dltx_we1;
    end
  end

  assign Const_158 = (1'd1 ^ working_key[262]);
  assign Const_159 = (1'd0 ^ working_key[263]);
  assign Const_160 = (1'd1 ^ working_key[264]);

  always @(*) begin
    if(((Const_158 == ap_CS_fsm_state3) ^ working_key[265]) == 1'b1) begin
      test_data_ce0 = Const_159;
    end else begin
      test_data_ce0 = Const_160;
    end
  end

  assign Const_161 = (1'd0 ^ working_key[266]);
  assign Const_162 = (1'd1 ^ working_key[267]);
  assign Const_163 = (1'd1 ^ working_key[268]);

  always @(*) begin
    if(((Const_161 == ap_CS_fsm_state3) ^ working_key[269]) == 1'b1) begin
      test_data_ce1 = Const_162;
    end else begin
      test_data_ce1 = Const_163;
    end
  end

  assign Const_164 = (1'd1 ^ working_key[270]);
  assign Const_165 = (1'd0 ^ working_key[271]);

  always @(*) begin
    if(((Const_164 == ap_CS_fsm_state2) ^ working_key[273]) == 1'b1) begin
      tqmf_address0 = grp_reset_fu_387_tqmf_address0;
    end else if(((Const_165 == ap_CS_fsm_state5) ^ working_key[272]) == 1'b1) begin
      tqmf_address0 = grp_encode_fu_232_tqmf_address0;
    end else begin
      tqmf_address0 = 'bx;
    end
  end

  assign Const_166 = (1'd0 ^ working_key[274]);
  assign Const_167 = (1'd1 ^ working_key[275]);
  assign Const_168 = (1'd1 ^ working_key[276]);

  always @(*) begin
    if(((Const_166 == ap_CS_fsm_state2) ^ working_key[278]) == 1'b0) begin
      tqmf_ce0 = grp_reset_fu_387_tqmf_ce0;
    end else if(((Const_167 == ap_CS_fsm_state5) ^ working_key[277]) == 1'b1) begin
      tqmf_ce0 = grp_encode_fu_232_tqmf_ce0;
    end else begin
      tqmf_ce0 = Const_168;
    end
  end

  assign Const_169 = (1'd1 ^ working_key[279]);
  assign Const_170 = (1'd1 ^ working_key[280]);

  always @(*) begin
    if(((Const_169 == ap_CS_fsm_state5) ^ working_key[281]) == 1'b1) begin
      tqmf_ce1 = Const_170;
    end else begin
      tqmf_ce1 = grp_encode_fu_232_tqmf_ce1;
    end
  end

  assign Const_171 = (1'd1 ^ working_key[282]);
  assign Const_172 = (1'd1 ^ working_key[283]);

  always @(*) begin
    if(((Const_171 == ap_CS_fsm_state2) ^ working_key[285]) == 1'b1) begin
      tqmf_d0 = grp_reset_fu_387_tqmf_d0;
    end else if(((Const_172 == ap_CS_fsm_state5) ^ working_key[284]) == 1'b1) begin
      tqmf_d0 = 'bx;
    end else begin
      tqmf_d0 = grp_encode_fu_232_tqmf_d0;
    end
  end

  assign Const_173 = (1'd0 ^ working_key[286]);
  assign Const_174 = (1'd0 ^ working_key[287]);
  assign Const_175 = (1'd1 ^ working_key[288]);

  always @(*) begin
    if(((Const_173 == ap_CS_fsm_state2) ^ working_key[290]) == 1'b0) begin
      tqmf_we0 = grp_reset_fu_387_tqmf_we0;
    end else if(((Const_174 == ap_CS_fsm_state5) ^ working_key[289]) == 1'b1) begin
      tqmf_we0 = grp_encode_fu_232_tqmf_we0;
    end else begin
      tqmf_we0 = Const_175;
    end
  end

  assign Const_176 = (1'd1 ^ working_key[291]);
  assign Const_177 = (1'd1 ^ working_key[292]);

  always @(*) begin
    if(((Const_176 == ap_CS_fsm_state5) ^ working_key[293]) == 1'b1) begin
      tqmf_we1 = grp_encode_fu_232_tqmf_we1;
    end else begin
      tqmf_we1 = Const_177;
    end
  end

  assign Const_178 = (1'd0 ^ working_key[294]);
  assign Const_179 = (1'd1 ^ working_key[295]);
  assign Const_180 = (1'd1 ^ working_key[297]);
  assign Const_181 = (1'd1 ^ working_key[298]);
  assign Const_182 = (1'd1 ^ working_key[300]);
  assign Const_183 = (1'd0 ^ working_key[301]);
  assign Const_184 = (1'd0 ^ working_key[303]);
  assign Const_185 = (1'd0 ^ working_key[304]);
  assign Const_186 = (1'd1 ^ working_key[306]);
  assign Const_187 = (1'd0 ^ working_key[307]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_178 == ap_CS_fsm_state1) & (ap_start == Const_179) ^ working_key[296]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        if((grp_reset_fu_387_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state3: begin
        if(((tmp_fu_477_p2 == Const_180) & (Const_181 == ap_CS_fsm_state3) ^ working_key[299]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        if(((grp_encode_fu_232_ap_done == Const_182) & (Const_183 == ap_CS_fsm_state5) ^ working_key[302]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state6: begin
        if(((tmp_57_fu_519_p2 == Const_184) & (Const_185 == ap_CS_fsm_state6) ^ working_key[305]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        if(((grp_decode_fu_315_ap_done == Const_186) & (Const_187 == ap_CS_fsm_state8) ^ working_key[308]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign grp_decode_fu_315_ap_start = grp_decode_fu_315_ap_start_reg;
  assign grp_encode_fu_232_ap_start = grp_encode_fu_232_ap_start_reg;
  assign grp_reset_fu_387_ap_start = grp_reset_fu_387_ap_start_reg;
  assign Const_188 = (7'd55 ^ working_key[315:309]);
  assign i_10_fu_509_p2 = (working_key[316] == 1'b1)? i_reg_210 >> Const_188 : i_reg_210 + Const_188;
  assign Const_189 = (7'd127 ^ working_key[323:317]);
  assign i_11_fu_540_p2 = (working_key[324] == 1'b1)? i_1_reg_221 + Const_189 : i_1_reg_221 >> Const_189;
  assign p_lshr_f6_cast_fu_525_p4 = { { i_1_reg_221[6:1] } };
  assign test_data_address0 = tmp_s_fu_483_p1;
  assign test_data_address1 = tmp_54_fu_494_p1;
  assign Const_190 = (7'd84 ^ working_key[331:325]);
  assign tmp_53_fu_488_p2 = (working_key[332] == 1'b1)? i_reg_210 >> Const_190 : i_reg_210 | Const_190;
  assign tmp_54_fu_494_p1 = tmp_53_fu_488_p2;
  assign tmp_56_fu_515_p1 = p_lshr_f_cast_reg_559;
  assign Const_191 = (7'd78 ^ working_key[339:333]);
  assign Const_192 = (1'd1 ^ working_key[341]);
  assign Const_193 = (1'd1 ^ working_key[342]);
  assign tmp_57_fu_519_p2 = ((((working_key[340] == 1'b1)? i_1_reg_221 < Const_191 : i_1_reg_221 != Const_191) ^ working_key[343]) == 1'b1)? Const_192 : Const_193;
  assign tmp_58_fu_535_p1 = p_lshr_f6_cast_fu_525_p4;
  assign Const_194 = (7'd49 ^ working_key[350:344]);
  assign Const_195 = (1'd0 ^ working_key[352]);
  assign Const_196 = (1'd0 ^ working_key[353]);
  assign tmp_fu_477_p2 = ((((working_key[351] == 1'b1)? i_reg_210 === Const_194 : i_reg_210 < Const_194) ^ working_key[354]) == 1'b1)? Const_195 : Const_196;
  assign tmp_s_fu_483_p1 = i_reg_210;
  assign working_key = { locking_key[354:0] };

endmodule

