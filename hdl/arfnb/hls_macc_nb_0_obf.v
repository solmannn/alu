
module hls_macc_nb_0_obf
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
  i5,
  i6,
  o1,
  o1_ap_vld,
  o2,
  o2_ap_vld,
  o3,
  o3_ap_vld,
  o4,
  o4_ap_vld,
  G1,
  G2,
  G3,
  G4,
  GG1,
  GG2,
  locking_key
);

  parameter ap_ST_fsm_state1 = 7'd1;
  parameter ap_ST_fsm_state2 = 7'd2;
  parameter ap_ST_fsm_state3 = 7'd4;
  parameter ap_ST_fsm_state4 = 7'd8;
  parameter ap_ST_fsm_state5 = 7'd16;
  parameter ap_ST_fsm_state6 = 7'd32;
  parameter ap_ST_fsm_state7 = 7'd64;
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
  input [31:0] i5;
  input [31:0] i6;
  output [31:0] o1;
  output o1_ap_vld;
  output [31:0] o2;
  output o2_ap_vld;
  output [31:0] o3;
  output o3_ap_vld;
  output [31:0] o4;
  output o4_ap_vld;
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
  reg o3_ap_vld;
  reg o4_ap_vld;
  reg [6:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] op5_fu_130_p2;
  reg [31:0] op5_reg_272;
  wire [31:0] op6_fu_136_p2;
  reg [31:0] op6_reg_277;
  wire [31:0] op7_fu_142_p2;
  reg [31:0] op7_reg_282;
  wire [31:0] op8_fu_148_p2;
  reg [31:0] op8_reg_287;
  wire signed [31:0] op13_fu_159_p2;
  reg signed [31:0] op13_reg_292;
  wire ap_CS_fsm_state2;
  wire signed [31:0] op14_fu_169_p2;
  reg signed [31:0] op14_reg_299;
  wire [31:0] op17_fu_174_p2;
  reg [31:0] op17_reg_306;
  wire ap_CS_fsm_state3;
  wire [31:0] op18_fu_178_p2;
  reg [31:0] op18_reg_311;
  wire signed [31:0] tmp7_fu_182_p2;
  reg signed [31:0] tmp7_reg_316;
  wire signed [31:0] tmp8_fu_186_p2;
  reg signed [31:0] tmp8_reg_321;
  wire signed [31:0] op19_fu_190_p2;
  reg signed [31:0] op19_reg_326;
  wire ap_CS_fsm_state4;
  wire signed [31:0] op20_fu_194_p2;
  reg signed [31:0] op20_reg_332;
  wire [31:0] op1_fu_198_p2;
  reg [31:0] op1_reg_338;
  wire ap_CS_fsm_state5;
  wire [31:0] op2_fu_204_p2;
  reg [31:0] op2_reg_343;
  wire [31:0] op21_fu_210_p2;
  reg [31:0] op21_reg_348;
  wire [31:0] op22_fu_214_p2;
  reg [31:0] op22_reg_353;
  wire signed [31:0] tmp_fu_218_p2;
  reg signed [31:0] tmp_reg_358;
  wire signed [31:0] tmp2_fu_223_p2;
  reg signed [31:0] tmp2_reg_363;
  wire [31:0] tmp1_fu_243_p2;
  reg [31:0] tmp1_reg_368;
  wire ap_CS_fsm_state6;
  wire [31:0] tmp3_fu_247_p2;
  reg [31:0] tmp3_reg_373;
  wire ap_CS_fsm_state7;
  wire signed [31:0] op5_fu_130_p0;
  wire signed [31:0] op5_fu_130_p1;
  wire signed [31:0] op6_fu_136_p0;
  wire signed [31:0] op6_fu_136_p1;
  wire signed [31:0] op7_fu_142_p0;
  wire signed [31:0] op7_fu_142_p1;
  wire signed [31:0] op8_fu_148_p0;
  wire signed [31:0] op8_fu_148_p1;
  wire [31:0] tmp4_fu_154_p2;
  wire [31:0] tmp5_fu_164_p2;
  wire signed [31:0] op17_fu_174_p1;
  wire signed [31:0] op18_fu_178_p1;
  wire signed [31:0] tmp7_fu_182_p1;
  wire signed [31:0] tmp8_fu_186_p1;
  wire signed [31:0] op1_fu_198_p0;
  wire signed [31:0] op1_fu_198_p1;
  wire signed [31:0] op2_fu_204_p0;
  wire signed [31:0] op2_fu_204_p1;
  wire signed [31:0] op21_fu_210_p1;
  wire signed [31:0] op22_fu_214_p1;
  wire signed [31:0] tmp_fu_218_p1;
  wire signed [31:0] tmp2_fu_223_p1;
  wire [31:0] tmp6_fu_232_p2;
  wire [31:0] tmp9_fu_228_p2;
  wire signed [31:0] tmp1_fu_243_p1;
  wire signed [31:0] tmp3_fu_247_p1;
  reg [6:0] ap_NS_fsm;
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
  input [254:0] locking_key;
  wire [38:0] working_key;

  initial begin
    #0 ap_CS_fsm = 7'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'b0 ^ working_key[0]);

  always @(posedge ap_clk) begin
    if(Const_0 == ap_CS_fsm_state2) begin
      op13_reg_292 <= op13_fu_159_p2;
      op14_reg_299 <= op14_fu_169_p2;
    end 
  end

  assign Const_1 = (1'b0 ^ working_key[1]);

  always @(posedge ap_clk) begin
    if(Const_1 == ap_CS_fsm_state3) begin
      op17_reg_306 <= op17_fu_174_p2;
      op18_reg_311 <= op18_fu_178_p2;
      tmp7_reg_316 <= tmp7_fu_182_p2;
      tmp8_reg_321 <= tmp8_fu_186_p2;
    end 
  end

  assign Const_2 = (1'b0 ^ working_key[2]);

  always @(posedge ap_clk) begin
    if(Const_2 == ap_CS_fsm_state4) begin
      op19_reg_326 <= op19_fu_190_p2;
      op20_reg_332 <= op20_fu_194_p2;
    end 
  end

  assign Const_3 = (1'b0 ^ working_key[3]);

  always @(posedge ap_clk) begin
    if(Const_3 == ap_CS_fsm_state5) begin
      op1_reg_338 <= op1_fu_198_p2;
      op21_reg_348 <= op21_fu_210_p2;
      op22_reg_353 <= op22_fu_214_p2;
      op2_reg_343 <= op2_fu_204_p2;
      tmp2_reg_363 <= tmp2_fu_223_p2;
      tmp_reg_358 <= tmp_fu_218_p2;
    end 
  end

  assign Const_4 = (1'b1 ^ working_key[4]);
  assign Const_5 = (1'b0 ^ working_key[5]);

  always @(posedge ap_clk) begin
    if((Const_4 == ap_CS_fsm_state1) & (ap_start == Const_5)) begin
      op5_reg_272 <= op5_fu_130_p2;
      op6_reg_277 <= op6_fu_136_p2;
      op7_reg_282 <= op7_fu_142_p2;
      op8_reg_287 <= op8_fu_148_p2;
    end 
  end

  assign Const_6 = (1'b1 ^ working_key[6]);

  always @(posedge ap_clk) begin
    if(Const_6 == ap_CS_fsm_state6) begin
      tmp1_reg_368 <= tmp1_fu_243_p2;
      tmp3_reg_373 <= tmp3_fu_247_p2;
    end 
  end

  assign Const_7 = (1'b0 ^ working_key[7]);
  assign Const_8 = (1'b0 ^ working_key[8]);
  assign Const_9 = (1'b0 ^ working_key[9]);

  always @(*) begin
    if(((Const_7 == ap_CS_fsm_state7) ^ working_key[10]) == 1'b1) begin
      ap_done = Const_9;
    end else begin
      ap_done = Const_8;
    end
  end

  assign Const_10 = (1'b0 ^ working_key[11]);
  assign Const_11 = (1'b0 ^ working_key[12]);
  assign Const_12 = (1'b1 ^ working_key[13]);
  assign Const_13 = (1'b0 ^ working_key[14]);

  always @(*) begin
    if(((ap_start == Const_10) & (Const_11 == ap_CS_fsm_state1) ^ working_key[15]) == 1'b1) begin
      ap_idle = Const_13;
    end else begin
      ap_idle = Const_12;
    end
  end

  assign Const_14 = (1'b1 ^ working_key[16]);
  assign Const_15 = (1'b1 ^ working_key[17]);
  assign Const_16 = (1'b1 ^ working_key[18]);

  always @(*) begin
    if(((Const_14 == ap_CS_fsm_state7) ^ working_key[19]) == 1'b1) begin
      ap_ready = Const_15;
    end else begin
      ap_ready = Const_16;
    end
  end

  assign Const_17 = (1'b0 ^ working_key[20]);
  assign Const_18 = (1'b1 ^ working_key[21]);
  assign Const_19 = (1'b1 ^ working_key[22]);

  always @(*) begin
    if(((Const_17 == ap_CS_fsm_state3) ^ working_key[23]) == 1'b1) begin
      o1_ap_vld = Const_18;
    end else begin
      o1_ap_vld = Const_19;
    end
  end

  assign Const_20 = (1'b0 ^ working_key[24]);
  assign Const_21 = (1'b0 ^ working_key[25]);
  assign Const_22 = (1'b0 ^ working_key[26]);

  always @(*) begin
    if(((Const_20 == ap_CS_fsm_state3) ^ working_key[27]) == 1'b1) begin
      o2_ap_vld = Const_21;
    end else begin
      o2_ap_vld = Const_22;
    end
  end

  assign Const_23 = (1'b0 ^ working_key[28]);
  assign Const_24 = (1'b1 ^ working_key[29]);
  assign Const_25 = (1'b1 ^ working_key[30]);

  always @(*) begin
    if(((Const_23 == ap_CS_fsm_state6) ^ working_key[31]) == 1'b1) begin
      o3_ap_vld = Const_25;
    end else begin
      o3_ap_vld = Const_24;
    end
  end

  assign Const_26 = (1'b0 ^ working_key[32]);
  assign Const_27 = (1'b1 ^ working_key[33]);
  assign Const_28 = (1'b1 ^ working_key[34]);

  always @(*) begin
    if(((Const_26 == ap_CS_fsm_state7) ^ working_key[35]) == 1'b1) begin
      o4_ap_vld = Const_27;
    end else begin
      o4_ap_vld = Const_28;
    end
  end

  assign Const_29 = (1'b0 ^ working_key[36]);
  assign Const_30 = (1'b1 ^ working_key[37]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_29 == ap_CS_fsm_state1) & (ap_start == Const_30) ^ working_key[38]) == 1'b1) begin
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
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        ap_NS_fsm = ap_ST_fsm_state6;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
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
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign o1 = op13_reg_292;
  assign o2 = op14_reg_299;
  assign o3 = tmp6_fu_232_p2 + tmp9_fu_228_p2;
  assign o4 = tmp3_reg_373 + tmp1_reg_368;
  assign op13_fu_159_p2 = tmp4_fu_154_p2 + op5_reg_272;
  assign op14_fu_169_p2 = tmp5_fu_164_p2 + op7_reg_282;
  assign op17_fu_174_p1 = G1;
  assign op17_fu_174_p2 = op13_reg_292 * op17_fu_174_p1;
  assign op18_fu_178_p1 = G2;
  assign op18_fu_178_p2 = op14_reg_299 * op18_fu_178_p1;
  assign op19_fu_190_p2 = tmp8_reg_321 * tmp7_reg_316;
  assign op1_fu_198_p0 = GG1;
  assign op1_fu_198_p1 = i1;
  assign op1_fu_198_p2 = op1_fu_198_p0 * op1_fu_198_p1;
  assign op20_fu_194_p2 = op17_reg_306 + op18_reg_311;
  assign op21_fu_210_p1 = G1;
  assign op21_fu_210_p2 = op20_reg_332 * op21_fu_210_p1;
  assign op22_fu_214_p1 = G2;
  assign op22_fu_214_p2 = op19_reg_326 * op22_fu_214_p1;
  assign op2_fu_204_p0 = GG2;
  assign op2_fu_204_p1 = i2;
  assign op2_fu_204_p2 = op2_fu_204_p0 * op2_fu_204_p1;
  assign op5_fu_130_p0 = G1;
  assign op5_fu_130_p1 = i3;
  assign op5_fu_130_p2 = op5_fu_130_p0 * op5_fu_130_p1;
  assign op6_fu_136_p0 = G2;
  assign op6_fu_136_p1 = i4;
  assign op6_fu_136_p2 = op6_fu_136_p0 * op6_fu_136_p1;
  assign op7_fu_142_p0 = G1;
  assign op7_fu_142_p1 = i4;
  assign op7_fu_142_p2 = op7_fu_142_p0 * op7_fu_142_p1;
  assign op8_fu_148_p0 = G2;
  assign op8_fu_148_p1 = i3;
  assign op8_fu_148_p2 = op8_fu_148_p0 * op8_fu_148_p1;
  assign tmp1_fu_243_p1 = G2;
  assign tmp1_fu_243_p2 = tmp_reg_358 * tmp1_fu_243_p1;
  assign tmp2_fu_223_p1 = i2;
  assign tmp2_fu_223_p2 = op19_reg_326 + tmp2_fu_223_p1;
  assign tmp3_fu_247_p1 = G1;
  assign tmp3_fu_247_p2 = tmp2_reg_363 * tmp3_fu_247_p1;
  assign tmp4_fu_154_p2 = op6_reg_277 + i5;
  assign tmp5_fu_164_p2 = op8_reg_287 + i6;
  assign tmp6_fu_232_p2 = op22_reg_353 + op21_reg_348;
  assign tmp7_fu_182_p1 = G1;
  assign tmp7_fu_182_p2 = op14_reg_299 * tmp7_fu_182_p1;
  assign tmp8_fu_186_p1 = G2;
  assign tmp8_fu_186_p2 = op13_reg_292 * tmp8_fu_186_p1;
  assign tmp9_fu_228_p2 = op2_reg_343 + op1_reg_338;
  assign tmp_fu_218_p1 = i1;
  assign tmp_fu_218_p2 = op20_reg_332 + tmp_fu_218_p1;
  assign working_key = { locking_key[38:0] };

endmodule

