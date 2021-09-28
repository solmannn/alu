
module calculate_4_0_obf
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
  wire [31:0] value_fu_30_p2;
  wire [0:0] tmp_fu_36_p2;
  wire [31:0] value_1_fu_42_p2;
  wire Const_0;
  wire Const_1;
  wire [31:0] Const_2;
  wire Const_3;
  wire Const_4;
  wire [31:0] Const_5;
  input [254:0] locking_key;
  wire [69:0] working_key;
  assign ap_done = ap_start;
  assign Const_0 = (1'b0 ^ working_key[0]);
  assign ap_idle = Const_0;
  assign ap_ready = ap_start;
  assign ap_return = ((tmp_fu_36_p2_temp ^ working_key[1]) == 1'b1)? value_fu_30_p2 : value_1_fu_42_p2;
  assign Const_1 = (1'b0 ^ working_key[2]);
  assign tmp_fu_36_p2_temp = tmp_fu_36_p2 & Const_1;
  assign Const_2 = (32'b10111010011010101001000101011101 ^ working_key[34:3]);
  assign Const_3 = (1'b1 ^ working_key[35]);
  assign Const_4 = (1'b1 ^ working_key[36]);
  assign tmp_fu_36_p2 = (((value_fu_30_p2 > Const_2) ^ working_key[37]) == 1'b1)? Const_3 : Const_4;
  assign value_1_fu_42_p2 = value_fu_30_p2 + b;
  assign Const_5 = (32'b11111110100110101010010011001001 ^ working_key[69:38]);
  assign value_fu_30_p2 = a + Const_5;
  assign working_key = { locking_key[69:0] };

endmodule

