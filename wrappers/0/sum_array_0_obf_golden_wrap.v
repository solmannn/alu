
module sum_array
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  ap_return
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0] ap_return;

  sum_array_0_obf
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .ap_return(ap_return),
    .working_key(1535'b11001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101010100110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111)
  );


endmodule

