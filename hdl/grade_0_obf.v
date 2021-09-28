
module grade_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  p,
  b,
  c,
  m,
  cs,
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
  input [31:0] p;
  input [31:0] b;
  input [31:0] c;
  input [31:0] m;
  input [31:0] cs;
  output [7:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [2:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] tmp2_fu_80_p2;
  reg [31:0] tmp2_reg_217;
  wire [0:0] tmp_4_fu_97_p2;
  reg [0:0] tmp_4_reg_222;
  wire ap_CS_fsm_state2;
  wire [0:0] tmp_5_fu_103_p2;
  reg [0:0] tmp_5_reg_228;
  wire [0:0] tmp_7_fu_109_p2;
  reg [0:0] tmp_7_reg_234;
  wire [0:0] tmp_9_fu_115_p2;
  reg [0:0] tmp_9_reg_240;
  wire [0:0] tmp_3_fu_121_p2;
  reg [0:0] tmp_3_reg_245;
  wire [31:0] tmp1_fu_74_p2;
  wire [31:0] tmp_fu_86_p2;
  wire [31:0] total_fu_92_p2;
  wire ap_CS_fsm_state3;
  wire [0:0] sel_tmp1_fu_127_p2;
  wire [0:0] sel_tmp6_fu_137_p2;
  wire [0:0] sel_tmp_fu_147_p2;
  wire [0:0] sel_tmp3_fu_152_p2;
  wire [0:0] sel_tmp7_fu_142_p2;
  wire [0:0] sel_tmp2_fu_132_p2;
  wire [0:0] or_cond_fu_165_p2;
  wire [6:0] newSel_fu_157_p3;
  wire [6:0] newSel1_fu_171_p3;
  wire [0:0] or_cond1_fu_179_p2;
  wire [0:0] or_cond2_fu_199_p2;
  wire [6:0] newSel3_fu_191_p3;
  wire [6:0] newSel2_fu_184_p3;
  wire [6:0] newSel4_fu_205_p3;
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
  wire [6:0] Const_15;
  wire [6:0] Const_16;
  wire [31:0] Const_17;
  input [254:0] locking_key;
  wire [34:0] working_key;

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

  assign Const_0 = (1'b0 ^ working_key[0]);
  assign Const_1 = (1'b0 ^ working_key[1]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_0) & (Const_1 == ap_CS_fsm_state1)) begin
      tmp2_reg_217 <= tmp2_fu_80_p2;
    end 
  end

  assign Const_2 = (1'b0 ^ working_key[2]);

  always @(posedge ap_clk) begin
    if(Const_2 == ap_CS_fsm_state2) begin
      tmp_3_reg_245 <= tmp_3_fu_121_p2;
      tmp_4_reg_222 <= tmp_4_fu_97_p2;
      tmp_5_reg_228 <= tmp_5_fu_103_p2;
      tmp_7_reg_234 <= tmp_7_fu_109_p2;
      tmp_9_reg_240 <= tmp_9_fu_115_p2;
    end 
  end

  assign Const_3 = (1'b0 ^ working_key[3]);
  assign Const_4 = (1'b1 ^ working_key[4]);
  assign Const_5 = (1'b1 ^ working_key[5]);

  always @(*) begin
    if(((Const_3 == ap_CS_fsm_state3) ^ working_key[6]) == 1'b1) begin
      ap_done = Const_4;
    end else begin
      ap_done = Const_5;
    end
  end

  assign Const_6 = (1'b1 ^ working_key[7]);
  assign Const_7 = (1'b0 ^ working_key[8]);
  assign Const_8 = (1'b1 ^ working_key[9]);
  assign Const_9 = (1'b1 ^ working_key[10]);

  always @(*) begin
    if(((ap_start == Const_6) & (Const_7 == ap_CS_fsm_state1) ^ working_key[11]) == 1'b1) begin
      ap_idle = Const_8;
    end else begin
      ap_idle = Const_9;
    end
  end

  assign Const_10 = (1'b0 ^ working_key[12]);
  assign Const_11 = (1'b1 ^ working_key[13]);
  assign Const_12 = (1'b0 ^ working_key[14]);

  always @(*) begin
    if(((Const_10 == ap_CS_fsm_state3) ^ working_key[15]) == 1'b1) begin
      ap_ready = Const_12;
    end else begin
      ap_ready = Const_11;
    end
  end

  assign Const_13 = (1'b1 ^ working_key[16]);
  assign Const_14 = (1'b1 ^ working_key[17]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_13) & (Const_14 == ap_CS_fsm_state1) ^ working_key[18]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
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
  assign ap_return = newSel4_fu_205_p3;
  assign Const_15 = (7'b0101000 ^ working_key[25:19]);
  assign Const_16 = (7'b0110101 ^ working_key[32:26]);
  assign newSel1_fu_171_p3 = ((sel_tmp2_fu_132_p2_temp ^ working_key[33]) == 1'b1)? Const_15 : Const_16;
  
  assign Const_17 = (32'b0 ^ working_key[65:34]);
  assign sel_tmp2_fu_132_p2_temp = sel_tmp2_fu_132_p2 & Const_17;
  assign working_key = { locking_key[34:0] };

endmodule

