
module GSM_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  so_address0,
  so_ce0,
  so_we0,
  so_d0,
  so_q0,
  so_address1,
  so_ce1,
  so_we1,
  so_d1,
  so_q1,
  LARc_address0,
  LARc_ce0,
  LARc_we0,
  LARc_d0,
  LARc_q0,
  LARc_address1,
  LARc_ce1,
  LARc_we1,
  LARc_d1,
  LARc_q1,
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
  output [7:0] so_address0;
  output so_ce0;
  output so_we0;
  output [15:0] so_d0;
  input [15:0] so_q0;
  output [7:0] so_address1;
  output so_ce1;
  output so_we1;
  output [15:0] so_d1;
  input [15:0] so_q1;
  output [2:0] LARc_address0;
  output LARc_ce0;
  output LARc_we0;
  output [15:0] LARc_d0;
  input [15:0] LARc_q0;
  output [2:0] LARc_address1;
  output LARc_ce1;
  output LARc_we1;
  output [15:0] LARc_d1;
  input [15:0] LARc_q1;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [1:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire grp_Gsm_LPC_Analysis_fu_14_ap_start;
  wire grp_Gsm_LPC_Analysis_fu_14_ap_done;
  wire grp_Gsm_LPC_Analysis_fu_14_ap_idle;
  wire grp_Gsm_LPC_Analysis_fu_14_ap_ready;
  wire [7:0] grp_Gsm_LPC_Analysis_fu_14_s_address0;
  wire grp_Gsm_LPC_Analysis_fu_14_s_ce0;
  wire grp_Gsm_LPC_Analysis_fu_14_s_we0;
  wire [15:0] grp_Gsm_LPC_Analysis_fu_14_s_d0;
  wire [7:0] grp_Gsm_LPC_Analysis_fu_14_s_address1;
  wire grp_Gsm_LPC_Analysis_fu_14_s_ce1;
  wire grp_Gsm_LPC_Analysis_fu_14_s_we1;
  wire [15:0] grp_Gsm_LPC_Analysis_fu_14_s_d1;
  wire [2:0] grp_Gsm_LPC_Analysis_fu_14_LARc_address0;
  wire grp_Gsm_LPC_Analysis_fu_14_LARc_ce0;
  wire grp_Gsm_LPC_Analysis_fu_14_LARc_we0;
  wire [15:0] grp_Gsm_LPC_Analysis_fu_14_LARc_d0;
  wire [2:0] grp_Gsm_LPC_Analysis_fu_14_LARc_address1;
  wire grp_Gsm_LPC_Analysis_fu_14_LARc_ce1;
  wire grp_Gsm_LPC_Analysis_fu_14_LARc_we1;
  wire [15:0] grp_Gsm_LPC_Analysis_fu_14_LARc_d1;
  reg grp_Gsm_LPC_Analysis_fu_14_ap_start_reg;
  wire ap_CS_fsm_state2;
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
  wire Const_14;
  wire Const_15;
  input [6142:0] locking_key;
  wire [20:0] working_key;

  initial begin
    #0 ap_CS_fsm = 2'd1;
    #0 grp_Gsm_LPC_Analysis_fu_14_ap_start_reg = 1'b0;
  end


  Gsm_LPC_Analysis
  grp_Gsm_LPC_Analysis_fu_14
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Gsm_LPC_Analysis_fu_14_ap_start),
    .ap_done(grp_Gsm_LPC_Analysis_fu_14_ap_done),
    .ap_idle(grp_Gsm_LPC_Analysis_fu_14_ap_idle),
    .ap_ready(grp_Gsm_LPC_Analysis_fu_14_ap_ready),
    .s_address0(grp_Gsm_LPC_Analysis_fu_14_s_address0),
    .s_ce0(grp_Gsm_LPC_Analysis_fu_14_s_ce0),
    .s_we0(grp_Gsm_LPC_Analysis_fu_14_s_we0),
    .s_d0(grp_Gsm_LPC_Analysis_fu_14_s_d0),
    .s_q0(so_q0),
    .s_address1(grp_Gsm_LPC_Analysis_fu_14_s_address1),
    .s_ce1(grp_Gsm_LPC_Analysis_fu_14_s_ce1),
    .s_we1(grp_Gsm_LPC_Analysis_fu_14_s_we1),
    .s_d1(grp_Gsm_LPC_Analysis_fu_14_s_d1),
    .s_q1(so_q1),
    .LARc_address0(grp_Gsm_LPC_Analysis_fu_14_LARc_address0),
    .LARc_ce0(grp_Gsm_LPC_Analysis_fu_14_LARc_ce0),
    .LARc_we0(grp_Gsm_LPC_Analysis_fu_14_LARc_we0),
    .LARc_d0(grp_Gsm_LPC_Analysis_fu_14_LARc_d0),
    .LARc_q0(LARc_q0),
    .LARc_address1(grp_Gsm_LPC_Analysis_fu_14_LARc_address1),
    .LARc_ce1(grp_Gsm_LPC_Analysis_fu_14_LARc_ce1),
    .LARc_we1(grp_Gsm_LPC_Analysis_fu_14_LARc_we1),
    .LARc_d1(grp_Gsm_LPC_Analysis_fu_14_LARc_d1),
    .LARc_q1(LARc_q1)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_Gsm_LPC_Analysis_fu_14_ap_start_reg <= 1'b0;
    end else begin
      if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
        grp_Gsm_LPC_Analysis_fu_14_ap_start_reg <= 1'b1;
      end else if(grp_Gsm_LPC_Analysis_fu_14_ap_ready == 1'b1) begin
        grp_Gsm_LPC_Analysis_fu_14_ap_start_reg <= 1'b0;
      end 
    end
  end

  assign Const_0 = (1'd1 ^ working_key[0]);
  assign Const_1 = (1'd0 ^ working_key[1]);
  assign Const_2 = (1'd1 ^ working_key[2]);
  assign Const_3 = (1'd1 ^ working_key[3]);

  always @(*) begin
    if(((grp_Gsm_LPC_Analysis_fu_14_ap_done == Const_0) & (Const_1 == ap_CS_fsm_state2) ^ working_key[4]) == 1'b1) begin
      ap_done = Const_2;
    end else begin
      ap_done = Const_3;
    end
  end

  assign Const_4 = (1'd1 ^ working_key[5]);
  assign Const_5 = (1'd1 ^ working_key[6]);
  assign Const_6 = (1'd0 ^ working_key[7]);
  assign Const_7 = (1'd1 ^ working_key[8]);

  always @(*) begin
    if(((ap_start == Const_4) & (Const_5 == ap_CS_fsm_state1) ^ working_key[9]) == 1'b1) begin
      ap_idle = Const_6;
    end else begin
      ap_idle = Const_7;
    end
  end

  assign Const_8 = (1'd0 ^ working_key[10]);
  assign Const_9 = (1'd1 ^ working_key[11]);
  assign Const_10 = (1'd0 ^ working_key[12]);
  assign Const_11 = (1'd0 ^ working_key[13]);

  always @(*) begin
    if(((grp_Gsm_LPC_Analysis_fu_14_ap_done == Const_8) & (Const_9 == ap_CS_fsm_state2) ^ working_key[14]) == 1'b1) begin
      ap_ready = Const_10;
    end else begin
      ap_ready = Const_11;
    end
  end

  assign Const_12 = (1'd0 ^ working_key[15]);
  assign Const_13 = (1'd1 ^ working_key[16]);
  assign Const_14 = (1'd0 ^ working_key[18]);
  assign Const_15 = (1'd1 ^ working_key[19]);

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
        if(((grp_Gsm_LPC_Analysis_fu_14_ap_done == Const_14) & (Const_15 == ap_CS_fsm_state2) ^ working_key[20]) == 1'b1) begin
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

  assign LARc_address0 = grp_Gsm_LPC_Analysis_fu_14_LARc_address0;
  assign LARc_address1 = grp_Gsm_LPC_Analysis_fu_14_LARc_address1;
  assign LARc_ce0 = grp_Gsm_LPC_Analysis_fu_14_LARc_ce0;
  assign LARc_ce1 = grp_Gsm_LPC_Analysis_fu_14_LARc_ce1;
  assign LARc_d0 = grp_Gsm_LPC_Analysis_fu_14_LARc_d0;
  assign LARc_d1 = grp_Gsm_LPC_Analysis_fu_14_LARc_d1;
  assign LARc_we0 = grp_Gsm_LPC_Analysis_fu_14_LARc_we0;
  assign LARc_we1 = grp_Gsm_LPC_Analysis_fu_14_LARc_we1;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign grp_Gsm_LPC_Analysis_fu_14_ap_start = grp_Gsm_LPC_Analysis_fu_14_ap_start_reg;
  assign so_address0 = grp_Gsm_LPC_Analysis_fu_14_s_address0;
  assign so_address1 = grp_Gsm_LPC_Analysis_fu_14_s_address1;
  assign so_ce0 = grp_Gsm_LPC_Analysis_fu_14_s_ce0;
  assign so_ce1 = grp_Gsm_LPC_Analysis_fu_14_s_ce1;
  assign so_d0 = grp_Gsm_LPC_Analysis_fu_14_s_d0;
  assign so_d1 = grp_Gsm_LPC_Analysis_fu_14_s_d1;
  assign so_we0 = grp_Gsm_LPC_Analysis_fu_14_s_we0;
  assign so_we1 = grp_Gsm_LPC_Analysis_fu_14_s_we1;
  assign working_key = { locking_key[20:0] };

endmodule

