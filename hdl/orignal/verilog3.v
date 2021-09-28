module calculate_3 (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        ap_return
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] a;
input  [31:0] b;
output  [31:0] ap_return;

assign ap_done = ap_start;

assign ap_idle = 1'd1;

assign ap_ready = ap_start;

assign ap_return = (a * 32'd100);

endmodule //calculate
