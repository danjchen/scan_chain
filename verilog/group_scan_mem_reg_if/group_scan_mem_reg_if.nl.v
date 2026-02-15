/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP1
// Date      : Thu Feb 12 21:29:36 2026
/////////////////////////////////////////////////////////////


module rwctr ( clk, rst_n, id_valid, static_wen, static_ren, static_addr, 
        static_wdata, static_ready, static_rdata, scan_wen, scan_ren, 
        scan_addr, scan_wdata, scan_rdata, scan_ready );
  input [11:0] static_addr;
  input [31:0] static_wdata;
  output [31:0] static_rdata;
  output [11:0] scan_addr;
  output [31:0] scan_wdata;
  input [31:0] scan_rdata;
  input clk, rst_n, id_valid, static_wen, static_ren, scan_ready;
  output static_ready, scan_wen, scan_ren;
  wire   holding, static_ready_w, scan_wen_w, scan_addr_w_11_, scan_addr_w_10_,
         scan_addr_w_9_, scan_addr_w_8_, scan_addr_w_7_, scan_addr_w_6_,
         scan_addr_w_5_, scan_addr_w_4_, scan_addr_w_3_, scan_addr_w_2_,
         scan_addr_w_1_, scan_addr_w_0_, scan_wdata_w_31_, scan_wdata_w_30_,
         scan_wdata_w_29_, scan_wdata_w_28_, scan_wdata_w_27_,
         scan_wdata_w_26_, scan_wdata_w_25_, scan_wdata_w_24_,
         scan_wdata_w_23_, scan_wdata_w_22_, scan_wdata_w_21_,
         scan_wdata_w_20_, scan_wdata_w_19_, scan_wdata_w_18_,
         scan_wdata_w_17_, scan_wdata_w_16_, scan_wdata_w_15_,
         scan_wdata_w_14_, scan_wdata_w_13_, scan_wdata_w_12_,
         scan_wdata_w_11_, scan_wdata_w_10_, scan_wdata_w_9_, scan_wdata_w_8_,
         scan_wdata_w_7_, scan_wdata_w_6_, scan_wdata_w_5_, scan_wdata_w_4_,
         scan_wdata_w_3_, scan_wdata_w_2_, scan_wdata_w_1_, scan_wdata_w_0_,
         n1, n3, n4, n6, n7, n2, n5, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;

  DFCNQD1 holding_reg ( .D(n16), .CP(clk), .CDN(rst_n), .Q(holding) );
  EDFCNQD1 static_rdata_reg_9_ ( .D(scan_rdata[9]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[9]) );
  EDFCNQD1 static_rdata_reg_8_ ( .D(scan_rdata[8]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[8]) );
  EDFCNQD1 static_rdata_reg_7_ ( .D(scan_rdata[7]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[7]) );
  EDFCNQD1 static_rdata_reg_6_ ( .D(scan_rdata[6]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[6]) );
  EDFCNQD1 static_rdata_reg_5_ ( .D(scan_rdata[5]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[5]) );
  EDFCNQD1 static_rdata_reg_4_ ( .D(scan_rdata[4]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[4]) );
  EDFCNQD1 static_rdata_reg_3_ ( .D(scan_rdata[3]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[3]) );
  EDFCNQD1 static_rdata_reg_31_ ( .D(scan_rdata[31]), .E(n20), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[31]) );
  EDFCNQD1 static_rdata_reg_30_ ( .D(scan_rdata[30]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[30]) );
  EDFCNQD1 static_rdata_reg_2_ ( .D(scan_rdata[2]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[2]) );
  EDFCNQD1 static_rdata_reg_29_ ( .D(scan_rdata[29]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[29]) );
  EDFCNQD1 static_rdata_reg_28_ ( .D(scan_rdata[28]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[28]) );
  EDFCNQD1 static_rdata_reg_27_ ( .D(scan_rdata[27]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[27]) );
  EDFCNQD1 static_rdata_reg_26_ ( .D(scan_rdata[26]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[26]) );
  EDFCNQD1 static_rdata_reg_25_ ( .D(scan_rdata[25]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[25]) );
  EDFCNQD1 static_rdata_reg_24_ ( .D(scan_rdata[24]), .E(n19), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[24]) );
  EDFCNQD1 static_rdata_reg_23_ ( .D(scan_rdata[23]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[23]) );
  EDFCNQD1 static_rdata_reg_22_ ( .D(scan_rdata[22]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[22]) );
  EDFCNQD1 static_rdata_reg_21_ ( .D(scan_rdata[21]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[21]) );
  EDFCNQD1 static_rdata_reg_20_ ( .D(scan_rdata[20]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[20]) );
  EDFCNQD1 static_rdata_reg_1_ ( .D(scan_rdata[1]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[1]) );
  EDFCNQD1 static_rdata_reg_19_ ( .D(scan_rdata[19]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[19]) );
  EDFCNQD1 static_rdata_reg_18_ ( .D(scan_rdata[18]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[18]) );
  EDFCNQD1 static_rdata_reg_17_ ( .D(scan_rdata[17]), .E(n18), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[17]) );
  EDFCNQD1 static_rdata_reg_16_ ( .D(scan_rdata[16]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[16]) );
  EDFCNQD1 static_rdata_reg_15_ ( .D(scan_rdata[15]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[15]) );
  EDFCNQD1 static_rdata_reg_14_ ( .D(scan_rdata[14]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[14]) );
  EDFCNQD1 static_rdata_reg_13_ ( .D(scan_rdata[13]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[13]) );
  EDFCNQD1 static_rdata_reg_12_ ( .D(scan_rdata[12]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[12]) );
  EDFCNQD1 static_rdata_reg_11_ ( .D(scan_rdata[11]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[11]) );
  EDFCNQD1 static_rdata_reg_10_ ( .D(scan_rdata[10]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[10]) );
  EDFCNQD1 static_rdata_reg_0_ ( .D(scan_rdata[0]), .E(n17), .CP(clk), .CDN(
        rst_n), .Q(static_rdata[0]) );
  DFCNQD1 scan_wen_reg ( .D(scan_wen_w), .CP(clk), .CDN(rst_n), .Q(scan_wen)
         );
  DFCNQD1 scan_ren_reg ( .D(n1), .CP(clk), .CDN(rst_n), .Q(scan_ren) );
  DFCNQD1 scan_addr_reg_11_ ( .D(scan_addr_w_11_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[11]) );
  DFCNQD1 scan_addr_reg_10_ ( .D(scan_addr_w_10_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[10]) );
  DFCNQD1 scan_addr_reg_9_ ( .D(scan_addr_w_9_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[9]) );
  DFCNQD1 scan_addr_reg_8_ ( .D(scan_addr_w_8_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[8]) );
  DFCNQD1 scan_addr_reg_7_ ( .D(scan_addr_w_7_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[7]) );
  DFCNQD1 scan_addr_reg_6_ ( .D(scan_addr_w_6_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[6]) );
  DFCNQD1 scan_addr_reg_5_ ( .D(scan_addr_w_5_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[5]) );
  DFCNQD1 scan_addr_reg_4_ ( .D(scan_addr_w_4_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[4]) );
  DFCNQD1 scan_addr_reg_3_ ( .D(scan_addr_w_3_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[3]) );
  DFCNQD1 scan_addr_reg_2_ ( .D(scan_addr_w_2_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[2]) );
  DFCNQD1 scan_addr_reg_1_ ( .D(scan_addr_w_1_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[1]) );
  DFCNQD1 scan_addr_reg_0_ ( .D(scan_addr_w_0_), .CP(clk), .CDN(rst_n), .Q(
        scan_addr[0]) );
  DFCNQD1 scan_wdata_reg_31_ ( .D(scan_wdata_w_31_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[31]) );
  DFCNQD1 scan_wdata_reg_30_ ( .D(scan_wdata_w_30_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[30]) );
  DFCNQD1 scan_wdata_reg_29_ ( .D(scan_wdata_w_29_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[29]) );
  DFCNQD1 scan_wdata_reg_28_ ( .D(scan_wdata_w_28_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[28]) );
  DFCNQD1 scan_wdata_reg_27_ ( .D(scan_wdata_w_27_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[27]) );
  DFCNQD1 scan_wdata_reg_26_ ( .D(scan_wdata_w_26_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[26]) );
  DFCNQD1 scan_wdata_reg_25_ ( .D(scan_wdata_w_25_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[25]) );
  DFCNQD1 scan_wdata_reg_24_ ( .D(scan_wdata_w_24_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[24]) );
  DFCNQD1 scan_wdata_reg_23_ ( .D(scan_wdata_w_23_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[23]) );
  DFCNQD1 scan_wdata_reg_22_ ( .D(scan_wdata_w_22_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[22]) );
  DFCNQD1 scan_wdata_reg_21_ ( .D(scan_wdata_w_21_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[21]) );
  DFCNQD1 scan_wdata_reg_20_ ( .D(scan_wdata_w_20_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[20]) );
  DFCNQD1 scan_wdata_reg_19_ ( .D(scan_wdata_w_19_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[19]) );
  DFCNQD1 scan_wdata_reg_18_ ( .D(scan_wdata_w_18_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[18]) );
  DFCNQD1 scan_wdata_reg_17_ ( .D(scan_wdata_w_17_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[17]) );
  DFCNQD1 scan_wdata_reg_16_ ( .D(scan_wdata_w_16_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[16]) );
  DFCNQD1 scan_wdata_reg_15_ ( .D(scan_wdata_w_15_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[15]) );
  DFCNQD1 scan_wdata_reg_14_ ( .D(scan_wdata_w_14_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[14]) );
  DFCNQD1 scan_wdata_reg_13_ ( .D(scan_wdata_w_13_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[13]) );
  DFCNQD1 scan_wdata_reg_12_ ( .D(scan_wdata_w_12_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[12]) );
  DFCNQD1 scan_wdata_reg_11_ ( .D(scan_wdata_w_11_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[11]) );
  DFCNQD1 scan_wdata_reg_10_ ( .D(scan_wdata_w_10_), .CP(clk), .CDN(rst_n), 
        .Q(scan_wdata[10]) );
  DFCNQD1 scan_wdata_reg_9_ ( .D(scan_wdata_w_9_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[9]) );
  DFCNQD1 scan_wdata_reg_8_ ( .D(scan_wdata_w_8_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[8]) );
  DFCNQD1 scan_wdata_reg_7_ ( .D(scan_wdata_w_7_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[7]) );
  DFCNQD1 scan_wdata_reg_6_ ( .D(scan_wdata_w_6_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[6]) );
  DFCNQD1 scan_wdata_reg_5_ ( .D(scan_wdata_w_5_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[5]) );
  DFCNQD1 scan_wdata_reg_4_ ( .D(scan_wdata_w_4_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[4]) );
  DFCNQD1 scan_wdata_reg_3_ ( .D(scan_wdata_w_3_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[3]) );
  DFCNQD1 scan_wdata_reg_2_ ( .D(scan_wdata_w_2_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[2]) );
  DFCNQD1 scan_wdata_reg_1_ ( .D(scan_wdata_w_1_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[1]) );
  DFCNQD1 scan_wdata_reg_0_ ( .D(scan_wdata_w_0_), .CP(clk), .CDN(rst_n), .Q(
        scan_wdata[0]) );
  DFCNQD1 static_ready_reg ( .D(n2), .CP(clk), .CDN(rst_n), .Q(static_ready)
         );
  CKBD1 U3 ( .I(static_ready_w), .Z(n2) );
  OA21D0 U4 ( .A1(n5), .A2(static_ready), .B(n4), .Z(static_ready_w) );
  CKBD1 U5 ( .I(n8), .Z(n11) );
  CKBD1 U6 ( .I(n9), .Z(n14) );
  CKBD1 U7 ( .I(n8), .Z(n12) );
  CKBD1 U8 ( .I(n10), .Z(n15) );
  CKBD1 U9 ( .I(n9), .Z(n13) );
  CKBD1 U10 ( .I(n10), .Z(n16) );
  CKBD1 U11 ( .I(n3), .Z(n8) );
  CKBD1 U12 ( .I(n3), .Z(n10) );
  CKBD1 U13 ( .I(n3), .Z(n9) );
  INVD1 U14 ( .I(n4), .ZN(n3) );
  CKBD1 U15 ( .I(n5), .Z(n17) );
  CKBD1 U16 ( .I(n5), .Z(n18) );
  CKBD1 U17 ( .I(n5), .Z(n19) );
  CKBD1 U18 ( .I(n5), .Z(n20) );
  INVD1 U19 ( .I(n6), .ZN(n1) );
  AN2XD1 U20 ( .A1(scan_ready), .A2(n6), .Z(n5) );
  ND2D1 U21 ( .A1(static_ren), .A2(n11), .ZN(n6) );
  ND2D1 U22 ( .A1(n7), .A2(id_valid), .ZN(n4) );
  IAO21D1 U23 ( .A1(static_wen), .A2(static_ren), .B(holding), .ZN(n7) );
  AN2XD1 U24 ( .A1(static_wdata[0]), .A2(n15), .Z(scan_wdata_w_0_) );
  AN2XD1 U25 ( .A1(static_wdata[1]), .A2(n13), .Z(scan_wdata_w_1_) );
  AN2XD1 U26 ( .A1(static_wdata[2]), .A2(n12), .Z(scan_wdata_w_2_) );
  AN2XD1 U27 ( .A1(static_wdata[3]), .A2(n11), .Z(scan_wdata_w_3_) );
  AN2XD1 U28 ( .A1(static_wdata[4]), .A2(n11), .Z(scan_wdata_w_4_) );
  AN2XD1 U29 ( .A1(static_wdata[5]), .A2(n11), .Z(scan_wdata_w_5_) );
  AN2XD1 U30 ( .A1(static_wdata[6]), .A2(n11), .Z(scan_wdata_w_6_) );
  AN2XD1 U31 ( .A1(static_wdata[7]), .A2(n11), .Z(scan_wdata_w_7_) );
  AN2XD1 U32 ( .A1(static_wdata[8]), .A2(n11), .Z(scan_wdata_w_8_) );
  AN2XD1 U33 ( .A1(static_wdata[9]), .A2(n11), .Z(scan_wdata_w_9_) );
  AN2XD1 U34 ( .A1(static_wdata[10]), .A2(n15), .Z(scan_wdata_w_10_) );
  AN2XD1 U35 ( .A1(static_wdata[11]), .A2(n14), .Z(scan_wdata_w_11_) );
  AN2XD1 U36 ( .A1(static_wdata[12]), .A2(n14), .Z(scan_wdata_w_12_) );
  AN2XD1 U37 ( .A1(static_wdata[13]), .A2(n14), .Z(scan_wdata_w_13_) );
  AN2XD1 U38 ( .A1(static_wdata[14]), .A2(n14), .Z(scan_wdata_w_14_) );
  AN2XD1 U39 ( .A1(static_wdata[15]), .A2(n14), .Z(scan_wdata_w_15_) );
  AN2XD1 U40 ( .A1(static_wdata[16]), .A2(n14), .Z(scan_wdata_w_16_) );
  AN2XD1 U41 ( .A1(static_wdata[17]), .A2(n14), .Z(scan_wdata_w_17_) );
  AN2XD1 U42 ( .A1(static_wdata[18]), .A2(n14), .Z(scan_wdata_w_18_) );
  AN2XD1 U43 ( .A1(static_wdata[19]), .A2(n13), .Z(scan_wdata_w_19_) );
  AN2XD1 U44 ( .A1(static_wdata[20]), .A2(n13), .Z(scan_wdata_w_20_) );
  AN2XD1 U45 ( .A1(static_wdata[21]), .A2(n13), .Z(scan_wdata_w_21_) );
  AN2XD1 U46 ( .A1(static_wdata[22]), .A2(n13), .Z(scan_wdata_w_22_) );
  AN2XD1 U47 ( .A1(static_wdata[23]), .A2(n13), .Z(scan_wdata_w_23_) );
  AN2XD1 U48 ( .A1(static_wdata[24]), .A2(n13), .Z(scan_wdata_w_24_) );
  AN2XD1 U49 ( .A1(static_wdata[25]), .A2(n12), .Z(scan_wdata_w_25_) );
  AN2XD1 U50 ( .A1(static_wdata[26]), .A2(n12), .Z(scan_wdata_w_26_) );
  AN2XD1 U51 ( .A1(static_wdata[27]), .A2(n12), .Z(scan_wdata_w_27_) );
  AN2XD1 U52 ( .A1(static_wdata[28]), .A2(n12), .Z(scan_wdata_w_28_) );
  AN2XD1 U53 ( .A1(static_wdata[29]), .A2(n12), .Z(scan_wdata_w_29_) );
  AN2XD1 U54 ( .A1(static_wdata[30]), .A2(n12), .Z(scan_wdata_w_30_) );
  AN2XD1 U55 ( .A1(static_wdata[31]), .A2(n12), .Z(scan_wdata_w_31_) );
  AN2XD1 U56 ( .A1(static_addr[4]), .A2(n15), .Z(scan_addr_w_4_) );
  AN2XD1 U57 ( .A1(static_addr[5]), .A2(n15), .Z(scan_addr_w_5_) );
  AN2XD1 U58 ( .A1(static_addr[6]), .A2(n15), .Z(scan_addr_w_6_) );
  AN2XD1 U59 ( .A1(static_addr[7]), .A2(n15), .Z(scan_addr_w_7_) );
  AN2XD1 U60 ( .A1(static_addr[8]), .A2(n15), .Z(scan_addr_w_8_) );
  AN2XD1 U61 ( .A1(static_addr[9]), .A2(n15), .Z(scan_addr_w_9_) );
  AN2XD1 U62 ( .A1(static_wen), .A2(n13), .Z(scan_wen_w) );
  AN2XD1 U63 ( .A1(static_addr[0]), .A2(n16), .Z(scan_addr_w_0_) );
  AN2XD1 U64 ( .A1(static_addr[1]), .A2(n16), .Z(scan_addr_w_1_) );
  AN2XD1 U65 ( .A1(static_addr[2]), .A2(n16), .Z(scan_addr_w_2_) );
  AN2XD1 U66 ( .A1(static_addr[3]), .A2(n16), .Z(scan_addr_w_3_) );
  AN2XD1 U67 ( .A1(static_addr[10]), .A2(n16), .Z(scan_addr_w_10_) );
  AN2XD1 U68 ( .A1(static_addr[11]), .A2(n16), .Z(scan_addr_w_11_) );
