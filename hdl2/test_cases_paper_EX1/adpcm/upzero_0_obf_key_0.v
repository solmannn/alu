
module upzero_0_obf
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
  locking_key
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
  wire Const_1349;
  wire Const_1350;
  wire Const_1351;
  wire [2:0] Const_1352;
  wire Const_1353;
  wire Const_1354;
  wire Const_1355;
  wire Const_1356;
  wire [2:0] Const_1357;
  wire Const_1358;
  wire Const_1359;
  wire Const_1360;
  wire Const_1361;
  wire Const_1362;
  wire Const_1363;
  wire Const_1364;
  wire Const_1365;
  wire Const_1366;
  wire Const_1367;
  wire Const_1368;
  wire Const_1369;
  wire Const_1370;
  wire Const_1371;
  wire Const_1372;
  wire Const_1373;
  wire Const_1374;
  wire Const_1375;
  wire Const_1376;
  wire Const_1377;
  wire Const_1378;
  wire Const_1379;
  wire Const_1380;
  wire Const_1381;
  wire Const_1382;
  wire Const_1383;
  wire Const_1384;
  wire Const_1385;
  wire Const_1386;
  wire Const_1387;
  wire Const_1388;
  wire Const_1389;
  wire Const_1390;
  wire Const_1391;
  wire Const_1392;
  wire Const_1393;
  wire Const_1394;
  wire Const_1395;
  wire Const_1396;
  wire Const_1397;
  wire Const_1398;
  wire Const_1399;
  wire Const_1400;
  wire Const_1401;
  wire Const_1402;
  wire Const_1403;
  wire Const_1404;
  wire Const_1405;
  wire Const_1406;
  wire Const_1407;
  wire [2:0] Const_1408;
  wire Const_1409;
  wire [2:0] Const_1410;
  wire Const_1411;
  wire Const_1412;
  wire Const_1413;
  wire Const_1414;
  wire Const_1415;
  wire [2:0] Const_1416;
  wire Const_1417;
  wire Const_1418;
  wire Const_1419;
  wire Const_1420;
  wire [2:0] Const_1421;
  wire Const_1422;
  wire [2:0] Const_1423;
  wire Const_1424;
  wire [2:0] Const_1425;
  wire Const_1426;
  wire [2:0] Const_1427;
  wire Const_1428;
  wire Const_1429;
  wire Const_1430;
  wire Const_1431;
  wire Const_1432;
  wire Const_1433;
  wire Const_1434;
  wire Const_1435;
  wire Const_1436;
  wire Const_1437;
  wire Const_1438;
  wire Const_1439;
  wire Const_1440;
  wire Const_1441;
  wire Const_1442;
  wire Const_1443;
  wire Const_1444;
  wire Const_1445;
  wire Const_1446;
  wire Const_1447;
  wire Const_1448;
  wire Const_1449;
  wire Const_1450;
  wire Const_1451;
  wire Const_1452;
  wire Const_1453;
  wire Const_1454;
  wire Const_1455;
  wire Const_1456;
  wire Const_1457;
  wire Const_1458;
  wire Const_1459;
  wire Const_1460;
  wire Const_1461;
  wire Const_1462;
  wire Const_1463;
  wire Const_1464;
  wire Const_1465;
  wire Const_1466;
  wire Const_1467;
  wire Const_1468;
  wire [2:0] Const_1469;
  wire [2:0] Const_1470;
  wire Const_1471;
  wire Const_1472;
  wire [2:0] Const_1473;
  wire Const_1474;
  wire Const_1475;
  wire [2:0] Const_1476;
  wire [2:0] Const_1477;
  wire [31:0] Const_1478;
  wire [31:0] Const_1479;
  wire Const_1480;
  wire [24:0] Const_1481;
  wire [24:0] Const_1482;
  wire [16:0] Const_1483;
  wire Const_1484;
  wire Const_1485;
  input [12286:0] locking_key;
  wire [336:0] working_key;

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

  assign Const_1349 = (1'd0 ^ working_key[6237]);
  assign Const_1350 = (1'd0 ^ working_key[6238]);
  assign Const_1351 = (1'd1 ^ working_key[6239]);
  assign Const_1352 = (3'd5 ^ working_key[6242:6240]);
  assign Const_1353 = (1'd1 ^ working_key[6243]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_171_p2 == Const_1349) & (Const_1350 == ap_CS_fsm_state1) & (ap_start == Const_1351) ^ working_key[6244]) == 1'b0) begin
      i_1_reg_140 <= Const_1352;
    end else if(Const_1353 == ap_CS_fsm_state5) begin
      i_1_reg_140 <= i_3_reg_312;
    end 
  end

  assign Const_1354 = (1'd0 ^ working_key[6245]);
  assign Const_1355 = (1'd1 ^ working_key[6246]);
  assign Const_1356 = (1'd0 ^ working_key[6247]);
  assign Const_1357 = (3'd2 ^ working_key[6250:6248]);
  assign Const_1358 = (1'd1 ^ working_key[6251]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_171_p2 == Const_1354) & (Const_1355 == ap_CS_fsm_state1) & (ap_start == Const_1356) ^ working_key[6252]) == 1'b0) begin
      i_reg_151 <= Const_1357;
    end else if(Const_1358 == ap_CS_fsm_state6) begin
      i_reg_151 <= i_2_reg_330;
    end 
  end

  assign Const_1359 = (1'd0 ^ working_key[6253]);
  assign Const_1360 = (1'd0 ^ working_key[6254]);
  assign Const_1361 = (1'd0 ^ working_key[6255]);

  always @(posedge ap_clk) begin
    if((exitcond_fu_177_p2 == Const_1359) & (tmp_reg_305 == Const_1360) & (Const_1361 == ap_CS_fsm_state2)) begin
      bli_addr_1_reg_322 <= tmp_5_fu_189_p1;
    end 
  end

  assign Const_1362 = (1'd0 ^ working_key[6256]);
  assign Const_1363 = (1'd0 ^ working_key[6257]);
  assign Const_1364 = (1'd1 ^ working_key[6258]);

  always @(posedge ap_clk) begin
    if((exitcond1_fu_195_p2 == Const_1362) & (tmp_reg_305 == Const_1363) & (Const_1364 == ap_CS_fsm_state2)) begin
      bli_addr_reg_335 <= tmp_1_fu_207_p1;
    end 
  end

  assign Const_1365 = (1'd0 ^ working_key[6259]);

  always @(posedge ap_clk) begin
    if(Const_1365 == ap_CS_fsm_state4) begin
      bli_load_1_reg_351 <= bli_q0;
      tmp_6_reg_346 <= tmp_6_fu_212_p2;
    end 
  end

  assign Const_1366 = (1'd1 ^ working_key[6260]);
  assign Const_1367 = (1'd0 ^ working_key[6261]);

  always @(posedge ap_clk) begin
    if((Const_1366 == ap_CS_fsm_state1) & (ap_start == Const_1367)) begin
      dlt_cast1_reg_294 <= dlt_cast1_fu_167_p1;
      tmp_reg_305 <= tmp_fu_171_p2;
    end 
  end

  assign Const_1368 = (1'd0 ^ working_key[6262]);

  always @(posedge ap_clk) begin
    if(Const_1368 == ap_CS_fsm_state8) begin
      dlti_load_3_reg_367 <= dlti_q1;
    end 
  end

  assign Const_1369 = (1'd1 ^ working_key[6263]);
  assign Const_1370 = (1'd1 ^ working_key[6264]);

  always @(posedge ap_clk) begin
    if((tmp_reg_305 == Const_1369) & (Const_1370 == ap_CS_fsm_state2)) begin
      i_2_reg_330 <= i_2_fu_201_p2;
    end 
  end

  assign Const_1371 = (1'd1 ^ working_key[6265]);
  assign Const_1372 = (1'd1 ^ working_key[6266]);

  always @(posedge ap_clk) begin
    if((tmp_reg_305 == Const_1371) & (Const_1372 == ap_CS_fsm_state2)) begin
      i_3_reg_312 <= i_3_fu_183_p2;
    end 
  end

  assign Const_1373 = (1'd0 ^ working_key[6267]);
  assign Const_1374 = (1'd0 ^ working_key[6268]);
  assign Const_1375 = (1'd0 ^ working_key[6269]);
  assign Const_1376 = (1'd1 ^ working_key[6270]);

  always @(posedge ap_clk) begin
    if((Const_1373 == ap_CS_fsm_state9) | (Const_1374 == ap_CS_fsm_state8) | (Const_1375 == ap_CS_fsm_state7) | (Const_1376 == ap_CS_fsm_state3)) begin
      reg_162 <= dlti_q0;
    end 
  end

  assign Const_1377 = (1'd0 ^ working_key[6271]);
  assign Const_1378 = (1'd0 ^ working_key[6272]);
  assign Const_1379 = (1'd0 ^ working_key[6273]);
  assign Const_1380 = (1'd1 ^ working_key[6274]);
  assign Const_1381 = (1'd1 ^ working_key[6275]);

  always @(*) begin
    if((((Const_1377 == ap_CS_fsm_state10) | (ap_start == Const_1378) & (Const_1379 == ap_CS_fsm_state1)) ^ working_key[6276]) == 1'b1) begin
      ap_done = Const_1380;
    end else begin
      ap_done = Const_1381;
    end
  end

  assign Const_1382 = (1'd1 ^ working_key[6277]);
  assign Const_1383 = (1'd0 ^ working_key[6278]);
  assign Const_1384 = (1'd1 ^ working_key[6279]);
  assign Const_1385 = (1'd1 ^ working_key[6280]);

  always @(*) begin
    if(((ap_start == Const_1382) & (Const_1383 == ap_CS_fsm_state1) ^ working_key[6281]) == 1'b1) begin
      ap_idle = Const_1384;
    end else begin
      ap_idle = Const_1385;
    end
  end

  assign Const_1386 = (1'd0 ^ working_key[6282]);
  assign Const_1387 = (1'd1 ^ working_key[6283]);
  assign Const_1388 = (1'd0 ^ working_key[6284]);

  always @(*) begin
    if(((Const_1386 == ap_CS_fsm_state10) ^ working_key[6285]) == 1'b1) begin
      ap_ready = Const_1388;
    end else begin
      ap_ready = Const_1387;
    end
  end

  assign Const_1389 = (1'd1 ^ working_key[6286]);
  assign Const_1390 = (1'd1 ^ working_key[6287]);
  assign Const_1391 = (1'd0 ^ working_key[6288]);
  assign Const_1392 = (1'd1 ^ working_key[6289]);

  always @(*) begin
    if(((Const_1389 == ap_CS_fsm_state6) ^ working_key[6292]) == 1'b0) begin
      bli_address0 = bli_addr_reg_335;
    end else if((((Const_1390 == ap_CS_fsm_state3) | (Const_1391 == ap_CS_fsm_state5)) ^ working_key[6291]) == 1'b1) begin
      bli_address0 = bli_addr_1_reg_322;
    end else if(((Const_1392 == ap_CS_fsm_state2) ^ working_key[6290]) == 1'b1) begin
      bli_address0 = 'bx;
    end else begin
      bli_address0 = tmp_1_fu_207_p1;
    end
  end

  assign Const_1393 = (1'd1 ^ working_key[6293]);
  assign Const_1394 = (1'd0 ^ working_key[6294]);
  assign Const_1395 = (1'd0 ^ working_key[6295]);
  assign Const_1396 = (1'd1 ^ working_key[6296]);
  assign Const_1397 = (1'd1 ^ working_key[6297]);
  assign Const_1398 = (1'd1 ^ working_key[6298]);

  always @(*) begin
    if((((Const_1393 == ap_CS_fsm_state2) | (Const_1394 == ap_CS_fsm_state3) | (Const_1395 == ap_CS_fsm_state6) | (Const_1396 == ap_CS_fsm_state5)) ^ working_key[6299]) == 1'b1) begin
      bli_ce0 = Const_1397;
    end else begin
      bli_ce0 = Const_1398;
    end
  end

  assign Const_1399 = (1'd0 ^ working_key[6300]);
  assign Const_1400 = (1'd0 ^ working_key[6301]);

  always @(*) begin
    if(((Const_1399 == ap_CS_fsm_state6) ^ working_key[6303]) == 1'b0) begin
      bli_d0 = tmp_3_fu_289_p1;
    end else if(((Const_1400 == ap_CS_fsm_state5) ^ working_key[6302]) == 1'b1) begin
      bli_d0 = 'bx;
    end else begin
      bli_d0 = tmp_4_cast_fu_262_p1;
    end
  end

  assign Const_1401 = (1'd0 ^ working_key[6304]);
  assign Const_1402 = (1'd0 ^ working_key[6305]);
  assign Const_1403 = (1'd0 ^ working_key[6306]);
  assign Const_1404 = (1'd0 ^ working_key[6307]);

  always @(*) begin
    if((((Const_1401 == ap_CS_fsm_state6) | (Const_1402 == ap_CS_fsm_state5)) ^ working_key[6308]) == 1'b1) begin
      bli_we0 = Const_1404;
    end else begin
      bli_we0 = Const_1403;
    end
  end

  assign Const_1405 = (1'd1 ^ working_key[6309]);
  assign Const_1406 = (1'd0 ^ working_key[6310]);
  assign Const_1407 = (1'd1 ^ working_key[6311]);
  assign Const_1408 = (3'd1 ^ working_key[6314:6312]);
  assign Const_1409 = (1'd0 ^ working_key[6315]);
  assign Const_1410 = (3'd1 ^ working_key[6318:6316]);
  assign Const_1411 = (1'd0 ^ working_key[6319]);
  assign Const_1412 = (1'd1 ^ working_key[6320]);
  assign Const_1413 = (1'd1 ^ working_key[6321]);
  assign Const_1414 = (1'd1 ^ working_key[6322]);
  assign Const_1415 = (1'd0 ^ working_key[6323]);
  assign Const_1416 = (3'd6 ^ working_key[6326:6324]);
  assign Const_1417 = (1'd1 ^ working_key[6327]);
  assign Const_1418 = (1'd0 ^ working_key[6328]);
  assign Const_1419 = (1'd0 ^ working_key[6329]);

  always @(*) begin
    if(((Const_1405 == ap_CS_fsm_state9) ^ working_key[6334]) == 1'b1) begin
      dlti_address0 = dlti_addr_3_reg_357;
    end else if((((Const_1406 == ap_CS_fsm_state8) | (Const_1407 == ap_CS_fsm_state10)) ^ working_key[6333]) == 1'b0) begin
      dlti_address0 = Const_1408;
    end else if(((Const_1409 == ap_CS_fsm_state7) ^ working_key[6332]) == 1'b1) begin
      dlti_address0 = Const_1410;
    end else if(((Const_1411 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == Const_1412) & (tmp_reg_305 == Const_1413) | (tmp_reg_305 == Const_1414) & (exitcond1_fu_195_p2 == Const_1415)) ^ working_key[6331]) == 1'b0) begin
      dlti_address0 = Const_1416;
    end else if(((exitcond_fu_177_p2 == Const_1417) & (tmp_reg_305 == Const_1418) & (Const_1419 == ap_CS_fsm_state2) ^ working_key[6330]) == 1'b1) begin
      dlti_address0 = tmp_5_fu_189_p1;
    end else begin
      dlti_address0 = 'bx;
    end
  end

  assign Const_1420 = (1'd1 ^ working_key[6335]);
  assign Const_1421 = (3'd1 ^ working_key[6338:6336]);
  assign Const_1422 = (1'd0 ^ working_key[6339]);
  assign Const_1423 = (3'd6 ^ working_key[6342:6340]);
  assign Const_1424 = (1'd0 ^ working_key[6343]);
  assign Const_1425 = (3'd7 ^ working_key[6346:6344]);
  assign Const_1426 = (1'd0 ^ working_key[6347]);
  assign Const_1427 = (3'd0 ^ working_key[6350:6348]);

  always @(*) begin
    if(((Const_1420 == ap_CS_fsm_state10) ^ working_key[6354]) == 1'b1) begin
      dlti_address1 = Const_1421;
    end else if(((Const_1422 == ap_CS_fsm_state9) ^ working_key[6353]) == 1'b0) begin
      dlti_address1 = Const_1423;
    end else if(((Const_1424 == ap_CS_fsm_state8) ^ working_key[6352]) == 1'b1) begin
      dlti_address1 = Const_1425;
    end else if(((Const_1426 == ap_CS_fsm_state7) ^ working_key[6351]) == 1'b1) begin
      dlti_address1 = 'bx;
    end else begin
      dlti_address1 = Const_1427;
    end
  end

  assign Const_1428 = (1'd0 ^ working_key[6355]);
  assign Const_1429 = (1'd1 ^ working_key[6356]);
  assign Const_1430 = (1'd0 ^ working_key[6357]);
  assign Const_1431 = (1'd1 ^ working_key[6358]);
  assign Const_1432 = (1'd1 ^ working_key[6359]);
  assign Const_1433 = (1'd0 ^ working_key[6360]);
  assign Const_1434 = (1'd1 ^ working_key[6361]);
  assign Const_1435 = (1'd0 ^ working_key[6362]);
  assign Const_1436 = (1'd0 ^ working_key[6363]);
  assign Const_1437 = (1'd0 ^ working_key[6364]);
  assign Const_1438 = (1'd1 ^ working_key[6365]);
  assign Const_1439 = (1'd0 ^ working_key[6366]);
  assign Const_1440 = (1'd1 ^ working_key[6367]);
  assign Const_1441 = (1'd1 ^ working_key[6368]);

  always @(*) begin
    if((((Const_1428 == ap_CS_fsm_state9) | (Const_1429 == ap_CS_fsm_state8) | (Const_1430 == ap_CS_fsm_state7) | (Const_1431 == ap_CS_fsm_state10) | (exitcond_fu_177_p2 == Const_1432) & (tmp_reg_305 == Const_1433) & (Const_1434 == ap_CS_fsm_state2) | (Const_1435 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == Const_1436) & (tmp_reg_305 == Const_1437) | (tmp_reg_305 == Const_1438) & (exitcond1_fu_195_p2 == Const_1439))) ^ working_key[6369]) == 1'b1) begin
      dlti_ce0 = Const_1440;
    end else begin
      dlti_ce0 = Const_1441;
    end
  end

  assign Const_1442 = (1'd0 ^ working_key[6370]);
  assign Const_1443 = (1'd1 ^ working_key[6371]);
  assign Const_1444 = (1'd0 ^ working_key[6372]);
  assign Const_1445 = (1'd0 ^ working_key[6373]);
  assign Const_1446 = (1'd1 ^ working_key[6374]);
  assign Const_1447 = (1'd1 ^ working_key[6375]);

  always @(*) begin
    if((((Const_1442 == ap_CS_fsm_state9) | (Const_1443 == ap_CS_fsm_state8) | (Const_1444 == ap_CS_fsm_state7) | (Const_1445 == ap_CS_fsm_state10)) ^ working_key[6376]) == 1'b1) begin
      dlti_ce1 = Const_1446;
    end else begin
      dlti_ce1 = Const_1447;
    end
  end

  assign Const_1448 = (1'd0 ^ working_key[6377]);
  assign Const_1449 = (1'd1 ^ working_key[6378]);

  always @(*) begin
    if(((Const_1448 == ap_CS_fsm_state10) ^ working_key[6380]) == 1'b0) begin
      dlti_d0 = dlt_cast1_reg_294;
    end else if(((Const_1449 == ap_CS_fsm_state9) ^ working_key[6379]) == 1'b1) begin
      dlti_d0 = dlti_load_3_reg_367;
    end else begin
      dlti_d0 = 'bx;
    end
  end

  assign Const_1450 = (1'd1 ^ working_key[6381]);
  assign Const_1451 = (1'd1 ^ working_key[6382]);
  assign Const_1452 = (1'd0 ^ working_key[6383]);
  assign Const_1453 = (1'd0 ^ working_key[6384]);

  always @(*) begin
    if((((Const_1450 == ap_CS_fsm_state9) | (Const_1451 == ap_CS_fsm_state10)) ^ working_key[6385]) == 1'b1) begin
      dlti_we0 = Const_1453;
    end else begin
      dlti_we0 = Const_1452;
    end
  end

  assign Const_1454 = (1'd1 ^ working_key[6386]);
  assign Const_1455 = (1'd0 ^ working_key[6387]);
  assign Const_1456 = (1'd1 ^ working_key[6388]);
  assign Const_1457 = (1'd0 ^ working_key[6389]);
  assign Const_1458 = (1'd1 ^ working_key[6390]);

  always @(*) begin
    if((((Const_1454 == ap_CS_fsm_state9) | (Const_1455 == ap_CS_fsm_state8) | (Const_1456 == ap_CS_fsm_state10)) ^ working_key[6391]) == 1'b1) begin
      dlti_we1 = Const_1457;
    end else begin
      dlti_we1 = Const_1458;
    end
  end

  assign Const_1459 = (1'd1 ^ working_key[6392]);
  assign Const_1460 = (1'd0 ^ working_key[6393]);
  assign Const_1461 = (1'd1 ^ working_key[6395]);
  assign Const_1462 = (1'd0 ^ working_key[6396]);
  assign Const_1463 = (1'd0 ^ working_key[6397]);
  assign Const_1464 = (1'd1 ^ working_key[6398]);
  assign Const_1465 = (1'd0 ^ working_key[6399]);
  assign Const_1466 = (1'd0 ^ working_key[6400]);
  assign Const_1467 = (1'd0 ^ working_key[6401]);
  assign Const_1468 = (1'd1 ^ working_key[6402]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_1459 == ap_CS_fsm_state1) & (ap_start == Const_1460) ^ working_key[6394]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(((exitcond1_fu_195_p2 == Const_1461) & (tmp_reg_305 == Const_1462) & (Const_1463 == ap_CS_fsm_state2) ^ working_key[6404]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else if(((Const_1464 == ap_CS_fsm_state2) & ((exitcond_fu_177_p2 == Const_1465) & (tmp_reg_305 == Const_1466) | (tmp_reg_305 == Const_1467) & (exitcond1_fu_195_p2 == Const_1468)) ^ working_key[6403]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
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
  assign Const_1469 = (3'd0 ^ working_key[6407:6405]);
  assign dlti_addr_3_reg_357 = Const_1469;
  assign dlti_d1 = reg_162;
  assign Const_1470 = (3'd3 ^ working_key[6410:6408]);
  assign Const_1471 = (1'd1 ^ working_key[6412]);
  assign Const_1472 = (1'd1 ^ working_key[6413]);
  assign exitcond1_fu_195_p2 = ((((working_key[6411] == 1'b1)? i_reg_151 > Const_1470 : i_reg_151 == Const_1470) ^ working_key[6414]) == 1'b1)? Const_1471 : Const_1472;
  assign Const_1473 = (3'd4 ^ working_key[6417:6415]);
  assign Const_1474 = (1'd1 ^ working_key[6419]);
  assign Const_1475 = (1'd1 ^ working_key[6420]);
  assign exitcond_fu_177_p2 = ((((working_key[6418] == 1'b1)? i_1_reg_140 == Const_1473 : i_1_reg_140 < Const_1473) ^ working_key[6421]) == 1'b1)? Const_1474 : Const_1475;
  assign Const_1476 = (3'd2 ^ working_key[6424:6422]);
  assign i_2_fu_201_p2 = (working_key[6425] == 1'b1)? i_reg_151 * Const_1476 : i_reg_151 + Const_1476;
  assign Const_1477 = (3'd4 ^ working_key[6428:6426]);
  assign i_3_fu_183_p2 = (working_key[6429] == 1'b1)? i_1_reg_140 + Const_1477 : i_1_reg_140 << Const_1477;
  assign Const_1478 = (32'd2863310167 ^ working_key[6461:6430]);
  assign tmp_10_fu_232_p2 = (working_key[6462] == 1'b1)? bli_load_1_reg_351 >> Const_1478 : bli_load_1_reg_351 << Const_1478;
  assign tmp_11_fu_242_p4 = { { tmp_s_fu_237_p2[31:8] } };
  assign tmp_1_fu_207_p1 = i_reg_151;
  assign tmp_2_fu_273_p2 = (working_key[6463] == 1'b1)? tmp_7_fu_267_p2 * bli_q0 : tmp_7_fu_267_p2 - bli_q0;
  assign tmp_3_fu_289_p1 = tmp_8_fu_279_p4;
  assign tmp_4_cast_fu_262_p1 = tmp_4_fu_256_p2;
  assign tmp_4_fu_256_p2 = (working_key[6464] == 1'b1)? tmp_9_cast_cast_fu_224_p3 >> wd3_cast_fu_252_p1 : tmp_9_cast_cast_fu_224_p3 + wd3_cast_fu_252_p1;
  assign tmp_5_fu_189_p1 = i_1_reg_140;
  assign tmp_6_fu_212_p1 = dlt_cast1_reg_294;
  assign tmp_6_fu_212_p2 = (working_key[6465] == 1'b1)? reg_162 >> tmp_6_fu_212_p1 : reg_162 * tmp_6_fu_212_p1;
  assign Const_1479 = (32'd2066393762 ^ working_key[6497:6466]);
  assign tmp_7_fu_267_p2 = (working_key[6498] == 1'b1)? bli_q0 << Const_1479 : bli_q0 >> Const_1479;
  assign tmp_8_fu_279_p4 = { { tmp_2_fu_273_p2[31:8] } };
  assign Const_1480 = (1'd1 ^ working_key[6499]);
  assign Const_1481 = (25'd2927381 ^ working_key[6525:6501]);
  assign Const_1482 = (25'd22320426 ^ working_key[6550:6526]);
  assign tmp_9_cast_cast_fu_224_p3 = ((((working_key[6500] == 1'b1)? tmp_9_fu_217_p3[0:0] === Const_1480 : tmp_9_fu_217_p3[0:0] != Const_1480) ^ working_key[6551]) == 1'b1)? Const_1482 : Const_1481;
  assign tmp_9_fu_217_p3 = tmp_6_reg_346[32'd31];
  assign tmp_fu_171_p0 = dlt;
  assign Const_1483 = (17'd88052 ^ working_key[6568:6552]);
  assign Const_1484 = (1'd1 ^ working_key[6570]);
  assign Const_1485 = (1'd1 ^ working_key[6571]);
  assign tmp_fu_171_p2 = ((((working_key[6569] == 1'b1)? tmp_fu_171_p0 > Const_1483 : tmp_fu_171_p0 == Const_1483) ^ working_key[6572]) == 1'b1)? Const_1484 : Const_1485;
  assign tmp_s_fu_237_p2 = (working_key[6573] == 1'b1)? tmp_10_fu_232_p2 - bli_load_1_reg_351 : tmp_10_fu_232_p2 >> bli_load_1_reg_351;
  assign wd3_cast_fu_252_p1 = tmp_11_fu_242_p4;
  assign working_key = { locking_key[336:0] };

endmodule

