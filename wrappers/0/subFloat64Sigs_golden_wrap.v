
module subFloat64Sigs
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  zSign,
  ap_return,
  working_key,
  locking_key
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [63:0] a;
  input [63:0] b;
  input [0:0] zSign;
  output [63:0] ap_return;
  input [127:0] working_key;
  input [12286:0] locking_key;

  subFloat64Sigs
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .a(a),
    .b(b),
    .zSign(zSign),
    .ap_return(ap_return),
    .working_key(working_key),
    .locking_key(locking_key)
  );


endmodule

