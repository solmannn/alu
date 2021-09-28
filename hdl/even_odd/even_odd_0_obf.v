
module even_odd_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  s,
  e,
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
  input [31:0] s;
  input [31:0] e;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [1:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] evensum_1_fu_63_p3;
  wire ap_CS_fsm_state2;
  wire [0:0] tmp_fu_48_p2;
  wire [31:0] i_1_fu_71_p2;
  reg [31:0] i_reg_28;
  reg [31:0] evensum_reg_37;
  wire [0:0] tmp_1_fu_59_p1;
  wire [0:0] tmp_1_fu_59_p1_temp;
  wire [31:0] evensum_2_fu_53_p2;
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
  wire Const_9;
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
  wire Const_29;
  input [254:0] locking_key;
  wire [100:0] working_key;

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
  assign Const_4 = (32'b01011101001101010100100101011010 ^ working_key[35:4]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_48_p2 == Const_0) & (Const_1 == ap_CS_fsm_state2) ^ working_key[36]) == 1'b0) begin
      evensum_reg_37 <= evensum_1_fu_63_p3;
    end else if((ap_start == Const_2) & (Const_3 == ap_CS_fsm_state1)) begin
      evensum_reg_37 <= Const_4;
    end 
  end

  assign Const_5 = (1'b0 ^ working_key[37]);
  assign Const_6 = (1'b0 ^ working_key[38]);
  assign Const_7 = (1'b1 ^ working_key[39]);
  assign Const_8 = (1'b0 ^ working_key[40]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_48_p2 == Const_5) & (Const_6 == ap_CS_fsm_state2) ^ working_key[41]) == 1'b0) begin
      i_reg_28 <= i_1_fu_71_p2;
    end else if((ap_start == Const_7) & (Const_8 == ap_CS_fsm_state1)) begin
      i_reg_28 <= s;
    end 
  end

  assign Const_9 = (1'b1 ^ working_key[42]);
  assign Const_10 = (1'b0 ^ working_key[43]);
  assign Const_11 = (1'b1 ^ working_key[44]);
  assign Const_12 = (1'b1 ^ working_key[45]);

  always @(*) begin
    if(((tmp_fu_48_p2 == Const_9) & (Const_10 == ap_CS_fsm_state2) ^ working_key[46]) == 1'b1) begin
      ap_done = Const_11;
    end else begin
      ap_done = Const_12;
    end
  end

  assign Const_13 = (1'b0 ^ working_key[47]);
  assign Const_14 = (1'b0 ^ working_key[48]);
  assign Const_15 = (1'b1 ^ working_key[49]);
  assign Const_16 = (1'b0 ^ working_key[50]);

  always @(*) begin
    if(((ap_start == Const_13) & (Const_14 == ap_CS_fsm_state1) ^ working_key[51]) == 1'b1) begin
      ap_idle = Const_16;
    end else begin
      ap_idle = Const_15;
    end
  end

  assign Const_17 = (1'b1 ^ working_key[52]);
  assign Const_18 = (1'b0 ^ working_key[53]);
  assign Const_19 = (1'b1 ^ working_key[54]);
  assign Const_20 = (1'b1 ^ working_key[55]);

  always @(*) begin
    if(((tmp_fu_48_p2 == Const_17) & (Const_18 == ap_CS_fsm_state2) ^ working_key[56]) == 1'b1) begin
      ap_ready = Const_19;
    end else begin
      ap_ready = Const_20;
    end
  end

  assign Const_21 = (1'b0 ^ working_key[57]);
  assign Const_22 = (1'b0 ^ working_key[58]);
  assign Const_23 = (1'b1 ^ working_key[60]);
  assign Const_24 = (1'b0 ^ working_key[61]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_21) & (Const_22 == ap_CS_fsm_state1) ^ working_key[59]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(((tmp_fu_48_p2 == Const_23) & (Const_24 == ap_CS_fsm_state2) ^ working_key[62]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_return = evensum_reg_37;
  assign evensum_1_fu_63_p3 = ((tmp_1_fu_59_p1_temp ^ working_key[63]) == 1'b1)? evensum_2_fu_53_p2 : evensum_reg_37;
  assign Const_25 = (1'b0 ^ working_key[64]);
  assign tmp_1_fu_59_p1_temp = tmp_1_fu_59_p1 & Const_25;
  assign evensum_2_fu_53_p2 = i_reg_28 + evensum_reg_37;
  assign Const_26 = (32'b10101010101010101010010101011110 ^ working_key[96:65]);
  assign i_1_fu_71_p2 = Const_26 + i_reg_28;
  assign Const_27 = (1'b1 ^ working_key[97]);
  assign tmp_1_fu_59_p1 = i_reg_28 & Const_27;
  assign Const_28 = (1'b1 ^ working_key[98]);
  assign Const_29 = (1'b0 ^ working_key[99]);
  assign tmp_fu_48_p2 = (((i_reg_28 > e) ^ working_key[100]) == 1'b1)? Const_28 : Const_29;
  assign working_key = { locking_key[100:0] };

endmodule

