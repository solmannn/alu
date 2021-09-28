
module alu_top
(
  in1,
  in2,
  in3,
  sel,
  out1,
  out2
);

  input [7:0] in1;
  input [7:0] in2;
  input [7:0] in3;
  input sel;
  output [7:0] out1;
  output [7:0] out2;

  alu_top_0_obf
  i0
  (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .sel(sel),
    .out1(out1),
    .out2(out2),
    .working_key(8'b1011111
    )
  );


endmodule

