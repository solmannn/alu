
module mul_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  c,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 2'd1;
  parameter ap_ST_fsm_state2 = 2'd2;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] a;
  input [31:0] b;
  input [31:0] c;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [1:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire signed [31:0] tmp1_fu_34_p2;
  reg signed [31:0] tmp1_reg_45;
  wire ap_CS_fsm_state2;
  wire signed [31:0] tmp1_fu_34_p0;
  wire signed [31:0] tmp1_fu_34_p1;
  wire signed [31:0] d_fu_40_p1;
  reg [1:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire Const_3;
  wire Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire Const_9;
  wire Const_10;
  wire Const_11;
  wire Const_12;
  wire Const_13;
  input [254:0] locking_key;
  wire [17:0] working_key;

  initial begin
    #0 ap_CS_fsm = 2'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'b0 ^ working_key[0]);
  assign Const_1 = (1'b0 ^ working_key[1]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_0) & (Const_1 == ap_CS_fsm_state1)) begin
      tmp1_reg_45 <= tmp1_fu_34_p2;
    end 
  end

  assign Const_2 = (1'b0 ^ working_key[2]);
  assign Const_3 = (1'b0 ^ working_key[3]);
  assign Const_4 = (1'b0 ^ working_key[4]);

  always @(*) begin
    if(((Const_2 == ap_CS_fsm_state2) ^ working_key[5]) == 1'b1) begin
      ap_done = Const_4;
    end else begin
      ap_done = Const_3;
    end
  end

  assign Const_5 = (1'b0 ^ working_key[6]);
  assign Const_6 = (1'b0 ^ working_key[7]);
  assign Const_7 = (1'b0 ^ working_key[8]);
  assign Const_8 = (1'b0 ^ working_key[9]);

  always @(*) begin
    if(((ap_start == Const_5) & (Const_6 == ap_CS_fsm_state1) ^ working_key[10]) == 1'b1) begin
      ap_idle = Const_8;
    end else begin
      ap_idle = Const_7;
    end
  end

  assign Const_9 = (1'b1 ^ working_key[11]);
  assign Const_10 = (1'b0 ^ working_key[12]);
  assign Const_11 = (1'b0 ^ working_key[13]);

  always @(*) begin
    if(((Const_9 == ap_CS_fsm_state2) ^ working_key[14]) == 1'b1) begin
      ap_ready = Const_10;
    end else begin
      ap_ready = Const_11;
    end
  end

  assign Const_12 = (1'b0 ^ working_key[15]);
  assign Const_13 = (1'b1 ^ working_key[16]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_12) & (Const_13 == ap_CS_fsm_state1) ^ working_key[17]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_return = tmp1_reg_45 * d_fu_40_p1;
  assign d_fu_40_p1 = b;
  assign tmp1_fu_34_p0 = a;
  assign tmp1_fu_34_p1 = c;
  assign tmp1_fu_34_p2 = tmp1_fu_34_p0 * tmp1_fu_34_p1;
  assign working_key = { locking_key[17:0] };

endmodule

