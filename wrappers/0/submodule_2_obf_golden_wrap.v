
module submodule
(
  x,
  y,
  z
);

  input [15:0] x;
  input [15:0] y;
  output [15:0] z;

  submodule_2_obf
  i0
  (
    .x(x),
    .y(y),
    .z(z),
    .working_key(1'b0)
  );


endmodule

