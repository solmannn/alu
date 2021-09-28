
module example
(
  in1,
  in2,
  in3,
  out1
);

  input [15:0] in1;
  input [15:0] in2;
  input [15:0] in3;
  output [15:0] out1;

  example_0_obf
  i0
  (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out1(out1),
    .working_key(33'b00101010101010100010101010101010
    )
  );


endmodule

