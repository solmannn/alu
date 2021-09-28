
module alu_top_0_obf
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
  input [7:0] locking_key;
  wire [0:0] working_key;
  assign out1 = ((sel ^ working_key[0]) == 1'b1)? in1 + in2 : in1 - in2;
  assign out2 = in3 * 8'd12;
  assign working_key = locking_key[0];

endmodule

