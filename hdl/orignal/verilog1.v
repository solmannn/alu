module calculate_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        ap_return
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] a;
input  [31:0] b;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] value_fu_28_p2;
reg   [31:0] value_reg_59;
wire   [0:0] tmp_fu_34_p2;
reg   [0:0] tmp_reg_64;
wire   [31:0] tmp_1_fu_40_p2;
reg   [31:0] tmp_1_reg_69;
wire    ap_CS_fsm_state2;
wire  signed [31:0] value_fu_28_p0;
wire  signed [31:0] value_fu_28_p1;
wire  signed [31:0] tmp_1_fu_40_p0;
wire  signed [31:0] tmp_1_fu_40_p1;
wire    ap_CS_fsm_state3;
reg   [2:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_64 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_1_reg_69 <= tmp_1_fu_40_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_reg_64 <= tmp_fu_34_p2;
        value_reg_59 <= value_fu_28_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_return = ((tmp_reg_64_temp1) ? value_reg_59 : tmp_1_reg_69);

assign tmp_reg_64_temp1 = tmp_reg_64_temp & 1'd1;

assign tmp_1_fu_40_p0 = b;

assign tmp_1_fu_40_p1 = a;

assign tmp_1_fu_40_p2 = ($signed(tmp_1_fu_40_p0) * $signed(tmp_1_fu_40_p1));

assign tmp_fu_34_p2 = (($signed(value_fu_28_p2) > $signed(32'd1000)) ? 1'b1 : 1'b0);

assign value_fu_28_p0 = b;

assign value_fu_28_p1 = a;

assign value_fu_28_p2 = ($signed(value_fu_28_p0) + $signed(value_fu_28_p1));

endmodule //calculate
