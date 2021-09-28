
module hls_macc_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  in1,
  in2,
  in3,
  in4,
  in7,
  in8,
  in9,
  in10,
  in14,
  in12,
  in15,
  in17,
  in19,
  in20,
  in22,
  in24,
  in27,
  in28,
  in29,
  in32,
  out13,
  out13_ap_vld,
  out30_i,
  out30_o,
  out30_o_ap_vld,
  out31,
  out31_ap_vld,
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
  input [31:0] in1;
  input [31:0] in2;
  input [31:0] in3;
  input [31:0] in4;
  input [31:0] in7;
  input [31:0] in8;
  input [31:0] in9;
  input [31:0] in10;
  input [31:0] in14;
  input [31:0] in12;
  input [31:0] in15;
  input [31:0] in17;
  input [31:0] in19;
  input [31:0] in20;
  input [31:0] in22;
  input [31:0] in24;
  input [31:0] in27;
  input [31:0] in28;
  input [31:0] in29;
  input [31:0] in32;
  output [31:0] out13;
  output out13_ap_vld;
  input [31:0] out30_i;
  output [31:0] out30_o;
  output out30_o_ap_vld;
  output [31:0] out31;
  output out31_ap_vld;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg out13_ap_vld;
  reg out30_o_ap_vld;
  reg out31_ap_vld;
  reg [3:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] t11_fu_211_p2;
  reg [31:0] t11_reg_322;
  wire [31:0] t5_fu_217_p2;
  reg [31:0] t5_reg_328;
  wire ap_CS_fsm_state2;
  wire [31:0] t23_fu_229_p2;
  reg [31:0] t23_reg_333;
  wire [31:0] t26_2_fu_262_p3;
  reg [31:0] t26_2_reg_338;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire [31:0] tmp1_fu_205_p2;
  wire [31:0] tmp2_fu_223_p2;
  wire [31:0] t25_fu_240_p2;
  wire [31:0] tmp3_fu_251_p2;
  wire [0:0] tmp_2_fu_234_p2;
  wire [31:0] t26_fu_245_p2;
  wire [31:0] t26_1_fu_257_p2;
  wire [0:0] tmp_fu_277_p2;
  wire [31:0] t16_fu_283_p2;
  wire [31:0] t16_1_fu_288_p2;
  wire [31:0] tempout30_1_fu_293_p2;
  wire [31:0] t16_2_fu_298_p3;
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
  input [3070:0] locking_key;
  wire [62:0] working_key;

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

  assign Const_0 = (1'd0 ^ working_key[0]);
  assign Const_1 = (1'd0 ^ working_key[1]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_0) & (Const_1 == ap_CS_fsm_state1)) begin
      t11_reg_322 <= t11_fu_211_p2;
    end 
  end

  assign Const_2 = (1'd0 ^ working_key[2]);

  always @(posedge ap_clk) begin
    if(Const_2 == ap_CS_fsm_state2) begin
      t23_reg_333 <= t23_fu_229_p2;
      t5_reg_328 <= t5_fu_217_p2;
    end 
  end

  assign Const_3 = (1'd0 ^ working_key[3]);

  always @(posedge ap_clk) begin
    if(Const_3 == ap_CS_fsm_state3) begin
      t26_2_reg_338 <= t26_2_fu_262_p3;
    end 
  end

  assign Const_4 = (1'd1 ^ working_key[4]);
  assign Const_5 = (1'd0 ^ working_key[5]);
  assign Const_6 = (1'd0 ^ working_key[6]);

  always @(*) begin
    if(((Const_4 == ap_CS_fsm_state4) ^ working_key[7]) == 1'b1) begin
      ap_done = Const_6;
    end else begin
      ap_done = Const_5;
    end
  end

  assign Const_7 = (1'd1 ^ working_key[8]);
  assign Const_8 = (1'd1 ^ working_key[9]);
  assign Const_9 = (1'd0 ^ working_key[10]);
  assign Const_10 = (1'd0 ^ working_key[11]);

  always @(*) begin
    if(((ap_start == Const_7) & (Const_8 == ap_CS_fsm_state1) ^ working_key[12]) == 1'b1) begin
      ap_idle = Const_10;
    end else begin
      ap_idle = Const_9;
    end
  end

  assign Const_11 = (1'd1 ^ working_key[13]);
  assign Const_12 = (1'd1 ^ working_key[14]);
  assign Const_13 = (1'd1 ^ working_key[15]);

  always @(*) begin
    if(((Const_11 == ap_CS_fsm_state4) ^ working_key[16]) == 1'b1) begin
      ap_ready = Const_12;
    end else begin
      ap_ready = Const_13;
    end
  end

  assign Const_14 = (1'd1 ^ working_key[17]);
  assign Const_15 = (1'd0 ^ working_key[18]);
  assign Const_16 = (1'd0 ^ working_key[19]);

  always @(*) begin
    if(((Const_14 == ap_CS_fsm_state4) ^ working_key[20]) == 1'b1) begin
      out13_ap_vld = Const_16;
    end else begin
      out13_ap_vld = Const_15;
    end
  end

  assign Const_17 = (1'd1 ^ working_key[21]);
  assign Const_18 = (1'd0 ^ working_key[22]);
  assign Const_19 = (1'd0 ^ working_key[23]);

  always @(*) begin
    if(((Const_17 == ap_CS_fsm_state4) ^ working_key[24]) == 1'b1) begin
      out30_o_ap_vld = Const_19;
    end else begin
      out30_o_ap_vld = Const_18;
    end
  end

  assign Const_20 = (1'd0 ^ working_key[25]);
  assign Const_21 = (1'd1 ^ working_key[26]);
  assign Const_22 = (1'd0 ^ working_key[27]);

  always @(*) begin
    if(((Const_20 == ap_CS_fsm_state4) ^ working_key[28]) == 1'b1) begin
      out31_ap_vld = Const_22;
    end else begin
      out31_ap_vld = Const_21;
    end
  end

  assign Const_23 = (1'd1 ^ working_key[29]);
  assign Const_24 = (1'd0 ^ working_key[30]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_23) & (Const_24 == ap_CS_fsm_state1) ^ working_key[31]) == 1'b1) begin
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
  assign out13 = (working_key[32] == 1'b1)? in14 - in15 : in14 + in15;
  assign Const_25 = (1'd1 ^ working_key[33]);
  assign out30_o = ((((working_key[34] == 1'b1)? tmp_fu_277_p2[0:0] === Const_25 : tmp_fu_277_p2[0:0] > Const_25) ^ working_key[35]) == 1'b1)? out30_i : tempout30_1_fu_293_p2;
  assign out31 = (working_key[36] == 1'b1)? t16_2_fu_298_p3 + in32 : t16_2_fu_298_p3 - in32;
  assign t11_fu_211_p2 = (working_key[37] == 1'b1)? tmp1_fu_205_p2 - in8 : tmp1_fu_205_p2 + in8;
  assign t16_1_fu_288_p2 = (working_key[38] == 1'b1)? t26_2_reg_338 - in28 : t26_2_reg_338 + in28;
  assign Const_26 = (1'd1 ^ working_key[39]);
  assign t16_2_fu_298_p3 = ((((working_key[40] == 1'b1)? tmp_fu_277_p2[0:0] === Const_26 : tmp_fu_277_p2[0:0] > Const_26) ^ working_key[41]) == 1'b1)? t16_1_fu_288_p2 : t16_fu_283_p2;
  assign t16_fu_283_p2 = (working_key[42] == 1'b1)? t11_reg_322 + in17 : t11_reg_322 - in17;
  assign t23_fu_229_p2 = (working_key[43] == 1'b1)? tmp2_fu_223_p2 + t11_reg_322 : tmp2_fu_223_p2 - t11_reg_322;
  assign t25_fu_240_p2 = (working_key[44] == 1'b1)? t23_reg_333 + in24 : t23_reg_333 - in24;
  assign t26_1_fu_257_p2 = (working_key[45] == 1'b1)? tmp3_fu_251_p2 + t5_reg_328 : tmp3_fu_251_p2 - t5_reg_328;
  assign Const_27 = (1'd1 ^ working_key[46]);
  assign t26_2_fu_262_p3 = ((((working_key[47] == 1'b1)? tmp_2_fu_234_p2[0:0] > Const_27 : tmp_2_fu_234_p2[0:0] === Const_27) ^ working_key[48]) == 1'b1)? t26_1_fu_257_p2 : t26_fu_245_p2;
  assign t26_fu_245_p2 = (working_key[49] == 1'b1)? t25_fu_240_p2 - in27 : t25_fu_240_p2 + in27;
  assign t5_fu_217_p2 = (working_key[50] == 1'b1)? in3 + in4 : in3 - in4;
  assign tempout30_1_fu_293_p2 = (working_key[51] == 1'b1)? t26_2_reg_338 + in29 : t26_2_reg_338 - in29;
  assign tmp1_fu_205_p2 = (working_key[52] == 1'b1)? in7 - in12 : in7 + in12;
  assign tmp2_fu_223_p2 = (working_key[53] == 1'b1)? t5_fu_217_p2 + in22 : t5_fu_217_p2 - in22;
  assign tmp3_fu_251_p2 = (working_key[54] == 1'b1)? in19 - in20 : in19 + in20;
  assign Const_28 = (1'd1 ^ working_key[56]);
  assign Const_29 = (1'd1 ^ working_key[57]);
  assign tmp_2_fu_234_p2 = ((((working_key[55] == 1'b1)? in9 < in10 : in9 > in10) ^ working_key[58]) == 1'b1)? Const_29 : Const_28;
  assign Const_30 = (1'd1 ^ working_key[60]);
  assign Const_31 = (1'd1 ^ working_key[61]);
  assign tmp_fu_277_p2 = ((((working_key[59] == 1'b1)? in2 > in1 : in2 == in1) ^ working_key[62]) == 1'b1)? Const_30 : Const_31;
  assign working_key = { locking_key[62:0] };

endmodule

