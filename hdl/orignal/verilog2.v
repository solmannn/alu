module calculate_2 (
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

wire   [30:0] tmp_2_fu_34_p1;
wire   [30:0] tmp_1_fu_30_p1;
wire   [31:0] value_fu_38_p2;
wire   [0:0] tmp_fu_50_p2;
wire   [30:0] value_cast_fu_44_p2;
wire   [30:0] p_0_fu_56_p3;

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ap_return = p_0_fu_56_p3;

assign p_0_fu_56_p3 = ((tmp_fu_50_p2_temp) ? value_cast_fu_44_p2 : 31'd0);

assign tmp_fu_50_p2_temp = tmp_fu_50_p2 & 1'd1;

assign tmp_1_fu_30_p1 = a & 30'd2147483647;

assign tmp_2_fu_34_p1 = b & 30'd2147483647;

assign tmp_fu_50_p2 = (($signed(value_fu_38_p2) > $signed(32'd1000)) ? 1'b1 : 1'b0);

assign value_cast_fu_44_p2 = (tmp_2_fu_34_p1 + tmp_1_fu_30_p1);

assign value_fu_38_p2 = (a + b);

endmodule //calculate
