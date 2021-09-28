
module calculate
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  s,
  e,
  ap_return
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] s;
  input [31:0] e;
  output [31:0] ap_return;

  calculate_0_obf
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .s(s),
    .e(e),
    .ap_return(ap_return),
    .working_key(255'b110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111)
  );


endmodule

