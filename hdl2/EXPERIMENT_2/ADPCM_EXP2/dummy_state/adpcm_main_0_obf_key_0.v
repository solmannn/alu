
module adpcm_main
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  working_key
);

  parameter ap_ST_fsm_state1 = 9'd1;
  parameter ap_ST_fsm_state2 = 9'd2;
  parameter ap_ST_fsm_state3 = 9'd4;
  parameter ap_ST_fsm_state4 = 9'd8;
  parameter ap_ST_fsm_state5 = 9'd16;
  parameter ap_ST_fsm_state6 = 9'd32;
  parameter ap_ST_fsm_state7 = 9'd64;
  parameter ap_ST_fsm_state8 = 9'd128;
  parameter ap_ST_fsm_state9 = 9'd256;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] working_key;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [8:0] ap_CS_fsm;
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
  wire ap_CS_fsm_state9;
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
  reg [8:0] ap_NS_fsm;

  initial begin
    #0 ap_CS_fsm = 9'd1;
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
    .working_key(working_key)
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
    .working_key(working_key)
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
    .working_key(working_key)
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
    end else if(1'd1 == ap_CS_fsm_state9) begin
      dec_ah2 <= grp_decode_fu_315_dec_al2_o;
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


  always @(posedge ap_clk) begin
    if((tmp_fu_477_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      i_1_reg_221 <= 7'd0;
    end else if((grp_decode_fu_315_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state8)) begin
      i_1_reg_221 <= i_11_reg_587;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_encode_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
      i_reg_210 <= i_10_reg_564;
    end else if((grp_reset_fu_387_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2)) begin
      i_reg_210 <= 7'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (grp_decode_fu_315_ih_o_ap_vld == 1'b1)) begin
      ih <= grp_decode_fu_315_ih_o;
    end else if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_ih_o_ap_vld == 1'b1)) begin
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


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state7) begin
      compressed_load_reg_592 <= compressed_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_477_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
      i_10_reg_564 <= i_10_fu_509_p2;
      p_lshr_f_cast_reg_559 <= { { i_reg_210[6:1] } };
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_57_fu_519_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state6)) begin
      i_11_reg_587 <= i_11_fu_540_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (grp_encode_fu_232_il_o_ap_vld == 1'b1)) begin
      il <= grp_encode_fu_232_il_o;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      test_data_load_1_reg_574 <= test_data_q1;
      test_data_load_reg_569 <= test_data_q0;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumc_address0 = grp_reset_fu_387_accumc_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumc_address0 = grp_decode_fu_315_accumc_address0;
    end else begin
      accumc_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumc_ce0 = grp_reset_fu_387_accumc_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumc_ce0 = grp_decode_fu_315_accumc_ce0;
    end else begin
      accumc_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumc_d0 = grp_reset_fu_387_accumc_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumc_d0 = grp_decode_fu_315_accumc_d0;
    end else begin
      accumc_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumc_we0 = grp_reset_fu_387_accumc_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumc_we0 = grp_decode_fu_315_accumc_we0;
    end else begin
      accumc_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumd_address0 = grp_reset_fu_387_accumd_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumd_address0 = grp_decode_fu_315_accumd_address0;
    end else begin
      accumd_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumd_ce0 = grp_reset_fu_387_accumd_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumd_ce0 = grp_decode_fu_315_accumd_ce0;
    end else begin
      accumd_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumd_d0 = grp_reset_fu_387_accumd_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumd_d0 = grp_decode_fu_315_accumd_d0;
    end else begin
      accumd_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      accumd_we0 = grp_reset_fu_387_accumd_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      accumd_we0 = grp_decode_fu_315_accumd_we0;
    end else begin
      accumd_we0 = 1'b0;
    end
  end


  always @(*) begin
    if((tmp_57_fu_519_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) begin
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
    if((tmp_57_fu_519_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      compressed_address0 = tmp_58_fu_535_p1;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      compressed_address0 = tmp_56_fu_515_p1;
    end else begin
      compressed_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state6) | (grp_encode_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
      compressed_ce0 = 1'b1;
    end else begin
      compressed_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((grp_encode_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
      compressed_we0 = 1'b1;
    end else begin
      compressed_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bph_address0 = grp_reset_fu_387_dec_del_bph_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bph_address0 = grp_decode_fu_315_dec_del_bph_address0;
    end else begin
      dec_del_bph_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bph_ce0 = grp_reset_fu_387_dec_del_bph_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bph_ce0 = grp_decode_fu_315_dec_del_bph_ce0;
    end else begin
      dec_del_bph_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bph_d0 = grp_reset_fu_387_dec_del_bph_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bph_d0 = grp_decode_fu_315_dec_del_bph_d0;
    end else begin
      dec_del_bph_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bph_we0 = grp_reset_fu_387_dec_del_bph_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bph_we0 = grp_decode_fu_315_dec_del_bph_we0;
    end else begin
      dec_del_bph_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bpl_address0 = grp_reset_fu_387_dec_del_bpl_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bpl_address0 = grp_decode_fu_315_dec_del_bpl_address0;
    end else begin
      dec_del_bpl_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bpl_ce0 = grp_reset_fu_387_dec_del_bpl_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bpl_ce0 = grp_decode_fu_315_dec_del_bpl_ce0;
    end else begin
      dec_del_bpl_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bpl_d0 = grp_reset_fu_387_dec_del_bpl_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bpl_d0 = grp_decode_fu_315_dec_del_bpl_d0;
    end else begin
      dec_del_bpl_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_bpl_we0 = grp_reset_fu_387_dec_del_bpl_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_bpl_we0 = grp_decode_fu_315_dec_del_bpl_we0;
    end else begin
      dec_del_bpl_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dhx_address0 = grp_reset_fu_387_dec_del_dhx_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_address0 = grp_decode_fu_315_dec_del_dhx_address0;
    end else begin
      dec_del_dhx_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dhx_ce0 = grp_reset_fu_387_dec_del_dhx_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_ce0 = grp_decode_fu_315_dec_del_dhx_ce0;
    end else begin
      dec_del_dhx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_ce1 = grp_decode_fu_315_dec_del_dhx_ce1;
    end else begin
      dec_del_dhx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dhx_d0 = grp_reset_fu_387_dec_del_dhx_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_d0 = grp_decode_fu_315_dec_del_dhx_d0;
    end else begin
      dec_del_dhx_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dhx_we0 = grp_reset_fu_387_dec_del_dhx_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_we0 = grp_decode_fu_315_dec_del_dhx_we0;
    end else begin
      dec_del_dhx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dhx_we1 = grp_decode_fu_315_dec_del_dhx_we1;
    end else begin
      dec_del_dhx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dltx_address0 = grp_reset_fu_387_dec_del_dltx_address0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_address0 = grp_decode_fu_315_dec_del_dltx_address0;
    end else begin
      dec_del_dltx_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dltx_ce0 = grp_reset_fu_387_dec_del_dltx_ce0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_ce0 = grp_decode_fu_315_dec_del_dltx_ce0;
    end else begin
      dec_del_dltx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_ce1 = grp_decode_fu_315_dec_del_dltx_ce1;
    end else begin
      dec_del_dltx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dltx_d0 = grp_reset_fu_387_dec_del_dltx_d0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_d0 = grp_decode_fu_315_dec_del_dltx_d0;
    end else begin
      dec_del_dltx_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      dec_del_dltx_we0 = grp_reset_fu_387_dec_del_dltx_we0;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_we0 = grp_decode_fu_315_dec_del_dltx_we0;
    end else begin
      dec_del_dltx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      dec_del_dltx_we1 = grp_decode_fu_315_dec_del_dltx_we1;
    end else begin
      dec_del_dltx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bph_address0 = grp_reset_fu_387_delay_bph_address0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bph_address0 = grp_encode_fu_232_delay_bph_address0;
    end else begin
      delay_bph_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bph_ce0 = grp_reset_fu_387_delay_bph_ce0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bph_ce0 = grp_encode_fu_232_delay_bph_ce0;
    end else begin
      delay_bph_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bph_d0 = grp_reset_fu_387_delay_bph_d0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bph_d0 = grp_encode_fu_232_delay_bph_d0;
    end else begin
      delay_bph_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bph_we0 = grp_reset_fu_387_delay_bph_we0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bph_we0 = grp_encode_fu_232_delay_bph_we0;
    end else begin
      delay_bph_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bpl_address0 = grp_reset_fu_387_delay_bpl_address0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bpl_address0 = grp_encode_fu_232_delay_bpl_address0;
    end else begin
      delay_bpl_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bpl_ce0 = grp_reset_fu_387_delay_bpl_ce0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bpl_ce0 = grp_encode_fu_232_delay_bpl_ce0;
    end else begin
      delay_bpl_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bpl_d0 = grp_reset_fu_387_delay_bpl_d0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bpl_d0 = grp_encode_fu_232_delay_bpl_d0;
    end else begin
      delay_bpl_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_bpl_we0 = grp_reset_fu_387_delay_bpl_we0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_bpl_we0 = grp_encode_fu_232_delay_bpl_we0;
    end else begin
      delay_bpl_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dhx_address0 = grp_reset_fu_387_delay_dhx_address0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_address0 = grp_encode_fu_232_delay_dhx_address0;
    end else begin
      delay_dhx_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dhx_ce0 = grp_reset_fu_387_delay_dhx_ce0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_ce0 = grp_encode_fu_232_delay_dhx_ce0;
    end else begin
      delay_dhx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_ce1 = grp_encode_fu_232_delay_dhx_ce1;
    end else begin
      delay_dhx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dhx_d0 = grp_reset_fu_387_delay_dhx_d0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_d0 = grp_encode_fu_232_delay_dhx_d0;
    end else begin
      delay_dhx_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dhx_we0 = grp_reset_fu_387_delay_dhx_we0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_we0 = grp_encode_fu_232_delay_dhx_we0;
    end else begin
      delay_dhx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      delay_dhx_we1 = grp_encode_fu_232_delay_dhx_we1;
    end else begin
      delay_dhx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dltx_address0 = grp_reset_fu_387_delay_dltx_address0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_address0 = grp_encode_fu_232_delay_dltx_address0;
    end else begin
      delay_dltx_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dltx_ce0 = grp_reset_fu_387_delay_dltx_ce0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_ce0 = grp_encode_fu_232_delay_dltx_ce0;
    end else begin
      delay_dltx_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_ce1 = grp_encode_fu_232_delay_dltx_ce1;
    end else begin
      delay_dltx_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dltx_d0 = grp_reset_fu_387_delay_dltx_d0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_d0 = grp_encode_fu_232_delay_dltx_d0;
    end else begin
      delay_dltx_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      delay_dltx_we0 = grp_reset_fu_387_delay_dltx_we0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_we0 = grp_encode_fu_232_delay_dltx_we0;
    end else begin
      delay_dltx_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      delay_dltx_we1 = grp_encode_fu_232_delay_dltx_we1;
    end else begin
      delay_dltx_we1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      test_data_ce0 = 1'b1;
    end else begin
      test_data_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      test_data_ce1 = 1'b1;
    end else begin
      test_data_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      tqmf_address0 = grp_reset_fu_387_tqmf_address0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_address0 = grp_encode_fu_232_tqmf_address0;
    end else begin
      tqmf_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      tqmf_ce0 = grp_reset_fu_387_tqmf_ce0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_ce0 = grp_encode_fu_232_tqmf_ce0;
    end else begin
      tqmf_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_ce1 = grp_encode_fu_232_tqmf_ce1;
    end else begin
      tqmf_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      tqmf_d0 = grp_reset_fu_387_tqmf_d0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_d0 = grp_encode_fu_232_tqmf_d0;
    end else begin
      tqmf_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      tqmf_we0 = grp_reset_fu_387_tqmf_we0;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_we0 = grp_encode_fu_232_tqmf_we0;
    end else begin
      tqmf_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      tqmf_we1 = grp_encode_fu_232_tqmf_we1;
    end else begin
      tqmf_we1 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
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
        if((tmp_fu_477_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        if(working_key[0] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state9;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if((grp_encode_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state6: begin
        if((tmp_57_fu_519_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        if((grp_decode_fu_315_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state8)) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
      ap_ST_fsm_state9: begin
        if(working_key[1] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
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
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign grp_decode_fu_315_ap_start = grp_decode_fu_315_ap_start_reg;
  assign grp_encode_fu_232_ap_start = grp_encode_fu_232_ap_start_reg;
  assign grp_reset_fu_387_ap_start = grp_reset_fu_387_ap_start_reg;
  assign i_10_fu_509_p2 = i_reg_210 + 7'd2;
  assign i_11_fu_540_p2 = i_1_reg_221 + 7'd2;
  assign p_lshr_f6_cast_fu_525_p4 = { { i_1_reg_221[6:1] } };
  assign test_data_address0 = tmp_s_fu_483_p1;
  assign test_data_address1 = tmp_54_fu_494_p1;
  assign tmp_53_fu_488_p2 = i_reg_210 | 7'd1;
  assign tmp_54_fu_494_p1 = tmp_53_fu_488_p2;
  assign tmp_56_fu_515_p1 = p_lshr_f_cast_reg_559;
  assign tmp_57_fu_519_p2 = (i_1_reg_221 < 7'd100)? 1'b1 : 1'b0;
  assign tmp_58_fu_535_p1 = p_lshr_f6_cast_fu_525_p4;
  assign tmp_fu_477_p2 = (i_reg_210 < 7'd100)? 1'b1 : 1'b0;
  assign tmp_s_fu_483_p1 = i_reg_210;

endmodule

