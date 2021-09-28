
module calculate_1_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 3'd1;
  parameter ap_ST_fsm_state2 = 3'd2;
  parameter ap_ST_fsm_state3 = 3'd4;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] a;
  input [31:0] b;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [2:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] value_fu_28_p2;
  reg [31:0] value_reg_59;
  wire [0:0] tmp_fu_34_p2;
  reg [0:0] tmp_reg_64;
  wire [31:0] tmp_1_fu_40_p2;
  reg [31:0] tmp_1_reg_69;
  wire ap_CS_fsm_state2;
  wire signed [31:0] value_fu_28_p0;
  wire signed [31:0] value_fu_28_p1;
  wire signed [31:0] tmp_1_fu_40_p0;
  wire signed [31:0] tmp_1_fu_40_p1;
  wire ap_CS_fsm_state3;
  reg [2:0] ap_NS_fsm;
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
  wire Const_14;
  wire Const_15;
  wire [31:0] Const_16;
  wire [31:0] Const_17;
  wire Const_18;
  wire Const_19;
  input [254:0] locking_key;
  wire [87:0] working_key;

  initial begin
    #0 ap_CS_fsm = 3'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'b1 ^ working_key[0]);
  assign Const_1 = (1'b0 ^ working_key[1]);

  always @(posedge ap_clk) begin
    if((tmp_reg_64 == Const_0) & (Const_1 == ap_CS_fsm_state2)) begin
      tmp_1_reg_69 <= tmp_1_fu_40_p2;
    end 
  end

  assign Const_2 = (1'b0 ^ working_key[2]);
  assign Const_3 = (1'b0 ^ working_key[3]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_2) & (Const_3 == ap_CS_fsm_state1)) begin
      tmp_reg_64 <= tmp_fu_34_p2;
      value_reg_59 <= value_fu_28_p2;
    end 
  end

  assign Const_4 = (1'b1 ^ working_key[4]);
  assign Const_5 = (1'b0 ^ working_key[5]);
  assign Const_6 = (1'b0 ^ working_key[6]);

  always @(*) begin
    if(((Const_4 == ap_CS_fsm_state3) ^ working_key[7]) == 1'b1) begin
      ap_done = Const_6;
    end else begin
      ap_done = Const_5;
    end
  end

  assign Const_7 = (1'b1 ^ working_key[8]);
  assign Const_8 = (1'b1 ^ working_key[9]);
  assign Const_9 = (1'b0 ^ working_key[10]);
  assign Const_10 = (1'b0 ^ working_key[11]);

  always @(*) begin
    if(((ap_start == Const_7) & (Const_8 == ap_CS_fsm_state1) ^ working_key[12]) == 1'b1) begin
      ap_idle = Const_10;
    end else begin
      ap_idle = Const_9;
    end
  end

  assign Const_11 = (1'b1 ^ working_key[13]);
  assign Const_12 = (1'b1 ^ working_key[14]);
  assign Const_13 = (1'b1 ^ working_key[15]);

  always @(*) begin
    if(((Const_11 == ap_CS_fsm_state3) ^ working_key[16]) == 1'b1) begin
      ap_ready = Const_12;
    end else begin
      ap_ready = Const_13;
    end
  end

  assign Const_14 = (1'b1 ^ working_key[17]);
  assign Const_15 = (1'b0 ^ working_key[18]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_14) & (Const_15 == ap_CS_fsm_state1) ^ working_key[19]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_return = ((tmp_reg_64_temp1 ^ working_key[20]) == 1'b1)? tmp_1_reg_69 : value_reg_59;
  assign Const_16 = (32'b01001001010110101010111010011011 ^ working_key[52:21]);
  assign tmp_reg_64_temp1 = tmp_reg_64_temp & Const_16;
  assign tmp_1_fu_40_p0 = b;
  assign tmp_1_fu_40_p1 = a;
  assign tmp_1_fu_40_p2 = tmp_1_fu_40_p0 * tmp_1_fu_40_p1;
  assign Const_17 = (32'b10101010010101011111111011011101 ^ working_key[84:53]);
  assign Const_18 = (1'b1 ^ working_key[85]);
  assign Const_19 = (1'b1 ^ working_key[86]);
  assign tmp_fu_34_p2 = (((value_fu_28_p2 > Const_17) ^ working_key[87]) == 1'b1)? Const_18 : Const_19;
  assign value_fu_28_p0 = b;
  assign value_fu_28_p1 = a;
  assign value_fu_28_p2 = value_fu_28_p0 + value_fu_28_p1;
  assign working_key = { locking_key[87:0] };

endmodule

