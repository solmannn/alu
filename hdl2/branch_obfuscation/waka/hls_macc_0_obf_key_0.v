
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
  input [3070:0] locking_key;
  wire [11:0] working_key;

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
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      t11_reg_322 <= t11_fu_211_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      t23_reg_333 <= t23_fu_229_p2;
      t5_reg_328 <= t5_fu_217_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      t26_2_reg_338 <= t26_2_fu_262_p3;
    end 
  end


  always @(*) begin
    if(((1'b1 == ap_CS_fsm_state4) ^ working_key[0]) == 1'b1) begin
      ap_done = 1'b0;
    end else begin
      ap_done = 1'b1;
    end
  end


  always @(*) begin
    if(((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1) ^ working_key[1]) == 1'b1) begin
      ap_idle = 1'b0;
    end else begin
      ap_idle = 1'b1;
    end
  end


  always @(*) begin
    if(((1'b1 == ap_CS_fsm_state4) ^ working_key[2]) == 1'b1) begin
      ap_ready = 1'b0;
    end else begin
      ap_ready = 1'b1;
    end
  end


  always @(*) begin
    if(((1'b1 == ap_CS_fsm_state4) ^ working_key[3]) == 1'b1) begin
      out13_ap_vld = 1'b0;
    end else begin
      out13_ap_vld = 1'b1;
    end
  end


  always @(*) begin
    if(((1'b1 == ap_CS_fsm_state4) ^ working_key[4]) == 1'b1) begin
      out30_o_ap_vld = 1'b1;
    end else begin
      out30_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(((1'b1 == ap_CS_fsm_state4) ^ working_key[5]) == 1'b1) begin
      out31_ap_vld = 1'b0;
    end else begin
      out31_ap_vld = 1'b1;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) ^ working_key[6]) == 1'b1) begin
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
  assign out13 = in14 - in15;
  assign out30_o = (((tmp_fu_277_p2[0:0] === 1'b1) ^ working_key[7]) == 1'b1)? tempout30_1_fu_293_p2 : out30_i;
  assign out31 = t16_2_fu_298_p3 + in32;
  assign t11_fu_211_p2 = tmp1_fu_205_p2 + in8;
  assign t16_1_fu_288_p2 = t26_2_reg_338 - in28;
  assign t16_2_fu_298_p3 = (((tmp_fu_277_p2[0:0] === 1'b1) ^ working_key[8]) == 1'b1)? t16_1_fu_288_p2 : t16_fu_283_p2;
  assign t16_fu_283_p2 = t11_reg_322 - in17;
  assign t23_fu_229_p2 = tmp2_fu_223_p2 + t11_reg_322;
  assign t25_fu_240_p2 = t23_reg_333 - in24;
  assign t26_1_fu_257_p2 = tmp3_fu_251_p2 + t5_reg_328;
  assign t26_2_fu_262_p3 = (((tmp_2_fu_234_p2[0:0] === 1'b1) ^ working_key[9]) == 1'b1)? t26_fu_245_p2 : t26_1_fu_257_p2;
  assign t26_fu_245_p2 = t25_fu_240_p2 + in27;
  assign t5_fu_217_p2 = in3 - in4;
  assign tempout30_1_fu_293_p2 = t26_2_reg_338 + in29;
  assign tmp1_fu_205_p2 = in7 + in12;
  assign tmp2_fu_223_p2 = t5_fu_217_p2 + in22;
  assign tmp3_fu_251_p2 = in19 + in20;
  assign tmp_2_fu_234_p2 = (((in9 < in10) ^ working_key[10]) == 1'b1)? 1'b0 : 1'b1;
  assign tmp_fu_277_p2 = (((in2 == in1) ^ working_key[11]) == 1'b1)? 1'b1 : 1'b0;
  assign working_key = { locking_key[11:0] };

endmodule