endmodule


module mem_reg_mux ( scan_ren, scan_wen, scan_addr, scan_wdata, scan_rdata, 
        scan_ready, sram_ren, sram_wen, sram_addr, sram_wdata, sram_rdata, 
        sram_ready, reg_wen, reg_ren, cr_wdata, cr_rdata, sr_rdata, reg_ready
 );
  input [11:0] scan_addr;
  input [31:0] scan_wdata;
  output [31:0] scan_rdata;
  output [10:0] sram_addr;
  output [31:0] sram_wdata;
  input [31:0] sram_rdata;
  output [16:0] cr_wdata;
  input [16:0] cr_rdata;
  input [14:0] sr_rdata;
  input scan_ren, scan_wen, sram_ready, reg_ready;
  output scan_ready, sram_ren, sram_wen, reg_wen, reg_ren;
  wire   n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n1, n2, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74;

  OR2D1 U47 ( .A1(sram_ready), .A2(n74), .Z(scan_ready) );
  CKBD1 U2 ( .I(n106), .Z(scan_rdata[0]) );
  CKBD1 U3 ( .I(n96), .Z(scan_rdata[10]) );
  CKBD1 U4 ( .I(n95), .Z(scan_rdata[11]) );
  CKBD1 U5 ( .I(n94), .Z(scan_rdata[12]) );
  CKBD1 U6 ( .I(n93), .Z(scan_rdata[13]) );
  CKBD1 U7 ( .I(n92), .Z(scan_rdata[14]) );
  CKBD1 U8 ( .I(n91), .Z(scan_rdata[15]) );
  CKBD1 U9 ( .I(n90), .Z(scan_rdata[16]) );
  CKBD1 U10 ( .I(n89), .Z(scan_rdata[17]) );
  CKBD1 U11 ( .I(n88), .Z(scan_rdata[18]) );
  CKBD1 U12 ( .I(n87), .Z(scan_rdata[19]) );
  CKBD1 U13 ( .I(n105), .Z(scan_rdata[1]) );
  CKBD1 U14 ( .I(n86), .Z(scan_rdata[20]) );
  CKBD1 U15 ( .I(n85), .Z(scan_rdata[21]) );
  CKBD1 U16 ( .I(n84), .Z(scan_rdata[22]) );
  CKBD1 U17 ( .I(n83), .Z(scan_rdata[23]) );
  CKBD1 U18 ( .I(n82), .Z(scan_rdata[24]) );
  CKBD1 U19 ( .I(n81), .Z(scan_rdata[25]) );
  CKBD1 U20 ( .I(n80), .Z(scan_rdata[26]) );
  CKBD1 U21 ( .I(n79), .Z(scan_rdata[27]) );
  CKBD1 U22 ( .I(n78), .Z(scan_rdata[28]) );
  CKBD1 U23 ( .I(n77), .Z(scan_rdata[29]) );
  CKBD1 U24 ( .I(n104), .Z(scan_rdata[2]) );
  CKBD1 U25 ( .I(n76), .Z(scan_rdata[30]) );
  CKBD1 U26 ( .I(n75), .Z(scan_rdata[31]) );
  CKBD1 U27 ( .I(n103), .Z(scan_rdata[3]) );
  CKBD1 U28 ( .I(n102), .Z(scan_rdata[4]) );
  CKBD1 U29 ( .I(n101), .Z(scan_rdata[5]) );
  CKBD1 U30 ( .I(n100), .Z(scan_rdata[6]) );
  CKBD1 U31 ( .I(n99), .Z(scan_rdata[7]) );
  CKBD1 U32 ( .I(n98), .Z(scan_rdata[8]) );
  CKBD1 U33 ( .I(n97), .Z(scan_rdata[9]) );
  INVD1 U34 ( .I(n63), .ZN(n59) );
  INVD1 U35 ( .I(n63), .ZN(n58) );
  INVD1 U36 ( .I(n63), .ZN(n60) );
  CKBD1 U37 ( .I(n66), .Z(n63) );
  INVD1 U38 ( .I(n62), .ZN(n61) );
  CKBD1 U39 ( .I(n66), .Z(n64) );
  CKBD1 U40 ( .I(n66), .Z(n65) );
  CKBD1 U41 ( .I(n21), .Z(n53) );
  CKBD1 U42 ( .I(n21), .Z(n54) );
  CKBD1 U43 ( .I(n21), .Z(n55) );
  CKBD1 U44 ( .I(n21), .Z(n56) );
  CKBD1 U45 ( .I(n67), .Z(n70) );
  INVD1 U46 ( .I(n57), .ZN(n66) );
  CKBD1 U48 ( .I(n66), .Z(n62) );
  NR2D1 U49 ( .A1(scan_addr[11]), .A2(n20), .ZN(sram_wdata[15]) );
  NR2D1 U50 ( .A1(scan_addr[11]), .A2(n19), .ZN(sram_wdata[16]) );
  NR2D1 U51 ( .A1(n57), .A2(n17), .ZN(sram_wdata[18]) );
  NR2D1 U52 ( .A1(n57), .A2(n16), .ZN(sram_wdata[19]) );
  NR2D1 U53 ( .A1(n57), .A2(n14), .ZN(sram_wdata[21]) );
  NR2D1 U54 ( .A1(n57), .A2(n12), .ZN(sram_wdata[23]) );
  NR2D1 U55 ( .A1(n61), .A2(n18), .ZN(sram_wdata[17]) );
  NR2D1 U56 ( .A1(n61), .A2(n15), .ZN(sram_wdata[20]) );
  NR2D1 U57 ( .A1(n61), .A2(n11), .ZN(sram_wdata[24]) );
  NR2D1 U58 ( .A1(n61), .A2(n10), .ZN(sram_wdata[25]) );
  NR2D1 U59 ( .A1(n61), .A2(n8), .ZN(sram_wdata[27]) );
  NR2D1 U60 ( .A1(n61), .A2(n6), .ZN(sram_wdata[29]) );
  NR2D1 U61 ( .A1(n61), .A2(n5), .ZN(sram_wdata[30]) );
  NR2D1 U62 ( .A1(n61), .A2(n1), .ZN(sram_ren) );
  NR2D1 U63 ( .A1(scan_addr[11]), .A2(n13), .ZN(sram_wdata[22]) );
  NR2D1 U64 ( .A1(scan_addr[11]), .A2(n9), .ZN(sram_wdata[26]) );
  NR2D1 U65 ( .A1(scan_addr[11]), .A2(n7), .ZN(sram_wdata[28]) );
  NR2D1 U66 ( .A1(scan_addr[11]), .A2(n4), .ZN(sram_wdata[31]) );
  NR2D1 U67 ( .A1(scan_addr[11]), .A2(n2), .ZN(sram_wen) );
  NR2D1 U68 ( .A1(n10), .A2(n63), .ZN(cr_wdata[10]) );
  NR2D1 U69 ( .A1(n20), .A2(n62), .ZN(cr_wdata[0]) );
  NR2D1 U70 ( .A1(n19), .A2(n64), .ZN(cr_wdata[1]) );
  NR2D1 U71 ( .A1(n18), .A2(n64), .ZN(cr_wdata[2]) );
  NR2D1 U72 ( .A1(n17), .A2(n65), .ZN(cr_wdata[3]) );
  NR2D1 U73 ( .A1(n16), .A2(n65), .ZN(cr_wdata[4]) );
  NR2D1 U74 ( .A1(n15), .A2(n65), .ZN(cr_wdata[5]) );
  NR2D1 U75 ( .A1(n14), .A2(n65), .ZN(cr_wdata[6]) );
  NR2D1 U76 ( .A1(n13), .A2(n65), .ZN(cr_wdata[7]) );
  NR2D1 U77 ( .A1(n12), .A2(n65), .ZN(cr_wdata[8]) );
  NR2D1 U78 ( .A1(n11), .A2(n65), .ZN(cr_wdata[9]) );
  NR2D1 U79 ( .A1(n9), .A2(n64), .ZN(cr_wdata[11]) );
  NR2D1 U80 ( .A1(n8), .A2(n64), .ZN(cr_wdata[12]) );
  NR2D1 U81 ( .A1(n7), .A2(n64), .ZN(cr_wdata[13]) );
  NR2D1 U82 ( .A1(n6), .A2(n64), .ZN(cr_wdata[14]) );
  NR2D1 U83 ( .A1(n5), .A2(n64), .ZN(cr_wdata[15]) );
  NR2D1 U84 ( .A1(n4), .A2(n64), .ZN(cr_wdata[16]) );
  NR2D1 U85 ( .A1(n1), .A2(n65), .ZN(reg_ren) );
  NR2D1 U86 ( .A1(n2), .A2(n66), .ZN(reg_wen) );
  CKBD1 U87 ( .I(n67), .Z(n71) );
  CKBD1 U88 ( .I(n68), .Z(n72) );
  CKBD1 U89 ( .I(n68), .Z(n73) );
  CKBD1 U90 ( .I(n69), .Z(n74) );
  CKBD1 U91 ( .I(reg_ready), .Z(n69) );
  INR2D1 U92 ( .A1(sram_ready), .B1(n70), .ZN(n21) );
  AO22D0 U93 ( .A1(sr_rdata[0]), .A2(n70), .B1(sram_rdata[0]), .B2(n53), .Z(
        n106) );
  AO22D0 U94 ( .A1(sr_rdata[10]), .A2(n70), .B1(sram_rdata[10]), .B2(n53), .Z(
        n96) );
  AO22D0 U95 ( .A1(sr_rdata[11]), .A2(n70), .B1(sram_rdata[11]), .B2(n53), .Z(
        n95) );
  AO22D0 U96 ( .A1(sr_rdata[12]), .A2(n70), .B1(sram_rdata[12]), .B2(n53), .Z(
        n94) );
  AO22D0 U97 ( .A1(sr_rdata[13]), .A2(n70), .B1(sram_rdata[13]), .B2(n53), .Z(
        n93) );
  AO22D0 U98 ( .A1(sr_rdata[14]), .A2(n70), .B1(sram_rdata[14]), .B2(n53), .Z(
        n92) );
  AO22D0 U99 ( .A1(cr_rdata[0]), .A2(n70), .B1(sram_rdata[15]), .B2(n53), .Z(
        n91) );
  AO22D0 U100 ( .A1(cr_rdata[1]), .A2(n71), .B1(sram_rdata[16]), .B2(n53), .Z(
        n90) );
  AO22D0 U101 ( .A1(cr_rdata[2]), .A2(n71), .B1(sram_rdata[17]), .B2(n54), .Z(
        n89) );
  AO22D0 U102 ( .A1(cr_rdata[3]), .A2(n71), .B1(sram_rdata[18]), .B2(n54), .Z(
        n88) );
  AO22D0 U103 ( .A1(cr_rdata[4]), .A2(n71), .B1(sram_rdata[19]), .B2(n54), .Z(
        n87) );
  AO22D0 U104 ( .A1(sr_rdata[1]), .A2(n71), .B1(sram_rdata[1]), .B2(n54), .Z(
        n105) );
  AO22D0 U105 ( .A1(cr_rdata[5]), .A2(n71), .B1(sram_rdata[20]), .B2(n54), .Z(
        n86) );
  AO22D0 U106 ( .A1(cr_rdata[6]), .A2(n71), .B1(sram_rdata[21]), .B2(n54), .Z(
        n85) );
  AO22D0 U107 ( .A1(cr_rdata[7]), .A2(n71), .B1(sram_rdata[22]), .B2(n54), .Z(
        n84) );
  AO22D0 U108 ( .A1(cr_rdata[8]), .A2(n72), .B1(sram_rdata[23]), .B2(n54), .Z(
        n83) );
  AO22D0 U109 ( .A1(cr_rdata[9]), .A2(n72), .B1(sram_rdata[24]), .B2(n55), .Z(
        n82) );
  AO22D0 U110 ( .A1(cr_rdata[10]), .A2(n72), .B1(sram_rdata[25]), .B2(n55), 
        .Z(n81) );
  AO22D0 U111 ( .A1(cr_rdata[11]), .A2(n72), .B1(sram_rdata[26]), .B2(n55), 
        .Z(n80) );
  AO22D0 U112 ( .A1(cr_rdata[12]), .A2(n72), .B1(sram_rdata[27]), .B2(n55), 
        .Z(n79) );
  AO22D0 U113 ( .A1(cr_rdata[13]), .A2(n72), .B1(sram_rdata[28]), .B2(n55), 
        .Z(n78) );
  AO22D0 U114 ( .A1(cr_rdata[14]), .A2(n72), .B1(sram_rdata[29]), .B2(n55), 
        .Z(n77) );
  AO22D0 U115 ( .A1(sr_rdata[2]), .A2(n72), .B1(sram_rdata[2]), .B2(n55), .Z(
        n104) );
  AO22D0 U116 ( .A1(cr_rdata[15]), .A2(n73), .B1(sram_rdata[30]), .B2(n55), 
        .Z(n76) );
  AO22D0 U117 ( .A1(cr_rdata[16]), .A2(n73), .B1(sram_rdata[31]), .B2(n56), 
        .Z(n75) );
  AO22D0 U118 ( .A1(sr_rdata[3]), .A2(n73), .B1(sram_rdata[3]), .B2(n56), .Z(
        n103) );
  AO22D0 U119 ( .A1(sr_rdata[4]), .A2(n73), .B1(sram_rdata[4]), .B2(n56), .Z(
        n102) );
  AO22D0 U120 ( .A1(sr_rdata[5]), .A2(n73), .B1(sram_rdata[5]), .B2(n56), .Z(
        n101) );
  AO22D0 U121 ( .A1(sr_rdata[6]), .A2(n73), .B1(sram_rdata[6]), .B2(n56), .Z(
        n100) );
  AO22D0 U122 ( .A1(sr_rdata[7]), .A2(n73), .B1(sram_rdata[7]), .B2(n56), .Z(
        n99) );
  AO22D0 U123 ( .A1(sr_rdata[8]), .A2(n73), .B1(sram_rdata[8]), .B2(n56), .Z(
        n98) );
  AO22D0 U124 ( .A1(sr_rdata[9]), .A2(n74), .B1(sram_rdata[9]), .B2(n56), .Z(
        n97) );
  CKBD1 U125 ( .I(reg_ready), .Z(n67) );
  INR2D1 U126 ( .A1(scan_wdata[0]), .B1(n59), .ZN(sram_wdata[0]) );
  INR2D1 U127 ( .A1(scan_wdata[1]), .B1(n59), .ZN(sram_wdata[1]) );
  INR2D1 U128 ( .A1(scan_wdata[2]), .B1(n59), .ZN(sram_wdata[2]) );
  INR2D1 U129 ( .A1(scan_wdata[3]), .B1(n58), .ZN(sram_wdata[3]) );
  INR2D1 U130 ( .A1(scan_wdata[4]), .B1(n58), .ZN(sram_wdata[4]) );
  INR2D1 U131 ( .A1(scan_wdata[5]), .B1(n58), .ZN(sram_wdata[5]) );
  INR2D1 U132 ( .A1(scan_wdata[6]), .B1(n58), .ZN(sram_wdata[6]) );
  INR2D1 U133 ( .A1(scan_wdata[7]), .B1(n58), .ZN(sram_wdata[7]) );
  INR2D1 U134 ( .A1(scan_wdata[8]), .B1(n58), .ZN(sram_wdata[8]) );
  INR2D1 U135 ( .A1(scan_wdata[9]), .B1(n58), .ZN(sram_wdata[9]) );
  INR2D1 U136 ( .A1(scan_wdata[10]), .B1(n59), .ZN(sram_wdata[10]) );
  INR2D1 U137 ( .A1(scan_wdata[11]), .B1(n59), .ZN(sram_wdata[11]) );
  INR2D1 U138 ( .A1(scan_wdata[12]), .B1(n59), .ZN(sram_wdata[12]) );
  INR2D1 U139 ( .A1(scan_wdata[13]), .B1(n59), .ZN(sram_wdata[13]) );
  INR2D1 U140 ( .A1(scan_wdata[14]), .B1(n59), .ZN(sram_wdata[14]) );
  INR2D1 U141 ( .A1(scan_addr[0]), .B1(n58), .ZN(sram_addr[0]) );
  INR2D1 U142 ( .A1(scan_addr[2]), .B1(n60), .ZN(sram_addr[2]) );
  INR2D1 U143 ( .A1(scan_addr[4]), .B1(n60), .ZN(sram_addr[4]) );
  INR2D1 U144 ( .A1(scan_addr[5]), .B1(n60), .ZN(sram_addr[5]) );
  INR2D1 U145 ( .A1(scan_addr[6]), .B1(n60), .ZN(sram_addr[6]) );
  INR2D1 U146 ( .A1(scan_addr[7]), .B1(n60), .ZN(sram_addr[7]) );
  INR2D1 U147 ( .A1(scan_addr[8]), .B1(n60), .ZN(sram_addr[8]) );
  INR2D1 U148 ( .A1(scan_addr[9]), .B1(n60), .ZN(sram_addr[9]) );
  INR2D1 U149 ( .A1(scan_addr[10]), .B1(n60), .ZN(sram_addr[10]) );
  CKBD1 U150 ( .I(scan_addr[11]), .Z(n57) );
  INR2D1 U151 ( .A1(scan_addr[1]), .B1(n57), .ZN(sram_addr[1]) );
  INR2D1 U152 ( .A1(scan_addr[3]), .B1(n57), .ZN(sram_addr[3]) );
  CKBD1 U153 ( .I(reg_ready), .Z(n68) );
  INVD1 U154 ( .I(scan_wdata[15]), .ZN(n20) );
  INVD1 U155 ( .I(scan_wdata[16]), .ZN(n19) );
  INVD1 U156 ( .I(scan_wdata[17]), .ZN(n18) );
  INVD1 U157 ( .I(scan_wdata[18]), .ZN(n17) );
  INVD1 U158 ( .I(scan_wdata[19]), .ZN(n16) );
  INVD1 U159 ( .I(scan_wdata[20]), .ZN(n15) );
  INVD1 U160 ( .I(scan_wdata[21]), .ZN(n14) );
  INVD1 U161 ( .I(scan_wdata[22]), .ZN(n13) );
  INVD1 U162 ( .I(scan_wdata[23]), .ZN(n12) );
  INVD1 U163 ( .I(scan_wdata[24]), .ZN(n11) );
  INVD1 U164 ( .I(scan_wdata[25]), .ZN(n10) );
  INVD1 U165 ( .I(scan_wdata[26]), .ZN(n9) );
  INVD1 U166 ( .I(scan_wdata[27]), .ZN(n8) );
  INVD1 U167 ( .I(scan_wdata[28]), .ZN(n7) );
  INVD1 U168 ( .I(scan_wdata[29]), .ZN(n6) );
  INVD1 U169 ( .I(scan_wdata[30]), .ZN(n5) );
  INVD1 U170 ( .I(scan_wdata[31]), .ZN(n4) );
  INVD1 U171 ( .I(scan_wen), .ZN(n2) );
  INVD1 U172 ( .I(scan_ren), .ZN(n1) );
