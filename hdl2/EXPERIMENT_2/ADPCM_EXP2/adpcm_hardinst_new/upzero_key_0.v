
module upzero
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  dlt,
  dlti_address0,
  dlti_ce0,
  dlti_we0,
  dlti_d0,
  dlti_q0,
  dlti_address1,
  dlti_ce1,
  dlti_we1,
  dlti_d1,
  dlti_q1,
  bli_address0,
  bli_ce0,
  bli_we0,
  bli_d0,
  bli_q0,
  working_key
);

  parameter ap_ST_fsm_state1 = 10'd1;
  parameter ap_ST_fsm_state2 = 10'd2;
  parameter ap_ST_fsm_state3 = 10'd4;
  parameter ap_ST_fsm_state4 = 10'd8;
  parameter ap_ST_fsm_state5 = 10'd16;
  parameter ap_ST_fsm_state6 = 10'd32;
  parameter ap_ST_fsm_state7 = 10'd64;
  parameter ap_ST_fsm_state8 = 10'd128;
  parameter ap_ST_fsm_state9 = 10'd256;
  parameter ap_ST_fsm_state10 = 10'd512;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [16:0] dlt;
  output [2:0] dlti_address0;
  output dlti_ce0;
  output dlti_we0;
  output [31:0] dlti_d0;
  input [31:0] dlti_q0;
  output [2:0] dlti_address1;
  output dlti_ce1;
  output dlti_we1;
  output [31:0] dlti_d1;
  input [31:0] dlti_q1;
  output [2:0] bli_address0;
  output bli_ce0;
  output bli_we0;
  output [31:0] bli_d0;
  input [31:0] bli_q0;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [2:0] dlti_address0;
  reg dlti_ce0;
  reg dlti_we0;
  reg [31:0] dlti_d0;
  reg [2:0] dlti_address1;
  reg dlti_ce1;
  reg dlti_we1;
  reg [2:0] bli_address0;
  reg bli_ce0;
  reg bli_we0;
  reg [31:0] bli_d0;
  reg [9:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg signed [31:0] reg_162;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state8;
  wire ap_CS_fsm_state9;
  wire signed [31:0] dlt_cast1_fu_167_p1;
  reg signed [31:0] dlt_cast1_reg_294;
  wire [0:0] tmp_fu_171_p2;
  reg [0:0] tmp_reg_305;
  wire [2:0] i_3_fu_183_p2;
  reg [2:0] i_3_reg_312;
  wire ap_CS_fsm_state2;
  wire [0:0] exitcond_fu_177_p2;
  reg [2:0] bli_addr_1_reg_322;
  wire [2:0] i_2_fu_201_p2;
  reg [2:0] i_2_reg_330;
  reg [2:0] bli_addr_reg_335;
  wire [0:0] exitcond1_fu_195_p2;
  wire [31:0] tmp_6_fu_212_p2;
  reg [31:0] tmp_6_reg_346;
  wire ap_CS_fsm_state4;
  reg [31:0] bli_load_1_reg_351;
  wire [2:0] dlti_addr_3_reg_357;
  reg [31:0] dlti_load_3_reg_367;
  reg [2:0] i_1_reg_140;
  wire ap_CS_fsm_state5;
  reg [2:0] i_reg_151;
  wire ap_CS_fsm_state6;
  wire [63:0] tmp_5_fu_189_p1;
  wire [63:0] tmp_1_fu_207_p1;
  wire ap_CS_fsm_state10;
  wire signed [31:0] tmp_4_cast_fu_262_p1;
  wire signed [31:0] tmp_3_fu_289_p1;
  wire signed [16:0] dlt_cast1_fu_167_p0;
  wire signed [16:0] tmp_fu_171_p0;
  wire signed [16:0] tmp_6_fu_212_p1;
  wire [0:0] tmp_9_fu_217_p3;
  wire [31:0] tmp_10_fu_232_p2;
  wire [31:0] tmp_s_fu_237_p2;
  wire [23:0] tmp_11_fu_242_p4;
  wire [24:0] tmp_9_cast_cast_fu_224_p3;
  wire signed [24:0] wd3_cast_fu_252_p1;
  wire [24:0] tmp_4_fu_256_p2;
  wire [31:0] tmp_7_fu_267_p2;
  wire [31:0] tmp_2_fu_273_p2;
  wire [23:0] tmp_8_fu_279_p4;
  reg [9:0] ap_NS_fsm;
  wire [31:0] temp132;
  wire [31:0] temp134;
  wire [31:0] temp135;
  wire [31:0] temp136;
  wire [31:0] temp138;
  wire [31:0] temp139;
  input [29:0] working_key;

  initial begin
    #0 ap_CS_fsm = 10'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_171_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[26] == 1'b1) begin
        i_1_reg_140 <= temp132;
      end else begin
        i_1_reg_140 <= 3'd0;
      end
    end else if(1'b1 == ap_CS_fsm_state5) begin
      i_1_reg_140 <= i_3_reg_312;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_171_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[29] == 1'b1) begin
        i_reg_151 <= temp136;
      end else begin
        i_reg_151 <= 3'd0;
      end
    end else if(1'b1 == ap_CS_fsm_state6) begin
      i_reg_151 <= i_2_reg_330;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond_fu_177_p2 == 1'd0) & (tmp_reg_305 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      bli_addr_1_reg_322 <= tmp_5_fu_189_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond1_fu_195_p2 == 1'd0) & (tmp_reg_305 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
      bli_addr_reg_335 <= tmp_1_fu_207_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      bli_load_1_reg_351 <= bli_q0;
      tmp_6_reg_346 <= tmp_6_fu_212_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      dlt_cast1_reg_294 <= dlt_cast1_fu_167_p1;
      tmp_reg_305 <= tmp_fu_171_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      dlti_load_3_reg_367 <= dlti_q1;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_reg_305 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
      i_2_reg_330 <= i_2_fu_201_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_reg_305 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      i_3_reg_312 <= i_3_fu_183_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state3)) begin
      reg_162 <= dlti_q0;
    end 
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state10) | (ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_done = 1'b1;
    end else begin
      ap_done = 1'b0;
    end
  end


  always @(*) begin
    if((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_idle = 1'b1;
    end else begin
      ap_idle = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      bli_address0 = bli_addr_reg_335;
    end else if((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5)) begin
      bli_address0 = bli_addr_1_reg_322;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      bli_address0 = tmp_1_fu_207_p1;
    end else begin
      bli_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5)) begin
      bli_ce0 = 1'b1;
    end else begin
      bli_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      bli_d0 = tmp_3_fu_289_p1;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      bli_d0 = tmp_4_cast_fu_262_p1;
    end else begin
      bli_d0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5)) begin
      bli_we0 = 1'b1;
    end else begin
      bli_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      dlti_address0 = dlti_addr_3_reg_357;
    end else if((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state10)) begin
      dlti_address0 = 64'd0;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      dlti_address0 = 64'd3;
    end else if((1'b1 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == 1'd1) & (tmp_reg_305 == 1'd0) | (tmp_reg_305 == 1'd1) & (exitcond1_fu_195_p2 == 1'd1))) begin
      dlti_address0 = 64'd4;
    end else if((exitcond_fu_177_p2 == 1'd0) & (tmp_reg_305 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      dlti_address0 = tmp_5_fu_189_p1;
    end else begin
      dlti_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      dlti_address1 = 64'd1;
    end else if(1'b1 == ap_CS_fsm_state9) begin
      dlti_address1 = 64'd4;
    end else if(1'b1 == ap_CS_fsm_state8) begin
      dlti_address1 = 64'd5;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      dlti_address1 = 64'd2;
    end else begin
      dlti_address1 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state10) | (exitcond_fu_177_p2 == 1'd0) & (tmp_reg_305 == 1'd0) & (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == 1'd1) & (tmp_reg_305 == 1'd0) | (tmp_reg_305 == 1'd1) & (exitcond1_fu_195_p2 == 1'd1))) begin
      dlti_ce0 = 1'b1;
    end else begin
      dlti_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state10)) begin
      dlti_ce1 = 1'b1;
    end else begin
      dlti_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      dlti_d0 = dlt_cast1_reg_294;
    end else if(1'b1 == ap_CS_fsm_state9) begin
      dlti_d0 = dlti_load_3_reg_367;
    end else begin
      dlti_d0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state10)) begin
      dlti_we0 = 1'b1;
    end else begin
      dlti_we0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state10)) begin
      dlti_we1 = 1'b1;
    end else begin
      dlti_we1 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((exitcond1_fu_195_p2 == 1'd0) & (tmp_reg_305 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else if((1'b1 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == 1'd1) & (tmp_reg_305 == 1'd0) | (tmp_reg_305 == 1'd1) & (exitcond1_fu_195_p2 == 1'd1))) begin
          ap_NS_fsm = ap_ST_fsm_state7;
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
        ap_NS_fsm = ap_ST_fsm_state2;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state2;
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        ap_NS_fsm = ap_ST_fsm_state9;
      end
      ap_ST_fsm_state9: begin
        ap_NS_fsm = ap_ST_fsm_state10;
      end
      ap_ST_fsm_state10: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign dlt_cast1_fu_167_p0 = dlt;
  assign dlt_cast1_fu_167_p1 = dlt_cast1_fu_167_p0;
  assign dlti_addr_3_reg_357 = 64'd3;
  assign dlti_d1 = reg_162;
  assign exitcond1_fu_195_p2 = (i_reg_151 == 3'd6)? 1'b1 : 1'b0;
  assign exitcond_fu_177_p2 = (i_1_reg_140 == 3'd6)? 1'b1 : 1'b0;
  assign i_2_fu_201_p2 = i_reg_151 + 3'd1;
  assign i_3_fu_183_p2 = i_1_reg_140 + 3'd1;
  assign tmp_10_fu_232_p2 = bli_load_1_reg_351 << 32'd8;
  assign tmp_11_fu_242_p4 = { { tmp_s_fu_237_p2[31:8] } };
  assign tmp_1_fu_207_p1 = i_reg_151;
  assign tmp_2_fu_273_p2 = tmp_7_fu_267_p2 - bli_q0;
  assign tmp_3_fu_289_p1 = $signed(tmp_8_fu_279_p4);
  assign tmp_4_cast_fu_262_p1 = $signed(tmp_4_fu_256_p2);
  assign tmp_4_fu_256_p2 = $signed(tmp_9_cast_cast_fu_224_p3) + $signed(wd3_cast_fu_252_p1);
  assign tmp_5_fu_189_p1 = i_1_reg_140;
  assign tmp_6_fu_212_p1 = dlt_cast1_reg_294;
  assign tmp_6_fu_212_p2 = $signed(reg_162) * $signed(tmp_6_fu_212_p1);
  assign tmp_7_fu_267_p2 = bli_q0 << 32'd8;
  assign tmp_8_fu_279_p4 = { { tmp_2_fu_273_p2[31:8] } };
  assign tmp_9_cast_cast_fu_224_p3 = (tmp_9_fu_217_p3[0:0] === 1'b1)? 25'd33554304 : 25'd128;
  assign tmp_9_fu_217_p3 = tmp_6_reg_346[32'd31];
  assign tmp_fu_171_p0 = dlt;
  assign tmp_fu_171_p2 = (tmp_fu_171_p0 == 17'd0)? 1'b1 : 1'b0;
  assign tmp_s_fu_237_p2 = tmp_10_fu_232_p2 - bli_load_1_reg_351;
  assign wd3_cast_fu_252_p1 = $signed(tmp_11_fu_242_p4);
  assign temp132 = temp134 * temp135;
  assign temp135 = (working_key[24] == 1'b1)? dlt + dlti_q0 : bli_q0 + dlti_q0;
  assign temp134 = (working_key[25] == 1'b1)? dlti_q1 + dlt : dlti_q1 + bli_q0;
  assign temp136 = temp138 * temp139;
  assign temp139 = (working_key[27] == 1'b1)? dlti_q0 + bli_q0 : dlti_q0 + dlt;
  assign temp138 = (working_key[28] == 1'b1)? dlt + dlti_q1 : dlti_q1 + dlt;

endmodule

