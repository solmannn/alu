
module hls_macc_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  in1,
  in2,
  in3,
  in4,
  in7,
  in8,
  in9,
  in10,
  in14,
  in12,
  in15,
  in17,
  in19,
  in20,
  in22,
  in24,
  in27,
  in28,
  in29,
  in32,
  out13,
  out13_ap_vld,
  out30_i,
  out30_o,
  out30_o_ap_vld,
  out31,
  out31_ap_vld,
  locking_key
);

  input [3070:0] locking_key;
  wire [11:0] working_key;

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state3: begin
        if((working_key[0] ^ 1'b0) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        if((working_key[1] ^ 1'b1) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      default: begin
        if((working_key[2] ^ 1'b0) == 1'b1) begin
          ap_NS_fsm = 'bx;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((working_key[3] ^ 1'b1) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
    endcase
  end

  assign a = (working_key[4] == 1'b1)? b + c : b * c;
  assign a = (working_key[5] == 1'b1)? b * c : b + c;
  assign m = (working_key[6] == 1'b1)? n - t : n + t;
  assign m = (working_key[7] == 1'b1)? n + t : n - t;
  assign z = (working_key[8] == 1'b1)? x << y : x >> y;
  assign z = (working_key[9] == 1'b1)? x >> y : x << y;
  assign i = (working_key[10] == 1'b1)? j | k : j & k;
  assign i = (working_key[11] == 1'b1)? j & k : j | k;
  assign working_key = { locking_key[11:0] };

endmodule

