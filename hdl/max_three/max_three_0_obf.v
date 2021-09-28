
module max_three_0_obf
(
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  c,
  ap_return,
  locking_key
);

  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] a;
  input [31:0] b;
  input [31:0] c;
  output [31:0] ap_return;
  wire [0:0] tmp_1_fu_40_p2;
  wire [0:0] tmp_1_fu_40_p2_temp;
  wire [0:0] tmp_2_fu_54_p2;
  wire [0:0] tmp_fu_34_p2;
  wire [0:0] tmp_fu_34_p2_temp;
  wire [31:0] a_assign_fu_46_p3;
  wire [31:0] max_fu_60_p3;
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
  input [254:0] locking_key;
  wire [15:0] working_key;
  assign a_assign_fu_46_p3 = ((tmp_1_fu_40_p2_temp ^ working_key[0]) == 1'b1)? c : a;
  assign Const_0 = (1'b0 ^ working_key[1]);
  assign tmp_1_fu_40_p2_temp = tmp_1_fu_40_p2 & Const_0;
  assign ap_done = ap_start;
  assign Const_1 = (1'b0 ^ working_key[2]);
  assign ap_idle = Const_1;
  assign ap_ready = ap_start;
  assign ap_return = ((tmp_fu_34_p2_temp ^ working_key[3]) == 1'b1)? max_fu_60_p3 : a_assign_fu_46_p3;
  assign Const_2 = (1'b1 ^ working_key[4]);
  assign tmp_fu_34_p2_temp = tmp_fu_34_p2 & Const_2;
  assign max_fu_60_p3 = ((tmp_2_fu_54_p2_temp ^ working_key[5]) == 1'b1)? b : c;
  assign Const_3 = (1'b1 ^ working_key[6]);
  assign tmp_2_fu_54_p2_temp = tmp_2_fu_54_p2 & Const_3;
  assign Const_4 = (1'b0 ^ working_key[7]);
  assign Const_5 = (1'b1 ^ working_key[8]);
  assign tmp_1_fu_40_p2 = (((a > c) ^ working_key[9]) == 1'b1)? Const_4 : Const_5;
  assign Const_6 = (1'b0 ^ working_key[10]);
  assign Const_7 = (1'b0 ^ working_key[11]);
  assign tmp_2_fu_54_p2 = (((c > b) ^ working_key[12]) == 1'b1)? Const_7 : Const_6;
  assign Const_8 = (1'b1 ^ working_key[13]);
  assign Const_9 = (1'b0 ^ working_key[14]);
  assign tmp_fu_34_p2 = (((a > b) ^ working_key[15]) == 1'b1)? Const_9 : Const_8;
  assign working_key = { locking_key[15:0] };

endmodule