endmodule


module syn_pulse_gen ( clk, rst_n, scan_id, id_valid );
  input clk, rst_n, scan_id;
  output id_valid;
  wire   scan_id_d, scan_id_2d, id_hold, n1, n2;

  DFCNQD1 scan_id_d_reg ( .D(scan_id), .CP(clk), .CDN(rst_n), .Q(scan_id_d) );
  DFCNQD1 scan_id_2d_reg ( .D(n2), .CP(clk), .CDN(rst_n), .Q(scan_id_2d) );
  DFCNQD1 id_hold_reg ( .D(n1), .CP(clk), .CDN(rst_n), .Q(id_hold) );
  CKXOR2D1 U3 ( .A1(scan_id_2d), .A2(id_hold), .Z(id_valid) );
  DEL015 U4 ( .I(scan_id_2d), .Z(n1) );
  DEL015 U5 ( .I(scan_id_d), .Z(n2) );
endmodule


module group_scan_mem_reg_if ( clk, rst_n, static_wen_group_mux, 
        static_ren_group_mux, static_addr_group_mux, static_wdata_group_mux, 
        static_rdata_group_mux, static_ready_group_mux, scan_id_group_mux, 
        sram_ren, sram_wen, sram_addr, sram_wdata, sram_rdata, sram_ready, 
        reg_wen, reg_ren, cr_wdata, cr_rdata, sr_rdata, reg_ready );
  input [19:0] static_addr_group_mux;
  input [31:0] static_wdata_group_mux;
  output [31:0] static_rdata_group_mux;
  output [10:0] sram_addr;
  output [31:0] sram_wdata;
  input [31:0] sram_rdata;
  output [16:0] cr_wdata;
  input [16:0] cr_rdata;
  input [14:0] sr_rdata;
  input clk, rst_n, static_wen_group_mux, static_ren_group_mux,
         scan_id_group_mux, sram_ready, reg_ready;
  output static_ready_group_mux, sram_ren, sram_wen, reg_wen, reg_ren;
  wire   id_valid, scan_wen, scan_ren, scan_addr_11_0, scan_addr_10_0,
         scan_addr_9_0, scan_addr_8_0, scan_addr_7_0, scan_addr_6_0,
         scan_addr_5_0, scan_addr_4_0, scan_addr_3_0, scan_addr_2_0,
         scan_addr_1_0, scan_addr_0_0, scan_wdata_31_0, scan_wdata_30_0,
         scan_wdata_29_0, scan_wdata_28_0, scan_wdata_27_0, scan_wdata_26_0,
         scan_wdata_25_0, scan_wdata_24_0, scan_wdata_23_0, scan_wdata_22_0,
         scan_wdata_21_0, scan_wdata_20_0, scan_wdata_19_0, scan_wdata_18_0,
         scan_wdata_17_0, scan_wdata_16_0, scan_wdata_15_0, scan_wdata_14_0,
         scan_wdata_13_0, scan_wdata_12_0, scan_wdata_11_0, scan_wdata_10_0,
         scan_wdata_9_0, scan_wdata_8_0, scan_wdata_7_0, scan_wdata_6_0,
         scan_wdata_5_0, scan_wdata_4_0, scan_wdata_3_0, scan_wdata_2_0,
         scan_wdata_1_0, scan_wdata_0_0, scan_rdata_31_0, scan_rdata_30_0,
         scan_rdata_29_0, scan_rdata_28_0, scan_rdata_27_0, scan_rdata_26_0,
         scan_rdata_25_0, scan_rdata_24_0, scan_rdata_23_0, scan_rdata_22_0,
         scan_rdata_21_0, scan_rdata_20_0, scan_rdata_19_0, scan_rdata_18_0,
         scan_rdata_17_0, scan_rdata_16_0, scan_rdata_15_0, scan_rdata_14_0,
         scan_rdata_13_0, scan_rdata_12_0, scan_rdata_11_0, scan_rdata_10_0,
         scan_rdata_9_0, scan_rdata_8_0, scan_rdata_7_0, scan_rdata_6_0,
         scan_rdata_5_0, scan_rdata_4_0, scan_rdata_3_0, scan_rdata_2_0,
         scan_rdata_1_0, scan_rdata_0_0, scan_ready;

  rwctr rwctr_inst ( .clk(clk), .rst_n(rst_n), .id_valid(id_valid), 
        .static_wen(static_wen_group_mux), .static_ren(static_ren_group_mux), 
        .static_addr(static_addr_group_mux[11:0]), .static_wdata(
        static_wdata_group_mux), .static_ready(static_ready_group_mux), 
        .static_rdata(static_rdata_group_mux), .scan_wen(scan_wen), .scan_ren(
        scan_ren), .scan_addr({scan_addr_11_0, scan_addr_10_0, scan_addr_9_0, 
        scan_addr_8_0, scan_addr_7_0, scan_addr_6_0, scan_addr_5_0, 
        scan_addr_4_0, scan_addr_3_0, scan_addr_2_0, scan_addr_1_0, 
        scan_addr_0_0}), .scan_wdata({scan_wdata_31_0, scan_wdata_30_0, 
        scan_wdata_29_0, scan_wdata_28_0, scan_wdata_27_0, scan_wdata_26_0, 
        scan_wdata_25_0, scan_wdata_24_0, scan_wdata_23_0, scan_wdata_22_0, 
        scan_wdata_21_0, scan_wdata_20_0, scan_wdata_19_0, scan_wdata_18_0, 
        scan_wdata_17_0, scan_wdata_16_0, scan_wdata_15_0, scan_wdata_14_0, 
        scan_wdata_13_0, scan_wdata_12_0, scan_wdata_11_0, scan_wdata_10_0, 
        scan_wdata_9_0, scan_wdata_8_0, scan_wdata_7_0, scan_wdata_6_0, 
        scan_wdata_5_0, scan_wdata_4_0, scan_wdata_3_0, scan_wdata_2_0, 
        scan_wdata_1_0, scan_wdata_0_0}), .scan_rdata({scan_rdata_31_0, 
        scan_rdata_30_0, scan_rdata_29_0, scan_rdata_28_0, scan_rdata_27_0, 
        scan_rdata_26_0, scan_rdata_25_0, scan_rdata_24_0, scan_rdata_23_0, 
        scan_rdata_22_0, scan_rdata_21_0, scan_rdata_20_0, scan_rdata_19_0, 
        scan_rdata_18_0, scan_rdata_17_0, scan_rdata_16_0, scan_rdata_15_0, 
        scan_rdata_14_0, scan_rdata_13_0, scan_rdata_12_0, scan_rdata_11_0, 
        scan_rdata_10_0, scan_rdata_9_0, scan_rdata_8_0, scan_rdata_7_0, 
        scan_rdata_6_0, scan_rdata_5_0, scan_rdata_4_0, scan_rdata_3_0, 
        scan_rdata_2_0, scan_rdata_1_0, scan_rdata_0_0}), .scan_ready(
        scan_ready) );
  mem_reg_mux mem_reg_mux_inst ( .scan_ren(scan_ren), .scan_wen(scan_wen), 
        .scan_addr({scan_addr_11_0, scan_addr_10_0, scan_addr_9_0, 
        scan_addr_8_0, scan_addr_7_0, scan_addr_6_0, scan_addr_5_0, 
        scan_addr_4_0, scan_addr_3_0, scan_addr_2_0, scan_addr_1_0, 
        scan_addr_0_0}), .scan_wdata({scan_wdata_31_0, scan_wdata_30_0, 
        scan_wdata_29_0, scan_wdata_28_0, scan_wdata_27_0, scan_wdata_26_0, 
        scan_wdata_25_0, scan_wdata_24_0, scan_wdata_23_0, scan_wdata_22_0, 
        scan_wdata_21_0, scan_wdata_20_0, scan_wdata_19_0, scan_wdata_18_0, 
        scan_wdata_17_0, scan_wdata_16_0, scan_wdata_15_0, scan_wdata_14_0, 
        scan_wdata_13_0, scan_wdata_12_0, scan_wdata_11_0, scan_wdata_10_0, 
        scan_wdata_9_0, scan_wdata_8_0, scan_wdata_7_0, scan_wdata_6_0, 
        scan_wdata_5_0, scan_wdata_4_0, scan_wdata_3_0, scan_wdata_2_0, 
        scan_wdata_1_0, scan_wdata_0_0}), .scan_rdata({scan_rdata_31_0, 
        scan_rdata_30_0, scan_rdata_29_0, scan_rdata_28_0, scan_rdata_27_0, 
        scan_rdata_26_0, scan_rdata_25_0, scan_rdata_24_0, scan_rdata_23_0, 
        scan_rdata_22_0, scan_rdata_21_0, scan_rdata_20_0, scan_rdata_19_0, 
        scan_rdata_18_0, scan_rdata_17_0, scan_rdata_16_0, scan_rdata_15_0, 
        scan_rdata_14_0, scan_rdata_13_0, scan_rdata_12_0, scan_rdata_11_0, 
        scan_rdata_10_0, scan_rdata_9_0, scan_rdata_8_0, scan_rdata_7_0, 
        scan_rdata_6_0, scan_rdata_5_0, scan_rdata_4_0, scan_rdata_3_0, 
        scan_rdata_2_0, scan_rdata_1_0, scan_rdata_0_0}), .scan_ready(
        scan_ready), .sram_ren(sram_ren), .sram_wen(sram_wen), .sram_addr(
        sram_addr), .sram_wdata(sram_wdata), .sram_rdata(sram_rdata), 
        .sram_ready(sram_ready), .reg_wen(reg_wen), .reg_ren(reg_ren), 
        .cr_wdata(cr_wdata), .cr_rdata(cr_rdata), .sr_rdata(sr_rdata), 
        .reg_ready(reg_ready) );
  syn_pulse_gen syn_pulse_gen_inst ( .clk(clk), .rst_n(rst_n), .scan_id(
        scan_id_group_mux), .id_valid(id_valid) );
endmodule

