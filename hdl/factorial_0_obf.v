
module factorial_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  num,
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
  input [31:0] num;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [1:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] temp_1_fu_47_p2;
  wire ap_CS_fsm_state2;
  wire [0:0] tmp_fu_42_p2;
  wire [31:0] i_1_fu_53_p2;
  reg signed [31:0] temp_reg_20;
  reg signed [31:0] i_reg_31;
  reg [1:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire Const_3;
  wire [31:0] Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire [31:0] Const_9;
  wire Const_10;
  wire Const_11;
  wire Const_12;
  wire Const_13;
  wire Const_14;
  wire Const_15;
  wire Const_16;
  wire Const_17;
  wire Const_18;
  wire Const_19;
  wire Const_20;
  wire Const_21;
  wire Const_22;
  wire Const_23;
  wire Const_24;
  wire Const_25;
  wire [31:0] Const_26;
  wire Const_27;
  wire Const_28;
  input [254:0] locking_key;
  wire [129:0] working_key;

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

  assign Const_0 = (1'b1 ^ working_key[0]);
  assign Const_1 = (1'b0 ^ working_key[1]);
  assign Const_2 = (1'b0 ^ working_key[2]);
  assign Const_3 = (1'b0 ^ working_key[3]);
  assign Const_4 = (32'b01011101001101010100100101011011 ^ working_key[35:4]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_42_p2 == Const_0) & (Const_1 == ap_CS_fsm_state2) ^ working_key[36]) == 1'b0) begin
      i_reg_31 <= i_1_fu_53_p2;
    end else if((ap_start == Const_2) & (Const_3 == ap_CS_fsm_state1)) begin
      i_reg_31 <= Const_4;
    end 
  end

  assign Const_5 = (1'b0 ^ working_key[37]);
  assign Const_6 = (1'b0 ^ working_key[38]);
  assign Const_7 = (1'b1 ^ working_key[39]);
  assign Const_8 = (1'b0 ^ working_key[40]);
  assign Const_9 = (32'b01011111110100110101010010010100 ^ working_key[72:41]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_42_p2 == Const_5) & (Const_6 == ap_CS_fsm_state2) ^ working_key[73]) == 1'b0) begin
      temp_reg_20 <= temp_1_fu_47_p2;
    end else if((ap_start == Const_7) & (Const_8 == ap_CS_fsm_state1)) begin
      temp_reg_20 <= Const_9;
    end 
  end

  assign Const_10 = (1'b1 ^ working_key[74]);
  assign Const_11 = (1'b0 ^ working_key[75]);
  assign Const_12 = (1'b1 ^ working_key[76]);
  assign Const_13 = (1'b0 ^ working_key[77]);

  always @(*) begin
    if(((tmp_fu_42_p2 == Const_10) & (Const_11 == ap_CS_fsm_state2) ^ working_key[78]) == 1'b1) begin
      ap_done = Const_13;
    end else begin
      ap_done = Const_12;
    end
  end

  assign Const_14 = (1'b0 ^ working_key[79]);
  assign Const_15 = (1'b0 ^ working_key[80]);
  assign Const_16 = (1'b1 ^ working_key[81]);
  assign Const_17 = (1'b1 ^ working_key[82]);

  always @(*) begin
    if(((ap_start == Const_14) & (Const_15 == ap_CS_fsm_state1) ^ working_key[83]) == 1'b1) begin
      ap_idle = Const_16;
    end else begin
      ap_idle = Const_17;
    end
  end

  assign Const_18 = (1'b0 ^ working_key[84]);
  assign Const_19 = (1'b1 ^ working_key[85]);
  assign Const_20 = (1'b0 ^ working_key[86]);
  assign Const_21 = (1'b0 ^ working_key[87]);

  always @(*) begin
    if(((tmp_fu_42_p2 == Const_18) & (Const_19 == ap_CS_fsm_state2) ^ working_key[88]) == 1'b1) begin
      ap_ready = Const_21;
    end else begin
      ap_ready = Const_20;
    end
  end

  assign Const_22 = (1'b1 ^ working_key[89]);
  assign Const_23 = (1'b0 ^ working_key[90]);
  assign Const_24 = (1'b0 ^ working_key[92]);
  assign Const_25 = (1'b1 ^ working_key[93]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_22) & (Const_23 == ap_CS_fsm_state1) ^ working_key[91]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(((tmp_fu_42_p2 == Const_24) & (Const_25 == ap_CS_fsm_state2) ^ working_key[94]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_return = temp_reg_20;
  assign Const_26 = (32'b11001010101010101010101010000011 ^ working_key[126:95]);
  assign i_1_fu_53_p2 = i_reg_31 + Const_26;
  assign temp_1_fu_47_p2 = i_reg_31 * temp_reg_20;
  assign Const_27 = (1'b1 ^ working_key[127]);
  assign Const_28 = (1'b0 ^ working_key[128]);
  assign tmp_fu_42_p2 = (((i_reg_31 > num) ^ working_key[129]) == 1'b1)? Const_28 : Const_27;
  assign working_key = { locking_key[129:0] };

endmodule

