
module viterbi_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  Obs_address0,
  Obs_ce0,
  Obs_q0,
  transMat_address0,
  transMat_ce0,
  transMat_q0,
  obsLik_address0,
  obsLik_ce0,
  obsLik_q0,
  v_address0,
  v_ce0,
  v_we0,
  v_d0,
  v_q0,
  ap_return,
  working_key,
);

  parameter ap_ST_fsm_state1 = 17'd1;
  parameter ap_ST_fsm_state2 = 17'd2;
  parameter ap_ST_fsm_state3 = 17'd4;
  parameter ap_ST_fsm_state4 = 17'd8;
  parameter ap_ST_fsm_state5 = 17'd16;
  parameter ap_ST_fsm_state6 = 17'd32;
  parameter ap_ST_fsm_state7 = 17'd64;
  parameter ap_ST_fsm_state8 = 17'd128;
  parameter ap_ST_fsm_state9 = 17'd256;
  parameter ap_ST_fsm_state10 = 17'd512;
  parameter ap_ST_fsm_state11 = 17'd1024;
  parameter ap_ST_fsm_state12 = 17'd2048;
  parameter ap_ST_fsm_state13 = 17'd4096;
  parameter ap_ST_fsm_state14 = 17'd8192;
  parameter ap_ST_fsm_state15 = 17'd16384;
  parameter ap_ST_fsm_state16 = 17'd32768;
  parameter ap_ST_fsm_state17 = 17'd65536;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [6:0] Obs_address0;
  input [2:0] working_key;
  output Obs_ce0;
  input [31:0] Obs_q0;
  output [11:0] transMat_address0;
  output transMat_ce0;
  input [31:0] transMat_q0;
  output [11:0] obsLik_address0;
  output obsLik_ce0;
  input [31:0] obsLik_q0;
  output [11:0] v_address0;
  output v_ce0;
  output v_we0;
  output [31:0] v_d0;
  input [31:0] v_q0;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg Obs_ce0;
  reg transMat_ce0;
  reg obsLik_ce0;
  reg [11:0] v_address0;
  reg v_ce0;
  reg v_we0;
  reg [31:0] v_d0;
  reg [16:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [31:0] reg_236;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state13;
  wire ap_CS_fsm_state16;
  wire [31:0] grp_fu_225_p2;
  reg [31:0] reg_243;
  wire ap_CS_fsm_state9;
  wire ap_CS_fsm_state12;
  wire [11:0] zext_ln42_fu_250_p1;
  reg [11:0] zext_ln42_reg_596;
  wire ap_CS_fsm_state2;
  wire [7:0] i_2_fu_260_p2;
  reg [7:0] i_2_reg_604;
  wire [0:0] icmp_ln42_fu_254_p2;
  reg [31:0] baseObs_reg_615;
  wire ap_CS_fsm_state3;
  wire [12:0] zext_ln47_1_fu_271_p1;
  reg [12:0] zext_ln47_1_reg_620;
  wire [5:0] j_fu_280_p2;
  reg [5:0] j_reg_628;
  wire ap_CS_fsm_state4;
  wire [4:0] trunc_ln46_fu_286_p1;
  reg [4:0] trunc_ln46_reg_633;
  wire [0:0] icmp_ln44_fu_274_p2;
  reg [11:0] v_addr_2_reg_638;
  wire [5:0] k_fu_314_p2;
  reg [5:0] k_reg_646;
  wire ap_CS_fsm_state5;
  wire [0:0] icmp_ln45_fu_308_p2;
  wire [31:0] add_ln46_2_fu_354_p2;
  reg [31:0] add_ln46_2_reg_656;
  reg [11:0] v_addr_3_reg_661;
  reg [31:0] transMat_load_reg_666;
  wire ap_CS_fsm_state8;
  reg [31:0] obsLik_load_reg_676;
  wire [0:0] icmp_ln47_2_fu_391_p2;
  reg [0:0] icmp_ln47_2_reg_681;
  wire [0:0] icmp_ln47_3_fu_397_p2;
  reg [0:0] icmp_ln47_3_reg_686;
  wire ap_CS_fsm_state15;
  wire [0:0] icmp_ln56_fu_455_p2;
  wire [31:0] finalState_1_fu_574_p3;
  wire ap_CS_fsm_state17;
  wire [31:0] maxProb_1_fu_582_p3;
  wire [5:0] i_fu_590_p2;
  reg [7:0] i_0_reg_156;
  reg [5:0] j_0_reg_167;
  reg [5:0] k_0_reg_178;
  wire ap_CS_fsm_state14;
  reg [5:0] i_1_reg_189;
  reg [31:0] finalState_0_reg_201;
  reg [31:0] maxProb_0_reg_213;
  wire [63:0] zext_ln43_fu_266_p1;
  wire [63:0] zext_ln46_fu_303_p1;
  wire [63:0] zext_ln46_1_fu_329_p1;
  wire [63:0] zext_ln47_fu_364_p1;
  wire signed [63:0] sext_ln46_fu_369_p1;
  wire [63:0] zext_ln57_fu_475_p1;
  wire [0:0] and_ln47_1_fu_449_p2;
  reg [31:0] grp_fu_225_p0;
  reg [31:0] grp_fu_225_p1;
  wire ap_CS_fsm_state7;
  wire ap_CS_fsm_state10;
  reg [31:0] grp_fu_229_p0;
  reg [31:0] grp_fu_229_p1;
  wire [11:0] shl_ln1_fu_290_p3;
  wire [11:0] add_ln46_fu_298_p2;
  wire [11:0] add_ln46_1_fu_320_p4;
  wire [4:0] trunc_ln46_1_fu_334_p1;
  wire [11:0] shl_ln46_1_fu_338_p3;
  wire [31:0] zext_ln46_3_fu_350_p1;
  wire [12:0] zext_ln46_2_fu_346_p1;
  wire [12:0] add_ln47_fu_359_p2;
  wire [31:0] bitcast_ln47_1_fu_373_p1;
  wire [7:0] tmp_8_fu_377_p4;
  wire [22:0] trunc_ln47_1_fu_387_p1;
  wire [31:0] bitcast_ln47_fu_403_p1;
  wire [7:0] tmp_7_fu_407_p4;
  wire [22:0] trunc_ln47_fu_417_p1;
  wire [0:0] icmp_ln47_1_fu_427_p2;
  wire [0:0] icmp_ln47_fu_421_p2;
  wire [0:0] or_ln47_fu_433_p2;
  wire [0:0] or_ln47_1_fu_439_p2;
  wire [0:0] and_ln47_fu_443_p2;
  wire [0:0] grp_fu_229_p2;
  wire [12:0] shl_ln_fu_461_p3;
  wire [12:0] add_ln57_fu_469_p2;
  wire [31:0] bitcast_ln57_fu_480_p1;
  wire [31:0] bitcast_ln57_1_fu_498_p1;
  wire [7:0] tmp_fu_484_p4;
  wire [22:0] trunc_ln57_fu_494_p1;
  wire [0:0] icmp_ln57_1_fu_522_p2;
  wire [0:0] icmp_ln57_fu_516_p2;
  wire [7:0] tmp_2_fu_502_p4;
  wire [22:0] trunc_ln57_1_fu_512_p1;
  wire [0:0] icmp_ln57_3_fu_540_p2;
  wire [0:0] icmp_ln57_2_fu_534_p2;
  wire [0:0] or_ln57_fu_528_p2;
  wire [0:0] or_ln57_1_fu_546_p2;
  wire [0:0] and_ln57_fu_552_p2;
  wire [5:0] finalState_fu_564_p2;
  wire [0:0] and_ln57_1_fu_558_p2;
  wire [31:0] zext_ln58_fu_570_p1;
  reg [16:0] ap_NS_fsm;

  initial begin
    #0 ap_CS_fsm = 17'd1;
  end


  viterbi_fmul_32nsbkb
  #(
    .ID(1),
    .NUM_STAGE(3),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .dout_WIDTH(32)
  )
  viterbi_fmul_32nsbkb_U1
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_225_p0),
    .din1(grp_fu_225_p1),
    .ce(1'b1),
    .dout(grp_fu_225_p2)
  );


  viterbi_fcmp_32nscud
  #(
    .ID(1),
    .NUM_STAGE(2),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .dout_WIDTH(1)
  )
  viterbi_fcmp_32nscud_U2
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_229_p0),
    .din1(grp_fu_229_p1),
    .ce(1'b1),
    .opcode(5'd2),
    .dout(grp_fu_229_p2)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
      finalState_0_reg_201 <= 32'd0;
    end else if(1'b1 == ap_CS_fsm_state17) begin
      finalState_0_reg_201 <= finalState_1_fu_574_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd1)) begin
      i_0_reg_156 <= i_2_reg_604;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      i_0_reg_156 <= 8'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
      i_1_reg_189 <= 6'd1;
    end else if(1'b1 == ap_CS_fsm_state17) begin
      i_1_reg_189 <= i_fu_590_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd1)) begin
      j_0_reg_167 <= j_reg_628;
    end else if(1'b1 == ap_CS_fsm_state3) begin
      j_0_reg_167 <= 6'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state14) begin
      k_0_reg_178 <= k_reg_646;
    end else if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd0)) begin
      k_0_reg_178 <= 6'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
      maxProb_0_reg_213 <= 32'd0;
    end else if(1'b1 == ap_CS_fsm_state17) begin
      maxProb_0_reg_213 <= maxProb_1_fu_582_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd0)) begin
      add_ln46_2_reg_656 <= add_ln46_2_fu_354_p2;
      v_addr_3_reg_661 <= zext_ln47_fu_364_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      baseObs_reg_615 <= Obs_q0;
      zext_ln47_1_reg_620[7:0] <= zext_ln47_1_fu_271_p1[7:0];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      i_2_reg_604 <= i_2_fu_260_p2;
      zext_ln42_reg_596[7:0] <= zext_ln42_fu_250_p1[7:0];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
      icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      j_reg_628 <= j_fu_280_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      k_reg_646 <= k_fu_314_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      obsLik_load_reg_676 <= obsLik_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state6)) begin
      reg_236 <= v_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9)) begin
      reg_243 <= grp_fu_225_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      transMat_load_reg_666 <= transMat_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd0)) begin
      trunc_ln46_reg_633 <= trunc_ln46_fu_286_p1;
      v_addr_2_reg_638 <= zext_ln46_fu_303_p1;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      Obs_ce0 = 1'b1;
    end else begin
      Obs_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == 1'd1)) begin
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
    if((1'b1 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == 1'd1)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      grp_fu_225_p0 = reg_243;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      grp_fu_225_p0 = reg_236;
    end else begin
      grp_fu_225_p0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      grp_fu_225_p1 = obsLik_load_reg_676;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      grp_fu_225_p1 = transMat_load_reg_666;
    end else begin
      grp_fu_225_p1 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      grp_fu_229_p0 = v_q0;
    end else if(1'b1 == ap_CS_fsm_state13) begin
      grp_fu_229_p0 = reg_243;
    end else begin
      grp_fu_229_p0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      grp_fu_229_p1 = maxProb_0_reg_213;
    end else if(1'b1 == ap_CS_fsm_state13) begin
      grp_fu_229_p1 = v_q0;
    end else begin
      grp_fu_229_p1 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      obsLik_ce0 = 1'b1;
    end else begin
      obsLik_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      transMat_ce0 = 1'b1;
    end else begin
      transMat_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state15) begin
      v_address0 = zext_ln57_fu_475_p1;
    end else if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state14)) begin
      v_address0 = v_addr_3_reg_661;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      v_address0 = v_addr_2_reg_638;
    end else if(1'b1 == ap_CS_fsm_state1) begin
      v_address0 = 64'd0;
    end else begin
      v_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state5) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      v_ce0 = 1'b1;
    end else begin
      v_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state14) begin
      v_d0 = reg_243;
    end else if(1'b1 == ap_CS_fsm_state1) begin
      v_d0 = 32'd1065353216;
    end else begin
      v_d0 = 'bx;
    end
  end


  always @(*) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) | (1'b1 == ap_CS_fsm_state14) & (1'd1 == and_ln47_1_fu_449_p2)) begin
      v_we0 = 1'b1;
    end else begin
      v_we0 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state15;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd1)) begin
          if(working_key[0] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state6;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd1)) begin
          if(working_key[1] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state4;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state8;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state6: begin
        begin
          if(working_key[2] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state7;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state12;
          end
        end
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
        ap_NS_fsm = ap_ST_fsm_state11;
      end
      ap_ST_fsm_state11: begin
        ap_NS_fsm = ap_ST_fsm_state12;
      end
      ap_ST_fsm_state12: begin
        ap_NS_fsm = ap_ST_fsm_state13;
      end
      ap_ST_fsm_state13: begin
        ap_NS_fsm = ap_ST_fsm_state14;
      end
      ap_ST_fsm_state14: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state15: begin
        if((1'b1 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state16;
        end
      end
      ap_ST_fsm_state16: begin
        ap_NS_fsm = ap_ST_fsm_state17;
      end
      ap_ST_fsm_state17: begin
        ap_NS_fsm = ap_ST_fsm_state15;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign Obs_address0 = zext_ln43_fu_266_p1;
  assign add_ln46_1_fu_320_p4 = { { { trunc_ln46_reg_633 }, { 1'd0 } }, { k_0_reg_178 } };
  assign add_ln46_2_fu_354_p2 = baseObs_reg_615 + zext_ln46_3_fu_350_p1;
  assign add_ln46_fu_298_p2 = shl_ln1_fu_290_p3 + zext_ln42_reg_596;
  assign add_ln47_fu_359_p2 = zext_ln47_1_reg_620 + zext_ln46_2_fu_346_p1;
  assign add_ln57_fu_469_p2 = $signed(13'd8191) + $signed(shl_ln_fu_461_p3);
  assign and_ln47_1_fu_449_p2 = grp_fu_229_p2 & and_ln47_fu_443_p2;
  assign and_ln47_fu_443_p2 = or_ln47_fu_433_p2 & or_ln47_1_fu_439_p2;
  assign and_ln57_1_fu_558_p2 = grp_fu_229_p2 & and_ln57_fu_552_p2;
  assign and_ln57_fu_552_p2 = or_ln57_fu_528_p2 & or_ln57_1_fu_546_p2;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
  assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];
  assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];
  assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign ap_return = finalState_0_reg_201;
  assign bitcast_ln47_1_fu_373_p1 = v_q0;
  assign bitcast_ln47_fu_403_p1 = reg_243;
  assign bitcast_ln57_1_fu_498_p1 = maxProb_0_reg_213;
  assign bitcast_ln57_fu_480_p1 = reg_236;
  assign finalState_1_fu_574_p3 = (and_ln57_1_fu_558_p2[0:0] === 1'b1)? zext_ln58_fu_570_p1 : finalState_0_reg_201;
  assign finalState_fu_564_p2 = $signed(6'd63) + $signed(i_1_reg_189);
  assign i_2_fu_260_p2 = i_0_reg_156 + 8'd1;
  assign i_fu_590_p2 = 6'd1 + i_1_reg_189;
  assign icmp_ln42_fu_254_p2 = (i_0_reg_156 == 8'd128)? 1'b1 : 1'b0;
  assign icmp_ln44_fu_274_p2 = (j_0_reg_167 == 6'd32)? 1'b1 : 1'b0;
  assign icmp_ln45_fu_308_p2 = (k_0_reg_178 == 6'd32)? 1'b1 : 1'b0;
  assign icmp_ln47_1_fu_427_p2 = (trunc_ln47_fu_417_p1 == 23'd0)? 1'b1 : 1'b0;
  assign icmp_ln47_2_fu_391_p2 = (tmp_8_fu_377_p4 != 8'd255)? 1'b1 : 1'b0;
  assign icmp_ln47_3_fu_397_p2 = (trunc_ln47_1_fu_387_p1 == 23'd0)? 1'b1 : 1'b0;
  assign icmp_ln47_fu_421_p2 = (tmp_7_fu_407_p4 != 8'd255)? 1'b1 : 1'b0;
  assign icmp_ln56_fu_455_p2 = (i_1_reg_189 == 6'd33)? 1'b1 : 1'b0;
  assign icmp_ln57_1_fu_522_p2 = (trunc_ln57_fu_494_p1 == 23'd0)? 1'b1 : 1'b0;
  assign icmp_ln57_2_fu_534_p2 = (tmp_2_fu_502_p4 != 8'd255)? 1'b1 : 1'b0;
  assign icmp_ln57_3_fu_540_p2 = (trunc_ln57_1_fu_512_p1 == 23'd0)? 1'b1 : 1'b0;
  assign icmp_ln57_fu_516_p2 = (tmp_fu_484_p4 != 8'd255)? 1'b1 : 1'b0;
  assign j_fu_280_p2 = j_0_reg_167 + 6'd1;
  assign k_fu_314_p2 = k_0_reg_178 + 6'd1;
  assign maxProb_1_fu_582_p3 = (and_ln57_1_fu_558_p2[0:0] === 1'b1)? reg_236 : maxProb_0_reg_213;
  assign obsLik_address0 = sext_ln46_fu_369_p1;
  assign or_ln47_1_fu_439_p2 = icmp_ln47_3_reg_686 | icmp_ln47_2_reg_681;
  assign or_ln47_fu_433_p2 = icmp_ln47_fu_421_p2 | icmp_ln47_1_fu_427_p2;
  assign or_ln57_1_fu_546_p2 = icmp_ln57_3_fu_540_p2 | icmp_ln57_2_fu_534_p2;
  assign or_ln57_fu_528_p2 = icmp_ln57_fu_516_p2 | icmp_ln57_1_fu_522_p2;
  assign sext_ln46_fu_369_p1 = $signed(add_ln46_2_reg_656);
  assign shl_ln1_fu_290_p3 = { { trunc_ln46_fu_286_p1 }, { 7'd0 } };
  assign shl_ln46_1_fu_338_p3 = { { trunc_ln46_1_fu_334_p1 }, { 7'd0 } };
  assign shl_ln_fu_461_p3 = { { i_1_reg_189 }, { 7'd0 } };
  assign tmp_2_fu_502_p4 = { { bitcast_ln57_1_fu_498_p1[30:23] } };
  assign tmp_7_fu_407_p4 = { { bitcast_ln47_fu_403_p1[30:23] } };
  assign tmp_8_fu_377_p4 = { { bitcast_ln47_1_fu_373_p1[30:23] } };
  assign tmp_fu_484_p4 = { { bitcast_ln57_fu_480_p1[30:23] } };
  assign transMat_address0 = zext_ln46_1_fu_329_p1;
  assign trunc_ln46_1_fu_334_p1 = k_0_reg_178[4:0];
  assign trunc_ln46_fu_286_p1 = j_0_reg_167[4:0];
  assign trunc_ln47_1_fu_387_p1 = bitcast_ln47_1_fu_373_p1[22:0];
  assign trunc_ln47_fu_417_p1 = bitcast_ln47_fu_403_p1[22:0];
  assign trunc_ln57_1_fu_512_p1 = bitcast_ln57_1_fu_498_p1[22:0];
  assign trunc_ln57_fu_494_p1 = bitcast_ln57_fu_480_p1[22:0];
  assign zext_ln42_fu_250_p1 = i_0_reg_156;
  assign zext_ln43_fu_266_p1 = i_0_reg_156;
  assign zext_ln46_1_fu_329_p1 = add_ln46_1_fu_320_p4;
  assign zext_ln46_2_fu_346_p1 = shl_ln46_1_fu_338_p3;
  assign zext_ln46_3_fu_350_p1 = shl_ln46_1_fu_338_p3;
  assign zext_ln46_fu_303_p1 = add_ln46_fu_298_p2;
  assign zext_ln47_1_fu_271_p1 = i_2_reg_604;
  assign zext_ln47_fu_364_p1 = add_ln47_fu_359_p2;
  assign zext_ln57_fu_475_p1 = add_ln57_fu_469_p2;
  assign zext_ln58_fu_570_p1 = finalState_fu_564_p2;

  always @(posedge ap_clk) begin
    zext_ln42_reg_596[11:8] <= 4'b0000;
    zext_ln47_1_reg_620[12:8] <= 5'b00000;
  end


endmodule

