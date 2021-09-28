
module MixColumn_AddRoundKe
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  statemt_address0,
  statemt_ce0,
  statemt_we0,
  statemt_d0,
  statemt_q0,
  statemt_address1,
  statemt_ce1,
  statemt_we1,
  statemt_d1,
  statemt_q1,
  n,
  working_key,
  locking_key
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [4:0] statemt_address0;
  output statemt_ce0;
  output statemt_we0;
  output [31:0] statemt_d0;
  input [31:0] statemt_q0;
  output [4:0] statemt_address1;
  output statemt_ce1;
  output statemt_we1;
  output [31:0] statemt_d1;
  input [31:0] statemt_q1;
  input [3:0] n;
  input [31:0] working_key;
  input [63:0] working_key;
  input [128:0] working_key;

  MixColumn_AddRoundKe
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .statemt_address0(statemt_address0),
    .statemt_ce0(statemt_ce0),
    .statemt_we0(statemt_we0),
    .statemt_d0(statemt_d0),
    .statemt_q0(statemt_q0),
    .statemt_address1(statemt_address1),
    .statemt_ce1(statemt_ce1),
    .statemt_we1(statemt_we1),
    .statemt_d1(statemt_d1),
    .statemt_q1(statemt_q1),
    .n(n),
    .working_key(working_key),
    .working_key(working_key),
    .working_key(working_key)
  );


endmodule

