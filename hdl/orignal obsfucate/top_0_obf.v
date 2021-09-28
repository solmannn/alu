
module top_0_obf
(
  in1,
  in2,
  in3,
  sel,
  out1,
  out2,
  locking_key
);

  input [7:0] in1;
  input [7:0] in2;
  input [7:0] in3;
  input sel;
  output [7:0] out1;
  output [7:0] out2;
  wire Const_0;
  wire [7:0] Const_1;
  input [254:0] locking_key;
  wire [9:0] working_key;
  assign Const_0 = (1'b0 ^ working_key[0]);
  assign ap_idle = Const_0;
  assign out1 = ((sel ^ working_key[1]) == 1'b1)? in1 - in2 : in1 + in2;
  assign Const_1 = (8'b01100111 ^ working_key[9:2]);
  assign out2 = in3 * Const_1;
  assign working_key = { locking_key[9:0] };

endmodule

