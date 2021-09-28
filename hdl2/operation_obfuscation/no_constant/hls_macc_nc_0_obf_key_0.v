
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
  input [3070:0] locking_key;
  wire [19:0] working_key;

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


  always @(posedge ap_clk) begin
    if((tmp_6_reg_263 == 1'd0) & (tmp_reg_253 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      op3_reg_268 <= op3_fu_144_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      op4_reg_235 <= op4_fu_104_p2;
      op5_2_reg_247 <= op5_2_fu_116_p2;
      op5_reg_242 <= op5_fu_110_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      op5_1_reg_258 <= op5_1_fu_127_p2;
      tmp_6_reg_263 <= tmp_6_fu_139_p2;
      tmp_reg_253 <= tmp_fu_122_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_6_reg_263 == 1'd1) & (1'b1 == ap_CS_fsm_state3)) begin
      op6_3_reg_273 <= op6_3_fu_149_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      op7_reg_278 <= op7_fu_153_p2;
      op8_reg_283 <= op8_fu_157_p2;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
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
    if(1'b1 == ap_CS_fsm_state4) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      o1_ap_vld = 1'b1;
    end else begin
      o1_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      o2_ap_vld = 1'b1;
    end else begin
      o2_ap_vld = 1'b0;
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
  assign o1 = (working_key[0] == 1'b1)? tmp1_fu_187_p2 + op4_reg_235 : tmp1_fu_187_p2 - op4_reg_235;
  assign o2 = (working_key[1] == 1'b1)? tmp2_fu_198_p2 + op7_reg_278 : tmp2_fu_198_p2 - op7_reg_278;
  assign op3_fu_144_p0 = G1;
  assign op3_fu_144_p1 = i2;
  assign op3_fu_144_p2 = (working_key[2] == 1'b1)? op3_fu_144_p0 * op3_fu_144_p1 : op3_fu_144_p0 + op3_fu_144_p1;
  assign op4_fu_104_p0 = G2;
  assign op4_fu_104_p1 = i1;
  assign op4_fu_104_p2 = (working_key[3] == 1'b1)? op4_fu_104_p0 * op4_fu_104_p1 : op4_fu_104_p0 + op4_fu_104_p1;
  assign op5_1_fu_127_p2 = (working_key[4] == 1'b1)? op5_reg_242 - GG1 : op5_reg_242 + GG1;
  assign op5_2_fu_116_p0 = i4;
  assign op5_2_fu_116_p1 = i3;
  assign op5_2_fu_116_p2 = (working_key[5] == 1'b1)? op5_2_fu_116_p0 * op5_2_fu_116_p1 : op5_2_fu_116_p0 + op5_2_fu_116_p1;
  assign op5_3_fu_132_p3 = ((working_key[6] == 1'b1)? tmp_fu_122_p2[0:0] > 1'b1 : tmp_fu_122_p2[0:0] === 1'b1)? op5_1_fu_127_p2 : op5_2_reg_247;
  assign op5_fu_110_p0 = G1;
  assign op5_fu_110_p1 = i3;
  assign op5_fu_110_p2 = (working_key[7] == 1'b1)? op5_fu_110_p0 * op5_fu_110_p1 : op5_fu_110_p0 + op5_fu_110_p1;
  assign op6_1_fu_180_p3 = ((working_key[8] == 1'b1)? tmp_6_reg_263[0:0] === 1'b1 : tmp_6_reg_263[0:0] > 1'b1)? op6_4_fu_176_p2 : op6_5_fu_169_p3;
  assign op6_2_fu_165_p2 = (working_key[9] == 1'b1)? op5_2_reg_247 + op3_reg_268 : op5_2_reg_247 - op3_reg_268;
  assign op6_3_fu_149_p0 = G2;
  assign op6_3_fu_149_p1 = i4;
  assign op6_3_fu_149_p2 = (working_key[10] == 1'b1)? op6_3_fu_149_p0 * op6_3_fu_149_p1 : op6_3_fu_149_p0 + op6_3_fu_149_p1;
  assign op6_4_fu_176_p1 = i3;
  assign op6_4_fu_176_p2 = (working_key[11] == 1'b1)? op6_3_reg_273 + op6_4_fu_176_p1 : op6_3_reg_273 - op6_4_fu_176_p1;
  assign op6_5_fu_169_p3 = ((working_key[12] == 1'b1)? tmp_reg_253[0:0] === 1'b1 : tmp_reg_253[0:0] > 1'b1)? op6_fu_161_p2 : op6_2_fu_165_p2;
  assign op6_fu_161_p2 = (working_key[13] == 1'b1)? op5_1_reg_258 + op4_reg_235 : op5_1_reg_258 - op4_reg_235;
  assign op7_fu_153_p0 = G1;
  assign op7_fu_153_p1 = i4;
  assign op7_fu_153_p2 = (working_key[14] == 1'b1)? op7_fu_153_p0 + op7_fu_153_p1 : op7_fu_153_p0 * op7_fu_153_p1;
  assign op8_fu_157_p0 = G2;
  assign op8_fu_157_p1 = i3;
  assign op8_fu_157_p2 = (working_key[15] == 1'b1)? op8_fu_157_p0 * op8_fu_157_p1 : op8_fu_157_p0 + op8_fu_157_p1;
  assign tmp1_fu_187_p1 = G1;
  assign tmp1_fu_187_p2 = (working_key[16] == 1'b1)? op6_1_fu_180_p3 - tmp1_fu_187_p1 : op6_1_fu_180_p3 + tmp1_fu_187_p1;
  assign tmp2_fu_198_p2 = (working_key[17] == 1'b1)? op8_reg_283 - i6 : op8_reg_283 + i6;
  assign tmp_6_fu_139_p2 = ((working_key[18] == 1'b1)? op5_3_fu_132_p3 < op4_reg_235 : op5_3_fu_132_p3 > op4_reg_235)? 1'b1 : 1'b0;
  assign tmp_fu_122_p0 = G1;
  assign tmp_fu_122_p2 = ((working_key[19] == 1'b1)? tmp_fu_122_p0 > 32'd10 : tmp_fu_122_p0 > 32'd10)? 1'b1 : 1'b0;
  assign working_key = { locking_key[19:0] };

endmodule

