
module diff_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  x,
  dx,
  u,
  a,
  y,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 6'd1;
  parameter ap_ST_fsm_state2 = 6'd2;
  parameter ap_ST_fsm_state3 = 6'd4;
  parameter ap_ST_fsm_state4 = 6'd8;
  parameter ap_ST_fsm_state5 = 6'd16;
  parameter ap_ST_fsm_state6 = 6'd32;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] x;
  input [31:0] dx;
  input [31:0] u;
  input [31:0] a;
  input [31:0] y;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [5:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire signed [31:0] tmp_fu_87_p2;
  reg signed [31:0] tmp_reg_163;
  wire signed [31:0] tmp1_fu_98_p2;
  reg signed [31:0] tmp1_reg_172;
  wire ap_CS_fsm_state2;
  wire [0:0] tmp_1_fu_93_p2;
  wire [31:0] x_assign_fu_103_p2;
  reg [31:0] x_assign_reg_177;
  wire [31:0] tmp_3_fu_108_p2;
  reg [31:0] tmp_3_reg_182;
  wire ap_CS_fsm_state3;
  wire [31:0] tmp_5_fu_113_p2;
  reg [31:0] tmp_5_reg_187;
  wire signed [31:0] u_assign_fu_123_p2;
  reg signed [31:0] u_assign_reg_192;
  wire ap_CS_fsm_state4;
  wire [31:0] tmp_7_fu_128_p2;
  reg [31:0] tmp_7_reg_198;
  wire ap_CS_fsm_state5;
  wire [31:0] y_assign_fu_132_p2;
  wire ap_CS_fsm_state6;
  reg signed [31:0] p_s_reg_52;
  reg signed [31:0] p_1_reg_62;
  reg signed [31:0] p_0_reg_72;
  wire signed [31:0] tmp_2_fu_81_p0;
  wire [31:0] tmp_2_fu_81_p2;
  wire signed [31:0] tmp_fu_87_p1;
  wire signed [31:0] x_assign_fu_103_p1;
  wire [31:0] tmp_4_fu_118_p2;
  wire signed [31:0] tmp_7_fu_128_p1;
  reg [5:0] ap_NS_fsm;
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
  wire Const_26;
  wire Const_27;
  wire Const_28;
  wire Const_29;
  wire Const_30;
  wire Const_31;
  wire Const_32;
  wire Const_33;
  wire [31:0] Const_34;
  input [254:0] locking_key;
  wire [74:0] working_key;

  initial begin
    #0 ap_CS_fsm = 6'd1;
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
  assign Const_2 = (1'b0 ^ working_key[2]);

  always @(posedge ap_clk) begin
    if(((Const_0 == ap_CS_fsm_state6) ^ working_key[3]) == 1'b0) begin
      p_0_reg_72 <= x_assign_reg_177;
    end else if((Const_1 == ap_CS_fsm_state1) & (ap_start == Const_2)) begin
      p_0_reg_72 <= x;
    end 
  end

  assign Const_3 = (1'b1 ^ working_key[4]);
  assign Const_4 = (1'b0 ^ working_key[5]);
  assign Const_5 = (1'b1 ^ working_key[6]);

  always @(posedge ap_clk) begin
    if(((Const_3 == ap_CS_fsm_state6) ^ working_key[7]) == 1'b0) begin
      p_1_reg_62 <= y_assign_fu_132_p2;
    end else if((Const_4 == ap_CS_fsm_state1) & (ap_start == Const_5)) begin
      p_1_reg_62 <= y;
    end 
  end

  assign Const_6 = (1'b0 ^ working_key[8]);
  assign Const_7 = (1'b1 ^ working_key[9]);
  assign Const_8 = (1'b0 ^ working_key[10]);

  always @(posedge ap_clk) begin
    if(((Const_6 == ap_CS_fsm_state6) ^ working_key[11]) == 1'b1) begin
      p_s_reg_52 <= u_assign_reg_192;
    end else if((Const_7 == ap_CS_fsm_state1) & (ap_start == Const_8)) begin
      p_s_reg_52 <= u;
    end 
  end

  assign Const_9 = (1'b0 ^ working_key[12]);
  assign Const_10 = (1'b1 ^ working_key[13]);

  always @(posedge ap_clk) begin
    if((tmp_1_fu_93_p2 == Const_9) & (Const_10 == ap_CS_fsm_state2)) begin
      tmp1_reg_172 <= tmp1_fu_98_p2;
      x_assign_reg_177 <= x_assign_fu_103_p2;
    end 
  end

  assign Const_11 = (1'b1 ^ working_key[14]);

  always @(posedge ap_clk) begin
    if(Const_11 == ap_CS_fsm_state3) begin
      tmp_3_reg_182 <= tmp_3_fu_108_p2;
      tmp_5_reg_187 <= tmp_5_fu_113_p2;
    end 
  end

  assign Const_12 = (1'b0 ^ working_key[15]);

  always @(posedge ap_clk) begin
    if(Const_12 == ap_CS_fsm_state5) begin
      tmp_7_reg_198 <= tmp_7_fu_128_p2;
    end 
  end

  assign Const_13 = (1'b1 ^ working_key[16]);
  assign Const_14 = (1'b1 ^ working_key[17]);

  always @(posedge ap_clk) begin
    if((Const_13 == ap_CS_fsm_state1) & (ap_start == Const_14)) begin
      tmp_reg_163 <= tmp_fu_87_p2;
    end 
  end

  assign Const_15 = (1'b0 ^ working_key[18]);

  always @(posedge ap_clk) begin
    if(Const_15 == ap_CS_fsm_state4) begin
      u_assign_reg_192 <= u_assign_fu_123_p2;
    end 
  end

  assign Const_16 = (1'b0 ^ working_key[19]);
  assign Const_17 = (1'b0 ^ working_key[20]);
  assign Const_18 = (1'b1 ^ working_key[21]);
  assign Const_19 = (1'b1 ^ working_key[22]);

  always @(*) begin
    if(((tmp_1_fu_93_p2 == Const_16) & (Const_17 == ap_CS_fsm_state2) ^ working_key[23]) == 1'b1) begin
      ap_done = Const_18;
    end else begin
      ap_done = Const_19;
    end
  end

  assign Const_20 = (1'b1 ^ working_key[24]);
  assign Const_21 = (1'b0 ^ working_key[25]);
  assign Const_22 = (1'b1 ^ working_key[26]);
  assign Const_23 = (1'b0 ^ working_key[27]);

  always @(*) begin
    if(((ap_start == Const_20) & (Const_21 == ap_CS_fsm_state1) ^ working_key[28]) == 1'b1) begin
      ap_idle = Const_23;
    end else begin
      ap_idle = Const_22;
    end
  end

  assign Const_24 = (1'b0 ^ working_key[29]);
  assign Const_25 = (1'b0 ^ working_key[30]);
  assign Const_26 = (1'b0 ^ working_key[31]);
  assign Const_27 = (1'b1 ^ working_key[32]);

  always @(*) begin
    if(((tmp_1_fu_93_p2 == Const_24) & (Const_25 == ap_CS_fsm_state2) ^ working_key[33]) == 1'b1) begin
      ap_ready = Const_26;
    end else begin
      ap_ready = Const_27;
    end
  end

  assign Const_28 = (1'b0 ^ working_key[34]);
  assign Const_29 = (1'b1 ^ working_key[35]);
  assign Const_30 = (1'b0 ^ working_key[37]);
  assign Const_31 = (1'b0 ^ working_key[38]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_28 == ap_CS_fsm_state1) & (ap_start == Const_29) ^ working_key[36]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        if(((tmp_1_fu_93_p2 == Const_30) & (Const_31 == ap_CS_fsm_state2) ^ working_key[39]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        ap_NS_fsm = ap_ST_fsm_state6;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state2;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_return = p_1_reg_62;
  assign tmp1_fu_98_p2 = tmp_reg_163 * p_0_reg_72;
  assign Const_32 = (1'b0 ^ working_key[40]);
  assign Const_33 = (1'b1 ^ working_key[41]);

  assign tmp_1_fu_93_p2 = (((p_0_reg_72 < a) ^ working_key[42]) == 1'b1)? Const_32 : Const_33;
  assign tmp_2_fu_81_p0 = dx;
  assign Const_34 = (32'b01010111111101001101010100100111 ^ working_key[74:43]);

  assign tmp_2_fu_81_p2 = tmp_2_fu_81_p0 << Const_34;
  assign tmp_3_fu_108_p2 = tmp1_reg_172 * p_s_reg_52;
  assign tmp_4_fu_118_p2 = p_s_reg_52 - tmp_3_reg_182;
  assign tmp_5_fu_113_p2 = p_1_reg_62 * tmp_reg_163;
  assign tmp_7_fu_128_p1 = dx;

  assign tmp_7_fu_128_p2 = u_assign_reg_192 * tmp_7_fu_128_p1;
  assign tmp_fu_87_p1 = dx;
  assign tmp_fu_87_p2 = tmp_2_fu_81_p2 - tmp_fu_87_p1;
  assign u_assign_fu_123_p2 = tmp_4_fu_118_p2 - tmp_5_reg_187;
  assign x_assign_fu_103_p1 = dx;
  
  assign x_assign_fu_103_p2 = p_0_reg_72 + x_assign_fu_103_p1;
  assign y_assign_fu_132_p2 = tmp_7_reg_198 + p_1_reg_62;
  assign working_key = { locking_key[74:0] };

endmodule

