module calculate_4 (
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

wire   [31:0] value_fu_30_p2;
wire   [0:0] tmp_fu_36_p2;
wire   [31:0] value_1_fu_42_p2;

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ap_return = ((tmp_fu_36_p2_temp) ? value_1_fu_42_p2 : value_fu_30_p2);

assign tmp_fu_36_p2_temp = tmp_fu_36_p2 & 1'b1;

assign tmp_fu_36_p2 = (($signed(value_fu_30_p2) > $signed(32'd1000)) ? 1'd1 : 1'd0);

assign value_1_fu_42_p2 = (value_fu_30_p2 + b);

assign value_fu_30_p2 = (a + 32'd100);

endmodule //calculate
