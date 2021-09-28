
module calculate_3_0_obf
(
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  ap_return,
  locking_key
);

  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] a;
  input [31:0] b;
  output [31:0] ap_return;
  wire Const_0;
  wire [31:0] Const_1;
  input [254:0] locking_key;
  wire [32:0] working_key;
  assign ap_done = ap_start;
  assign Const_0 = (1'b0 ^ working_key[0]);
  assign ap_idle = Const_0;
  assign ap_ready = ap_start;
  assign Const_1 = (32'b11101001101010100100101010110011 ^ working_key[32:1]);
  assign ap_return = a * Const_1;
  assign working_key = { locking_key[32:0] };

endmodule

