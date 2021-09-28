
module alu_0_obf
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
  wire [7:0] Const_0;
  input [254:0] locking_key;
  wire [8:0] working_key;
  assign out1 = ((sel ^ working_key[0]) == 1'b1)? in1 - in2 : in1 + in2;
  assign Const_0 = (8'b11001110 ^ working_key[8:1]);
  assign out2 = in3 * Const_0;
  assign working_key = { locking_key[8:0] };

endmodule

