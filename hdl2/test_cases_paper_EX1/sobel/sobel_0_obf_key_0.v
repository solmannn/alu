
module sobel_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  indata_address0,
  indata_ce0,
  indata_q0,
  outdata_address0,
  outdata_ce0,
  outdata_we0,
  outdata_d0,
  GX_address0,
  GX_ce0,
  GX_q0,
  GY_address0,
  GY_ce0,
  GY_q0,
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
  output [17:0] indata_address0;
  output indata_ce0;
  input [7:0] indata_q0;
  output [17:0] outdata_address0;
  output outdata_ce0;
  output outdata_we0;
  output [7:0] outdata_d0;
  output [17:0] GX_address0;
  output GX_ce0;
  input [31:0] GX_q0;
  output [17:0] GY_address0;
  output GY_ce0;
  input [31:0] GY_q0;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg indata_ce0;
  reg outdata_ce0;
  reg outdata_we0;
  reg GX_ce0;
  reg GY_ce0;
  reg [7:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [8:0] Y_fu_242_p2;
  wire ap_CS_fsm_state3;
  wire [0:0] icmp_ln14_fu_224_p2;
  wire signed [17:0] sext_ln37_fu_248_p1;
  reg signed [17:0] sext_ln37_reg_521;
  wire ap_CS_fsm_state4;
  wire signed [4:0] sext_ln39_1_fu_280_p1;
  reg signed [4:0] sext_ln39_1_reg_529;
  wire [0:0] icmp_ln37_fu_256_p2;
  wire [7:0] xor_ln51_fu_378_p2;
  wire ap_CS_fsm_state5;
  wire [0:0] icmp_ln38_fu_384_p2;
  wire [2:0] J_fu_443_p2;
  reg [2:0] J_reg_557;
  wire [2:0] I_fu_449_p2;
  reg [7:0] indata_load_reg_567;
  wire ap_CS_fsm_state6;
  reg signed [31:0] GX_load_reg_572;
  reg signed [31:0] GY_load_reg_577;
  wire [63:0] sumX_fu_467_p2;
  wire ap_CS_fsm_state7;
  wire [63:0] sumY_fu_482_p2;
  wire [8:0] X_fu_501_p2;
  wire ap_CS_fsm_state8;
  wire [8:0] ap_phi_mux_Y_0_phi_fu_114_p4;
  reg [8:0] Y_0_reg_110;
  reg [8:0] X_0_reg_122;
  wire ap_CS_fsm_state2;
  wire [0:0] grp_fu_217_p2;
  reg [63:0] sumY_0_reg_134;
  wire [0:0] empty_7_fu_236_p2;
  reg [63:0] sumX_0_reg_146;
  reg signed [2:0] I_0_reg_158;
  reg [63:0] sumY_1_reg_170;
  reg [63:0] sumX_1_reg_182;
  reg signed [2:0] J_0_reg_194;
  reg [7:0] phi_ln53_reg_205;
  wire [63:0] zext_ln39_fu_413_p1;
  wire [63:0] zext_ln39_3_fu_437_p1;
  wire [63:0] zext_ln53_fu_496_p1;
  reg [8:0] grp_fu_217_p0;
  wire [0:0] empty_6_fu_230_p2;
  wire [1:0] trunc_ln39_fu_262_p1;
  wire [3:0] shl_ln_fu_266_p3;
  wire signed [3:0] sext_ln37_1_fu_252_p1;
  wire [3:0] sub_ln39_fu_274_p2;
  wire [55:0] tmp_1_fu_284_p4;
  wire [0:0] icmp_ln43_fu_294_p2;
  wire [63:0] select_ln43_fu_300_p3;
  wire [0:0] tmp_2_fu_308_p3;
  wire [7:0] trunc_ln44_fu_316_p1;
  wire [55:0] tmp_3_fu_328_p4;
  wire [0:0] icmp_ln47_fu_338_p2;
  wire [63:0] select_ln47_fu_344_p3;
  wire [0:0] tmp_4_fu_352_p3;
  wire [7:0] trunc_ln48_fu_360_p1;
  wire [7:0] select_ln48_fu_364_p3;
  wire [7:0] select_ln44_fu_320_p3;
  wire [7:0] add_ln51_fu_372_p2;
  wire signed [8:0] sext_ln39_2_fu_390_p1;
  wire [8:0] add_ln39_fu_394_p2;
  wire [17:0] tmp_fu_400_p3;
  wire [17:0] add_ln39_1_fu_408_p2;
  wire [2:0] xor_ln39_fu_418_p2;
  wire [4:0] zext_ln39_2_fu_424_p1;
  wire [4:0] add_ln39_2_fu_428_p2;
  wire signed [31:0] sext_ln39_3_fu_433_p1;
  wire [7:0] mul_ln39_fu_458_p1;
  wire [31:0] zext_ln39_1_fu_455_p1;
  wire [31:0] mul_ln39_fu_458_p2;
  wire signed [63:0] sext_ln39_fu_463_p1;
  wire [7:0] mul_ln40_fu_473_p1;
  wire [31:0] mul_ln40_fu_473_p2;
  wire signed [63:0] sext_ln40_fu_478_p1;
  wire [17:0] add_ln_fu_488_p3;
  reg [7:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire [2:0] Const_3;
  wire Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire [2:0] Const_8;
  wire Const_9;
  wire Const_10;
  wire Const_11;
  wire [8:0] Const_12;
  wire Const_13;
  wire Const_14;
  wire Const_15;
  wire Const_16;
  wire Const_17;
  wire [8:0] Const_18;
  wire Const_19;
  wire Const_20;
  wire Const_21;
  wire [7:0] Const_22;
  wire Const_23;
  wire Const_24;
  wire Const_25;
  wire Const_26;
  wire Const_27;
  wire [63:0] Const_28;
  wire Const_29;
  wire Const_30;
  wire Const_31;
  wire Const_32;
  wire Const_33;
  wire Const_34;
  wire Const_35;
  wire Const_36;
  wire [63:0] Const_37;
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
  wire [2:0] Const_91;
  wire [2:0] Const_92;
  wire [8:0] Const_93;
  wire [8:0] Const_94;
  wire [8:0] Const_95;
  wire Const_96;
  wire Const_97;
  wire [8:0] Const_98;
  wire Const_99;
  wire Const_100;
  wire [8:0] Const_101;
  wire Const_102;
  wire Const_103;
  wire [2:0] Const_104;
  wire Const_105;
  wire Const_106;
  wire [2:0] Const_107;
  wire Const_108;
  wire Const_109;
  wire [55:0] Const_110;
  wire Const_111;
  wire Const_112;
  wire [55:0] Const_113;
  wire Const_114;
  wire Const_115;
  wire [31:0] Const_116;
  wire [31:0] Const_117;
  wire Const_118;
  wire [63:0] Const_119;
  wire Const_120;
  wire [7:0] Const_121;
  wire Const_122;
  wire [63:0] Const_123;
  wire Const_124;
  wire [7:0] Const_125;
  wire [2:0] Const_126;
  wire [7:0] Const_127;
  input [3070:0] locking_key;
  wire [712:0] working_key;

  initial begin
    #0 ap_CS_fsm = 8'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'd0 ^ working_key[0]);
  assign Const_1 = (1'd1 ^ working_key[1]);
  assign Const_2 = (1'd1 ^ working_key[2]);
  assign Const_3 = (3'd2 ^ working_key[5:3]);
  assign Const_4 = (1'd1 ^ working_key[6]);
  assign Const_5 = (1'd0 ^ working_key[7]);

  always @(posedge ap_clk) begin
    if(((empty_7_fu_236_p2 == Const_0) & (icmp_ln14_fu_224_p2 == Const_1) & (Const_2 == ap_CS_fsm_state3) ^ working_key[8]) == 1'b0) begin
      I_0_reg_158 <= Const_3;
    end else if((icmp_ln38_fu_384_p2 == Const_4) & (Const_5 == ap_CS_fsm_state5)) begin
      I_0_reg_158 <= I_fu_449_p2;
    end 
  end

  assign Const_6 = (1'd0 ^ working_key[9]);
  assign Const_7 = (1'd0 ^ working_key[10]);
  assign Const_8 = (3'd5 ^ working_key[13:11]);
  assign Const_9 = (1'd1 ^ working_key[14]);

  always @(posedge ap_clk) begin
    if(((icmp_ln37_fu_256_p2 == Const_6) & (Const_7 == ap_CS_fsm_state4) ^ working_key[15]) == 1'b0) begin
      J_0_reg_194 <= Const_8;
    end else if(Const_9 == ap_CS_fsm_state7) begin
      J_0_reg_194 <= J_reg_557;
    end 
  end

  assign Const_10 = (1'd0 ^ working_key[16]);
  assign Const_11 = (1'd1 ^ working_key[17]);
  assign Const_12 = (9'd212 ^ working_key[26:18]);
  assign Const_13 = (1'd1 ^ working_key[27]);

  always @(posedge ap_clk) begin
    if(((grp_fu_217_p2 == Const_10) & (Const_11 == ap_CS_fsm_state2) ^ working_key[28]) == 1'b0) begin
      X_0_reg_122 <= Const_12;
    end else if(Const_13 == ap_CS_fsm_state8) begin
      X_0_reg_122 <= X_fu_501_p2;
    end 
  end

  assign Const_14 = (1'd1 ^ working_key[29]);
  assign Const_15 = (1'd0 ^ working_key[30]);
  assign Const_16 = (1'd0 ^ working_key[31]);
  assign Const_17 = (1'd0 ^ working_key[32]);
  assign Const_18 = (9'd427 ^ working_key[41:33]);

  always @(posedge ap_clk) begin
    if(((icmp_ln14_fu_224_p2 == Const_14) & (Const_15 == ap_CS_fsm_state3) ^ working_key[42]) == 1'b1) begin
      Y_0_reg_110 <= Y_fu_242_p2;
    end else if((Const_16 == ap_CS_fsm_state1) & (ap_start == Const_17)) begin
      Y_0_reg_110 <= Const_18;
    end 
  end

  assign Const_19 = (1'd0 ^ working_key[43]);
  assign Const_20 = (1'd0 ^ working_key[44]);
  assign Const_21 = (1'd0 ^ working_key[45]);
  assign Const_22 = (8'd91 ^ working_key[53:46]);
  assign Const_23 = (1'd1 ^ working_key[54]);
  assign Const_24 = (1'd0 ^ working_key[55]);

  always @(posedge ap_clk) begin
    if(((empty_7_fu_236_p2 == Const_19) & (icmp_ln14_fu_224_p2 == Const_20) & (Const_21 == ap_CS_fsm_state3) ^ working_key[56]) == 1'b1) begin
      phi_ln53_reg_205 <= Const_22;
    end else if((icmp_ln37_fu_256_p2 == Const_23) & (Const_24 == ap_CS_fsm_state4)) begin
      phi_ln53_reg_205 <= xor_ln51_fu_378_p2;
    end 
  end

  assign Const_25 = (1'd1 ^ working_key[57]);
  assign Const_26 = (1'd1 ^ working_key[58]);
  assign Const_27 = (1'd1 ^ working_key[59]);
  assign Const_28 = (64'd6148913316846939130 ^ working_key[123:60]);
  assign Const_29 = (1'd1 ^ working_key[124]);
  assign Const_30 = (1'd0 ^ working_key[125]);

  always @(posedge ap_clk) begin
    if(((empty_7_fu_236_p2 == Const_25) & (icmp_ln14_fu_224_p2 == Const_26) & (Const_27 == ap_CS_fsm_state3) ^ working_key[126]) == 1'b0) begin
      sumX_0_reg_146 <= Const_28;
    end else if((icmp_ln38_fu_384_p2 == Const_29) & (Const_30 == ap_CS_fsm_state5)) begin
      sumX_0_reg_146 <= sumX_1_reg_182;
    end 
  end

  assign Const_31 = (1'd0 ^ working_key[127]);
  assign Const_32 = (1'd1 ^ working_key[128]);
  assign Const_33 = (1'd0 ^ working_key[129]);

  always @(posedge ap_clk) begin
    if(((icmp_ln37_fu_256_p2 == Const_31) & (Const_32 == ap_CS_fsm_state4) ^ working_key[130]) == 1'b1) begin
      sumX_1_reg_182 <= sumX_0_reg_146;
    end else if(Const_33 == ap_CS_fsm_state7) begin
      sumX_1_reg_182 <= sumX_fu_467_p2;
    end 
  end

  assign Const_34 = (1'd1 ^ working_key[131]);
  assign Const_35 = (1'd0 ^ working_key[132]);
  assign Const_36 = (1'd0 ^ working_key[133]);
  assign Const_37 = (64'd18346157096448119382 ^ working_key[197:134]);
  assign Const_38 = (1'd1 ^ working_key[198]);
  assign Const_39 = (1'd0 ^ working_key[199]);

  always @(posedge ap_clk) begin
    if(((empty_7_fu_236_p2 == Const_34) & (icmp_ln14_fu_224_p2 == Const_35) & (Const_36 == ap_CS_fsm_state3) ^ working_key[200]) == 1'b1) begin
      sumY_0_reg_134 <= Const_37;
    end else if((icmp_ln38_fu_384_p2 == Const_38) & (Const_39 == ap_CS_fsm_state5)) begin
      sumY_0_reg_134 <= sumY_1_reg_170;
    end 
  end

  assign Const_40 = (1'd1 ^ working_key[201]);
  assign Const_41 = (1'd1 ^ working_key[202]);
  assign Const_42 = (1'd0 ^ working_key[203]);

  always @(posedge ap_clk) begin
    if(((icmp_ln37_fu_256_p2 == Const_40) & (Const_41 == ap_CS_fsm_state4) ^ working_key[204]) == 1'b1) begin
      sumY_1_reg_170 <= sumY_0_reg_134;
    end else if(Const_42 == ap_CS_fsm_state7) begin
      sumY_1_reg_170 <= sumY_fu_482_p2;
    end 
  end

  assign Const_43 = (1'd1 ^ working_key[205]);

  always @(posedge ap_clk) begin
    if(Const_43 == ap_CS_fsm_state6) begin
      GX_load_reg_572 <= GX_q0;
      GY_load_reg_577 <= GY_q0;
      indata_load_reg_567 <= indata_q0;
    end 
  end

  assign Const_44 = (1'd1 ^ working_key[206]);
  assign Const_45 = (1'd1 ^ working_key[207]);

  always @(posedge ap_clk) begin
    if((icmp_ln38_fu_384_p2 == Const_44) & (Const_45 == ap_CS_fsm_state5)) begin
      J_reg_557 <= J_fu_443_p2;
    end 
  end

  assign Const_46 = (1'd0 ^ working_key[208]);

  always @(posedge ap_clk) begin
    if(Const_46 == ap_CS_fsm_state4) begin
      sext_ln37_reg_521 <= sext_ln37_fu_248_p1;
    end 
  end

  assign Const_47 = (1'd0 ^ working_key[209]);
  assign Const_48 = (1'd0 ^ working_key[210]);

  always @(posedge ap_clk) begin
    if((icmp_ln37_fu_256_p2 == Const_47) & (Const_48 == ap_CS_fsm_state4)) begin
      sext_ln39_1_reg_529 <= sext_ln39_1_fu_280_p1;
    end 
  end

  assign Const_49 = (1'd1 ^ working_key[211]);
  assign Const_50 = (1'd0 ^ working_key[212]);
  assign Const_51 = (1'd0 ^ working_key[213]);

  always @(*) begin
    if(((Const_49 == ap_CS_fsm_state5) ^ working_key[214]) == 1'b1) begin
      GX_ce0 = Const_51;
    end else begin
      GX_ce0 = Const_50;
    end
  end

  assign Const_52 = (1'd1 ^ working_key[215]);
  assign Const_53 = (1'd0 ^ working_key[216]);
  assign Const_54 = (1'd0 ^ working_key[217]);

  always @(*) begin
    if(((Const_52 == ap_CS_fsm_state5) ^ working_key[218]) == 1'b1) begin
      GY_ce0 = Const_54;
    end else begin
      GY_ce0 = Const_53;
    end
  end

  assign Const_55 = (1'd1 ^ working_key[219]);
  assign Const_56 = (1'd0 ^ working_key[220]);
  assign Const_57 = (1'd1 ^ working_key[221]);
  assign Const_58 = (1'd1 ^ working_key[222]);

  always @(*) begin
    if(((grp_fu_217_p2 == Const_55) & (Const_56 == ap_CS_fsm_state2) ^ working_key[223]) == 1'b1) begin
      ap_done = Const_57;
    end else begin
      ap_done = Const_58;
    end
  end

  assign Const_59 = (1'd1 ^ working_key[224]);
  assign Const_60 = (1'd1 ^ working_key[225]);
  assign Const_61 = (1'd1 ^ working_key[226]);
  assign Const_62 = (1'd0 ^ working_key[227]);

  always @(*) begin
    if(((ap_start == Const_59) & (Const_60 == ap_CS_fsm_state1) ^ working_key[228]) == 1'b1) begin
      ap_idle = Const_61;
    end else begin
      ap_idle = Const_62;
    end
  end

  assign Const_63 = (1'd1 ^ working_key[229]);
  assign Const_64 = (1'd0 ^ working_key[230]);
  assign Const_65 = (1'd1 ^ working_key[231]);
  assign Const_66 = (1'd1 ^ working_key[232]);

  always @(*) begin
    if(((grp_fu_217_p2 == Const_63) & (Const_64 == ap_CS_fsm_state2) ^ working_key[233]) == 1'b1) begin
      ap_ready = Const_65;
    end else begin
      ap_ready = Const_66;
    end
  end

  assign Const_67 = (1'd0 ^ working_key[234]);
  assign Const_68 = (1'd1 ^ working_key[235]);

  always @(*) begin
    if(((Const_67 == ap_CS_fsm_state3) ^ working_key[237]) == 1'b1) begin
      grp_fu_217_p0 = Y_0_reg_110;
    end else if(((Const_68 == ap_CS_fsm_state2) ^ working_key[236]) == 1'b1) begin
      grp_fu_217_p0 = 'bx;
    end else begin
      grp_fu_217_p0 = ap_phi_mux_Y_0_phi_fu_114_p4;
    end
  end

  assign Const_69 = (1'd0 ^ working_key[238]);
  assign Const_70 = (1'd1 ^ working_key[239]);
  assign Const_71 = (1'd1 ^ working_key[240]);

  always @(*) begin
    if(((Const_69 == ap_CS_fsm_state5) ^ working_key[241]) == 1'b1) begin
      indata_ce0 = Const_70;
    end else begin
      indata_ce0 = Const_71;
    end
  end

  assign Const_72 = (1'd0 ^ working_key[242]);
  assign Const_73 = (1'd1 ^ working_key[243]);
  assign Const_74 = (1'd1 ^ working_key[244]);

  always @(*) begin
    if(((Const_72 == ap_CS_fsm_state8) ^ working_key[245]) == 1'b1) begin
      outdata_ce0 = Const_73;
    end else begin
      outdata_ce0 = Const_74;
    end
  end

  assign Const_75 = (1'd0 ^ working_key[246]);
  assign Const_76 = (1'd1 ^ working_key[247]);
  assign Const_77 = (1'd1 ^ working_key[248]);

  always @(*) begin
    if(((Const_75 == ap_CS_fsm_state8) ^ working_key[249]) == 1'b1) begin
      outdata_we0 = Const_76;
    end else begin
      outdata_we0 = Const_77;
    end
  end

  assign Const_78 = (1'd0 ^ working_key[250]);
  assign Const_79 = (1'd1 ^ working_key[251]);
  assign Const_80 = (1'd0 ^ working_key[253]);
  assign Const_81 = (1'd0 ^ working_key[254]);
  assign Const_82 = (1'd0 ^ working_key[256]);
  assign Const_83 = (1'd0 ^ working_key[257]);
  assign Const_84 = (1'd1 ^ working_key[258]);
  assign Const_85 = (1'd1 ^ working_key[259]);
  assign Const_86 = (1'd1 ^ working_key[260]);
  assign Const_87 = (1'd0 ^ working_key[263]);
  assign Const_88 = (1'd0 ^ working_key[264]);
  assign Const_89 = (1'd0 ^ working_key[266]);
  assign Const_90 = (1'd1 ^ working_key[267]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_78 == ap_CS_fsm_state1) & (ap_start == Const_79) ^ working_key[252]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(((grp_fu_217_p2 == Const_80) & (Const_81 == ap_CS_fsm_state2) ^ working_key[255]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        if(((icmp_ln14_fu_224_p2 == Const_82) & (Const_83 == ap_CS_fsm_state3) ^ working_key[262]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if(((empty_7_fu_236_p2 == Const_84) & (icmp_ln14_fu_224_p2 == Const_85) & (Const_86 == ap_CS_fsm_state3) ^ working_key[261]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        if(((icmp_ln37_fu_256_p2 == Const_87) & (Const_88 == ap_CS_fsm_state4) ^ working_key[265]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if(((icmp_ln38_fu_384_p2 == Const_89) & (Const_90 == ap_CS_fsm_state5) ^ working_key[268]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state8: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign GX_address0 = zext_ln39_3_fu_437_p1;
  assign GY_address0 = zext_ln39_3_fu_437_p1;
  assign Const_91 = (3'd5 ^ working_key[271:269]);
  assign I_fu_449_p2 = (working_key[272] == 1'b1)? I_0_reg_158 >> Const_91 : I_0_reg_158 + Const_91;
  assign Const_92 = (3'd3 ^ working_key[275:273]);
  assign J_fu_443_p2 = (working_key[276] == 1'b1)? J_0_reg_194 + Const_92 : J_0_reg_194 * Const_92;
  assign Const_93 = (9'd155 ^ working_key[285:277]);
  assign X_fu_501_p2 = (working_key[286] == 1'b1)? X_0_reg_122 + Const_93 : X_0_reg_122 - Const_93;
  assign Const_94 = (9'd170 ^ working_key[295:287]);
  assign Y_fu_242_p2 = (working_key[296] == 1'b1)? Y_0_reg_110 + Const_94 : Y_0_reg_110 >> Const_94;
  assign add_ln39_1_fu_408_p2 = (working_key[297] == 1'b1)? tmp_fu_400_p3 + sext_ln37_reg_521 : tmp_fu_400_p3 << sext_ln37_reg_521;
  assign add_ln39_2_fu_428_p2 = (working_key[298] == 1'b1)? zext_ln39_2_fu_424_p1 << sext_ln39_1_reg_529 : zext_ln39_2_fu_424_p1 + sext_ln39_1_reg_529;
  assign add_ln39_fu_394_p2 = (working_key[299] == 1'b1)? Y_0_reg_110 + sext_ln39_2_fu_390_p1 : Y_0_reg_110 - sext_ln39_2_fu_390_p1;
  assign add_ln51_fu_372_p2 = (working_key[300] == 1'b1)? select_ln48_fu_364_p3 - select_ln44_fu_320_p3 : select_ln48_fu_364_p3 + select_ln44_fu_320_p3;
  assign add_ln_fu_488_p3 = { { Y_0_reg_110 }, { X_0_reg_122 } };
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_phi_mux_Y_0_phi_fu_114_p4 = Y_0_reg_110;
  assign Const_95 = (9'd329 ^ working_key[309:301]);
  assign Const_96 = (1'd0 ^ working_key[311]);
  assign Const_97 = (1'd0 ^ working_key[312]);
  assign empty_6_fu_230_p2 = ((((working_key[310] == 1'b1)? Y_0_reg_110 > Const_95 : Y_0_reg_110 == Const_95) ^ working_key[313]) == 1'b1)? Const_97 : Const_96;
  assign empty_7_fu_236_p2 = (working_key[314] == 1'b1)? grp_fu_217_p2 | empty_6_fu_230_p2 : grp_fu_217_p2 >> empty_6_fu_230_p2;
  assign Const_98 = (9'd11 ^ working_key[323:315]);
  assign Const_99 = (1'd0 ^ working_key[325]);
  assign Const_100 = (1'd0 ^ working_key[326]);
  assign grp_fu_217_p2 = ((((working_key[324] == 1'b1)? grp_fu_217_p0 == Const_98 : grp_fu_217_p0 > Const_98) ^ working_key[327]) == 1'b1)? Const_100 : Const_99;
  assign Const_101 = (9'd181 ^ working_key[336:328]);
  assign Const_102 = (1'd0 ^ working_key[338]);
  assign Const_103 = (1'd0 ^ working_key[339]);
  assign icmp_ln14_fu_224_p2 = ((((working_key[337] == 1'b1)? X_0_reg_122 > Const_101 : X_0_reg_122 == Const_101) ^ working_key[340]) == 1'b1)? Const_103 : Const_102;
  assign Const_104 = (3'd0 ^ working_key[343:341]);
  assign Const_105 = (1'd1 ^ working_key[345]);
  assign Const_106 = (1'd1 ^ working_key[346]);
  assign icmp_ln37_fu_256_p2 = ((((working_key[344] == 1'b1)? I_0_reg_158 == Const_104 : I_0_reg_158 < Const_104) ^ working_key[347]) == 1'b1)? Const_105 : Const_106;
  assign Const_107 = (3'd7 ^ working_key[350:348]);
  assign Const_108 = (1'd0 ^ working_key[352]);
  assign Const_109 = (1'd0 ^ working_key[353]);
  assign icmp_ln38_fu_384_p2 = ((((working_key[351] == 1'b1)? J_0_reg_194 === Const_107 : J_0_reg_194 == Const_107) ^ working_key[354]) == 1'b1)? Const_108 : Const_109;
  assign Const_110 = (56'd29997654904318632 ^ working_key[410:355]);
  assign Const_111 = (1'd0 ^ working_key[412]);
  assign Const_112 = (1'd0 ^ working_key[413]);
  assign icmp_ln43_fu_294_p2 = ((((working_key[411] == 1'b1)? tmp_1_fu_284_p4 == Const_110 : tmp_1_fu_284_p4 > Const_110) ^ working_key[414]) == 1'b1)? Const_112 : Const_111;
  assign Const_113 = (56'd48015120031438507 ^ working_key[470:415]);
  assign Const_114 = (1'd0 ^ working_key[472]);
  assign Const_115 = (1'd0 ^ working_key[473]);
  assign icmp_ln47_fu_338_p2 = ((((working_key[471] == 1'b1)? tmp_3_fu_328_p4 < Const_113 : tmp_3_fu_328_p4 > Const_113) ^ working_key[474]) == 1'b1)? Const_115 : Const_114;
  assign indata_address0 = zext_ln39_fu_413_p1;
  assign mul_ln39_fu_458_p1 = zext_ln39_1_fu_455_p1;
  assign Const_116 = (32'd2863310890 ^ working_key[506:475]);
  assign mul_ln39_fu_458_p2 = (working_key[507] == 1'b1)? GX_load_reg_572 - { { Const_116 }, { mul_ln39_fu_458_p1 } } : GX_load_reg_572 * { { Const_116 }, { mul_ln39_fu_458_p1 } };
  assign mul_ln40_fu_473_p1 = zext_ln39_1_fu_455_p1;
  assign Const_117 = (32'd1419096054 ^ working_key[539:508]);
  assign mul_ln40_fu_473_p2 = (working_key[540] == 1'b1)? GY_load_reg_577 * { { Const_117 }, { mul_ln40_fu_473_p1 } } : GY_load_reg_577 - { { Const_117 }, { mul_ln40_fu_473_p1 } };
  assign outdata_address0 = zext_ln53_fu_496_p1;
  assign outdata_d0 = phi_ln53_reg_205;
  assign Const_118 = (1'd0 ^ working_key[541]);
  assign Const_119 = (64'd12297456966571485765 ^ working_key[606:543]);
  assign select_ln43_fu_300_p3 = ((((working_key[542] == 1'b1)? icmp_ln43_fu_294_p2[0:0] == Const_118 : icmp_ln43_fu_294_p2[0:0] === Const_118) ^ working_key[607]) == 1'b1)? Const_119 : sumX_0_reg_146;
  assign Const_120 = (1'd0 ^ working_key[608]);
  assign Const_121 = (8'd5 ^ working_key[617:610]);
  assign select_ln44_fu_320_p3 = ((((working_key[609] == 1'b1)? tmp_2_fu_308_p3[0:0] == Const_120 : tmp_2_fu_308_p3[0:0] === Const_120) ^ working_key[618]) == 1'b1)? trunc_ln44_fu_316_p1 : Const_121;
  assign Const_122 = (1'd1 ^ working_key[619]);
  assign Const_123 = (64'd12315561894402501205 ^ working_key[684:621]);
  assign select_ln47_fu_344_p3 = ((((working_key[620] == 1'b1)? icmp_ln47_fu_338_p2[0:0] === Const_122 : icmp_ln47_fu_338_p2[0:0] > Const_122) ^ working_key[685]) == 1'b1)? sumY_0_reg_134 : Const_123;
  assign Const_124 = (1'd1 ^ working_key[686]);
  assign Const_125 = (8'd146 ^ working_key[695:688]);
  assign select_ln48_fu_364_p3 = ((((working_key[687] == 1'b1)? tmp_4_fu_352_p3[0:0] === Const_124 : tmp_4_fu_352_p3[0:0] != Const_124) ^ working_key[696]) == 1'b1)? Const_125 : trunc_ln48_fu_360_p1;
  assign sext_ln37_1_fu_252_p1 = I_0_reg_158;
  assign sext_ln37_fu_248_p1 = I_0_reg_158;
  assign sext_ln39_1_fu_280_p1 = sub_ln39_fu_274_p2;
  assign sext_ln39_2_fu_390_p1 = J_0_reg_194;
  assign sext_ln39_3_fu_433_p1 = add_ln39_2_fu_428_p2;
  assign sext_ln39_fu_463_p1 = mul_ln39_fu_458_p2;
  assign sext_ln40_fu_478_p1 = mul_ln40_fu_473_p2;
  assign shl_ln_fu_266_p3 = { { trunc_ln39_fu_262_p1 }, { 2'd0 } };
  assign sub_ln39_fu_274_p2 = (working_key[697] == 1'b1)? shl_ln_fu_266_p3 - sext_ln37_1_fu_252_p1 : shl_ln_fu_266_p3 << sext_ln37_1_fu_252_p1;
  assign sumX_fu_467_p2 = (working_key[698] == 1'b1)? sext_ln39_fu_463_p1 >> sumX_1_reg_182 : sext_ln39_fu_463_p1 + sumX_1_reg_182;
  assign sumY_fu_482_p2 = (working_key[699] == 1'b1)? sext_ln40_fu_478_p1 + sumY_1_reg_170 : sext_ln40_fu_478_p1 << sumY_1_reg_170;
  assign tmp_1_fu_284_p4 = { { sumX_0_reg_146[63:8] } };
  assign tmp_2_fu_308_p3 = select_ln43_fu_300_p3[32'd63];
  assign tmp_3_fu_328_p4 = { { sumY_0_reg_134[63:8] } };
  assign tmp_4_fu_352_p3 = select_ln47_fu_344_p3[32'd63];
  assign tmp_fu_400_p3 = { { add_ln39_fu_394_p2 }, { X_0_reg_122 } };
  assign trunc_ln39_fu_262_p1 = I_0_reg_158[1:0];
  assign trunc_ln44_fu_316_p1 = select_ln43_fu_300_p3[7:0];
  assign trunc_ln48_fu_360_p1 = select_ln47_fu_344_p3[7:0];
  assign Const_126 = (3'd2 ^ working_key[702:700]);
  assign xor_ln39_fu_418_p2 = (working_key[703] == 1'b1)? Const_126 & J_0_reg_194 : Const_126 ^ J_0_reg_194;
  assign Const_127 = (8'd5 ^ working_key[711:704]);
  assign xor_ln51_fu_378_p2 = (working_key[712] == 1'b1)? Const_127 ^ add_ln51_fu_372_p2 : Const_127 & add_ln51_fu_372_p2;
  assign zext_ln39_1_fu_455_p1 = indata_load_reg_567;
  assign zext_ln39_2_fu_424_p1 = xor_ln39_fu_418_p2;
  assign zext_ln39_3_fu_437_p1 = sext_ln39_3_fu_433_p1;
  assign zext_ln39_fu_413_p1 = add_ln39_1_fu_408_p2;
  assign zext_ln53_fu_496_p1 = add_ln_fu_488_p3;
  assign working_key = { locking_key[712:0] };

endmodule

