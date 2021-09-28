
module calculate_2_0_obf
(
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  ap_return,
  locking_key
);

  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] a;
  input [31:0] b;
  output [31:0] ap_return;
  wire [30:0] tmp_2_fu_34_p1;
  wire [30:0] tmp_1_fu_30_p1;
  wire [31:0] value_fu_38_p2;
  wire [0:0] tmp_fu_50_p2;
  wire [30:0] value_cast_fu_44_p2;
  wire [30:0] p_0_fu_56_p3;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire [30:0] Const_3;
  wire [30:0] Const_4;
  wire [31:0] Const_5;
  wire Const_6;
  wire Const_7;
  input [254:0] locking_key;
  wire [100:0] working_key;
  assign ap_done = ap_start;
  assign Const_0 = (1'b0 ^ working_key[0]);
  assign ap_idle = Const_0;
  assign ap_ready = ap_start;
  assign ap_return = p_0_fu_56_p3;
  assign Const_1 = (1'b1 ^ working_key[1]);
  assign p_0_fu_56_p3 = ((tmp_fu_50_p2_temp ^ working_key[2]) == 1'b1)? Const_1 : value_cast_fu_44_p2;
  assign Const_2 = (1'b0 ^ working_key[3]);
  assign tmp_fu_50_p2_temp = tmp_fu_50_p2 & Const_2;
  assign Const_3 = (31'b0100010110010101011011010100101 ^ working_key[34:4]);
  assign tmp_1_fu_30_p1 = a & Const_3;
  assign Const_4 = (31'b0001011001010101101101010010101 ^ working_key[65:35]);
  assign tmp_2_fu_34_p1 = b & Const_4;
  assign Const_5 = (32'b01010101010101010101000101000111 ^ working_key[97:66]);
  assign Const_6 = (1'b1 ^ working_key[98]);
  assign Const_7 = (1'b0 ^ working_key[99]);
  assign tmp_fu_50_p2 = (((value_fu_38_p2 > Const_5) ^ working_key[100]) == 1'b1)? Const_6 : Const_7;
  assign value_cast_fu_44_p2 = tmp_2_fu_34_p1 + tmp_1_fu_30_p1;
  assign value_fu_38_p2 = a + b;
  assign working_key = { locking_key[100:0] };

endmodule

