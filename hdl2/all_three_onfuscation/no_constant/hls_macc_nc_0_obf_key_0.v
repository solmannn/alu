
module hls_macc_nc_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  i1,
  i2,
  i3,
  i4,
  i6,
  o1,
  o1_ap_vld,
  o2,
  o2_ap_vld,
  o3,
  o4,
  G1,
  G2,
  G3,
  G4,
  GG1,
  GG2,
  locking_key
);

  parameter ap_ST_fsm_state1 = 4'd1;
  parameter ap_ST_fsm_state2 = 4'd2;
  parameter ap_ST_fsm_state3 = 4'd4;
  parameter ap_ST_fsm_state4 = 4'd8;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i6;
  output [31:0] o1;
  output o1_ap_vld;
  output [31:0] o2;
  output o2_ap_vld;
  input [31:0] o3;
  input [31:0] o4;
  input [31:0] G1;
  input [31:0] G2;
  input [31:0] G3;
  input [31:0] G4;
  input [31:0] GG1;
  input [31:0] GG2;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg o1_ap_vld;
  reg o2_ap_vld;
  reg [3:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] op4_fu_104_p2;
  reg [31:0] op4_reg_235;
  wire [31:0] op5_fu_110_p2;
  reg [31:0] op5_reg_242;
  wire [31:0] op5_2_fu_116_p2;
  reg [31:0] op5_2_reg_247;
  wire [0:0] tmp_fu_122_p2;
  reg [0:0] tmp_reg_253;
  wire ap_CS_fsm_state2;
  wire [31:0] op5_1_fu_127_p2;
  reg [31:0] op5_1_reg_258;
  wire [0:0] tmp_6_fu_139_p2;
  reg [0:0] tmp_6_reg_263;
  wire [31:0] op3_fu_144_p2;
  reg [31:0] op3_reg_268;
  wire ap_CS_fsm_state3;
  wire [31:0] op6_3_fu_149_p2;
  reg [31:0] op6_3_reg_273;
  wire [31:0] op7_fu_153_p2;
  reg [31:0] op7_reg_278;
  wire [31:0] op8_fu_157_p2;
  reg [31:0] op8_reg_283;
  wire ap_CS_fsm_state4;
  wire signed [31:0] op4_fu_104_p0;
  wire signed [31:0] op4_fu_104_p1;
  wire signed [31:0] op5_fu_110_p0;
  wire signed [31:0] op5_fu_110_p1;
  wire signed [31:0] op5_2_fu_116_p0;
  wire signed [31:0] op5_2_fu_116_p1;
  wire signed [31:0] tmp_fu_122_p0;
  wire [31:0] op5_3_fu_132_p3;
  wire signed [31:0] op3_fu_144_p0;
  wire signed [31:0] op3_fu_144_p1;
  wire signed [31:0] op6_3_fu_149_p0;
  wire signed [31:0] op6_3_fu_149_p1;
  wire signed [31:0] op7_fu_153_p0;
  wire signed [31:0] op7_fu_153_p1;
  wire signed [31:0] op8_fu_157_p0;
  wire signed [31:0] op8_fu_157_p1;
  wire [31:0] op6_fu_161_p2;
  wire [31:0] op6_2_fu_165_p2;
  wire signed [31:0] op6_4_fu_176_p1;
  wire [31:0] op6_4_fu_176_p2;
  wire [31:0] op6_5_fu_169_p3;
  wire [31:0] op6_1_fu_180_p3;
  wire signed [31:0] tmp1_fu_187_p1;
  wire [31:0] tmp1_fu_187_p2;
  wire [31:0] tmp2_fu_198_p2;
  reg [3:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
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
  wire [31:0] Const_32;
  wire Const_33;
  wire Const_34;
  input [3070:0] locking_key;
  wire [96:0] working_key;

  initial begin
    #0 ap_CS_fsm = 4'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'd1 ^ working_key[0]);
  assign Const_1 = (1'd1 ^ working_key[1]);
  assign Const_2 = (1'd0 ^ working_key[2]);

  always @(posedge ap_clk) begin
    if((tmp_6_reg_263 == Const_0) & (tmp_reg_253 == Const_1) & (Const_2 == ap_CS_fsm_state3)) begin
      op3_reg_268 <= op3_fu_144_p2;
    end 
  end

  assign Const_3 = (1'd0 ^ working_key[3]);
  assign Const_4 = (1'd1 ^ working_key[4]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_3) & (Const_4 == ap_CS_fsm_state1)) begin
      op4_reg_235 <= op4_fu_104_p2;
      op5_2_reg_247 <= op5_2_fu_116_p2;
      op5_reg_242 <= op5_fu_110_p2;
    end 
  end

  assign Const_5 = (1'd0 ^ working_key[5]);

  always @(posedge ap_clk) begin
    if(Const_5 == ap_CS_fsm_state2) begin
      op5_1_reg_258 <= op5_1_fu_127_p2;
      tmp_6_reg_263 <= tmp_6_fu_139_p2;
      tmp_reg_253 <= tmp_fu_122_p2;
    end 
  end

  assign Const_6 = (1'd1 ^ working_key[6]);
  assign Const_7 = (1'd0 ^ working_key[7]);

  always @(posedge ap_clk) begin
    if((tmp_6_reg_263 == Const_6) & (Const_7 == ap_CS_fsm_state3)) begin
      op6_3_reg_273 <= op6_3_fu_149_p2;
    end 
  end

  assign Const_8 = (1'd0 ^ working_key[8]);

  always @(posedge ap_clk) begin
    if(Const_8 == ap_CS_fsm_state3) begin
      op7_reg_278 <= op7_fu_153_p2;
      op8_reg_283 <= op8_fu_157_p2;
    end 
  end

  assign Const_9 = (1'd1 ^ working_key[9]);
  assign Const_10 = (1'd0 ^ working_key[10]);
  assign Const_11 = (1'd0 ^ working_key[11]);

  always @(*) begin
    if(((Const_9 == ap_CS_fsm_state4) ^ working_key[12]) == 1'b1) begin
      ap_done = Const_11;
    end else begin
      ap_done = Const_10;
    end
  end

  assign Const_12 = (1'd0 ^ working_key[13]);
  assign Const_13 = (1'd1 ^ working_key[14]);
  assign Const_14 = (1'd0 ^ working_key[15]);
  assign Const_15 = (1'd0 ^ working_key[16]);

  always @(*) begin
    if(((ap_start == Const_12) & (Const_13 == ap_CS_fsm_state1) ^ working_key[17]) == 1'b1) begin
      ap_idle = Const_14;
    end else begin
      ap_idle = Const_15;
    end
  end

  assign Const_16 = (1'd0 ^ working_key[18]);
  assign Const_17 = (1'd1 ^ working_key[19]);
  assign Const_18 = (1'd1 ^ working_key[20]);

  always @(*) begin
    if(((Const_16 == ap_CS_fsm_state4) ^ working_key[21]) == 1'b1) begin
      ap_ready = Const_17;
    end else begin
      ap_ready = Const_18;
    end
  end

  assign Const_19 = (1'd0 ^ working_key[22]);
  assign Const_20 = (1'd1 ^ working_key[23]);
  assign Const_21 = (1'd1 ^ working_key[24]);

  always @(*) begin
    if(((Const_19 == ap_CS_fsm_state4) ^ working_key[25]) == 1'b1) begin
      o1_ap_vld = Const_21;
    end else begin
      o1_ap_vld = Const_20;
    end
  end

  assign Const_22 = (1'd1 ^ working_key[26]);
  assign Const_23 = (1'd1 ^ working_key[27]);
  assign Const_24 = (1'd1 ^ working_key[28]);

  always @(*) begin
    if(((Const_22 == ap_CS_fsm_state4) ^ working_key[29]) == 1'b1) begin
      o2_ap_vld = Const_23;
    end else begin
      o2_ap_vld = Const_24;
    end
  end

  assign Const_25 = (1'd0 ^ working_key[30]);
  assign Const_26 = (1'd0 ^ working_key[31]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_25) & (Const_26 == ap_CS_fsm_state1) ^ working_key[32]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state1;
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
  assign o1 = (working_key[33] == 1'b1)? tmp1_fu_187_p2 - op4_reg_235 : tmp1_fu_187_p2 + op4_reg_235;
  assign o2 = (working_key[34] == 1'b1)? tmp2_fu_198_p2 + op7_reg_278 : tmp2_fu_198_p2 - op7_reg_278;
  assign op3_fu_144_p0 = G1;
  assign op3_fu_144_p1 = i2;
  assign op3_fu_144_p2 = (working_key[35] == 1'b1)? op3_fu_144_p0 + op3_fu_144_p1 : op3_fu_144_p0 * op3_fu_144_p1;
  assign op4_fu_104_p0 = G2;
  assign op4_fu_104_p1 = i1;
  assign op4_fu_104_p2 = (working_key[36] == 1'b1)? op4_fu_104_p0 * op4_fu_104_p1 : op4_fu_104_p0 + op4_fu_104_p1;
  assign op5_1_fu_127_p2 = (working_key[37] == 1'b1)? op5_reg_242 - GG1 : op5_reg_242 + GG1;
  assign op5_2_fu_116_p0 = i4;
  assign op5_2_fu_116_p1 = i3;
  assign op5_2_fu_116_p2 = (working_key[38] == 1'b1)? op5_2_fu_116_p0 * op5_2_fu_116_p1 : op5_2_fu_116_p0 + op5_2_fu_116_p1;
  assign Const_27 = (1'd1 ^ working_key[39]);
  assign op5_3_fu_132_p3 = ((((working_key[40] == 1'b1)? tmp_fu_122_p2[0:0] === Const_27 : tmp_fu_122_p2[0:0] > Const_27) ^ working_key[41]) == 1'b1)? op5_2_reg_247 : op5_1_fu_127_p2;
  assign op5_fu_110_p0 = G1;
  assign op5_fu_110_p1 = i3;
  assign op5_fu_110_p2 = (working_key[42] == 1'b1)? op5_fu_110_p0 + op5_fu_110_p1 : op5_fu_110_p0 * op5_fu_110_p1;
  assign Const_28 = (1'd0 ^ working_key[43]);
  assign op6_1_fu_180_p3 = ((((working_key[44] == 1'b1)? tmp_6_reg_263[0:0] > Const_28 : tmp_6_reg_263[0:0] === Const_28) ^ working_key[45]) == 1'b1)? op6_5_fu_169_p3 : op6_4_fu_176_p2;
  assign op6_2_fu_165_p2 = (working_key[46] == 1'b1)? op5_2_reg_247 + op3_reg_268 : op5_2_reg_247 - op3_reg_268;
  assign op6_3_fu_149_p0 = G2;
  assign op6_3_fu_149_p1 = i4;
  assign op6_3_fu_149_p2 = (working_key[47] == 1'b1)? op6_3_fu_149_p0 + op6_3_fu_149_p1 : op6_3_fu_149_p0 * op6_3_fu_149_p1;
  assign op6_4_fu_176_p1 = i3;
  assign op6_4_fu_176_p2 = (working_key[48] == 1'b1)? op6_3_reg_273 - op6_4_fu_176_p1 : op6_3_reg_273 + op6_4_fu_176_p1;
  assign Const_29 = (1'd1 ^ working_key[49]);
  assign op6_5_fu_169_p3 = ((((working_key[50] == 1'b1)? tmp_reg_253[0:0] > Const_29 : tmp_reg_253[0:0] === Const_29) ^ working_key[51]) == 1'b1)? op6_2_fu_165_p2 : op6_fu_161_p2;
  assign op6_fu_161_p2 = (working_key[52] == 1'b1)? op5_1_reg_258 + op4_reg_235 : op5_1_reg_258 - op4_reg_235;
  assign op7_fu_153_p0 = G1;
  assign op7_fu_153_p1 = i4;
  assign op7_fu_153_p2 = (working_key[53] == 1'b1)? op7_fu_153_p0 * op7_fu_153_p1 : op7_fu_153_p0 + op7_fu_153_p1;
  assign op8_fu_157_p0 = G2;
  assign op8_fu_157_p1 = i3;
  assign op8_fu_157_p2 = (working_key[54] == 1'b1)? op8_fu_157_p0 + op8_fu_157_p1 : op8_fu_157_p0 * op8_fu_157_p1;
  assign tmp1_fu_187_p1 = G1;
  assign tmp1_fu_187_p2 = (working_key[55] == 1'b1)? op6_1_fu_180_p3 + tmp1_fu_187_p1 : op6_1_fu_180_p3 - tmp1_fu_187_p1;
  assign tmp2_fu_198_p2 = (working_key[56] == 1'b1)? op8_reg_283 - i6 : op8_reg_283 + i6;
  assign Const_30 = (1'd0 ^ working_key[58]);
  assign Const_31 = (1'd0 ^ working_key[59]);
  assign tmp_6_fu_139_p2 = ((((working_key[57] == 1'b1)? op5_3_fu_132_p3 < op4_reg_235 : op5_3_fu_132_p3 > op4_reg_235) ^ working_key[60]) == 1'b1)? Const_30 : Const_31;
  assign tmp_fu_122_p0 = G1;
  assign Const_32 = (32'd2863289847 ^ working_key[92:61]);
  assign Const_33 = (1'd0 ^ working_key[94]);
  assign Const_34 = (1'd0 ^ working_key[95]);
  assign tmp_fu_122_p2 = ((((working_key[93] == 1'b1)? tmp_fu_122_p0 > Const_32 : tmp_fu_122_p0 > Const_32) ^ working_key[96]) == 1'b1)? Const_34 : Const_33;
  assign working_key = { locking_key[96:0] };

endmodule

