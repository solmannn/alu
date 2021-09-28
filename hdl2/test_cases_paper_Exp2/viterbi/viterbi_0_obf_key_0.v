
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
  ap_return
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
  wire [31:0] temp100;
  wire [31:0] temp100;
  wire [31:0] temp101;
  wire [31:0] temp102;
  wire [31:0] temp103;
  wire [31:0] temp103;
  wire [31:0] temp104;
  wire [31:0] temp105;
  wire [31:0] temp106;
  wire [31:0] temp106;
  wire [31:0] temp107;
  wire [31:0] temp108;
  wire [31:0] temp109;
  wire [31:0] temp109;
  wire [31:0] temp110;
  wire [31:0] temp111;
  wire [31:0] temp112;
  wire [31:0] temp112;
  wire [31:0] temp113;
  wire [31:0] temp114;
  wire [31:0] temp115;
  wire [31:0] temp115;
  wire [31:0] temp116;
  wire [31:0] temp117;
  wire [31:0] temp118;
  wire [31:0] temp118;
  wire [31:0] temp119;
  wire [31:0] temp120;
  wire [31:0] temp121;
  wire [31:0] temp121;
  wire [31:0] temp122;
  wire [31:0] temp123;
  wire [31:0] temp124;
  wire [31:0] temp124;
  wire [31:0] temp125;
  wire [31:0] temp126;
  wire [31:0] temp127;
  wire [31:0] temp127;
  wire [31:0] temp128;
  wire [31:0] temp129;
  wire [31:0] temp130;
  wire [31:0] temp130;
  wire [31:0] temp131;
  wire [31:0] temp132;
  wire [31:0] temp133;
  wire [31:0] temp133;
  wire [31:0] temp134;
  wire [31:0] temp135;
  wire [31:0] temp136;
  wire [31:0] temp137;
  wire [31:0] temp138;
  wire [31:0] temp139;
  wire [31:0] temp140;
  wire [31:0] temp141;
  wire [31:0] temp142;
  wire [31:0] temp143;
  wire [31:0] temp144;
  wire [31:0] temp145;
  wire [31:0] temp146;
  wire [31:0] temp147;
  wire [31:0] temp148;
  wire [31:0] temp149;
  wire [31:0] temp150;
  wire [31:0] temp151;
  wire [31:0] temp152;
  wire [31:0] temp153;
  wire [31:0] temp154;
  wire [31:0] temp155;
  wire [31:0] temp156;
  wire [31:0] temp157;
  wire [31:0] temp158;
  wire [31:0] temp159;
  wire [31:0] temp160;
  wire [31:0] temp161;
  wire [31:0] temp162;
  wire [31:0] temp163;
  wire [31:0] temp164;
  wire [31:0] temp165;
  wire [31:0] temp166;
  wire [31:0] temp167;
  wire [31:0] temp168;
  wire [31:0] temp169;
  wire [31:0] temp170;
  wire [31:0] temp171;
  wire [31:0] temp172;
  wire [31:0] temp173;
  wire [31:0] temp174;
  wire [31:0] temp175;
  wire [31:0] temp176;
  wire [31:0] temp177;
  wire [31:0] temp178;
  wire [31:0] temp179;
  wire [31:0] temp180;
  wire [31:0] temp181;
  wire [31:0] temp182;
  wire [31:0] temp183;
  wire [31:0] temp184;
  wire [31:0] temp185;
  wire [31:0] temp186;
  wire [31:0] temp187;
  wire [31:0] temp188;
  wire [31:0] temp189;
  wire [31:0] temp190;
  wire [31:0] temp191;
  wire [31:0] temp192;
  wire [31:0] temp193;
  wire [31:0] temp194;
  wire [31:0] temp195;
  wire [31:0] temp196;
  wire [31:0] temp197;
  wire [31:0] temp198;
  wire [31:0] temp199;
  wire [31:0] temp200;
  wire [31:0] temp201;
  wire [31:0] temp202;
  wire [31:0] temp203;
  wire [31:0] temp204;
  wire [31:0] temp205;
  wire [31:0] temp206;
  wire [31:0] temp207;
  wire [31:0] temp208;
  wire [31:0] temp209;
  wire [31:0] temp210;
  wire [31:0] temp211;
  wire [31:0] temp212;
  wire [31:0] temp213;
  wire [31:0] temp214;
  wire [31:0] temp215;
  wire [31:0] temp216;
  wire [31:0] temp217;
  wire [31:0] temp218;
  wire [31:0] temp219;
  wire [31:0] temp220;
  wire [31:0] temp221;
  wire [31:0] temp222;
  wire [31:0] temp223;
  wire [31:0] temp224;
  wire [31:0] temp225;
  wire [31:0] temp226;
  wire [31:0] temp227;
  wire [31:0] temp228;
  wire [31:0] temp229;
  wire [31:0] temp230;
  wire [31:0] temp231;
  wire [31:0] temp232;
  wire [31:0] temp233;
  wire [31:0] temp234;
  wire [31:0] temp235;
  wire [31:0] temp236;
  wire [31:0] temp237;
  wire [31:0] temp238;
  wire [31:0] temp239;
  wire [31:0] temp240;
  wire [31:0] temp241;
  wire [31:0] temp242;
  wire [31:0] temp243;
  wire [31:0] temp244;
  wire [31:0] temp245;
  wire [31:0] temp246;
  wire [31:0] temp247;
  wire [31:0] temp248;
  wire [31:0] temp249;
  wire [31:0] temp250;
  wire [31:0] temp251;
  wire [31:0] temp252;
  wire [31:0] temp253;
  wire [31:0] temp254;
  wire [31:0] temp255;
  assign temp100 = temp100 * obsLik_q0;
  assign temp100 = temp101 * obsLik_q0;
  assign temp101 = temp102 * transMat_q0;
  assign temp102 = transMat_q0 * obsLik_q0;
  assign temp103 = temp103 * Obs_q0;
  assign temp103 = temp104 * Obs_q0;
  assign temp104 = temp105 * v_q0;
  assign temp105 = obsLik_q0 * Obs_q0;
  assign temp106 = temp106 * v_q0;
  assign temp106 = temp107 * v_q0;
  assign temp107 = temp108 * obsLik_q0;
  assign temp108 = obsLik_q0 * transMat_q0;
  assign temp109 = temp109 * Obs_q0;
  assign temp109 = temp110 * Obs_q0;
  assign temp110 = temp111 * transMat_q0;
  assign temp111 = transMat_q0 * Obs_q0;
  assign temp112 = temp112 * obsLik_q0;
  assign temp112 = temp113 * Obs_q0;
  assign temp113 = temp114 * Obs_q0;
  assign temp114 = v_q0 * transMat_q0;
  assign temp115 = temp115 * transMat_q0;
  assign temp115 = temp116 * Obs_q0;
  assign temp116 = temp117 * obsLik_q0;
  assign temp117 = Obs_q0 * obsLik_q0;
  assign temp118 = temp118 * v_q0;
  assign temp118 = temp119 * Obs_q0;
  assign temp119 = temp120 * v_q0;
  assign temp120 = transMat_q0 * Obs_q0;
  assign temp121 = temp121 * Obs_q0;
  assign temp121 = temp122 * transMat_q0;
  assign temp122 = temp123 * obsLik_q0;
  assign temp123 = Obs_q0 * transMat_q0;
  assign temp124 = temp124 * obsLik_q0;
  assign temp124 = temp125 * obsLik_q0;
  assign temp125 = temp126 * transMat_q0;
  assign temp126 = transMat_q0 * obsLik_q0;
  assign temp127 = temp127 * transMat_q0;
  assign temp127 = temp128 * transMat_q0;
  assign temp128 = temp129 * Obs_q0;
  assign temp129 = Obs_q0 * v_q0;
  assign temp130 = temp130 * obsLik_q0;
  assign temp130 = temp131 * v_q0;
  assign temp131 = temp132 * v_q0;
  assign temp132 = Obs_q0 * v_q0;
  assign temp133 = temp133 * v_q0;
  assign temp133 = temp134 * v_q0;
  assign temp134 = temp135 * obsLik_q0;
  assign temp135 = obsLik_q0 * transMat_q0;

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
      if(working_key[18] == 1'b1) begin
        finalState_0_reg_201 <= 32'd0;
      end else begin
        maxProb_0_reg_213 <= maxProb_1_fu_582_p3;
      end
    end else if(1'b1 == ap_CS_fsm_state17) begin
      if(working_key[19] == 1'b1) begin
        grp_fu_225_p1 <= temp136;
      end else begin
        finalState_0_reg_201 <= finalState_1_fu_574_p3;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd1)) begin
      if(working_key[20] == 1'b1) begin
        i_0_reg_156 <= i_2_reg_604;
      end else begin
        transMat_load_reg_666 <= transMat_q0;
      end
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      if(working_key[21] == 1'b1) begin
        grp_fu_229_p1 = v_q0;
      end else begin
        i_0_reg_156 <= 8'd0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
      if(working_key[22] == 1'b1) begin
        i_1_reg_189 <= 6'd1;
      end else begin
        v_address0 = zext_ln57_fu_475_p1;
      end
    end else if(1'b1 == ap_CS_fsm_state17) begin
      if(working_key[23] == 1'b1) begin
        icmp_ln47_3_reg_686 <= temp140;
      end else begin
        i_1_reg_189 <= i_fu_590_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd1)) begin
      if(working_key[24] == 1'b1) begin
        j_0_reg_167 <= j_reg_628;
      end else begin
        baseObs_reg_615 <= temp144;
      end
    end else if(1'b1 == ap_CS_fsm_state3) begin
      if(working_key[25] == 1'b1) begin
        j_0_reg_167 <= 6'd0;
      end else begin
        grp_fu_229_p1 = maxProb_0_reg_213;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state14) begin
      if(working_key[26] == 1'b1) begin
        v_d0 <= temp148;
      end else begin
        k_0_reg_178 <= k_reg_646;
      end
    end else if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd0)) begin
      if(working_key[27] == 1'b1) begin
        j_0_reg_167 <= temp152;
      end else begin
        k_0_reg_178 <= 6'd0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
      if(working_key[28] == 1'b1) begin
        maxProb_0_reg_213 <= 32'd0;
      end else begin
        obsLik_load_reg_676 <= temp156;
      end
    end else if(1'b1 == ap_CS_fsm_state17) begin
      if(working_key[29] == 1'b1) begin
        v_addr_2_reg_638 <= temp160;
      end else begin
        maxProb_0_reg_213 <= maxProb_1_fu_582_p3;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd0)) begin
      if(working_key[30] == 1'b1) begin
        add_ln46_2_reg_656 <= add_ln46_2_fu_354_p2;
        v_addr_3_reg_661 <= zext_ln47_fu_364_p1;
      end else begin
        zext_ln42_reg_596 <= temp164;
        j_0_reg_167 <= temp168;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      if(working_key[31] == 1'b1) begin
        baseObs_reg_615 <= Obs_q0;
        zext_ln47_1_reg_620[7:0] <= zext_ln47_1_fu_271_p1[7:0];
      end else begin
        reg_236 <= temp172;
        zext_ln42_reg_596 <= temp176;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      if(working_key[32] == 1'b1) begin
        i_2_reg_604 <= i_2_fu_260_p2;
        zext_ln42_reg_596[7:0] <= zext_ln42_fu_250_p1[7:0];
      end else begin
        grp_fu_229_p0 = v_q0;
        j_reg_628 <= temp180;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      if(working_key[33] == 1'b1) begin
        grp_fu_229_p1 = maxProb_0_reg_213;
        v_address0 = v_addr_3_reg_661;
      end else begin
        icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
        icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      if(working_key[34] == 1'b1) begin
        j_reg_628 <= j_fu_280_p2;
      end else begin
        grp_fu_229_p1 = v_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[35] == 1'b1) begin
        i_0_reg_156 <= temp184;
      end else begin
        k_reg_646 <= k_fu_314_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      if(working_key[36] == 1'b1) begin
        obsLik_load_reg_676 <= obsLik_q0;
      end else begin
        icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state6)) begin
      if(working_key[37] == 1'b1) begin
        reg_243 <= temp188;
      end else begin
        reg_236 <= v_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9)) begin
      if(working_key[38] == 1'b1) begin
        reg_243 <= grp_fu_225_p2;
      end else begin
        j_0_reg_167 <= temp192;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      if(working_key[39] == 1'b1) begin
        j_0_reg_167 <= j_reg_628;
      end else begin
        transMat_load_reg_666 <= transMat_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd0)) begin
      if(working_key[40] == 1'b1) begin
        trunc_ln46_reg_633 <= trunc_ln46_fu_286_p1;
        v_addr_2_reg_638 <= zext_ln46_fu_303_p1;
      end else begin
        i_2_reg_604 <= temp196;
        finalState_0_reg_201 <= finalState_1_fu_574_p3;
      end
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
      if(working_key[41] == 1'b1) begin
        grp_fu_225_p0 = reg_243;
      end else begin
        grp_fu_225_p1 = transMat_load_reg_666;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      if(working_key[42] == 1'b1) begin
        i_0_reg_156 <= i_2_reg_604;
      end else begin
        grp_fu_225_p0 = reg_236;
      end
    end else begin
      grp_fu_225_p0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      if(working_key[43] == 1'b1) begin
        grp_fu_225_p1 = obsLik_load_reg_676;
      end else begin
        finalState_0_reg_201 <= finalState_1_fu_574_p3;
      end
    end else if(1'b1 == ap_CS_fsm_state7) begin
      if(working_key[44] == 1'b1) begin
        icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
      end else begin
        grp_fu_225_p1 = transMat_load_reg_666;
      end
    end else begin
      grp_fu_225_p1 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      if(working_key[45] == 1'b1) begin
        grp_fu_229_p0 = v_q0;
      end else begin
        transMat_load_reg_666 <= temp200;
      end
    end else if(1'b1 == ap_CS_fsm_state13) begin
      if(working_key[46] == 1'b1) begin
        trunc_ln46_reg_633 <= temp204;
      end else begin
        grp_fu_229_p0 = reg_243;
      end
    end else begin
      grp_fu_229_p0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state16) begin
      if(working_key[47] == 1'b1) begin
        add_ln46_2_reg_656 <= temp208;
      end else begin
        grp_fu_229_p1 = maxProb_0_reg_213;
      end
    end else if(1'b1 == ap_CS_fsm_state13) begin
      if(working_key[48] == 1'b1) begin
        grp_fu_229_p1 = v_q0;
      end else begin
        obsLik_load_reg_676 <= temp212;
      end
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
      if(working_key[49] == 1'b1) begin
        j_0_reg_167 <= temp216;
      end else begin
        v_address0 = zext_ln57_fu_475_p1;
      end
    end else if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state14)) begin
      if(working_key[50] == 1'b1) begin
        icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
      end else begin
        v_address0 = v_addr_3_reg_661;
      end
    end else if(1'b1 == ap_CS_fsm_state5) begin
      if(working_key[51] == 1'b1) begin
        v_address0 = v_addr_2_reg_638;
      end else begin
        grp_fu_225_p1 <= temp220;
      end
    end else if(1'b1 == ap_CS_fsm_state1) begin
      if(working_key[52] == 1'b1) begin
        grp_fu_225_p1 = transMat_load_reg_666;
      end else begin
        v_address0 = 64'd0;
      end
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
      if(working_key[53] == 1'b1) begin
        v_d0 = reg_243;
      end else begin
        j_0_reg_167 <= j_reg_628;
      end
    end else if(1'b1 == ap_CS_fsm_state1) begin
      if(working_key[54] == 1'b1) begin
        v_address0 = v_addr_3_reg_661;
      end else begin
        v_d0 = 32'd1065353216;
      end
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
          if(working_key[0] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state18;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((1'b1 == ap_CS_fsm_state2) & (icmp_ln42_fu_254_p2 == 1'd1)) begin
          if(working_key[2] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state19;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state15;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        if(working_key[4] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state20;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        if((1'b1 == ap_CS_fsm_state4) & (icmp_ln44_fu_274_p2 == 1'd1)) begin
          if(working_key[6] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state21;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if((1'b1 == ap_CS_fsm_state5) & (icmp_ln45_fu_308_p2 == 1'd1)) begin
          if(working_key[8] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state22;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state4;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state6: begin
        if(working_key[10] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state23;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end
      end
      ap_ST_fsm_state7: begin
        if(working_key[12] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state24;
        end
      end
      ap_ST_fsm_state8: begin
        if(working_key[14] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state25;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state9;
        end
      end
      ap_ST_fsm_state9: begin
        if(working_key[16] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state10;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state26;
        end
      end
      ap_ST_fsm_state10: begin
        if(working_key[64] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state19;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end
      end
      ap_ST_fsm_state11: begin
        if(working_key[65] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state17;
        end
      end
      ap_ST_fsm_state12: begin
        if(working_key[66] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state23;
        end
      end
      ap_ST_fsm_state13: begin
        if(working_key[67] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state18;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state14;
        end
      end
      ap_ST_fsm_state14: begin
        if(working_key[68] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state18;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state15: begin
        if((1'b1 == ap_CS_fsm_state15) & (icmp_ln56_fu_455_p2 == 1'd1)) if(working_key[69] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state14;
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
      ap_ST_fsm_state18: begin
        if(working_key[1] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state24;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state21;
        end
      end
      ap_ST_fsm_state19: begin
        if(working_key[3] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state15;
        end
      end
      ap_ST_fsm_state20: begin
        if(working_key[5] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state26;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state17;
        end
      end
      ap_ST_fsm_state21: begin
        if(working_key[7] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end
      end
      ap_ST_fsm_state22: begin
        if(working_key[9] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state15;
        end
      end
      ap_ST_fsm_state23: begin
        if(working_key[11] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state14;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state26;
        end
      end
      ap_ST_fsm_state24: begin
        if(working_key[13] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state9;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end
      end
      ap_ST_fsm_state25: begin
        if(working_key[15] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state16;
        end
      end
      ap_ST_fsm_state26: begin
        if(working_key[17] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state15;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end
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


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state18) begin
      if(working_key[55] == 1'b1) begin
        v_addr_3_reg_661 <= zext_ln47_fu_364_p1;
      end else begin
        reg_236 <= temp224;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state19) begin
      if(working_key[56] == 1'b1) begin
        grp_fu_225_p1 = transMat_load_reg_666;
      end else begin
        k_reg_646 <= temp100;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state20) begin
      if(working_key[57] == 1'b1) begin
        icmp_ln47_2_reg_681 <= temp103;
        v_addr_2_reg_638 <= zext_ln46_fu_303_p1;
        grp_fu_225_p1 = obsLik_load_reg_676;
        v_d0 = reg_243;
      end else begin
        grp_fu_229_p1 = maxProb_0_reg_213;
        v_address0 = zext_ln57_fu_475_p1;
        grp_fu_229_p1 = maxProb_0_reg_213;
        transMat_load_reg_666 <= transMat_q0;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state21) begin
      if(working_key[58] == 1'b1) begin
        zext_ln42_reg_596 <= temp106;
        zext_ln42_reg_596 <= temp109;
        trunc_ln46_reg_633 <= temp112;
        add_ln46_2_reg_656 <= add_ln46_2_fu_354_p2;
      end else begin
        i_1_reg_189 <= i_fu_590_p2;
        grp_fu_229_p1 = maxProb_0_reg_213;
        baseObs_reg_615 <= Obs_q0;
        finalState_0_reg_201 <= finalState_1_fu_574_p3;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state22) begin
      if(working_key[59] == 1'b1) begin
        i_0_reg_156 <= temp228;
        icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
        transMat_load_reg_666 <= transMat_q0;
        v_addr_2_reg_638 <= temp232;
      end else begin
        obsLik_load_reg_676 <= temp115;
        grp_fu_229_p0 <= temp118;
        icmp_ln47_2_reg_681 <= icmp_ln47_2_fu_391_p2;
        transMat_load_reg_666 <= temp121;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state23) begin
      if(working_key[60] == 1'b1) begin
        v_address0 = zext_ln57_fu_475_p1;
        icmp_ln47_3_reg_686 <= icmp_ln47_3_fu_397_p2;
      end else begin
        reg_236 <= v_q0;
        trunc_ln46_reg_633 <= trunc_ln46_fu_286_p1;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state24) begin
      if(working_key[61] == 1'b1) begin
        reg_243 <= temp124;
      end else begin
        v_address0 = v_addr_3_reg_661;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state25) begin
      if(working_key[62] == 1'b1) begin
        i_2_reg_604 <= temp236;
        grp_fu_229_p0 = v_q0;
        v_d0 <= temp240;
      end else begin
        j_reg_628 <= j_fu_280_p2;
        i_2_reg_604 <= i_2_fu_260_p2;
        grp_fu_225_p1 <= temp127;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if(1'd1 == ap_CS_fsm_state26) begin
      if(working_key[63] == 1'b1) begin
        i_1_reg_189 <= i_fu_590_p2;
        j_reg_628 <= temp130;
        grp_fu_229_p0 <= temp133;
      end else begin
        grp_fu_225_p1 <= temp244;
        v_d0 <= temp248;
        transMat_load_reg_666 <= temp252;
      end
    end 
  end

  assign temp136 = temp137 * Obs_q0;
  assign temp137 = temp138 * v_q0;
  assign temp138 = temp139 * obsLik_q0;
  assign temp139 = transMat_q0 * Obs_q0;
  assign temp140 = temp141 * Obs_q0;
  assign temp141 = temp142 * Obs_q0;
  assign temp142 = temp143 * transMat_q0;
  assign temp143 = obsLik_q0 * obsLik_q0;
  assign temp144 = temp145 * transMat_q0;
  assign temp145 = temp146 * v_q0;
  assign temp146 = temp147 * v_q0;
  assign temp147 = v_q0 * Obs_q0;
  assign temp148 = temp149 * obsLik_q0;
  assign temp149 = temp150 * obsLik_q0;
  assign temp150 = temp151 * Obs_q0;
  assign temp151 = transMat_q0 * transMat_q0;
  assign temp152 = temp153 * Obs_q0;
  assign temp153 = temp154 * Obs_q0;
  assign temp154 = temp155 * transMat_q0;
  assign temp155 = Obs_q0 * Obs_q0;
  assign temp156 = temp157 * v_q0;
  assign temp157 = temp158 * obsLik_q0;
  assign temp158 = temp159 * obsLik_q0;
  assign temp159 = Obs_q0 * transMat_q0;
  assign temp160 = temp161 * v_q0;
  assign temp161 = temp162 * Obs_q0;
  assign temp162 = temp163 * v_q0;
  assign temp163 = transMat_q0 * v_q0;
  assign temp164 = temp165 * obsLik_q0;
  assign temp165 = temp166 * transMat_q0;
  assign temp166 = temp167 * transMat_q0;
  assign temp167 = transMat_q0 * obsLik_q0;
  assign temp168 = temp169 * obsLik_q0;
  assign temp169 = temp170 * obsLik_q0;
  assign temp170 = temp171 * transMat_q0;
  assign temp171 = transMat_q0 * v_q0;
  assign temp172 = temp173 * obsLik_q0;
  assign temp173 = temp174 * transMat_q0;
  assign temp174 = temp175 * Obs_q0;
  assign temp175 = v_q0 * transMat_q0;
  assign temp176 = temp177 * obsLik_q0;
  assign temp177 = temp178 * obsLik_q0;
  assign temp178 = temp179 * Obs_q0;
  assign temp179 = transMat_q0 * transMat_q0;
  assign temp180 = temp181 * obsLik_q0;
  assign temp181 = temp182 * Obs_q0;
  assign temp182 = temp183 * obsLik_q0;
  assign temp183 = transMat_q0 * transMat_q0;
  assign temp184 = temp185 * v_q0;
  assign temp185 = temp186 * obsLik_q0;
  assign temp186 = temp187 * transMat_q0;
  assign temp187 = Obs_q0 * obsLik_q0;
  assign temp188 = temp189 * obsLik_q0;
  assign temp189 = temp190 * obsLik_q0;
  assign temp190 = temp191 * v_q0;
  assign temp191 = Obs_q0 * transMat_q0;
  assign temp192 = temp193 * transMat_q0;
  assign temp193 = temp194 * obsLik_q0;
  assign temp194 = temp195 * transMat_q0;
  assign temp195 = v_q0 * obsLik_q0;
  assign temp196 = temp197 * transMat_q0;
  assign temp197 = temp198 * v_q0;
  assign temp198 = temp199 * v_q0;
  assign temp199 = obsLik_q0 * obsLik_q0;
  assign temp200 = temp201 * Obs_q0;
  assign temp201 = temp202 * v_q0;
  assign temp202 = temp203 * v_q0;
  assign temp203 = v_q0 * v_q0;
  assign temp204 = temp205 * v_q0;
  assign temp205 = temp206 * v_q0;
  assign temp206 = temp207 * v_q0;
  assign temp207 = obsLik_q0 * v_q0;
  assign temp208 = temp209 * Obs_q0;
  assign temp209 = temp210 * Obs_q0;
  assign temp210 = temp211 * Obs_q0;
  assign temp211 = v_q0 * transMat_q0;
  assign temp212 = temp213 * Obs_q0;
  assign temp213 = temp214 * obsLik_q0;
  assign temp214 = temp215 * v_q0;
  assign temp215 = obsLik_q0 * transMat_q0;
  assign temp216 = temp217 * obsLik_q0;
  assign temp217 = temp218 * v_q0;
  assign temp218 = temp219 * transMat_q0;
  assign temp219 = transMat_q0 * v_q0;
  assign temp220 = temp221 * obsLik_q0;
  assign temp221 = temp222 * Obs_q0;
  assign temp222 = temp223 * transMat_q0;
  assign temp223 = transMat_q0 * Obs_q0;
  assign temp224 = temp225 * obsLik_q0;
  assign temp225 = temp226 * transMat_q0;
  assign temp226 = temp227 * obsLik_q0;
  assign temp227 = Obs_q0 * obsLik_q0;
  assign temp228 = temp229 * Obs_q0;
  assign temp229 = temp230 * transMat_q0;
  assign temp230 = temp231 * obsLik_q0;
  assign temp231 = transMat_q0 * obsLik_q0;
  assign temp232 = temp233 * obsLik_q0;
  assign temp233 = temp234 * Obs_q0;
  assign temp234 = temp235 * Obs_q0;
  assign temp235 = Obs_q0 * transMat_q0;
  assign temp236 = temp237 * Obs_q0;
  assign temp237 = temp238 * v_q0;
  assign temp238 = temp239 * Obs_q0;
  assign temp239 = obsLik_q0 * v_q0;
  assign temp240 = temp241 * Obs_q0;
  assign temp241 = temp242 * obsLik_q0;
  assign temp242 = temp243 * transMat_q0;
  assign temp243 = Obs_q0 * Obs_q0;
  assign temp244 = temp245 * transMat_q0;
  assign temp245 = temp246 * v_q0;
  assign temp246 = temp247 * Obs_q0;
  assign temp247 = Obs_q0 * transMat_q0;
  assign temp248 = temp249 * obsLik_q0;
  assign temp249 = temp250 * Obs_q0;
  assign temp250 = temp251 * obsLik_q0;
  assign temp251 = obsLik_q0 * v_q0;
  assign temp252 = temp253 * transMat_q0;
  assign temp253 = temp254 * transMat_q0;
  assign temp254 = temp255 * transMat_q0;
  assign temp255 = transMat_q0 * transMat_q0;

endmodule

