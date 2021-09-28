
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
  GY_q0
);

  parameter ap_ST_fsm_state1 = 12'd1;
  parameter ap_ST_fsm_state2 = 12'd2;
  parameter ap_ST_fsm_state3 = 12'd4;
  parameter ap_ST_fsm_state4 = 12'd8;
  parameter ap_ST_fsm_state5 = 12'd16;
  parameter ap_ST_fsm_state6 = 12'd32;
  parameter ap_ST_fsm_state7 = 12'd64;
  parameter ap_ST_fsm_state8 = 12'd128;
  parameter ap_ST_fsm_state9 = 12'd256;
  parameter ap_ST_fsm_state10 = 12'd512;
  parameter ap_ST_fsm_state11 = 12'd1024;
  parameter ap_ST_fsm_state12 = 12'd2048;
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
  wire ap_CS_fsm_state9;
  wire ap_CS_fsm_state10;
  wire ap_CS_fsm_state11;
  wire ap_CS_fsm_state12;
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
  input [45:0] working_key;
  reg [11:0] ap_NS_fsm;

  initial begin
    #0 ap_CS_fsm = 12'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if((empty_7_fu_236_p2 == 1'd0) & (icmp_ln14_fu_224_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      if(working_key[8] == 1'b1) begin
        I_0_reg_158 <= 3'd7;
      end else begin
        I_0_reg_158 <= J_fu_443_p2;
      end
    end else if((icmp_ln38_fu_384_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) begin
      if(working_key[9] == 1'b1) begin
        I_0_reg_158 <= sumX_0_reg_146;
      end else begin
        I_0_reg_158 <= I_fu_449_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln37_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[10] == 1'b1) begin
        J_0_reg_194 <= 3'd7;
      end else begin
        J_0_reg_194 <= J_reg_557;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      if(working_key[11] == 1'b1) begin
        J_0_reg_194 <= ap_phi_mux_Y_0_phi_fu_114_p4;
      end else begin
        J_0_reg_194 <= J_reg_557;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_fu_217_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      if(working_key[12] == 1'b1) begin
        X_0_reg_122 <= 9'd1;
      end else begin
        X_0_reg_122 <= J_reg_557;
      end
    end else if(1'b1 == ap_CS_fsm_state8) begin
      if(working_key[13] == 1'b1) begin
        X_0_reg_122 <= Y_0_reg_110;
      end else begin
        X_0_reg_122 <= X_fu_501_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln14_fu_224_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
      if(working_key[14] == 1'b1) begin
        Y_0_reg_110 <= sext_ln37_fu_248_p1;
      end else begin
        Y_0_reg_110 <= Y_fu_242_p2;
      end
    end else if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[15] == 1'b1) begin
        Y_0_reg_110 <= 9'd1;
      end else begin
        Y_0_reg_110 <= J_reg_557;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((empty_7_fu_236_p2 == 1'd1) & (icmp_ln14_fu_224_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      if(working_key[16] == 1'b1) begin
        phi_ln53_reg_205 <= sumX_1_reg_182;
      end else begin
        phi_ln53_reg_205 <= 8'd255;
      end
    end else if((icmp_ln37_fu_256_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[17] == 1'b1) begin
        phi_ln53_reg_205 <= sumY_0_reg_134;
      end else begin
        phi_ln53_reg_205 <= xor_ln51_fu_378_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((empty_7_fu_236_p2 == 1'd0) & (icmp_ln14_fu_224_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      if(working_key[18] == 1'b1) begin
        sumX_0_reg_146 <= 64'd0;
      end else begin
        sumX_0_reg_146 <= Y_0_reg_110;
      end
    end else if((icmp_ln38_fu_384_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) begin
      if(working_key[19] == 1'b1) begin
        sumX_0_reg_146 <= J_reg_557;
      end else begin
        sumX_0_reg_146 <= sumX_1_reg_182;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln37_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[20] == 1'b1) begin
        sumX_1_reg_182 <= sumX_0_reg_146;
      end else begin
        sumX_1_reg_182 <= indata_q0;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      if(working_key[21] == 1'b1) begin
        sumX_1_reg_182 <= X_fu_501_p2;
      end else begin
        sumX_1_reg_182 <= sumX_fu_467_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state9) begin
      if(working_key[22] == 1'b1) begin
        sumX_1_reg_182 <= X_fu_501_p2;
      end else begin
        sumX_1_reg_182 <= Y_0_reg_110;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((empty_7_fu_236_p2 == 1'd0) & (icmp_ln14_fu_224_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      if(working_key[23] == 1'b1) begin
        sumY_0_reg_134 <= sumY_0_reg_134;
      end else begin
        sumY_0_reg_134 <= 64'd0;
      end
    end else if((icmp_ln38_fu_384_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) begin
      if(working_key[24] == 1'b1) begin
        sumY_0_reg_134 <= sumY_1_reg_170;
      end else begin
        sumY_0_reg_134 <= J_reg_557;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln37_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[25] == 1'b1) begin
        sumY_1_reg_170 <= sumY_0_reg_134;
      end else begin
        sumY_1_reg_170 <= Y_0_reg_110;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      if(working_key[26] == 1'b1) begin
        sumY_1_reg_170 <= ap_phi_mux_Y_0_phi_fu_114_p4;
      end else begin
        sumY_1_reg_170 <= sumY_fu_482_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      if(working_key[27] == 1'b1) begin
        GX_load_reg_572 <= sumY_fu_482_p2;
        GY_load_reg_577 <= X_fu_501_p2;
        indata_load_reg_567 <= Y_0_reg_110;
      end else begin
        GX_load_reg_572 <= GX_q0;
        GY_load_reg_577 <= GY_q0;
        indata_load_reg_567 <= indata_q0;
      end
    end else if(1'd1 == ap_CS_fsm_state9) begin
      if(working_key[28] == 1'b1) begin
        GY_load_reg_577 <= J_reg_557;
      end else begin
        GY_load_reg_577 <= sext_ln37_fu_248_p1;
      end
    end else if(1'd1 == ap_CS_fsm_state10) begin
      if(working_key[29] == 1'b1) begin
        indata_load_reg_567 <= X_fu_501_p2;
      end else begin
        indata_load_reg_567 <= X_fu_501_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state10) begin
      if(working_key[30] == 1'b1) begin
        GX_load_reg_572 <= xor_ln51_fu_378_p2;
      end else begin
        GX_load_reg_572 <= xor_ln51_fu_378_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state10) begin
      if(working_key[31] == 1'b1) begin
        GY_load_reg_577 <= J_fu_443_p2;
      end else begin
        GY_load_reg_577 <= indata_q0;
      end
    end else if(1'd1 == ap_CS_fsm_state11) begin
      if(working_key[32] == 1'b1) begin
        GX_load_reg_572 <= Y_0_reg_110;
      end else begin
        GX_load_reg_572 <= ap_phi_mux_Y_0_phi_fu_114_p4;
      end
    end else if(1'd1 == ap_CS_fsm_state11) begin
      if(working_key[33] == 1'b1) begin
        indata_load_reg_567 <= GY_q0;
      end else begin
        indata_load_reg_567 <= sumX_fu_467_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state12) begin
      if(working_key[34] == 1'b1) begin
        GY_load_reg_577 <= indata_q0;
      end else begin
        GY_load_reg_577 <= sumX_1_reg_182;
      end
    end else if(1'd1 == ap_CS_fsm_state12) begin
      if(working_key[35] == 1'b1) begin
        GX_load_reg_572 <= sumY_fu_482_p2;
      end else begin
        GX_load_reg_572 <= I_fu_449_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state12) begin
      if(working_key[36] == 1'b1) begin
        GY_load_reg_577 <= sumY_0_reg_134;
      end else begin
        GY_load_reg_577 <= indata_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln38_fu_384_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5)) begin
      if(working_key[37] == 1'b1) begin
        J_reg_557 <= I_fu_449_p2;
      end else begin
        J_reg_557 <= J_fu_443_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state11) begin
      if(working_key[38] == 1'b1) begin
        J_reg_557 <= indata_q0;
      end else begin
        J_reg_557 <= GY_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      if(working_key[39] == 1'b1) begin
        sext_ln37_reg_521 <= sumY_fu_482_p2;
      end else begin
        sext_ln37_reg_521 <= sext_ln37_fu_248_p1;
      end
    end else if(1'd1 == ap_CS_fsm_state11) begin
      if(working_key[40] == 1'b1) begin
        sext_ln37_reg_521 <= J_reg_557;
      end else begin
        sext_ln37_reg_521 <= sext_ln39_1_fu_280_p1;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln37_fu_256_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[41] == 1'b1) begin
        sext_ln39_1_reg_529 <= sext_ln39_1_fu_280_p1;
      end else begin
        sext_ln39_1_reg_529 <= xor_ln51_fu_378_p2;
      end
    end else if(1'd1 == ap_CS_fsm_state12) begin
      if(working_key[42] == 1'b1) begin
        sext_ln39_1_reg_529 <= sumX_1_reg_182;
      end else begin
        sext_ln39_1_reg_529 <= sumX_0_reg_146;
      end
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      GX_ce0 = 1'b1;
    end else begin
      GX_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      GY_ce0 = 1'b1;
    end else begin
      GY_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((grp_fu_217_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
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
    if((grp_fu_217_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      if(working_key[43] == 1'b1) begin
        grp_fu_217_p0 = Y_0_reg_110;
      end else begin
        grp_fu_217_p0 <= ap_phi_mux_Y_0_phi_fu_114_p4;
      end
    end else if(1'b1 == ap_CS_fsm_state2) begin
      if(working_key[44] == 1'b1) begin
        grp_fu_217_p0 <= GX_q0;
      end else begin
        grp_fu_217_p0 = ap_phi_mux_Y_0_phi_fu_114_p4;
      end
    end else begin
      grp_fu_217_p0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      indata_ce0 = 1'b1;
    end else begin
      indata_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      outdata_ce0 = 1'b1;
    end else begin
      outdata_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      outdata_we0 = 1'b1;
    end else begin
      outdata_we0 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          if(working_key[0] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state9;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((grp_fu_217_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
          if(working_key[2] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state1;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state10;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        if((icmp_ln14_fu_224_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
          if(working_key[4] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state11;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end
        end else if((empty_7_fu_236_p2 == 1'd0) & (icmp_ln14_fu_224_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end
      end
      ap_ST_fsm_state4: begin
        if((icmp_ln37_fu_256_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
          if(working_key[6] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state12;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state8;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if((icmp_ln38_fu_384_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) if(working_key[45] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
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
      ap_ST_fsm_state9: begin
        if(working_key[1] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end
      end
      ap_ST_fsm_state10: begin
        if(working_key[3] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state11: begin
        if(working_key[5] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state12: begin
        if(working_key[7] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end
      end
    endcase
  end

  assign GX_address0 = zext_ln39_3_fu_437_p1;
  assign GY_address0 = zext_ln39_3_fu_437_p1;
  assign I_fu_449_p2 = $signed(I_0_reg_158) + $signed(3'd1);
  assign J_fu_443_p2 = $signed(J_0_reg_194) + $signed(3'd1);
  assign X_fu_501_p2 = X_0_reg_122 + 9'd1;
  assign Y_fu_242_p2 = Y_0_reg_110 + 9'd1;
  assign add_ln39_1_fu_408_p2 = $signed(tmp_fu_400_p3) + $signed(sext_ln37_reg_521);
  assign add_ln39_2_fu_428_p2 = $signed(zext_ln39_2_fu_424_p1) + $signed(sext_ln39_1_reg_529);
  assign add_ln39_fu_394_p2 = $signed(Y_0_reg_110) + $signed(sext_ln39_2_fu_390_p1);
  assign add_ln51_fu_372_p2 = select_ln48_fu_364_p3 + select_ln44_fu_320_p3;
  assign add_ln_fu_488_p3 = { { Y_0_reg_110 }, { X_0_reg_122 } };
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_phi_mux_Y_0_phi_fu_114_p4 = Y_0_reg_110;
  assign empty_6_fu_230_p2 = (Y_0_reg_110 == 9'd0)? 1'b1 : 1'b0;
  assign empty_7_fu_236_p2 = grp_fu_217_p2 | empty_6_fu_230_p2;
  assign grp_fu_217_p2 = (grp_fu_217_p0 == 9'd511)? 1'b1 : 1'b0;
  assign icmp_ln14_fu_224_p2 = (X_0_reg_122 == 9'd511)? 1'b1 : 1'b0;
  assign icmp_ln37_fu_256_p2 = (I_0_reg_158 == 3'd2)? 1'b1 : 1'b0;
  assign icmp_ln38_fu_384_p2 = (J_0_reg_194 == 3'd2)? 1'b1 : 1'b0;
  assign icmp_ln43_fu_294_p2 = ($signed(tmp_1_fu_284_p4) > $signed(56'd0))? 1'b1 : 1'b0;
  assign icmp_ln47_fu_338_p2 = ($signed(tmp_3_fu_328_p4) > $signed(56'd0))? 1'b1 : 1'b0;
  assign indata_address0 = zext_ln39_fu_413_p1;
  assign mul_ln39_fu_458_p1 = zext_ln39_1_fu_455_p1;
  assign mul_ln39_fu_458_p2 = $signed(GX_load_reg_572) * $signed({ { 1'b0 }, { mul_ln39_fu_458_p1 } });
  assign mul_ln40_fu_473_p1 = zext_ln39_1_fu_455_p1;
  assign mul_ln40_fu_473_p2 = $signed(GY_load_reg_577) * $signed({ { 1'b0 }, { mul_ln40_fu_473_p1 } });
  assign outdata_address0 = zext_ln53_fu_496_p1;
  assign outdata_d0 = phi_ln53_reg_205;
  assign select_ln43_fu_300_p3 = (icmp_ln43_fu_294_p2[0:0] === 1'b1)? 64'd255 : sumX_0_reg_146;
  assign select_ln44_fu_320_p3 = (tmp_2_fu_308_p3[0:0] === 1'b1)? 8'd0 : trunc_ln44_fu_316_p1;
  assign select_ln47_fu_344_p3 = (icmp_ln47_fu_338_p2[0:0] === 1'b1)? 64'd255 : sumY_0_reg_134;
  assign select_ln48_fu_364_p3 = (tmp_4_fu_352_p3[0:0] === 1'b1)? 8'd0 : trunc_ln48_fu_360_p1;
  assign sext_ln37_1_fu_252_p1 = I_0_reg_158;
  assign sext_ln37_fu_248_p1 = I_0_reg_158;
  assign sext_ln39_1_fu_280_p1 = $signed(sub_ln39_fu_274_p2);
  assign sext_ln39_2_fu_390_p1 = J_0_reg_194;
  assign sext_ln39_3_fu_433_p1 = $signed(add_ln39_2_fu_428_p2);
  assign sext_ln39_fu_463_p1 = $signed(mul_ln39_fu_458_p2);
  assign sext_ln40_fu_478_p1 = $signed(mul_ln40_fu_473_p2);
  assign shl_ln_fu_266_p3 = { { trunc_ln39_fu_262_p1 }, { 2'd0 } };
  assign sub_ln39_fu_274_p2 = $signed(shl_ln_fu_266_p3) - $signed(sext_ln37_1_fu_252_p1);
  assign sumX_fu_467_p2 = $signed(sext_ln39_fu_463_p1) + $signed(sumX_1_reg_182);
  assign sumY_fu_482_p2 = $signed(sext_ln40_fu_478_p1) + $signed(sumY_1_reg_170);
  assign tmp_1_fu_284_p4 = { { sumX_0_reg_146[63:8] } };
  assign tmp_2_fu_308_p3 = select_ln43_fu_300_p3[32'd63];
  assign tmp_3_fu_328_p4 = { { sumY_0_reg_134[63:8] } };
  assign tmp_4_fu_352_p3 = select_ln47_fu_344_p3[32'd63];
  assign tmp_fu_400_p3 = { { add_ln39_fu_394_p2 }, { X_0_reg_122 } };
  assign trunc_ln39_fu_262_p1 = I_0_reg_158[1:0];
  assign trunc_ln44_fu_316_p1 = select_ln43_fu_300_p3[7:0];
  assign trunc_ln48_fu_360_p1 = select_ln47_fu_344_p3[7:0];
  assign xor_ln39_fu_418_p2 = 3'd4 ^ J_0_reg_194;
  assign xor_ln51_fu_378_p2 = 8'd255 ^ add_ln51_fu_372_p2;
  assign zext_ln39_1_fu_455_p1 = indata_load_reg_567;
  assign zext_ln39_2_fu_424_p1 = xor_ln39_fu_418_p2;
  assign zext_ln39_3_fu_437_p1 = $unsigned(sext_ln39_3_fu_433_p1);
  assign zext_ln39_fu_413_p1 = add_ln39_1_fu_408_p2;
  assign zext_ln53_fu_496_p1 = add_ln_fu_488_p3;

endmodule

