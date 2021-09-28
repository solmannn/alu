
module check
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  ap_return,
  locking_key,
  locking_key
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0] ap_return;
  input [12286:0] locking_key;
  input [12286:0] locking_key;

  check
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .ap_return(ap_return),
    .locking_key(locking_key),
    .locking_key(locking_key)
  );


endmodule

