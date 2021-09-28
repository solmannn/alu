
module reset_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  dec_detl,
  dec_detl_ap_vld,
  detl,
  detl_ap_vld,
  dec_deth,
  dec_deth_ap_vld,
  deth,
  deth_ap_vld,
  rlt2,
  rlt2_ap_vld,
  rlt1,
  rlt1_ap_vld,
  plt2,
  plt2_ap_vld,
  plt1,
  plt1_ap_vld,
  al2,
  al2_ap_vld,
  al1,
  al1_ap_vld,
  nbl,
  nbl_ap_vld,
  rh2,
  rh2_ap_vld,
  rh1,
  rh1_ap_vld,
  ph2,
  ph2_ap_vld,
  ph1,
  ph1_ap_vld,
  ah2,
  ah2_ap_vld,
  ah1,
  ah1_ap_vld,
  nbh,
  nbh_ap_vld,
  dec_rlt2,
  dec_rlt2_ap_vld,
  dec_rlt1,
  dec_rlt1_ap_vld,
  dec_plt2,
  dec_plt2_ap_vld,
  dec_plt1,
  dec_plt1_ap_vld,
  dec_al2,
  dec_al2_ap_vld,
  dec_al1,
  dec_al1_ap_vld,
  dec_nbl,
  dec_nbl_ap_vld,
  dec_rh2,
  dec_rh2_ap_vld,
  dec_rh1,
  dec_rh1_ap_vld,
  dec_ph2,
  dec_ph2_ap_vld,
  dec_ph1,
  dec_ph1_ap_vld,
  dec_ah2,
  dec_ah2_ap_vld,
  dec_ah1,
  dec_ah1_ap_vld,
  dec_nbh,
  dec_nbh_ap_vld,
  delay_dltx_address0,
  delay_dltx_ce0,
  delay_dltx_we0,
  delay_dltx_d0,
  delay_dhx_address0,
  delay_dhx_ce0,
  delay_dhx_we0,
  delay_dhx_d0,
  dec_del_dltx_address0,
  dec_del_dltx_ce0,
  dec_del_dltx_we0,
  dec_del_dltx_d0,
  dec_del_dhx_address0,
  dec_del_dhx_ce0,
  dec_del_dhx_we0,
  dec_del_dhx_d0,
  delay_bpl_address0,
  delay_bpl_ce0,
  delay_bpl_we0,
  delay_bpl_d0,
  delay_bph_address0,
  delay_bph_ce0,
  delay_bph_we0,
  delay_bph_d0,
  dec_del_bpl_address0,
  dec_del_bpl_ce0,
  dec_del_bpl_we0,
  dec_del_bpl_d0,
  dec_del_bph_address0,
  dec_del_bph_ce0,
  dec_del_bph_we0,
  dec_del_bph_d0,
  tqmf_address0,
  tqmf_ce0,
  tqmf_we0,
  tqmf_d0,
  accumc_address0,
  accumc_ce0,
  accumc_we0,
  accumc_d0,
  accumd_address0,
  accumd_ce0,
  accumd_we0,
  accumd_d0,
  locking_key
);

  parameter ap_ST_fsm_state1 = 5'd1;
  parameter ap_ST_fsm_state2 = 5'd2;
  parameter ap_ST_fsm_state3 = 5'd4;
  parameter ap_ST_fsm_state4 = 5'd8;
  parameter ap_ST_fsm_state5 = 5'd16;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [14:0] dec_detl;
  output dec_detl_ap_vld;
  output [31:0] detl;
  output detl_ap_vld;
  output [14:0] dec_deth;
  output dec_deth_ap_vld;
  output [14:0] deth;
  output deth_ap_vld;
  output [31:0] rlt2;
  output rlt2_ap_vld;
  output [31:0] rlt1;
  output rlt1_ap_vld;
  output [31:0] plt2;
  output plt2_ap_vld;
  output [31:0] plt1;
  output plt1_ap_vld;
  output [31:0] al2;
  output al2_ap_vld;
  output [31:0] al1;
  output al1_ap_vld;
  output [31:0] nbl;
  output nbl_ap_vld;
  output [31:0] rh2;
  output rh2_ap_vld;
  output [31:0] rh1;
  output rh1_ap_vld;
  output [31:0] ph2;
  output ph2_ap_vld;
  output [31:0] ph1;
  output ph1_ap_vld;
  output [31:0] ah2;
  output ah2_ap_vld;
  output [31:0] ah1;
  output ah1_ap_vld;
  output [31:0] nbh;
  output nbh_ap_vld;
  output [31:0] dec_rlt2;
  output dec_rlt2_ap_vld;
  output [31:0] dec_rlt1;
  output dec_rlt1_ap_vld;
  output [31:0] dec_plt2;
  output dec_plt2_ap_vld;
  output [31:0] dec_plt1;
  output dec_plt1_ap_vld;
  output [31:0] dec_al2;
  output dec_al2_ap_vld;
  output [31:0] dec_al1;
  output dec_al1_ap_vld;
  output [31:0] dec_nbl;
  output dec_nbl_ap_vld;
  output [31:0] dec_rh2;
  output dec_rh2_ap_vld;
  output [31:0] dec_rh1;
  output dec_rh1_ap_vld;
  output [31:0] dec_ph2;
  output dec_ph2_ap_vld;
  output [31:0] dec_ph1;
  output dec_ph1_ap_vld;
  output [31:0] dec_ah2;
  output dec_ah2_ap_vld;
  output [31:0] dec_ah1;
  output dec_ah1_ap_vld;
  output [31:0] dec_nbh;
  output dec_nbh_ap_vld;
  output [2:0] delay_dltx_address0;
  output delay_dltx_ce0;
  output delay_dltx_we0;
  output [31:0] delay_dltx_d0;
  output [2:0] delay_dhx_address0;
  output delay_dhx_ce0;
  output delay_dhx_we0;
  output [31:0] delay_dhx_d0;
  output [2:0] dec_del_dltx_address0;
  output dec_del_dltx_ce0;
  output dec_del_dltx_we0;
  output [31:0] dec_del_dltx_d0;
  output [2:0] dec_del_dhx_address0;
  output dec_del_dhx_ce0;
  output dec_del_dhx_we0;
  output [31:0] dec_del_dhx_d0;
  output [2:0] delay_bpl_address0;
  output delay_bpl_ce0;
  output delay_bpl_we0;
  output [31:0] delay_bpl_d0;
  output [2:0] delay_bph_address0;
  output delay_bph_ce0;
  output delay_bph_we0;
  output [31:0] delay_bph_d0;
  output [2:0] dec_del_bpl_address0;
  output dec_del_bpl_ce0;
  output dec_del_bpl_we0;
  output [31:0] dec_del_bpl_d0;
  output [2:0] dec_del_bph_address0;
  output dec_del_bph_ce0;
  output dec_del_bph_we0;
  output [31:0] dec_del_bph_d0;
  output [4:0] tqmf_address0;
  output tqmf_ce0;
  output tqmf_we0;
  output [6:0] tqmf_d0;
  output [3:0] accumc_address0;
  output accumc_ce0;
  output accumc_we0;
  output [31:0] accumc_d0;
  output [3:0] accumd_address0;
  output accumd_ce0;
  output accumd_we0;
  output [31:0] accumd_d0;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg dec_detl_ap_vld;
  reg detl_ap_vld;
  reg dec_deth_ap_vld;
  reg deth_ap_vld;
  reg rlt2_ap_vld;
  reg rlt1_ap_vld;
  reg plt2_ap_vld;
  reg plt1_ap_vld;
  reg al2_ap_vld;
  reg al1_ap_vld;
  reg nbl_ap_vld;
  reg rh2_ap_vld;
  reg rh1_ap_vld;
  reg ph2_ap_vld;
  reg ph1_ap_vld;
  reg ah2_ap_vld;
  reg ah1_ap_vld;
  reg nbh_ap_vld;
  reg dec_rlt2_ap_vld;
  reg dec_rlt1_ap_vld;
  reg dec_plt2_ap_vld;
  reg dec_plt1_ap_vld;
  reg dec_al2_ap_vld;
  reg dec_al1_ap_vld;
  reg dec_nbl_ap_vld;
  reg dec_rh2_ap_vld;
  reg dec_rh1_ap_vld;
  reg dec_ph2_ap_vld;
  reg dec_ph1_ap_vld;
  reg dec_ah2_ap_vld;
  reg dec_ah1_ap_vld;
  reg dec_nbh_ap_vld;
  reg delay_dltx_ce0;
  reg delay_dltx_we0;
  reg delay_dhx_ce0;
  reg delay_dhx_we0;
  reg dec_del_dltx_ce0;
  reg dec_del_dltx_we0;
  reg dec_del_dhx_ce0;
  reg dec_del_dhx_we0;
  reg delay_bpl_ce0;
  reg delay_bpl_we0;
  reg delay_bph_ce0;
  reg delay_bph_we0;
  reg dec_del_bpl_ce0;
  reg dec_del_bpl_we0;
  reg dec_del_bph_ce0;
  reg dec_del_bph_we0;
  reg tqmf_ce0;
  reg tqmf_we0;
  reg accumc_ce0;
  reg accumc_we0;
  reg accumd_ce0;
  reg accumd_we0;
  reg [4:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [2:0] i_4_fu_520_p2;
  wire ap_CS_fsm_state2;
  wire [2:0] i_5_fu_540_p2;
  wire ap_CS_fsm_state3;
  wire [4:0] i_6_fu_560_p2;
  wire ap_CS_fsm_state4;
  wire [3:0] i_7_fu_577_p2;
  wire ap_CS_fsm_state5;
  reg [2:0] i_reg_278;
  wire [0:0] exitcond3_fu_514_p2;
  reg [2:0] i_1_reg_289;
  wire [0:0] exitcond2_fu_534_p2;
  reg [4:0] i_2_reg_300;
  wire [0:0] exitcond1_fu_554_p2;
  reg [3:0] i_3_reg_311;
  wire [0:0] exitcond_fu_571_p2;
  wire [63:0] tmp_fu_526_p1;
  wire [63:0] tmp_s_fu_546_p1;
  wire [63:0] tmp_11_fu_566_p1;
  wire [63:0] tmp_12_fu_583_p1;
  reg [4:0] ap_NS_fsm;
  wire Const_1041;
  wire Const_1042;
  wire [2:0] Const_1043;
  wire Const_1044;
  wire Const_1045;
  wire Const_1046;
  wire Const_1047;
  wire [4:0] Const_1048;
  wire Const_1049;
  wire Const_1050;
  wire Const_1051;
  wire Const_1052;
  wire [3:0] Const_1053;
  wire Const_1054;
  wire Const_1055;
  wire Const_1056;
  wire Const_1057;
  wire Const_1058;
  wire Const_1059;
  wire [2:0] Const_1060;
  wire Const_1061;
  wire Const_1062;
  wire Const_1063;
  wire Const_1064;
  wire Const_1065;
  wire Const_1066;
  wire Const_1067;
  wire Const_1068;
  wire Const_1069;
  wire Const_1070;
  wire Const_1071;
  wire Const_1072;
  wire Const_1073;
  wire Const_1074;
  wire Const_1075;
  wire Const_1076;
  wire Const_1077;
  wire Const_1078;
  wire Const_1079;
  wire Const_1080;
  wire Const_1081;
  wire Const_1082;
  wire Const_1083;
  wire Const_1084;
  wire Const_1085;
  wire Const_1086;
  wire Const_1087;
  wire Const_1088;
  wire Const_1089;
  wire Const_1090;
  wire Const_1091;
  wire Const_1092;
  wire Const_1093;
  wire Const_1094;
  wire Const_1095;
  wire Const_1096;
  wire Const_1097;
  wire Const_1098;
  wire Const_1099;
  wire Const_1100;
  wire Const_1101;
  wire Const_1102;
  wire Const_1103;
  wire Const_1104;
  wire Const_1105;
  wire Const_1106;
  wire Const_1107;
  wire Const_1108;
  wire Const_1109;
  wire Const_1110;
  wire Const_1111;
  wire Const_1112;
  wire Const_1113;
  wire Const_1114;
  wire Const_1115;
  wire Const_1116;
  wire Const_1117;
  wire Const_1118;
  wire Const_1119;
  wire Const_1120;
  wire Const_1121;
  wire Const_1122;
  wire Const_1123;
  wire Const_1124;
  wire Const_1125;
  wire Const_1126;
  wire Const_1127;
  wire Const_1128;
  wire Const_1129;
  wire Const_1130;
  wire Const_1131;
  wire Const_1132;
  wire Const_1133;
  wire Const_1134;
  wire Const_1135;
  wire Const_1136;
  wire Const_1137;
  wire Const_1138;
  wire Const_1139;
  wire Const_1140;
  wire Const_1141;
  wire Const_1142;
  wire Const_1143;
  wire Const_1144;
  wire Const_1145;
  wire Const_1146;
  wire Const_1147;
  wire Const_1148;
  wire Const_1149;
  wire Const_1150;
  wire Const_1151;
  wire Const_1152;
  wire Const_1153;
  wire Const_1154;
  wire Const_1155;
  wire Const_1156;
  wire Const_1157;
  wire Const_1158;
  wire Const_1159;
  wire Const_1160;
  wire Const_1161;
  wire Const_1162;
  wire Const_1163;
  wire Const_1164;
  wire Const_1165;
  wire Const_1166;
  wire Const_1167;
  wire Const_1168;
  wire Const_1169;
  wire Const_1170;
  wire Const_1171;
  wire Const_1172;
  wire Const_1173;
  wire Const_1174;
  wire Const_1175;
  wire Const_1176;
  wire Const_1177;
  wire Const_1178;
  wire Const_1179;
  wire Const_1180;
  wire Const_1181;
  wire Const_1182;
  wire Const_1183;
  wire Const_1184;
  wire Const_1185;
  wire Const_1186;
  wire Const_1187;
  wire Const_1188;
  wire Const_1189;
  wire Const_1190;
  wire Const_1191;
  wire Const_1192;
  wire Const_1193;
  wire Const_1194;
  wire Const_1195;
  wire Const_1196;
  wire Const_1197;
  wire Const_1198;
  wire Const_1199;
  wire Const_1200;
  wire Const_1201;
  wire Const_1202;
  wire Const_1203;
  wire Const_1204;
  wire Const_1205;
  wire Const_1206;
  wire Const_1207;
  wire Const_1208;
  wire Const_1209;
  wire Const_1210;
  wire Const_1211;
  wire Const_1212;
  wire Const_1213;
  wire Const_1214;
  wire Const_1215;
  wire Const_1216;
  wire Const_1217;
  wire Const_1218;
  wire Const_1219;
  wire Const_1220;
  wire Const_1221;
  wire Const_1222;
  wire Const_1223;
  wire Const_1224;
  wire Const_1225;
  wire Const_1226;
  wire Const_1227;
  wire Const_1228;
  wire Const_1229;
  wire Const_1230;
  wire Const_1231;
  wire Const_1232;
  wire Const_1233;
  wire Const_1234;
  wire Const_1235;
  wire Const_1236;
  wire Const_1237;
  wire Const_1238;
  wire Const_1239;
  wire Const_1240;
  wire Const_1241;
  wire Const_1242;
  wire Const_1243;
  wire Const_1244;
  wire Const_1245;
  wire Const_1246;
  wire Const_1247;
  wire Const_1248;
  wire Const_1249;
  wire Const_1250;
  wire Const_1251;
  wire Const_1252;
  wire Const_1253;
  wire Const_1254;
  wire Const_1255;
  wire Const_1256;
  wire Const_1257;
  wire Const_1258;
  wire Const_1259;
  wire Const_1260;
  wire Const_1261;
  wire Const_1262;
  wire Const_1263;
  wire Const_1264;
  wire Const_1265;
  wire Const_1266;
  wire Const_1267;
  wire Const_1268;
  wire Const_1269;
  wire Const_1270;
  wire Const_1271;
  wire Const_1272;
  wire Const_1273;
  wire Const_1274;
  wire Const_1275;
  wire Const_1276;
  wire Const_1277;
  wire Const_1278;
  wire Const_1279;
  wire Const_1280;
  wire Const_1281;
  wire Const_1282;
  wire Const_1283;
  wire Const_1284;
  wire Const_1285;
  wire Const_1286;
  wire Const_1287;
  wire Const_1288;
  wire Const_1289;
  wire [31:0] Const_1290;
  wire [31:0] Const_1291;
  wire [31:0] Const_1292;
  wire [31:0] Const_1293;
  wire [31:0] Const_1294;
  wire [31:0] Const_1295;
  wire [31:0] Const_1296;
  wire [31:0] Const_1297;
  wire [31:0] Const_1298;
  wire [31:0] Const_1299;
  wire [31:0] Const_1300;
  wire [31:0] Const_1301;
  wire [31:0] Const_1302;
  wire [31:0] Const_1303;
  wire [14:0] Const_1304;
  wire [14:0] Const_1305;
  wire [31:0] Const_1306;
  wire [31:0] Const_1307;
  wire [31:0] Const_1308;
  wire [31:0] Const_1309;
  wire [31:0] Const_1310;
  wire [31:0] Const_1311;
  wire [31:0] Const_1312;
  wire [31:0] Const_1313;
  wire [31:0] Const_1314;
  wire [31:0] Const_1315;
  wire [31:0] Const_1316;
  wire [31:0] Const_1317;
  wire [31:0] Const_1318;
  wire [31:0] Const_1319;
  wire [14:0] Const_1320;
  wire [31:0] Const_1321;
  wire [4:0] Const_1322;
  wire Const_1323;
  wire Const_1324;
  wire [2:0] Const_1325;
  wire Const_1326;
  wire Const_1327;
  wire [2:0] Const_1328;
  wire Const_1329;
  wire Const_1330;
  wire [3:0] Const_1331;
  wire Const_1332;
  wire Const_1333;
  wire [2:0] Const_1334;
  wire [2:0] Const_1335;
  wire [4:0] Const_1336;
  wire [3:0] Const_1337;
  wire [31:0] Const_1338;
  wire [31:0] Const_1339;
  wire [31:0] Const_1340;
  wire [31:0] Const_1341;
  wire [31:0] Const_1342;
  wire [31:0] Const_1343;
  wire [31:0] Const_1344;
  wire [31:0] Const_1345;
  wire [31:0] Const_1346;
  wire [31:0] Const_1347;
  wire [6:0] Const_1348;
  input [12286:0] locking_key;
  wire [1675:0] working_key;

  initial begin
    #0 ap_CS_fsm = 5'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_1041 = (1'd1 ^ working_key[4561]);
  assign Const_1042 = (1'd0 ^ working_key[4562]);
  assign Const_1043 = (3'd2 ^ working_key[4565:4563]);
  assign Const_1044 = (1'd1 ^ working_key[4566]);
  assign Const_1045 = (1'd1 ^ working_key[4567]);

  always @(posedge ap_clk) begin
    if(((Const_1041 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1042) ^ working_key[4568]) == 1'b0) begin
      i_1_reg_289 <= Const_1043;
    end else if((exitcond2_fu_534_p2 == Const_1044) & (Const_1045 == ap_CS_fsm_state3)) begin
      i_1_reg_289 <= i_5_fu_540_p2;
    end 
  end

  assign Const_1046 = (1'd0 ^ working_key[4569]);
  assign Const_1047 = (1'd1 ^ working_key[4570]);
  assign Const_1048 = (5'd5 ^ working_key[4575:4571]);
  assign Const_1049 = (1'd1 ^ working_key[4576]);
  assign Const_1050 = (1'd1 ^ working_key[4577]);

  always @(posedge ap_clk) begin
    if(((exitcond2_fu_534_p2 == Const_1046) & (Const_1047 == ap_CS_fsm_state3) ^ working_key[4578]) == 1'b1) begin
      i_2_reg_300 <= Const_1048;
    end else if((exitcond1_fu_554_p2 == Const_1049) & (Const_1050 == ap_CS_fsm_state4)) begin
      i_2_reg_300 <= i_6_fu_560_p2;
    end 
  end

  assign Const_1051 = (1'd0 ^ working_key[4579]);
  assign Const_1052 = (1'd1 ^ working_key[4580]);
  assign Const_1053 = (4'd5 ^ working_key[4584:4581]);
  assign Const_1054 = (1'd1 ^ working_key[4585]);
  assign Const_1055 = (1'd0 ^ working_key[4586]);

  always @(posedge ap_clk) begin
    if(((exitcond1_fu_554_p2 == Const_1051) & (Const_1052 == ap_CS_fsm_state4) ^ working_key[4587]) == 1'b1) begin
      i_3_reg_311 <= Const_1053;
    end else if((exitcond_fu_571_p2 == Const_1054) & (Const_1055 == ap_CS_fsm_state5)) begin
      i_3_reg_311 <= i_7_fu_577_p2;
    end 
  end

  assign Const_1056 = (1'd1 ^ working_key[4588]);
  assign Const_1057 = (1'd1 ^ working_key[4589]);
  assign Const_1058 = (1'd1 ^ working_key[4590]);
  assign Const_1059 = (1'd0 ^ working_key[4591]);
  assign Const_1060 = (3'd3 ^ working_key[4594:4592]);

  always @(posedge ap_clk) begin
    if(((Const_1056 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1057) ^ working_key[4595]) == 1'b0) begin
      i_reg_278 <= i_4_fu_520_p2;
    end else if((Const_1058 == ap_CS_fsm_state1) & (ap_start == Const_1059)) begin
      i_reg_278 <= Const_1060;
    end 
  end

  assign Const_1061 = (1'd1 ^ working_key[4596]);
  assign Const_1062 = (1'd0 ^ working_key[4597]);
  assign Const_1063 = (1'd0 ^ working_key[4598]);

  always @(*) begin
    if(((Const_1061 == ap_CS_fsm_state5) ^ working_key[4599]) == 1'b1) begin
      accumc_ce0 = Const_1063;
    end else begin
      accumc_ce0 = Const_1062;
    end
  end

  assign Const_1064 = (1'd0 ^ working_key[4600]);
  assign Const_1065 = (1'd0 ^ working_key[4601]);
  assign Const_1066 = (1'd0 ^ working_key[4602]);
  assign Const_1067 = (1'd0 ^ working_key[4603]);

  always @(*) begin
    if(((exitcond_fu_571_p2 == Const_1064) & (Const_1065 == ap_CS_fsm_state5) ^ working_key[4604]) == 1'b1) begin
      accumc_we0 = Const_1067;
    end else begin
      accumc_we0 = Const_1066;
    end
  end

  assign Const_1068 = (1'd1 ^ working_key[4605]);
  assign Const_1069 = (1'd0 ^ working_key[4606]);
  assign Const_1070 = (1'd0 ^ working_key[4607]);

  always @(*) begin
    if(((Const_1068 == ap_CS_fsm_state5) ^ working_key[4608]) == 1'b1) begin
      accumd_ce0 = Const_1069;
    end else begin
      accumd_ce0 = Const_1070;
    end
  end

  assign Const_1071 = (1'd1 ^ working_key[4609]);
  assign Const_1072 = (1'd1 ^ working_key[4610]);
  assign Const_1073 = (1'd1 ^ working_key[4611]);
  assign Const_1074 = (1'd1 ^ working_key[4612]);

  always @(*) begin
    if(((exitcond_fu_571_p2 == Const_1071) & (Const_1072 == ap_CS_fsm_state5) ^ working_key[4613]) == 1'b1) begin
      accumd_we0 = Const_1073;
    end else begin
      accumd_we0 = Const_1074;
    end
  end

  assign Const_1075 = (1'd0 ^ working_key[4614]);
  assign Const_1076 = (1'd1 ^ working_key[4615]);
  assign Const_1077 = (1'd0 ^ working_key[4616]);
  assign Const_1078 = (1'd0 ^ working_key[4617]);

  always @(*) begin
    if(((Const_1075 == ap_CS_fsm_state1) & (ap_start == Const_1076) ^ working_key[4618]) == 1'b1) begin
      ah1_ap_vld = Const_1078;
    end else begin
      ah1_ap_vld = Const_1077;
    end
  end

  assign Const_1079 = (1'd0 ^ working_key[4619]);
  assign Const_1080 = (1'd1 ^ working_key[4620]);
  assign Const_1081 = (1'd1 ^ working_key[4621]);
  assign Const_1082 = (1'd1 ^ working_key[4622]);

  always @(*) begin
    if(((Const_1079 == ap_CS_fsm_state1) & (ap_start == Const_1080) ^ working_key[4623]) == 1'b1) begin
      ah2_ap_vld = Const_1081;
    end else begin
      ah2_ap_vld = Const_1082;
    end
  end

  assign Const_1083 = (1'd0 ^ working_key[4624]);
  assign Const_1084 = (1'd0 ^ working_key[4625]);
  assign Const_1085 = (1'd0 ^ working_key[4626]);
  assign Const_1086 = (1'd1 ^ working_key[4627]);

  always @(*) begin
    if(((Const_1083 == ap_CS_fsm_state1) & (ap_start == Const_1084) ^ working_key[4628]) == 1'b1) begin
      al1_ap_vld = Const_1086;
    end else begin
      al1_ap_vld = Const_1085;
    end
  end

  assign Const_1087 = (1'd0 ^ working_key[4629]);
  assign Const_1088 = (1'd0 ^ working_key[4630]);
  assign Const_1089 = (1'd1 ^ working_key[4631]);
  assign Const_1090 = (1'd1 ^ working_key[4632]);

  always @(*) begin
    if(((Const_1087 == ap_CS_fsm_state1) & (ap_start == Const_1088) ^ working_key[4633]) == 1'b1) begin
      al2_ap_vld = Const_1089;
    end else begin
      al2_ap_vld = Const_1090;
    end
  end

  assign Const_1091 = (1'd0 ^ working_key[4634]);
  assign Const_1092 = (1'd1 ^ working_key[4635]);
  assign Const_1093 = (1'd1 ^ working_key[4636]);
  assign Const_1094 = (1'd1 ^ working_key[4637]);
  assign Const_1095 = (1'd1 ^ working_key[4638]);
  assign Const_1096 = (1'd1 ^ working_key[4639]);

  always @(*) begin
    if((((exitcond_fu_571_p2 == Const_1091) & (Const_1092 == ap_CS_fsm_state5) | (ap_start == Const_1093) & (Const_1094 == ap_CS_fsm_state1)) ^ working_key[4640]) == 1'b1) begin
      ap_done = Const_1095;
    end else begin
      ap_done = Const_1096;
    end
  end

  assign Const_1097 = (1'd1 ^ working_key[4641]);
  assign Const_1098 = (1'd1 ^ working_key[4642]);
  assign Const_1099 = (1'd0 ^ working_key[4643]);
  assign Const_1100 = (1'd0 ^ working_key[4644]);

  always @(*) begin
    if(((ap_start == Const_1097) & (Const_1098 == ap_CS_fsm_state1) ^ working_key[4645]) == 1'b1) begin
      ap_idle = Const_1100;
    end else begin
      ap_idle = Const_1099;
    end
  end

  assign Const_1101 = (1'd1 ^ working_key[4646]);
  assign Const_1102 = (1'd0 ^ working_key[4647]);
  assign Const_1103 = (1'd1 ^ working_key[4648]);
  assign Const_1104 = (1'd1 ^ working_key[4649]);

  always @(*) begin
    if(((exitcond_fu_571_p2 == Const_1101) & (Const_1102 == ap_CS_fsm_state5) ^ working_key[4650]) == 1'b1) begin
      ap_ready = Const_1103;
    end else begin
      ap_ready = Const_1104;
    end
  end

  assign Const_1105 = (1'd0 ^ working_key[4651]);
  assign Const_1106 = (1'd1 ^ working_key[4652]);
  assign Const_1107 = (1'd0 ^ working_key[4653]);
  assign Const_1108 = (1'd0 ^ working_key[4654]);

  always @(*) begin
    if(((Const_1105 == ap_CS_fsm_state1) & (ap_start == Const_1106) ^ working_key[4655]) == 1'b1) begin
      dec_ah1_ap_vld = Const_1108;
    end else begin
      dec_ah1_ap_vld = Const_1107;
    end
  end

  assign Const_1109 = (1'd1 ^ working_key[4656]);
  assign Const_1110 = (1'd0 ^ working_key[4657]);
  assign Const_1111 = (1'd1 ^ working_key[4658]);
  assign Const_1112 = (1'd0 ^ working_key[4659]);

  always @(*) begin
    if(((Const_1109 == ap_CS_fsm_state1) & (ap_start == Const_1110) ^ working_key[4660]) == 1'b1) begin
      dec_ah2_ap_vld = Const_1111;
    end else begin
      dec_ah2_ap_vld = Const_1112;
    end
  end

  assign Const_1113 = (1'd1 ^ working_key[4661]);
  assign Const_1114 = (1'd1 ^ working_key[4662]);
  assign Const_1115 = (1'd0 ^ working_key[4663]);
  assign Const_1116 = (1'd0 ^ working_key[4664]);

  always @(*) begin
    if(((Const_1113 == ap_CS_fsm_state1) & (ap_start == Const_1114) ^ working_key[4665]) == 1'b1) begin
      dec_al1_ap_vld = Const_1116;
    end else begin
      dec_al1_ap_vld = Const_1115;
    end
  end

  assign Const_1117 = (1'd1 ^ working_key[4666]);
  assign Const_1118 = (1'd0 ^ working_key[4667]);
  assign Const_1119 = (1'd1 ^ working_key[4668]);
  assign Const_1120 = (1'd1 ^ working_key[4669]);

  always @(*) begin
    if(((Const_1117 == ap_CS_fsm_state1) & (ap_start == Const_1118) ^ working_key[4670]) == 1'b1) begin
      dec_al2_ap_vld = Const_1119;
    end else begin
      dec_al2_ap_vld = Const_1120;
    end
  end

  assign Const_1121 = (1'd0 ^ working_key[4671]);
  assign Const_1122 = (1'd1 ^ working_key[4672]);
  assign Const_1123 = (1'd1 ^ working_key[4673]);

  always @(*) begin
    if(((Const_1121 == ap_CS_fsm_state3) ^ working_key[4674]) == 1'b1) begin
      dec_del_bph_ce0 = Const_1122;
    end else begin
      dec_del_bph_ce0 = Const_1123;
    end
  end

  assign Const_1124 = (1'd1 ^ working_key[4675]);
  assign Const_1125 = (1'd1 ^ working_key[4676]);
  assign Const_1126 = (1'd0 ^ working_key[4677]);
  assign Const_1127 = (1'd0 ^ working_key[4678]);

  always @(*) begin
    if(((exitcond2_fu_534_p2 == Const_1124) & (Const_1125 == ap_CS_fsm_state3) ^ working_key[4679]) == 1'b1) begin
      dec_del_bph_we0 = Const_1127;
    end else begin
      dec_del_bph_we0 = Const_1126;
    end
  end

  assign Const_1128 = (1'd1 ^ working_key[4680]);
  assign Const_1129 = (1'd0 ^ working_key[4681]);
  assign Const_1130 = (1'd0 ^ working_key[4682]);

  always @(*) begin
    if(((Const_1128 == ap_CS_fsm_state3) ^ working_key[4683]) == 1'b1) begin
      dec_del_bpl_ce0 = Const_1130;
    end else begin
      dec_del_bpl_ce0 = Const_1129;
    end
  end

  assign Const_1131 = (1'd0 ^ working_key[4684]);
  assign Const_1132 = (1'd1 ^ working_key[4685]);
  assign Const_1133 = (1'd0 ^ working_key[4686]);
  assign Const_1134 = (1'd1 ^ working_key[4687]);

  always @(*) begin
    if(((exitcond2_fu_534_p2 == Const_1131) & (Const_1132 == ap_CS_fsm_state3) ^ working_key[4688]) == 1'b1) begin
      dec_del_bpl_we0 = Const_1133;
    end else begin
      dec_del_bpl_we0 = Const_1134;
    end
  end

  assign Const_1135 = (1'd1 ^ working_key[4689]);
  assign Const_1136 = (1'd0 ^ working_key[4690]);
  assign Const_1137 = (1'd0 ^ working_key[4691]);

  always @(*) begin
    if(((Const_1135 == ap_CS_fsm_state2) ^ working_key[4692]) == 1'b1) begin
      dec_del_dhx_ce0 = Const_1137;
    end else begin
      dec_del_dhx_ce0 = Const_1136;
    end
  end

  assign Const_1138 = (1'd1 ^ working_key[4693]);
  assign Const_1139 = (1'd1 ^ working_key[4694]);
  assign Const_1140 = (1'd1 ^ working_key[4695]);
  assign Const_1141 = (1'd1 ^ working_key[4696]);

  always @(*) begin
    if(((Const_1138 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1139) ^ working_key[4697]) == 1'b1) begin
      dec_del_dhx_we0 = Const_1141;
    end else begin
      dec_del_dhx_we0 = Const_1140;
    end
  end

  assign Const_1142 = (1'd1 ^ working_key[4698]);
  assign Const_1143 = (1'd0 ^ working_key[4699]);
  assign Const_1144 = (1'd0 ^ working_key[4700]);

  always @(*) begin
    if(((Const_1142 == ap_CS_fsm_state2) ^ working_key[4701]) == 1'b1) begin
      dec_del_dltx_ce0 = Const_1144;
    end else begin
      dec_del_dltx_ce0 = Const_1143;
    end
  end

  assign Const_1145 = (1'd1 ^ working_key[4702]);
  assign Const_1146 = (1'd0 ^ working_key[4703]);
  assign Const_1147 = (1'd0 ^ working_key[4704]);
  assign Const_1148 = (1'd0 ^ working_key[4705]);

  always @(*) begin
    if(((Const_1145 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1146) ^ working_key[4706]) == 1'b1) begin
      dec_del_dltx_we0 = Const_1147;
    end else begin
      dec_del_dltx_we0 = Const_1148;
    end
  end

  assign Const_1149 = (1'd0 ^ working_key[4707]);
  assign Const_1150 = (1'd1 ^ working_key[4708]);
  assign Const_1151 = (1'd0 ^ working_key[4709]);
  assign Const_1152 = (1'd0 ^ working_key[4710]);

  always @(*) begin
    if(((Const_1149 == ap_CS_fsm_state1) & (ap_start == Const_1150) ^ working_key[4711]) == 1'b1) begin
      dec_deth_ap_vld = Const_1152;
    end else begin
      dec_deth_ap_vld = Const_1151;
    end
  end

  assign Const_1153 = (1'd1 ^ working_key[4712]);
  assign Const_1154 = (1'd0 ^ working_key[4713]);
  assign Const_1155 = (1'd0 ^ working_key[4714]);
  assign Const_1156 = (1'd0 ^ working_key[4715]);

  always @(*) begin
    if(((Const_1153 == ap_CS_fsm_state1) & (ap_start == Const_1154) ^ working_key[4716]) == 1'b1) begin
      dec_detl_ap_vld = Const_1155;
    end else begin
      dec_detl_ap_vld = Const_1156;
    end
  end

  assign Const_1157 = (1'd0 ^ working_key[4717]);
  assign Const_1158 = (1'd1 ^ working_key[4718]);
  assign Const_1159 = (1'd0 ^ working_key[4719]);
  assign Const_1160 = (1'd1 ^ working_key[4720]);

  always @(*) begin
    if(((Const_1157 == ap_CS_fsm_state1) & (ap_start == Const_1158) ^ working_key[4721]) == 1'b1) begin
      dec_nbh_ap_vld = Const_1160;
    end else begin
      dec_nbh_ap_vld = Const_1159;
    end
  end

  assign Const_1161 = (1'd1 ^ working_key[4722]);
  assign Const_1162 = (1'd0 ^ working_key[4723]);
  assign Const_1163 = (1'd1 ^ working_key[4724]);
  assign Const_1164 = (1'd1 ^ working_key[4725]);

  always @(*) begin
    if(((Const_1161 == ap_CS_fsm_state1) & (ap_start == Const_1162) ^ working_key[4726]) == 1'b1) begin
      dec_nbl_ap_vld = Const_1163;
    end else begin
      dec_nbl_ap_vld = Const_1164;
    end
  end

  assign Const_1165 = (1'd0 ^ working_key[4727]);
  assign Const_1166 = (1'd1 ^ working_key[4728]);
  assign Const_1167 = (1'd0 ^ working_key[4729]);
  assign Const_1168 = (1'd1 ^ working_key[4730]);

  always @(*) begin
    if(((Const_1165 == ap_CS_fsm_state1) & (ap_start == Const_1166) ^ working_key[4731]) == 1'b1) begin
      dec_ph1_ap_vld = Const_1167;
    end else begin
      dec_ph1_ap_vld = Const_1168;
    end
  end

  assign Const_1169 = (1'd0 ^ working_key[4732]);
  assign Const_1170 = (1'd1 ^ working_key[4733]);
  assign Const_1171 = (1'd0 ^ working_key[4734]);
  assign Const_1172 = (1'd0 ^ working_key[4735]);

  always @(*) begin
    if(((Const_1169 == ap_CS_fsm_state1) & (ap_start == Const_1170) ^ working_key[4736]) == 1'b1) begin
      dec_ph2_ap_vld = Const_1171;
    end else begin
      dec_ph2_ap_vld = Const_1172;
    end
  end

  assign Const_1173 = (1'd0 ^ working_key[4737]);
  assign Const_1174 = (1'd1 ^ working_key[4738]);
  assign Const_1175 = (1'd1 ^ working_key[4739]);
  assign Const_1176 = (1'd1 ^ working_key[4740]);

  always @(*) begin
    if(((Const_1173 == ap_CS_fsm_state1) & (ap_start == Const_1174) ^ working_key[4741]) == 1'b1) begin
      dec_plt1_ap_vld = Const_1175;
    end else begin
      dec_plt1_ap_vld = Const_1176;
    end
  end

  assign Const_1177 = (1'd0 ^ working_key[4742]);
  assign Const_1178 = (1'd1 ^ working_key[4743]);
  assign Const_1179 = (1'd0 ^ working_key[4744]);
  assign Const_1180 = (1'd0 ^ working_key[4745]);

  always @(*) begin
    if(((Const_1177 == ap_CS_fsm_state1) & (ap_start == Const_1178) ^ working_key[4746]) == 1'b1) begin
      dec_plt2_ap_vld = Const_1180;
    end else begin
      dec_plt2_ap_vld = Const_1179;
    end
  end

  assign Const_1181 = (1'd0 ^ working_key[4747]);
  assign Const_1182 = (1'd1 ^ working_key[4748]);
  assign Const_1183 = (1'd1 ^ working_key[4749]);
  assign Const_1184 = (1'd1 ^ working_key[4750]);

  always @(*) begin
    if(((Const_1181 == ap_CS_fsm_state1) & (ap_start == Const_1182) ^ working_key[4751]) == 1'b1) begin
      dec_rh1_ap_vld = Const_1183;
    end else begin
      dec_rh1_ap_vld = Const_1184;
    end
  end

  assign Const_1185 = (1'd0 ^ working_key[4752]);
  assign Const_1186 = (1'd0 ^ working_key[4753]);
  assign Const_1187 = (1'd0 ^ working_key[4754]);
  assign Const_1188 = (1'd1 ^ working_key[4755]);

  always @(*) begin
    if(((Const_1185 == ap_CS_fsm_state1) & (ap_start == Const_1186) ^ working_key[4756]) == 1'b1) begin
      dec_rh2_ap_vld = Const_1188;
    end else begin
      dec_rh2_ap_vld = Const_1187;
    end
  end

  assign Const_1189 = (1'd0 ^ working_key[4757]);
  assign Const_1190 = (1'd0 ^ working_key[4758]);
  assign Const_1191 = (1'd1 ^ working_key[4759]);
  assign Const_1192 = (1'd1 ^ working_key[4760]);

  always @(*) begin
    if(((Const_1189 == ap_CS_fsm_state1) & (ap_start == Const_1190) ^ working_key[4761]) == 1'b1) begin
      dec_rlt1_ap_vld = Const_1191;
    end else begin
      dec_rlt1_ap_vld = Const_1192;
    end
  end

  assign Const_1193 = (1'd0 ^ working_key[4762]);
  assign Const_1194 = (1'd1 ^ working_key[4763]);
  assign Const_1195 = (1'd0 ^ working_key[4764]);
  assign Const_1196 = (1'd0 ^ working_key[4765]);

  always @(*) begin
    if(((Const_1193 == ap_CS_fsm_state1) & (ap_start == Const_1194) ^ working_key[4766]) == 1'b1) begin
      dec_rlt2_ap_vld = Const_1195;
    end else begin
      dec_rlt2_ap_vld = Const_1196;
    end
  end

  assign Const_1197 = (1'd0 ^ working_key[4767]);
  assign Const_1198 = (1'd1 ^ working_key[4768]);
  assign Const_1199 = (1'd1 ^ working_key[4769]);

  always @(*) begin
    if(((Const_1197 == ap_CS_fsm_state3) ^ working_key[4770]) == 1'b1) begin
      delay_bph_ce0 = Const_1198;
    end else begin
      delay_bph_ce0 = Const_1199;
    end
  end

  assign Const_1200 = (1'd1 ^ working_key[4771]);
  assign Const_1201 = (1'd1 ^ working_key[4772]);
  assign Const_1202 = (1'd0 ^ working_key[4773]);
  assign Const_1203 = (1'd0 ^ working_key[4774]);

  always @(*) begin
    if(((exitcond2_fu_534_p2 == Const_1200) & (Const_1201 == ap_CS_fsm_state3) ^ working_key[4775]) == 1'b1) begin
      delay_bph_we0 = Const_1203;
    end else begin
      delay_bph_we0 = Const_1202;
    end
  end

  assign Const_1204 = (1'd1 ^ working_key[4776]);
  assign Const_1205 = (1'd0 ^ working_key[4777]);
  assign Const_1206 = (1'd0 ^ working_key[4778]);

  always @(*) begin
    if(((Const_1204 == ap_CS_fsm_state3) ^ working_key[4779]) == 1'b1) begin
      delay_bpl_ce0 = Const_1206;
    end else begin
      delay_bpl_ce0 = Const_1205;
    end
  end

  assign Const_1207 = (1'd0 ^ working_key[4780]);
  assign Const_1208 = (1'd0 ^ working_key[4781]);
  assign Const_1209 = (1'd1 ^ working_key[4782]);
  assign Const_1210 = (1'd1 ^ working_key[4783]);

  always @(*) begin
    if(((exitcond2_fu_534_p2 == Const_1207) & (Const_1208 == ap_CS_fsm_state3) ^ working_key[4784]) == 1'b1) begin
      delay_bpl_we0 = Const_1209;
    end else begin
      delay_bpl_we0 = Const_1210;
    end
  end

  assign Const_1211 = (1'd0 ^ working_key[4785]);
  assign Const_1212 = (1'd1 ^ working_key[4786]);
  assign Const_1213 = (1'd0 ^ working_key[4787]);

  always @(*) begin
    if(((Const_1211 == ap_CS_fsm_state2) ^ working_key[4788]) == 1'b1) begin
      delay_dhx_ce0 = Const_1212;
    end else begin
      delay_dhx_ce0 = Const_1213;
    end
  end

  assign Const_1214 = (1'd1 ^ working_key[4789]);
  assign Const_1215 = (1'd0 ^ working_key[4790]);
  assign Const_1216 = (1'd0 ^ working_key[4791]);
  assign Const_1217 = (1'd0 ^ working_key[4792]);

  always @(*) begin
    if(((Const_1214 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1215) ^ working_key[4793]) == 1'b1) begin
      delay_dhx_we0 = Const_1217;
    end else begin
      delay_dhx_we0 = Const_1216;
    end
  end

  assign Const_1218 = (1'd1 ^ working_key[4794]);
  assign Const_1219 = (1'd0 ^ working_key[4795]);
  assign Const_1220 = (1'd0 ^ working_key[4796]);

  always @(*) begin
    if(((Const_1218 == ap_CS_fsm_state2) ^ working_key[4797]) == 1'b1) begin
      delay_dltx_ce0 = Const_1220;
    end else begin
      delay_dltx_ce0 = Const_1219;
    end
  end

  assign Const_1221 = (1'd1 ^ working_key[4798]);
  assign Const_1222 = (1'd1 ^ working_key[4799]);
  assign Const_1223 = (1'd1 ^ working_key[4800]);
  assign Const_1224 = (1'd1 ^ working_key[4801]);

  always @(*) begin
    if(((Const_1221 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1222) ^ working_key[4802]) == 1'b1) begin
      delay_dltx_we0 = Const_1223;
    end else begin
      delay_dltx_we0 = Const_1224;
    end
  end

  assign Const_1225 = (1'd0 ^ working_key[4803]);
  assign Const_1226 = (1'd1 ^ working_key[4804]);
  assign Const_1227 = (1'd0 ^ working_key[4805]);
  assign Const_1228 = (1'd0 ^ working_key[4806]);

  always @(*) begin
    if(((Const_1225 == ap_CS_fsm_state1) & (ap_start == Const_1226) ^ working_key[4807]) == 1'b1) begin
      deth_ap_vld = Const_1228;
    end else begin
      deth_ap_vld = Const_1227;
    end
  end

  assign Const_1229 = (1'd1 ^ working_key[4808]);
  assign Const_1230 = (1'd0 ^ working_key[4809]);
  assign Const_1231 = (1'd1 ^ working_key[4810]);
  assign Const_1232 = (1'd1 ^ working_key[4811]);

  always @(*) begin
    if(((Const_1229 == ap_CS_fsm_state1) & (ap_start == Const_1230) ^ working_key[4812]) == 1'b1) begin
      detl_ap_vld = Const_1231;
    end else begin
      detl_ap_vld = Const_1232;
    end
  end

  assign Const_1233 = (1'd1 ^ working_key[4813]);
  assign Const_1234 = (1'd0 ^ working_key[4814]);
  assign Const_1235 = (1'd0 ^ working_key[4815]);
  assign Const_1236 = (1'd0 ^ working_key[4816]);

  always @(*) begin
    if(((Const_1233 == ap_CS_fsm_state1) & (ap_start == Const_1234) ^ working_key[4817]) == 1'b1) begin
      nbh_ap_vld = Const_1236;
    end else begin
      nbh_ap_vld = Const_1235;
    end
  end

  assign Const_1237 = (1'd0 ^ working_key[4818]);
  assign Const_1238 = (1'd0 ^ working_key[4819]);
  assign Const_1239 = (1'd0 ^ working_key[4820]);
  assign Const_1240 = (1'd0 ^ working_key[4821]);

  always @(*) begin
    if(((Const_1237 == ap_CS_fsm_state1) & (ap_start == Const_1238) ^ working_key[4822]) == 1'b1) begin
      nbl_ap_vld = Const_1240;
    end else begin
      nbl_ap_vld = Const_1239;
    end
  end

  assign Const_1241 = (1'd1 ^ working_key[4823]);
  assign Const_1242 = (1'd0 ^ working_key[4824]);
  assign Const_1243 = (1'd0 ^ working_key[4825]);
  assign Const_1244 = (1'd0 ^ working_key[4826]);

  always @(*) begin
    if(((Const_1241 == ap_CS_fsm_state1) & (ap_start == Const_1242) ^ working_key[4827]) == 1'b1) begin
      ph1_ap_vld = Const_1244;
    end else begin
      ph1_ap_vld = Const_1243;
    end
  end

  assign Const_1245 = (1'd1 ^ working_key[4828]);
  assign Const_1246 = (1'd0 ^ working_key[4829]);
  assign Const_1247 = (1'd1 ^ working_key[4830]);
  assign Const_1248 = (1'd0 ^ working_key[4831]);

  always @(*) begin
    if(((Const_1245 == ap_CS_fsm_state1) & (ap_start == Const_1246) ^ working_key[4832]) == 1'b1) begin
      ph2_ap_vld = Const_1248;
    end else begin
      ph2_ap_vld = Const_1247;
    end
  end

  assign Const_1249 = (1'd1 ^ working_key[4833]);
  assign Const_1250 = (1'd1 ^ working_key[4834]);
  assign Const_1251 = (1'd0 ^ working_key[4835]);
  assign Const_1252 = (1'd0 ^ working_key[4836]);

  always @(*) begin
    if(((Const_1249 == ap_CS_fsm_state1) & (ap_start == Const_1250) ^ working_key[4837]) == 1'b1) begin
      plt1_ap_vld = Const_1252;
    end else begin
      plt1_ap_vld = Const_1251;
    end
  end

  assign Const_1253 = (1'd1 ^ working_key[4838]);
  assign Const_1254 = (1'd0 ^ working_key[4839]);
  assign Const_1255 = (1'd1 ^ working_key[4840]);
  assign Const_1256 = (1'd1 ^ working_key[4841]);

  always @(*) begin
    if(((Const_1253 == ap_CS_fsm_state1) & (ap_start == Const_1254) ^ working_key[4842]) == 1'b1) begin
      plt2_ap_vld = Const_1256;
    end else begin
      plt2_ap_vld = Const_1255;
    end
  end

  assign Const_1257 = (1'd1 ^ working_key[4843]);
  assign Const_1258 = (1'd1 ^ working_key[4844]);
  assign Const_1259 = (1'd0 ^ working_key[4845]);
  assign Const_1260 = (1'd0 ^ working_key[4846]);

  always @(*) begin
    if(((Const_1257 == ap_CS_fsm_state1) & (ap_start == Const_1258) ^ working_key[4847]) == 1'b1) begin
      rh1_ap_vld = Const_1260;
    end else begin
      rh1_ap_vld = Const_1259;
    end
  end

  assign Const_1261 = (1'd0 ^ working_key[4848]);
  assign Const_1262 = (1'd0 ^ working_key[4849]);
  assign Const_1263 = (1'd1 ^ working_key[4850]);
  assign Const_1264 = (1'd1 ^ working_key[4851]);

  always @(*) begin
    if(((Const_1261 == ap_CS_fsm_state1) & (ap_start == Const_1262) ^ working_key[4852]) == 1'b1) begin
      rh2_ap_vld = Const_1263;
    end else begin
      rh2_ap_vld = Const_1264;
    end
  end

  assign Const_1265 = (1'd0 ^ working_key[4853]);
  assign Const_1266 = (1'd1 ^ working_key[4854]);
  assign Const_1267 = (1'd0 ^ working_key[4855]);
  assign Const_1268 = (1'd0 ^ working_key[4856]);

  always @(*) begin
    if(((Const_1265 == ap_CS_fsm_state1) & (ap_start == Const_1266) ^ working_key[4857]) == 1'b1) begin
      rlt1_ap_vld = Const_1268;
    end else begin
      rlt1_ap_vld = Const_1267;
    end
  end

  assign Const_1269 = (1'd0 ^ working_key[4858]);
  assign Const_1270 = (1'd1 ^ working_key[4859]);
  assign Const_1271 = (1'd0 ^ working_key[4860]);
  assign Const_1272 = (1'd0 ^ working_key[4861]);

  always @(*) begin
    if(((Const_1269 == ap_CS_fsm_state1) & (ap_start == Const_1270) ^ working_key[4862]) == 1'b1) begin
      rlt2_ap_vld = Const_1272;
    end else begin
      rlt2_ap_vld = Const_1271;
    end
  end

  assign Const_1273 = (1'd1 ^ working_key[4863]);
  assign Const_1274 = (1'd1 ^ working_key[4864]);
  assign Const_1275 = (1'd1 ^ working_key[4865]);

  always @(*) begin
    if(((Const_1273 == ap_CS_fsm_state4) ^ working_key[4866]) == 1'b1) begin
      tqmf_ce0 = Const_1274;
    end else begin
      tqmf_ce0 = Const_1275;
    end
  end

  assign Const_1276 = (1'd0 ^ working_key[4867]);
  assign Const_1277 = (1'd0 ^ working_key[4868]);
  assign Const_1278 = (1'd1 ^ working_key[4869]);
  assign Const_1279 = (1'd1 ^ working_key[4870]);

  always @(*) begin
    if(((exitcond1_fu_554_p2 == Const_1276) & (Const_1277 == ap_CS_fsm_state4) ^ working_key[4871]) == 1'b1) begin
      tqmf_we0 = Const_1278;
    end else begin
      tqmf_we0 = Const_1279;
    end
  end

  assign Const_1280 = (1'd0 ^ working_key[4872]);
  assign Const_1281 = (1'd1 ^ working_key[4873]);
  assign Const_1282 = (1'd0 ^ working_key[4875]);
  assign Const_1283 = (1'd1 ^ working_key[4876]);
  assign Const_1284 = (1'd0 ^ working_key[4878]);
  assign Const_1285 = (1'd1 ^ working_key[4879]);
  assign Const_1286 = (1'd0 ^ working_key[4881]);
  assign Const_1287 = (1'd0 ^ working_key[4882]);
  assign Const_1288 = (1'd0 ^ working_key[4884]);
  assign Const_1289 = (1'd0 ^ working_key[4885]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_1280 == ap_CS_fsm_state1) & (ap_start == Const_1281) ^ working_key[4874]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        if(((Const_1282 == ap_CS_fsm_state2) & (exitcond3_fu_514_p2 == Const_1283) ^ working_key[4877]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state3: begin
        if(((exitcond2_fu_534_p2 == Const_1284) & (Const_1285 == ap_CS_fsm_state3) ^ working_key[4880]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        if(((exitcond1_fu_554_p2 == Const_1286) & (Const_1287 == ap_CS_fsm_state4) ^ working_key[4883]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state5: begin
        if(((exitcond_fu_571_p2 == Const_1288) & (Const_1289 == ap_CS_fsm_state5) ^ working_key[4886]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign accumc_address0 = tmp_12_fu_583_p1;
  assign Const_1290 = (32'd89478442 ^ working_key[4918:4887]);
  assign accumc_d0 = Const_1290;
  assign accumd_address0 = tmp_12_fu_583_p1;
  assign Const_1291 = (32'd2845136213 ^ working_key[4950:4919]);
  assign accumd_d0 = Const_1291;
  assign Const_1292 = (32'd1464685142 ^ working_key[4982:4951]);
  assign ah1 = Const_1292;
  assign Const_1293 = (32'd4271547565 ^ working_key[5014:4983]);
  assign ah2 = Const_1293;
  assign Const_1294 = (32'd89478442 ^ working_key[5046:5015]);
  assign al1 = Const_1294;
  assign Const_1295 = (32'd4254422357 ^ working_key[5078:5047]);
  assign al2 = Const_1295;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign Const_1296 = (32'd1960125803 ^ working_key[5110:5079]);
  assign dec_ah1 = Const_1296;
  assign Const_1297 = (32'd3920251605 ^ working_key[5142:5111]);
  assign dec_ah2 = Const_1297;
  assign Const_1298 = (32'd1431655087 ^ working_key[5174:5143]);
  assign dec_al1 = Const_1298;
  assign Const_1299 = (32'd2572506448 ^ working_key[5206:5175]);
  assign dec_al2 = Const_1299;
  assign dec_del_bph_address0 = tmp_s_fu_546_p1;
  assign Const_1300 = (32'd1960125802 ^ working_key[5238:5207]);
  assign dec_del_bph_d0 = Const_1300;
  assign dec_del_bpl_address0 = tmp_s_fu_546_p1;
  assign Const_1301 = (32'd3920251605 ^ working_key[5270:5239]);
  assign dec_del_bpl_d0 = Const_1301;
  assign dec_del_dhx_address0 = tmp_fu_526_p1;
  assign Const_1302 = (32'd1431655087 ^ working_key[5302:5271]);
  assign dec_del_dhx_d0 = Const_1302;
  assign dec_del_dltx_address0 = tmp_fu_526_p1;
  assign Const_1303 = (32'd3646248272 ^ working_key[5334:5303]);
  assign dec_del_dltx_d0 = Const_1303;
  assign Const_1304 = (15'd9571 ^ working_key[5349:5335]);
  assign dec_deth = Const_1304;
  assign Const_1305 = (15'd27018 ^ working_key[5364:5350]);
  assign dec_detl = Const_1305;
  assign Const_1306 = (32'd2796104533 ^ working_key[5396:5365]);
  assign dec_nbh = Const_1306;
  assign Const_1307 = (32'd1431653055 ^ working_key[5428:5397]);
  assign dec_nbl = Const_1307;
  assign Const_1308 = (32'd1700091201 ^ working_key[5460:5429]);
  assign dec_ph1 = Const_1308;
  assign Const_1309 = (32'd3545535914 ^ working_key[5492:5461]);
  assign dec_ph2 = Const_1309;
  assign Const_1310 = (32'd2796104533 ^ working_key[5524:5493]);
  assign dec_plt1 = Const_1310;
  assign Const_1311 = (32'd1431653055 ^ working_key[5556:5525]);
  assign dec_plt2 = Const_1311;
  assign Const_1312 = (32'd1700091201 ^ working_key[5588:5557]);
  assign dec_rh1 = Const_1312;
  assign Const_1313 = (32'd1563773274 ^ working_key[5620:5589]);
  assign dec_rh2 = Const_1313;
  assign Const_1314 = (32'd4201288373 ^ working_key[5652:5621]);
  assign dec_rlt1 = Const_1314;
  assign Const_1315 = (32'd357913771 ^ working_key[5684:5653]);
  assign dec_rlt2 = Const_1315;
  assign delay_bph_address0 = tmp_s_fu_546_p1;
  assign Const_1316 = (32'd2790610260 ^ working_key[5716:5685]);
  assign delay_bph_d0 = Const_1316;
  assign delay_bpl_address0 = tmp_s_fu_546_p1;
  assign Const_1317 = (32'd1563773274 ^ working_key[5748:5717]);
  assign delay_bpl_d0 = Const_1317;
  assign delay_dhx_address0 = tmp_fu_526_p1;
  assign Const_1318 = (32'd4201288373 ^ working_key[5780:5749]);
  assign delay_dhx_d0 = Const_1318;
  assign delay_dltx_address0 = tmp_fu_526_p1;
  assign Const_1319 = (32'd357913771 ^ working_key[5812:5781]);
  assign delay_dltx_d0 = Const_1319;
  assign Const_1320 = (15'd21852 ^ working_key[5827:5813]);
  assign deth = Const_1320;
  assign Const_1321 = (32'd2461396106 ^ working_key[5859:5828]);
  assign detl = Const_1321;
  assign Const_1322 = (5'd18 ^ working_key[5864:5860]);
  assign Const_1323 = (1'd0 ^ working_key[5866]);
  assign Const_1324 = (1'd0 ^ working_key[5867]);
  assign exitcond1_fu_554_p2 = ((((working_key[5865] == 1'b1)? i_2_reg_300 == Const_1322 : i_2_reg_300 > Const_1322) ^ working_key[5868]) == 1'b1)? Const_1323 : Const_1324;
  assign Const_1325 = (3'd3 ^ working_key[5871:5869]);
  assign Const_1326 = (1'd0 ^ working_key[5873]);
  assign Const_1327 = (1'd0 ^ working_key[5874]);
  assign exitcond2_fu_534_p2 = ((((working_key[5872] == 1'b1)? i_1_reg_289 == Const_1325 : i_1_reg_289 > Const_1325) ^ working_key[5875]) == 1'b1)? Const_1327 : Const_1326;
  assign Const_1328 = (3'd4 ^ working_key[5878:5876]);
  assign Const_1329 = (1'd1 ^ working_key[5880]);
  assign Const_1330 = (1'd1 ^ working_key[5881]);
  assign exitcond3_fu_514_p2 = ((((working_key[5879] == 1'b1)? i_reg_278 == Const_1328 : i_reg_278 < Const_1328) ^ working_key[5882]) == 1'b1)? Const_1330 : Const_1329;
  assign Const_1331 = (4'd1 ^ working_key[5886:5883]);
  assign Const_1332 = (1'd1 ^ working_key[5888]);
  assign Const_1333 = (1'd1 ^ working_key[5889]);
  assign exitcond_fu_571_p2 = ((((working_key[5887] == 1'b1)? i_3_reg_311 > Const_1331 : i_3_reg_311 == Const_1331) ^ working_key[5890]) == 1'b1)? Const_1332 : Const_1333;
  assign Const_1334 = (3'd3 ^ working_key[5893:5891]);
  assign i_4_fu_520_p2 = (working_key[5894] == 1'b1)? i_reg_278 + Const_1334 : i_reg_278 * Const_1334;
  assign Const_1335 = (3'd3 ^ working_key[5897:5895]);
  assign i_5_fu_540_p2 = (working_key[5898] == 1'b1)? i_1_reg_289 + Const_1335 : i_1_reg_289 - Const_1335;
  assign Const_1336 = (5'd8 ^ working_key[5903:5899]);
  assign i_6_fu_560_p2 = (working_key[5904] == 1'b1)? i_2_reg_300 + Const_1336 : i_2_reg_300 << Const_1336;
  assign Const_1337 = (4'd14 ^ working_key[5908:5905]);
  assign i_7_fu_577_p2 = (working_key[5909] == 1'b1)? i_3_reg_311 + Const_1337 : i_3_reg_311 >> Const_1337;
  assign Const_1338 = (32'd178956885 ^ working_key[5941:5910]);
  assign nbh = Const_1338;
  assign Const_1339 = (32'd1395305130 ^ working_key[5973:5942]);
  assign nbl = Const_1339;
  assign Const_1340 = (32'd2929370285 ^ working_key[6005:5974]);
  assign ph1 = Const_1340;
  assign Const_1341 = (32'd4248127834 ^ working_key[6037:6006]);
  assign ph2 = Const_1341;
  assign Const_1342 = (32'd178956885 ^ working_key[6069:6038]);
  assign plt1 = Const_1342;
  assign Const_1343 = (32'd2066393770 ^ working_key[6101:6070]);
  assign plt2 = Const_1343;
  assign Const_1344 = (32'd2929370285 ^ working_key[6133:6102]);
  assign rh1 = Const_1344;
  assign Const_1345 = (32'd4248127834 ^ working_key[6165:6134]);
  assign rh2 = Const_1345;
  assign Const_1346 = (32'd178956885 ^ working_key[6197:6166]);
  assign rlt1 = Const_1346;
  assign Const_1347 = (32'd1395305130 ^ working_key[6229:6198]);
  assign rlt2 = Const_1347;
  assign tmp_11_fu_566_p1 = i_2_reg_300;
  assign tmp_12_fu_583_p1 = i_3_reg_311;
  assign tmp_fu_526_p1 = i_reg_278;
  assign tmp_s_fu_546_p1 = i_1_reg_289;
  assign tqmf_address0 = tmp_11_fu_566_p1;
  assign Const_1348 = (7'd45 ^ working_key[6236:6230]);
  assign tqmf_d0 = Const_1348;
  assign working_key = { locking_key[1675:0] };

endmodule

