
module viterbi_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  Obs_address0,
  Obs_ce0,
  Obs_q0,
  transMat_address0,
  transMat_ce0,
  transMat_q0,
  obsLik_address0,
  obsLik_ce0,
  obsLik_q0,
  v_address0,
  v_ce0,
  v_we0,
  v_d0,
  v_q0,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 17'd1;
  parameter ap_ST_fsm_state2 = 17'd2;
  parameter ap_ST_fsm_state3 = 17'd4;
  parameter ap_ST_fsm_state4 = 17'd8;
  parameter ap_ST_fsm_state5 = 17'd16;
  parameter ap_ST_fsm_state6 = 17'd32;
  parameter ap_ST_fsm_state7 = 17'd64;
  parameter ap_ST_fsm_state8 = 17'd128;
  parameter ap_ST_fsm_state9 = 17'd256;
  parameter ap_ST_fsm_state10 = 17'd512;
  parameter ap_ST_fsm_state11 = 17'd1024;
  parameter ap_ST_fsm_state12 = 17'd2048;
  parameter ap_ST_fsm_state13 = 17'd4096;
  parameter ap_ST_fsm_state14 = 17'd8192;
  parameter ap_ST_fsm_state15 = 17'd16384;
  parameter ap_ST_fsm_state16 = 17'd32768;
  parameter ap_ST_fsm_state17 = 17'd65536;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [6:0] Obs_address0;
  output Obs_ce0;
  input [31:0] Obs_q0;
  output [11:0] transMat_address0;
  output transMat_ce0;
  input [31:0] transMat_q0;
  output [11:0] obsLik_address0;
  output obsLik_ce0;
  input [31:0] obsLik_q0;
  output [11:0] v_address0;
  output v_ce0;
  output v_we0;
  output [31:0] v_d0;
  input [31:0] v_q0;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg Obs_ce0;
  reg transMat_ce0;
  reg obsLik_ce0;
  reg [11:0] v_address0;
  reg v_ce0;
  reg v_we0;
  reg [31:0] v_d0;
  reg [16:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [31:0] reg_236;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state13;
  wire ap_CS_fsm_state16;
  wire [31:0] grp_fu_225_p2;
  reg [31:0] reg_243;
  wire ap_CS_fsm_state9;
  wire ap_CS_fsm_state12;
  wire [11:0] zext_ln42_fu_250_p1;
  reg [11:0] zext_ln42_reg_596;
  wire ap_CS_fsm_state2;
  wire [7:0] i_2_fu_260_p2;
  reg [7:0] i_2_reg_604;
  wire [0:0] icmp_ln42_fu_254_p2;
  reg [31:0] baseObs_reg_615;
  wire ap_CS_fsm_state3;
  wire [12:0] zext_ln47_1_fu_271_p1;
  reg [12:0] zext_ln47_1_reg_620;
  wire [5:0] j_fu_280_p2;
  reg [5:0] j_reg_628;
  wire ap_CS_fsm_state4;
  wire [4:0] trunc_ln46_fu_286_p1;
  reg [4:0] trunc_ln46_reg_633;
  wire [0:0] icmp_ln44_fu_274_p2;
  reg [11:0] v_addr_2_reg_638;
  wire [5:0] k_fu_314_p2;
  reg [5:0] k_reg_646;
  wire ap_CS_fsm_state5;
  wire [0:0] icmp_ln45_fu_308_p2;
  wire [31:0] add_ln46_2_fu_354_p2;
  reg [31:0] add_ln46_2_reg_656;
  reg [11:0] v_addr_3_reg_661;
  reg [31:0] transMat_load_reg_666;
  wire ap_CS_fsm_state8;
  reg [31:0] obsLik_load_reg_676;
  wire [0:0] icmp_ln47_2_fu_391_p2;
  reg [0:0] icmp_ln47_2_reg_681;
  wire [0:0] icmp_ln47_3_fu_397_p2;
  reg [0:0] icmp_ln47_3_reg_686;
  wire ap_CS_fsm_state15;
  wire [0:0] icmp_ln56_fu_455_p2;
  wire [31:0] finalState_1_fu_574_p3;
  wire ap_CS_fsm_state17;
  wire [31:0] maxProb_1_fu_582_p3;
  wire [5:0] i_fu_590_p2;
  reg [7:0] i_0_reg_156;
  reg [5:0] j_0_reg_167;
  reg [5:0] k_0_reg_178;
  wire ap_CS_fsm_state14;
  reg [5:0] i_1_reg_189;
  reg [31:0] finalState_0_reg_201;
  reg [31:0] maxProb_0_reg_213;
  wire [63:0] zext_ln43_fu_266_p1;
  wire [63:0] zext_ln46_fu_303_p1;
  wire [63:0] zext_ln46_1_fu_329_p1;
  wire [63:0] zext_ln47_fu_364_p1;
  wire signed [63:0] sext_ln46_fu_369_p1;
  wire [63:0] zext_ln57_fu_475_p1;
  wire [0:0] and_ln47_1_fu_449_p2;
  reg [31:0] grp_fu_225_p0;
  reg [31:0] grp_fu_225_p1;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state10;
  reg [31:0] grp_fu_229_p0;
  reg [31:0] grp_fu_229_p1;
  wire [11:0] shl_ln1_fu_290_p3;
  wire [11:0] add_ln46_fu_298_p2;
  wire [11:0] add_ln46_1_fu_320_p4;
  wire [4:0] trunc_ln46_1_fu_334_p1;
  wire [11:0] shl_ln46_1_fu_338_p3;
  wire [31:0] zext_ln46_3_fu_350_p1;
  wire [12:0] zext_ln46_2_fu_346_p1;
  wire [12:0] add_ln47_fu_359_p2;
  wire [31:0] bitcast_ln47_1_fu_373_p1;
  wire [7:0] tmp_8_fu_377_p4;
  wire [22:0] trunc_ln47_1_fu_387_p1;
  wire [31:0] bitcast_ln47_fu_403_p1;
  wire [7:0] tmp_7_fu_407_p4;
  wire [22:0] trunc_ln47_fu_417_p1;
  wire [0:0] icmp_ln47_1_fu_427_p2;
  wire [0:0] icmp_ln47_fu_421_p2;
  wire [0:0] or_ln47_fu_433_p2;
  wire [0:0] or_ln47_1_fu_439_p2;
  wire [0:0] and_ln47_fu_443_p2;
  wire [0:0] grp_fu_229_p2;
  wire [12:0] shl_ln_fu_461_p3;
  wire [12:0] add_ln57_fu_469_p2;
  wire [31:0] bitcast_ln57_fu_480_p1;
  wire [31:0] bitcast_ln57_1_fu_498_p1;
  wire [7:0] tmp_fu_484_p4;
  wire [22:0] trunc_ln57_fu_494_p1;
  wire [0:0] icmp_ln57_1_fu_522_p2;
  wire [0:0] icmp_ln57_fu_516_p2;
  wire [7:0] tmp_2_fu_502_p4;
  wire [22:0] trunc_ln57_1_fu_512_p1;
  wire [0:0] icmp_ln57_3_fu_540_p2;
  wire [0:0] icmp_ln57_2_fu_534_p2;
  wire [0:0] or_ln57_fu_528_p2;
  wire [0:0] or_ln57_1_fu_546_p2;
  wire [0:0] and_ln57_fu_552_p2;
  wire [5:0] finalState_fu_564_p2;
  wire [0:0] and_ln57_1_fu_558_p2;
  wire [31:0] zext_ln58_fu_570_p1;
  reg [16:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire [4:0] Const_2;
  wire Const_3;
  wire Const_4;
  wire [31:0] Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire Const_9;
  wire Const_10;
  wire [7:0] Const_11;
  wire Const_12;
  wire Const_13;
  wire [5:0] Const_14;
  wire Const_15;
  wire Const_16;
  wire Const_17;
  wire Const_18;
  wire [5:0] Const_19;
  wire Const_20;
  wire Const_21;
  wire Const_22;
  wire [5:0] Const_23;
  wire Const_24;
  wire Const_25;
  wire [31:0] Const_26;
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
  wire [11:0] Const_78;
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
  wire [31:0] Const_89;
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
  wire [12:0] Const_106;
  wire Const_107;
  wire [5:0] Const_108;
  wire [7:0] Const_109;
  wire [5:0] Const_110;
  wire [7:0] Const_111;
  wire Const_112;
  wire Const_113;
  wire [5:0] Const_114;
  wire Const_115;
  wire Const_116;
  wire [5:0] Const_117;
  wire Const_118;
  wire Const_119;
  wire [22:0] Const_120;
  wire Const_121;
  wire Const_122;
  wire Const_123;
  wire Const_124;
  wire Const_125;
  wire [22:0] Const_126;
  wire Const_127;
  wire Const_128;
  wire Const_129;
  wire Const_130;
  wire Const_131;
  wire [5:0] Const_132;
  wire Const_133;
  wire Const_134;
  wire [22:0] Const_135;
  wire Const_136;
  wire Const_137;
  wire Const_138;
  wire Const_139;
  wire Const_140;
  wire [22:0] Const_141;
  wire Const_142;
  wire Const_143;
  wire Const_144;
  wire Const_145;
  wire Const_146;
  wire [5:0] Const_147;
  wire [5:0] Const_148;
  wire Const_149;
  input [3070:0] locking_key;
  wire [534:0] working_key;

  initial begin
    #0 ap_CS_fsm = 17'd1;
  end

  assign Const_0 = (1'd1 ^ working_key[0]);

  viterbi_fmul_32nsbkb
  #(
    .ID(1),
    .NUM_STAGE(3),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .dout_WIDTH(32)
  )
  viterbi_fmul_32nsbkb_U1
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_225_p0),
    .din1(grp_fu_225_p1),
    .ce(Const_0),
    .dout(grp_fu_225_p2)
  );

  assign Const_1 = (1'd0 ^ working_key[1]);
  assign Const_2 = (5'd8 ^ working_key[6:2]);

  viterbi_fcmp_32nscud
  #(
    .ID(1),
    .NUM_STAGE(2),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .dout_WIDTH(1)
  )
  viterbi_fcmp_32nscud_U2
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_229_p0),
    .din1(grp_fu_229_p1),
    .ce(Const_1),
    .opcode(Const_2),
    .dout(grp_fu_229_p2)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_3 = (1'd0 ^ working_key[7]);
  assign Const_4 = (1'd0 ^ working_key[8]);
  assign Const_5 = (32'd2867440202 ^ working_key[40:9]);
  assign Const_6 = (1'd0 ^ working_key[41]);

  always @(posedge ap_clk) begin
    if(((Const_3 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == Const_4) ^ working_key[42]) == 1'b1) begin
      finalState_0_reg_201 <= Const_5;
    end else if(Const_6 == ap_CS_fsm_state17) begin
      finalState_0_reg_201 <= finalState_1_fu_574_p3;
    end 
  end

  assign Const_7 = (1'd0 ^ working_key[43]);
  assign Const_8 = (1'd1 ^ working_key[44]);
  assign Const_9 = (1'd0 ^ working_key[45]);
  assign Const_10 = (1'd1 ^ working_key[46]);
  assign Const_11 = (8'd82 ^ working_key[54:47]);

  always @(posedge ap_clk) begin
    if(((Const_7 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == Const_8) ^ working_key[55]) == 1'b0) begin
      i_0_reg_156 <= i_2_reg_604;
    end else if((ap_start == Const_9) & (Const_10 == ap_CS_fsm_state1)) begin
      i_0_reg_156 <= Const_11;
    end 
  end

  assign Const_12 = (1'd1 ^ working_key[56]);
  assign Const_13 = (1'd0 ^ working_key[57]);
  assign Const_14 = (6'd40 ^ working_key[63:58]);
  assign Const_15 = (1'd0 ^ working_key[64]);

  always @(posedge ap_clk) begin
    if(((Const_12 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == Const_13) ^ working_key[65]) == 1'b0) begin
      i_1_reg_189 <= Const_14;
    end else if(Const_15 == ap_CS_fsm_state17) begin
      i_1_reg_189 <= i_fu_590_p2;
    end 
  end

  assign Const_16 = (1'd0 ^ working_key[66]);
  assign Const_17 = (1'd0 ^ working_key[67]);
  assign Const_18 = (1'd0 ^ working_key[68]);
  assign Const_19 = (6'd21 ^ working_key[74:69]);

  always @(posedge ap_clk) begin
    if(((Const_16 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == Const_17) ^ working_key[75]) == 1'b0) begin
      j_0_reg_167 <= j_reg_628;
    end else if(Const_18 == ap_CS_fsm_state3) begin
      j_0_reg_167 <= Const_19;
    end 
  end

  assign Const_20 = (1'd1 ^ working_key[76]);
  assign Const_21 = (1'd1 ^ working_key[77]);
  assign Const_22 = (1'd1 ^ working_key[78]);
  assign Const_23 = (6'd42 ^ working_key[84:79]);

  always @(posedge ap_clk) begin
    if(((Const_20 == ap_CS_fsm_state14) ^ working_key[85]) == 1'b1) begin
      k_0_reg_178 <= k_reg_646;
    end else if((Const_21 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == Const_22)) begin
      k_0_reg_178 <= Const_23;
    end 
  end

  assign Const_24 = (1'd0 ^ working_key[86]);
  assign Const_25 = (1'd1 ^ working_key[87]);
  assign Const_26 = (32'd1431650645 ^ working_key[119:88]);
  assign Const_27 = (1'd0 ^ working_key[120]);

  always @(posedge ap_clk) begin
    if(((Const_24 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == Const_25) ^ working_key[121]) == 1'b1) begin
      maxProb_0_reg_213 <= Const_26;
    end else if(Const_27 == ap_CS_fsm_state17) begin
      maxProb_0_reg_213 <= maxProb_1_fu_582_p3;
    end 
  end

  assign Const_28 = (1'd0 ^ working_key[122]);
  assign Const_29 = (1'd0 ^ working_key[123]);

  always @(posedge ap_clk) begin
    if((Const_28 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == Const_29)) begin
      add_ln46_2_reg_656 <= add_ln46_2_fu_354_p2;
      v_addr_3_reg_661 <= zext_ln47_fu_364_p1;
    end 
  end

  assign Const_30 = (1'd1 ^ working_key[124]);

  always @(posedge ap_clk) begin
    if(Const_30 == ap_CS_fsm_state3) begin
      baseObs_reg_615 <= Obs_q0;
      zext_ln47_1_reg_620[7:0] <= zext_ln47_1_fu_271_p1[7:0];
    end 
  end

  assign Const_31 = (1'd0 ^ working_key[125]);

  always @(posedge ap_clk) begin
    if(Const_31 == ap_CS_fsm_state2) begin
      i_2_reg_604 <= i_2_fu_260_p2;
      zext_ln42_reg_596[7:0] <= zext_ln42_fu_250_p1[7:0];
    end 
  end

  assign Const_32 = (1'd0 ^ working_key[126]);

  always @(posedge ap_clk) begin
    if(Const_32 == ap_CS_fsm_state13) begin
      icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
      icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
    end 
  end

  assign Const_33 = (1'd1 ^ working_key[127]);

  always @(posedge ap_clk) begin
    if(Const_33 == ap_CS_fsm_state4) begin
      j_reg_628 <= j_fu_280_p2;
    end 
  end

  assign Const_34 = (1'd1 ^ working_key[128]);

  always @(posedge ap_clk) begin
    if(Const_34 == ap_CS_fsm_state5) begin
      k_reg_646 <= k_fu_314_p2;
    end 
  end

  assign Const_35 = (1'd0 ^ working_key[129]);

  always @(posedge ap_clk) begin
    if(Const_35 == ap_CS_fsm_state9) begin
      obsLik_load_reg_676 <= obsLik_q0;
    end 
  end

  assign Const_36 = (1'd1 ^ working_key[130]);
  assign Const_37 = (1'd0 ^ working_key[131]);
  assign Const_38 = (1'd1 ^ working_key[132]);

  always @(posedge ap_clk) begin
    if((Const_36 == ap_CS_fsm_state16) | (Const_37 == ap_CS_fsm_state13) | (Const_38 == ap_CS_fsm_state6)) begin
      reg_236 <= v_q0;
    end 
  end

  assign Const_39 = (1'd0 ^ working_key[133]);
  assign Const_40 = (1'd1 ^ working_key[134]);

  always @(posedge ap_clk) begin
    if((Const_39 == ap_CS_fsm_state12) | (Const_40 == ap_CS_fsm_state9)) begin
      reg_243 <= grp_fu_225_p2;
    end 
  end

  assign Const_41 = (1'd0 ^ working_key[135]);

  always @(posedge ap_clk) begin
    if(Const_41 == ap_CS_fsm_state6) begin
      transMat_load_reg_666 <= transMat_q0;
    end 
  end

  assign Const_42 = (1'd0 ^ working_key[136]);
  assign Const_43 = (1'd0 ^ working_key[137]);

  always @(posedge ap_clk) begin
    if((Const_42 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == Const_43)) begin
      trunc_ln46_reg_633 <= trunc_ln46_fu_286_p1;
      v_addr_2_reg_638 <= zext_ln46_fu_303_p1;
    end 
  end

  assign Const_44 = (1'd0 ^ working_key[138]);
  assign Const_45 = (1'd1 ^ working_key[139]);
  assign Const_46 = (1'd1 ^ working_key[140]);

  always @(*) begin
    if(((Const_44 == ap_CS_fsm_state2) ^ working_key[141]) == 1'b1) begin
      Obs_ce0 = Const_45;
    end else begin
      Obs_ce0 = Const_46;
    end
  end

  assign Const_47 = (1'd1 ^ working_key[142]);
  assign Const_48 = (1'd0 ^ working_key[143]);
  assign Const_49 = (1'd1 ^ working_key[144]);
  assign Const_50 = (1'd0 ^ working_key[145]);

  always @(*) begin
    if(((Const_47 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == Const_48) ^ working_key[146]) == 1'b1) begin
      ap_done = Const_50;
    end else begin
      ap_done = Const_49;
    end
  end

  assign Const_51 = (1'd0 ^ working_key[147]);
  assign Const_52 = (1'd0 ^ working_key[148]);
  assign Const_53 = (1'd1 ^ working_key[149]);
  assign Const_54 = (1'd1 ^ working_key[150]);

  always @(*) begin
    if(((ap_start == Const_51) & (Const_52 == ap_CS_fsm_state1) ^ working_key[151]) == 1'b1) begin
      ap_idle = Const_53;
    end else begin
      ap_idle = Const_54;
    end
  end

  assign Const_55 = (1'd0 ^ working_key[152]);
  assign Const_56 = (1'd0 ^ working_key[153]);
  assign Const_57 = (1'd1 ^ working_key[154]);
  assign Const_58 = (1'd0 ^ working_key[155]);

  always @(*) begin
    if(((Const_55 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == Const_56) ^ working_key[156]) == 1'b1) begin
      ap_ready = Const_58;
    end else begin
      ap_ready = Const_57;
    end
  end

  assign Const_59 = (1'd1 ^ working_key[157]);
  assign Const_60 = (1'd0 ^ working_key[158]);

  always @(*) begin
    if(((Const_59 == ap_CS_fsm_state10) ^ working_key[160]) == 1'b0) begin
      grp_fu_225_p0 = reg_243;
    end else if(((Const_60 == ap_CS_fsm_state7) ^ working_key[159]) == 1'b1) begin
      grp_fu_225_p0 = 'bx;
    end else begin
      grp_fu_225_p0 = reg_236;
    end
  end

  assign Const_61 = (1'd1 ^ working_key[161]);
  assign Const_62 = (1'd0 ^ working_key[162]);

  always @(*) begin
    if(((Const_61 == ap_CS_fsm_state10) ^ working_key[164]) == 1'b0) begin
      grp_fu_225_p1 = obsLik_load_reg_676;
    end else if(((Const_62 == ap_CS_fsm_state7) ^ working_key[163]) == 1'b1) begin
      grp_fu_225_p1 = transMat_load_reg_666;
    end else begin
      grp_fu_225_p1 = 'bx;
    end
  end

  assign Const_63 = (1'd1 ^ working_key[165]);
  assign Const_64 = (1'd0 ^ working_key[166]);

  always @(*) begin
    if(((Const_63 == ap_CS_fsm_state16) ^ working_key[168]) == 1'b0) begin
      grp_fu_229_p0 = v_q0;
    end else if(((Const_64 == ap_CS_fsm_state13) ^ working_key[167]) == 1'b1) begin
      grp_fu_229_p0 = reg_243;
    end else begin
      grp_fu_229_p0 = 'bx;
    end
  end

  assign Const_65 = (1'd0 ^ working_key[169]);
  assign Const_66 = (1'd1 ^ working_key[170]);

  always @(*) begin
    if(((Const_65 == ap_CS_fsm_state16) ^ working_key[172]) == 1'b1) begin
      grp_fu_229_p1 = maxProb_0_reg_213;
    end else if(((Const_66 == ap_CS_fsm_state13) ^ working_key[171]) == 1'b1) begin
      grp_fu_229_p1 = 'bx;
    end else begin
      grp_fu_229_p1 = v_q0;
    end
  end

  assign Const_67 = (1'd0 ^ working_key[173]);
  assign Const_68 = (1'd1 ^ working_key[174]);
  assign Const_69 = (1'd0 ^ working_key[175]);

  always @(*) begin
    if(((Const_67 == ap_CS_fsm_state8) ^ working_key[176]) == 1'b1) begin
      obsLik_ce0 = Const_69;
    end else begin
      obsLik_ce0 = Const_68;
    end
  end

  assign Const_70 = (1'd1 ^ working_key[177]);
  assign Const_71 = (1'd1 ^ working_key[178]);
  assign Const_72 = (1'd1 ^ working_key[179]);

  always @(*) begin
    if(((Const_70 == ap_CS_fsm_state5) ^ working_key[180]) == 1'b1) begin
      transMat_ce0 = Const_71;
    end else begin
      transMat_ce0 = Const_72;
    end
  end

  assign Const_73 = (1'd0 ^ working_key[181]);
  assign Const_74 = (1'd1 ^ working_key[182]);
  assign Const_75 = (1'd0 ^ working_key[183]);
  assign Const_76 = (1'd1 ^ working_key[184]);
  assign Const_77 = (1'd0 ^ working_key[185]);
  assign Const_78 = (12'd4073 ^ working_key[197:186]);

  always @(*) begin
    if(((Const_73 == ap_CS_fsm_state15) ^ working_key[201]) == 1'b0) begin
      v_address0 = zext_ln57_fu_475_p1;
    end else if((((Const_74 == ap_CS_fsm_state12) | (Const_75 == ap_CS_fsm_state14)) ^ working_key[200]) == 1'b1) begin
      v_address0 = v_addr_3_reg_661;
    end else if(((Const_76 == ap_CS_fsm_state5) ^ working_key[199]) == 1'b0) begin
      v_address0 = v_addr_2_reg_638;
    end else if(((Const_77 == ap_CS_fsm_state1) ^ working_key[198]) == 1'b1) begin
      v_address0 = Const_78;
    end else begin
      v_address0 = 'bx;
    end
  end

  assign Const_79 = (1'd1 ^ working_key[202]);
  assign Const_80 = (1'd0 ^ working_key[203]);
  assign Const_81 = (1'd1 ^ working_key[204]);
  assign Const_82 = (1'd1 ^ working_key[205]);
  assign Const_83 = (1'd0 ^ working_key[206]);
  assign Const_84 = (1'd1 ^ working_key[207]);
  assign Const_85 = (1'd0 ^ working_key[208]);
  assign Const_86 = (1'd0 ^ working_key[209]);

  always @(*) begin
    if((((Const_79 == ap_CS_fsm_state12) | (Const_80 == ap_CS_fsm_state14) | (Const_81 == ap_CS_fsm_state15) | (Const_82 == ap_CS_fsm_state5) | (ap_start == Const_83) & (Const_84 == ap_CS_fsm_state1)) ^ working_key[210]) == 1'b1) begin
      v_ce0 = Const_86;
    end else begin
      v_ce0 = Const_85;
    end
  end

  assign Const_87 = (1'd1 ^ working_key[211]);
  assign Const_88 = (1'd0 ^ working_key[212]);
  assign Const_89 = (32'd2502560426 ^ working_key[244:213]);

  always @(*) begin
    if(((Const_87 == ap_CS_fsm_state14) ^ working_key[246]) == 1'b0) begin
      v_d0 = reg_243;
    end else if(((Const_88 == ap_CS_fsm_state1) ^ working_key[245]) == 1'b1) begin
      v_d0 = Const_89;
    end else begin
      v_d0 = 'bx;
    end
  end

  assign Const_90 = (1'd1 ^ working_key[247]);
  assign Const_91 = (1'd0 ^ working_key[248]);
  assign Const_92 = (1'd1 ^ working_key[249]);
  assign Const_93 = (1'd0 ^ working_key[250]);
  assign Const_94 = (1'd1 ^ working_key[251]);
  assign Const_95 = (1'd0 ^ working_key[252]);

  always @(*) begin
    if((((ap_start == Const_90) & (Const_91 == ap_CS_fsm_state1) | (Const_92 == ap_CS_fsm_state14) & (Const_93 == and_ln47_1_fu_449_p2)) ^ working_key[253]) == 1'b1) begin
      v_we0 = Const_95;
    end else begin
      v_we0 = Const_94;
    end
  end

  assign Const_96 = (1'd0 ^ working_key[254]);
  assign Const_97 = (1'd1 ^ working_key[255]);
  assign Const_98 = (1'd0 ^ working_key[257]);
  assign Const_99 = (1'd0 ^ working_key[258]);
  assign Const_100 = (1'd1 ^ working_key[260]);
  assign Const_101 = (1'd0 ^ working_key[261]);
  assign Const_102 = (1'd0 ^ working_key[263]);
  assign Const_103 = (1'd0 ^ working_key[264]);
  assign Const_104 = (1'd0 ^ working_key[266]);
  assign Const_105 = (1'd1 ^ working_key[267]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_96) & (Const_97 == ap_CS_fsm_state1) ^ working_key[256]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        if(((Const_98 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == Const_99) ^ working_key[259]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state15;
        end
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        if(((Const_100 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == Const_101) ^ working_key[262]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if(((Const_102 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == Const_103) ^ working_key[265]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        ap_NS_fsm = ap_ST_fsm_state9;
      end
      ap_ST_fsm_state9: begin
        ap_NS_fsm = ap_ST_fsm_state10;
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
        ap_NS_fsm = ap_ST_fsm_state14;
      end
      ap_ST_fsm_state14: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state15: begin
        if(((Const_104 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == Const_105) ^ working_key[268]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state16;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state16: begin
        ap_NS_fsm = ap_ST_fsm_state17;
      end
      ap_ST_fsm_state17: begin
        ap_NS_fsm = ap_ST_fsm_state15;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign Obs_address0 = zext_ln43_fu_266_p1;
  assign add_ln46_1_fu_320_p4 = { { { trunc_ln46_reg_633 }, { 1'd0 } }, { k_0_reg_178 } };
  assign add_ln46_2_fu_354_p2 = (working_key[269] == 1'b1)? baseObs_reg_615 >> zext_ln46_3_fu_350_p1 : baseObs_reg_615 + zext_ln46_3_fu_350_p1;
  assign add_ln46_fu_298_p2 = (working_key[270] == 1'b1)? shl_ln1_fu_290_p3 * zext_ln42_reg_596 : shl_ln1_fu_290_p3 + zext_ln42_reg_596;
  assign add_ln47_fu_359_p2 = (working_key[271] == 1'b1)? zext_ln47_1_reg_620 + zext_ln46_2_fu_346_p1 : zext_ln47_1_reg_620 - zext_ln46_2_fu_346_p1;
  assign Const_106 = (13'd3243 ^ working_key[284:272]);
  assign add_ln57_fu_469_p2 = (working_key[285] == 1'b1)? Const_106 * shl_ln_fu_461_p3 : Const_106 + shl_ln_fu_461_p3;
  assign and_ln47_1_fu_449_p2 = (working_key[286] == 1'b1)? grp_fu_229_p2 & and_ln47_fu_443_p2 : grp_fu_229_p2 ^ and_ln47_fu_443_p2;
  assign and_ln47_fu_443_p2 = (working_key[287] == 1'b1)? or_ln47_fu_433_p2 & or_ln47_1_fu_439_p2 : or_ln47_fu_433_p2 >> or_ln47_1_fu_439_p2;
  assign and_ln57_1_fu_558_p2 = (working_key[288] == 1'b1)? grp_fu_229_p2 & and_ln57_fu_552_p2 : grp_fu_229_p2 << and_ln57_fu_552_p2;
  assign and_ln57_fu_552_p2 = (working_key[289] == 1'b1)? or_ln57_fu_528_p2 | or_ln57_1_fu_546_p2 : or_ln57_fu_528_p2 & or_ln57_1_fu_546_p2;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
  assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];
  assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];
  assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign ap_return = finalState_0_reg_201;
  assign bitcast_ln47_1_fu_373_p1 = v_q0;
  assign bitcast_ln47_fu_403_p1 = reg_243;
  assign bitcast_ln57_1_fu_498_p1 = maxProb_0_reg_213;
  assign bitcast_ln57_fu_480_p1 = reg_236;
  assign Const_107 = (1'd0 ^ working_key[290]);
  assign finalState_1_fu_574_p3 = ((((working_key[291] == 1'b1)? and_ln57_1_fu_558_p2[0:0] > Const_107 : and_ln57_1_fu_558_p2[0:0] === Const_107) ^ working_key[292]) == 1'b1)? finalState_0_reg_201 : zext_ln58_fu_570_p1;
  assign Const_108 = (6'd37 ^ working_key[298:293]);
  assign finalState_fu_564_p2 = (working_key[299] == 1'b1)? Const_108 + i_1_reg_189 : Const_108 * i_1_reg_189;
  assign Const_109 = (8'd147 ^ working_key[307:300]);
  assign i_2_fu_260_p2 = (working_key[308] == 1'b1)? i_0_reg_156 << Const_109 : i_0_reg_156 + Const_109;
  assign Const_110 = (6'd52 ^ working_key[314:309]);
  assign i_fu_590_p2 = (working_key[315] == 1'b1)? Const_110 >> i_1_reg_189 : Const_110 + i_1_reg_189;
  assign Const_111 = (8'd122 ^ working_key[323:316]);
  assign Const_112 = (1'd0 ^ working_key[325]);
  assign Const_113 = (1'd0 ^ working_key[326]);
  assign icmp_ln42_fu_254_p2 = ((((working_key[324] == 1'b1)? i_0_reg_156 == Const_111 : i_0_reg_156 === Const_111) ^ working_key[327]) == 1'b1)? Const_113 : Const_112;
  assign Const_114 = (6'd42 ^ working_key[333:328]);
  assign Const_115 = (1'd1 ^ working_key[335]);
  assign Const_116 = (1'd1 ^ working_key[336]);
  assign icmp_ln44_fu_274_p2 = ((((working_key[334] == 1'b1)? j_0_reg_167 == Const_114 : j_0_reg_167 === Const_114) ^ working_key[337]) == 1'b1)? Const_115 : Const_116;
  assign Const_117 = (6'd53 ^ working_key[343:338]);
  assign Const_118 = (1'd1 ^ working_key[345]);
  assign Const_119 = (1'd1 ^ working_key[346]);
  assign icmp_ln45_fu_308_p2 = ((((working_key[344] == 1'b1)? k_0_reg_178 == Const_117 : k_0_reg_178 != Const_117) ^ working_key[347]) == 1'b1)? Const_118 : Const_119;
  assign Const_120 = (23'd5592085 ^ working_key[370:348]);
  assign Const_121 = (1'd0 ^ working_key[372]);
  assign Const_122 = (1'd0 ^ working_key[373]);
  assign icmp_ln47_1_fu_427_p2 = ((((working_key[371] == 1'b1)? trunc_ln47_fu_417_p1 < Const_120 : trunc_ln47_fu_417_p1 == Const_120) ^ working_key[374]) == 1'b1)? Const_122 : Const_121;
  assign Const_123 = (1'd53 ^ working_key[375]);
  assign Const_124 = (1'd1 ^ working_key[377]);
  assign Const_125 = (1'd1 ^ working_key[378]);
  assign icmp_ln47_2_fu_391_p2 = ((((working_key[376] == 1'b1)? tmp_8_fu_377_p4 == Const_123 : tmp_8_fu_377_p4 != Const_123) ^ working_key[379]) == 1'b1)? Const_124 : Const_125;
  assign Const_126 = (23'd6984373 ^ working_key[402:380]);
  assign Const_127 = (1'd1 ^ working_key[404]);
  assign Const_128 = (1'd1 ^ working_key[405]);
  assign icmp_ln47_3_fu_397_p2 = ((((working_key[403] == 1'b1)? trunc_ln47_1_fu_387_p1 === Const_126 : trunc_ln47_1_fu_387_p1 == Const_126) ^ working_key[406]) == 1'b1)? Const_127 : Const_128;
  assign Const_129 = (1'd168 ^ working_key[407]);
  assign Const_130 = (1'd1 ^ working_key[409]);
  assign Const_131 = (1'd1 ^ working_key[410]);
  assign icmp_ln47_fu_421_p2 = ((((working_key[408] == 1'b1)? tmp_7_fu_407_p4 != Const_129 : tmp_7_fu_407_p4 == Const_129) ^ working_key[411]) == 1'b1)? Const_131 : Const_130;
  assign Const_132 = (6'd43 ^ working_key[417:412]);
  assign Const_133 = (1'd1 ^ working_key[419]);
  assign Const_134 = (1'd0 ^ working_key[420]);
  assign icmp_ln56_fu_455_p2 = ((((working_key[418] == 1'b1)? i_1_reg_189 == Const_132 : i_1_reg_189 < Const_132) ^ working_key[421]) == 1'b1)? Const_134 : Const_133;
  assign Const_135 = (23'd2882154 ^ working_key[444:422]);
  assign Const_136 = (1'd1 ^ working_key[446]);
  assign Const_137 = (1'd0 ^ working_key[447]);
  assign icmp_ln57_1_fu_522_p2 = ((((working_key[445] == 1'b1)? trunc_ln57_fu_494_p1 == Const_135 : trunc_ln57_fu_494_p1 < Const_135) ^ working_key[448]) == 1'b1)? Const_137 : Const_136;
  assign Const_138 = (1'd85 ^ working_key[449]);
  assign Const_139 = (1'd0 ^ working_key[451]);
  assign Const_140 = (1'd0 ^ working_key[452]);
  assign icmp_ln57_2_fu_534_p2 = ((((working_key[450] == 1'b1)? tmp_2_fu_502_p4 === Const_138 : tmp_2_fu_502_p4 != Const_138) ^ working_key[453]) == 1'b1)? Const_140 : Const_139;
  assign Const_141 = (23'd2795562 ^ working_key[476:454]);
  assign Const_142 = (1'd1 ^ working_key[478]);
  assign Const_143 = (1'd1 ^ working_key[479]);
  assign icmp_ln57_3_fu_540_p2 = ((((working_key[477] == 1'b1)? trunc_ln57_1_fu_512_p1 == Const_141 : trunc_ln57_1_fu_512_p1 === Const_141) ^ working_key[480]) == 1'b1)? Const_142 : Const_143;
  assign Const_144 = (1'd106 ^ working_key[481]);
  assign Const_145 = (1'd1 ^ working_key[483]);
  assign Const_146 = (1'd1 ^ working_key[484]);
  assign icmp_ln57_fu_516_p2 = ((((working_key[482] == 1'b1)? tmp_fu_484_p4 != Const_144 : tmp_fu_484_p4 < Const_144) ^ working_key[485]) == 1'b1)? Const_146 : Const_145;
  assign Const_147 = (6'd62 ^ working_key[491:486]);
  assign j_fu_280_p2 = (working_key[492] == 1'b1)? j_0_reg_167 * Const_147 : j_0_reg_167 + Const_147;
  assign Const_148 = (6'd44 ^ working_key[498:493]);
  assign k_fu_314_p2 = (working_key[499] == 1'b1)? k_0_reg_178 * Const_148 : k_0_reg_178 + Const_148;
  assign Const_149 = (1'd0 ^ working_key[500]);
  assign maxProb_1_fu_582_p3 = ((((working_key[501] == 1'b1)? and_ln57_1_fu_558_p2[0:0] != Const_149 : and_ln57_1_fu_558_p2[0:0] === Const_149) ^ working_key[502]) == 1'b1)? reg_236 : maxProb_0_reg_213;
  assign obsLik_address0 = sext_ln46_fu_369_p1;
  assign or_ln47_1_fu_439_p2 = (working_key[503] == 1'b1)? icmp_ln47_3_reg_686 | icmp_ln47_2_reg_681 : icmp_ln47_3_reg_686 & icmp_ln47_2_reg_681;
  assign or_ln47_fu_433_p2 = (working_key[504] == 1'b1)? icmp_ln47_fu_421_p2 >> icmp_ln47_1_fu_427_p2 : icmp_ln47_fu_421_p2 | icmp_ln47_1_fu_427_p2;
  assign or_ln57_1_fu_546_p2 = (working_key[505] == 1'b1)? icmp_ln57_3_fu_540_p2 & icmp_ln57_2_fu_534_p2 : icmp_ln57_3_fu_540_p2 | icmp_ln57_2_fu_534_p2;
  assign or_ln57_fu_528_p2 = (working_key[506] == 1'b1)? icmp_ln57_fu_516_p2 | icmp_ln57_1_fu_522_p2 : icmp_ln57_fu_516_p2 << icmp_ln57_1_fu_522_p2;
  assign sext_ln46_fu_369_p1 = add_ln46_2_reg_656;
  assign shl_ln1_fu_290_p3 = { { trunc_ln46_fu_286_p1 }, { 7'd0 } };
  assign shl_ln46_1_fu_338_p3 = { { trunc_ln46_1_fu_334_p1 }, { 7'd0 } };
  assign shl_ln_fu_461_p3 = { { i_1_reg_189 }, { 7'd0 } };
  assign tmp_2_fu_502_p4 = { { bitcast_ln57_1_fu_498_p1[30:23] } };
  assign tmp_7_fu_407_p4 = { { bitcast_ln47_fu_403_p1[30:23] } };
  assign tmp_8_fu_377_p4 = { { bitcast_ln47_1_fu_373_p1[30:23] } };
  assign tmp_fu_484_p4 = { { bitcast_ln57_fu_480_p1[30:23] } };
  assign transMat_address0 = zext_ln46_1_fu_329_p1;
  assign trunc_ln46_1_fu_334_p1 = k_0_reg_178[4:0];
  assign trunc_ln46_fu_286_p1 = j_0_reg_167[4:0];
  assign trunc_ln47_1_fu_387_p1 = bitcast_ln47_1_fu_373_p1[22:0];
  assign trunc_ln47_fu_417_p1 = bitcast_ln47_fu_403_p1[22:0];
  assign trunc_ln57_1_fu_512_p1 = bitcast_ln57_1_fu_498_p1[22:0];
  assign trunc_ln57_fu_494_p1 = bitcast_ln57_fu_480_p1[22:0];
  assign zext_ln42_fu_250_p1 = i_0_reg_156;
  assign zext_ln43_fu_266_p1 = i_0_reg_156;
  assign zext_ln46_1_fu_329_p1 = add_ln46_1_fu_320_p4;
  assign zext_ln46_2_fu_346_p1 = shl_ln46_1_fu_338_p3;
  assign zext_ln46_3_fu_350_p1 = shl_ln46_1_fu_338_p3;
  assign zext_ln46_fu_303_p1 = add_ln46_fu_298_p2;
  assign zext_ln47_1_fu_271_p1 = i_2_reg_604;
  assign zext_ln47_fu_364_p1 = add_ln47_fu_359_p2;
  assign zext_ln57_fu_475_p1 = add_ln57_fu_469_p2;
  assign zext_ln58_fu_570_p1 = finalState_fu_564_p2;

  always @(posedge ap_clk) begin
    zext_ln42_reg_596[11:8] <= 4'b0000;
    zext_ln47_1_reg_620[12:8] <= 5'b00000;
  end

  assign working_key = { locking_key[534:0] };

endmodule

