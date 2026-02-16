/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12-SP5
// Date      : Sun Feb 15 20:51:27 2026
/////////////////////////////////////////////////////////////


module mem_reg_mux ( scan_ren, scan_wen, scan_addr, scan_wdata, scan_rdata, 
        scan_ready, sram_ren, sram_wen, sram_addr, sram_wdata, sram_rdata, 
        sram_ready, reg_wen, reg_ren, cr_wdata, cr_rdata, sr_rdata, reg_ready, 
        seg_id, id_sel );
  input [15:0] scan_addr;
  input [31:0] scan_wdata;
  output [31:0] scan_rdata;
  output [10:0] sram_addr;
  output [31:0] sram_wdata;
  input [31:0] sram_rdata;
  output [16:0] cr_wdata;
  input [16:0] cr_rdata;
  input [14:0] sr_rdata;
  output [3:0] seg_id;
  input scan_ren, scan_wen, sram_ready, reg_ready;
  output scan_ready, sram_ren, sram_wen, reg_wen, reg_ren, id_sel;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n3, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  tri   scan_ren;
  tri   scan_wen;
  tri   [15:0] scan_addr;
  tri   [31:0] scan_wdata;
  tri   [31:0] scan_rdata;
  tri   scan_ready;

  OR2D1 U47 ( .A1(sram_ready), .A2(n46), .Z(scan_ready) );
  INVD1 U2 ( .I(n23), .ZN(n3) );
  INVD1 U3 ( .I(n23), .ZN(n22) );
  INVD1 U4 ( .I(scan_addr[15]), .ZN(n23) );
  INVD1 U5 ( .I(n23), .ZN(n24) );
  INVD1 U6 ( .I(n23), .ZN(n25) );
  INVD1 U7 ( .I(n23), .ZN(n26) );
  INVD1 U8 ( .I(n23), .ZN(n27) );
  INVD1 U9 ( .I(n3), .ZN(n28) );
  INVD1 U10 ( .I(n22), .ZN(n29) );
  INVD1 U11 ( .I(n26), .ZN(n30) );
  NR2D1 U12 ( .A1(n20), .A2(n28), .ZN(cr_wdata[0]) );
  NR2D1 U13 ( .A1(n19), .A2(n28), .ZN(cr_wdata[1]) );
  NR2D1 U14 ( .A1(n18), .A2(n28), .ZN(cr_wdata[2]) );
  NR2D1 U15 ( .A1(n17), .A2(n28), .ZN(cr_wdata[3]) );
  NR2D1 U16 ( .A1(n16), .A2(n28), .ZN(cr_wdata[4]) );
  NR2D1 U17 ( .A1(n15), .A2(n28), .ZN(cr_wdata[5]) );
  NR2D1 U18 ( .A1(n14), .A2(n28), .ZN(cr_wdata[6]) );
  NR2D1 U19 ( .A1(n13), .A2(n30), .ZN(cr_wdata[7]) );
  NR2D1 U20 ( .A1(n12), .A2(n29), .ZN(cr_wdata[8]) );
  NR2D1 U21 ( .A1(n11), .A2(n30), .ZN(cr_wdata[9]) );
  NR2D1 U22 ( .A1(n10), .A2(n29), .ZN(cr_wdata[10]) );
  NR2D1 U23 ( .A1(n9), .A2(n30), .ZN(cr_wdata[11]) );
  NR2D1 U24 ( .A1(n8), .A2(n29), .ZN(cr_wdata[12]) );
  NR2D1 U25 ( .A1(n7), .A2(n30), .ZN(cr_wdata[13]) );
  NR2D1 U26 ( .A1(n6), .A2(n29), .ZN(cr_wdata[14]) );
  NR2D1 U27 ( .A1(n5), .A2(n30), .ZN(cr_wdata[15]) );
  NR2D1 U28 ( .A1(n4), .A2(n29), .ZN(cr_wdata[16]) );
  NR2D1 U29 ( .A1(n1), .A2(n30), .ZN(reg_ren) );
  NR2D1 U30 ( .A1(n2), .A2(n29), .ZN(reg_wen) );
  CKBD1 U31 ( .I(n21), .Z(n35) );
  CKBD1 U32 ( .I(n21), .Z(n36) );
  CKBD1 U33 ( .I(n21), .Z(n37) );
  CKBD1 U34 ( .I(n21), .Z(n38) );
  CKBD1 U35 ( .I(n39), .Z(n42) );
  CKBD1 U36 ( .I(n39), .Z(n43) );
  CKBD1 U37 ( .I(n40), .Z(n44) );
  CKBD1 U38 ( .I(n40), .Z(n45) );
  INR2D1 U39 ( .A1(sram_ready), .B1(n42), .ZN(n21) );
  INR2D1 U40 ( .A1(scan_wdata[0]), .B1(n25), .ZN(sram_wdata[0]) );
  INR2D1 U41 ( .A1(scan_wdata[1]), .B1(n22), .ZN(sram_wdata[1]) );
  INR2D1 U42 ( .A1(scan_wdata[2]), .B1(n26), .ZN(sram_wdata[2]) );
  INR2D1 U43 ( .A1(scan_wdata[3]), .B1(n25), .ZN(sram_wdata[3]) );
  INR2D1 U44 ( .A1(scan_wdata[4]), .B1(n24), .ZN(sram_wdata[4]) );
  INR2D1 U45 ( .A1(scan_wdata[5]), .B1(n27), .ZN(sram_wdata[5]) );
  INR2D1 U46 ( .A1(scan_wdata[6]), .B1(n24), .ZN(sram_wdata[6]) );
  INR2D1 U48 ( .A1(scan_wdata[7]), .B1(n3), .ZN(sram_wdata[7]) );
  INR2D1 U49 ( .A1(scan_wdata[8]), .B1(n25), .ZN(sram_wdata[8]) );
  INR2D1 U50 ( .A1(scan_wdata[9]), .B1(n3), .ZN(sram_wdata[9]) );
  INR2D1 U51 ( .A1(scan_wdata[10]), .B1(n22), .ZN(sram_wdata[10]) );
  INR2D1 U52 ( .A1(scan_wdata[11]), .B1(n22), .ZN(sram_wdata[11]) );
  INR2D1 U53 ( .A1(scan_wdata[12]), .B1(n26), .ZN(sram_wdata[12]) );
  INR2D1 U54 ( .A1(scan_wdata[13]), .B1(n24), .ZN(sram_wdata[13]) );
  INR2D1 U55 ( .A1(scan_wdata[14]), .B1(n3), .ZN(sram_wdata[14]) );
  INR2D1 U56 ( .A1(scan_addr[0]), .B1(n26), .ZN(sram_addr[0]) );
  INR2D1 U57 ( .A1(scan_addr[1]), .B1(n27), .ZN(sram_addr[1]) );
  INR2D1 U58 ( .A1(scan_addr[2]), .B1(n22), .ZN(sram_addr[2]) );
  INR2D1 U59 ( .A1(scan_addr[3]), .B1(n27), .ZN(sram_addr[3]) );
  INR2D1 U60 ( .A1(scan_addr[4]), .B1(n25), .ZN(sram_addr[4]) );
  INR2D1 U61 ( .A1(scan_addr[5]), .B1(n26), .ZN(sram_addr[5]) );
  INR2D1 U62 ( .A1(scan_addr[6]), .B1(n25), .ZN(sram_addr[6]) );
  INR2D1 U63 ( .A1(scan_addr[7]), .B1(n24), .ZN(sram_addr[7]) );
  INR2D1 U64 ( .A1(scan_addr[8]), .B1(n27), .ZN(sram_addr[8]) );
  INR2D1 U65 ( .A1(scan_addr[9]), .B1(n24), .ZN(sram_addr[9]) );
  INR2D1 U66 ( .A1(scan_addr[10]), .B1(n3), .ZN(sram_addr[10]) );
  NR2D1 U67 ( .A1(n27), .A2(n20), .ZN(sram_wdata[15]) );
  NR2D1 U68 ( .A1(n26), .A2(n19), .ZN(sram_wdata[16]) );
  NR2D1 U69 ( .A1(n22), .A2(n18), .ZN(sram_wdata[17]) );
  NR2D1 U70 ( .A1(n3), .A2(n17), .ZN(sram_wdata[18]) );
  NR2D1 U71 ( .A1(n24), .A2(n16), .ZN(sram_wdata[19]) );
  NR2D1 U72 ( .A1(n25), .A2(n15), .ZN(sram_wdata[20]) );
  NR2D1 U73 ( .A1(n27), .A2(n14), .ZN(sram_wdata[21]) );
  NR2D1 U74 ( .A1(n26), .A2(n13), .ZN(sram_wdata[22]) );
  NR2D1 U75 ( .A1(n22), .A2(n12), .ZN(sram_wdata[23]) );
  NR2D1 U76 ( .A1(n3), .A2(n11), .ZN(sram_wdata[24]) );
  NR2D1 U77 ( .A1(n24), .A2(n10), .ZN(sram_wdata[25]) );
  NR2D1 U78 ( .A1(n25), .A2(n9), .ZN(sram_wdata[26]) );
  NR2D1 U79 ( .A1(n26), .A2(n8), .ZN(sram_wdata[27]) );
  NR2D1 U80 ( .A1(n25), .A2(n7), .ZN(sram_wdata[28]) );
  NR2D1 U81 ( .A1(n27), .A2(n6), .ZN(sram_wdata[29]) );
  NR2D1 U82 ( .A1(n22), .A2(n5), .ZN(sram_wdata[30]) );
  NR2D1 U83 ( .A1(n3), .A2(n4), .ZN(sram_wdata[31]) );
  NR2D1 U84 ( .A1(n24), .A2(n2), .ZN(sram_wen) );
  NR2D1 U85 ( .A1(n27), .A2(n1), .ZN(sram_ren) );
  INVD1 U86 ( .I(scan_wdata[15]), .ZN(n20) );
  INVD1 U87 ( .I(scan_wdata[16]), .ZN(n19) );
  INVD1 U88 ( .I(scan_wdata[17]), .ZN(n18) );
  INVD1 U89 ( .I(scan_wdata[18]), .ZN(n17) );
  INVD1 U90 ( .I(scan_wdata[19]), .ZN(n16) );
  INVD1 U91 ( .I(scan_wdata[20]), .ZN(n15) );
  INVD1 U92 ( .I(scan_wdata[21]), .ZN(n14) );
  INVD1 U93 ( .I(scan_wdata[22]), .ZN(n13) );
  INVD1 U94 ( .I(scan_wdata[23]), .ZN(n12) );
  INVD1 U95 ( .I(scan_wdata[24]), .ZN(n11) );
  INVD1 U96 ( .I(scan_wdata[25]), .ZN(n10) );
  INVD1 U97 ( .I(scan_wdata[26]), .ZN(n9) );
  INVD1 U98 ( .I(scan_wdata[27]), .ZN(n8) );
  INVD1 U99 ( .I(scan_wdata[28]), .ZN(n7) );
  INVD1 U100 ( .I(scan_wdata[29]), .ZN(n6) );
  INVD1 U101 ( .I(scan_wdata[30]), .ZN(n5) );
  INVD1 U102 ( .I(scan_wdata[31]), .ZN(n4) );
  INVD1 U103 ( .I(scan_wen), .ZN(n2) );
  INVD1 U104 ( .I(scan_ren), .ZN(n1) );
  AO22D0 U105 ( .A1(sr_rdata[0]), .A2(n42), .B1(sram_rdata[0]), .B2(n35), .Z(
        scan_rdata[0]) );
  AO22D0 U106 ( .A1(sr_rdata[1]), .A2(n43), .B1(sram_rdata[1]), .B2(n36), .Z(
        scan_rdata[1]) );
  AO22D0 U107 ( .A1(sr_rdata[2]), .A2(n44), .B1(sram_rdata[2]), .B2(n37), .Z(
        scan_rdata[2]) );
  AO22D0 U108 ( .A1(sr_rdata[3]), .A2(n45), .B1(sram_rdata[3]), .B2(n38), .Z(
        scan_rdata[3]) );
  AO22D0 U109 ( .A1(sr_rdata[4]), .A2(n45), .B1(sram_rdata[4]), .B2(n38), .Z(
        scan_rdata[4]) );
  AO22D0 U110 ( .A1(sr_rdata[5]), .A2(n45), .B1(sram_rdata[5]), .B2(n38), .Z(
        scan_rdata[5]) );
  AO22D0 U111 ( .A1(sr_rdata[6]), .A2(n45), .B1(sram_rdata[6]), .B2(n38), .Z(
        scan_rdata[6]) );
  AO22D0 U112 ( .A1(sr_rdata[7]), .A2(n45), .B1(sram_rdata[7]), .B2(n38), .Z(
        scan_rdata[7]) );
  AO22D0 U113 ( .A1(sr_rdata[8]), .A2(n45), .B1(sram_rdata[8]), .B2(n38), .Z(
        scan_rdata[8]) );
  AO22D0 U114 ( .A1(sr_rdata[9]), .A2(n46), .B1(sram_rdata[9]), .B2(n38), .Z(
        scan_rdata[9]) );
  AO22D0 U115 ( .A1(sr_rdata[10]), .A2(n42), .B1(sram_rdata[10]), .B2(n35), 
        .Z(scan_rdata[10]) );
  AO22D0 U116 ( .A1(sr_rdata[11]), .A2(n42), .B1(sram_rdata[11]), .B2(n35), 
        .Z(scan_rdata[11]) );
  AO22D0 U117 ( .A1(sr_rdata[12]), .A2(n42), .B1(sram_rdata[12]), .B2(n35), 
        .Z(scan_rdata[12]) );
  AO22D0 U118 ( .A1(sr_rdata[13]), .A2(n42), .B1(sram_rdata[13]), .B2(n35), 
        .Z(scan_rdata[13]) );
  AO22D0 U119 ( .A1(sr_rdata[14]), .A2(n42), .B1(sram_rdata[14]), .B2(n35), 
        .Z(scan_rdata[14]) );
  AO22D0 U120 ( .A1(cr_rdata[0]), .A2(n42), .B1(sram_rdata[15]), .B2(n35), .Z(
        scan_rdata[15]) );
  AO22D0 U121 ( .A1(cr_rdata[1]), .A2(n43), .B1(sram_rdata[16]), .B2(n35), .Z(
        scan_rdata[16]) );
  AO22D0 U122 ( .A1(cr_rdata[2]), .A2(n43), .B1(sram_rdata[17]), .B2(n36), .Z(
        scan_rdata[17]) );
  AO22D0 U123 ( .A1(cr_rdata[3]), .A2(n43), .B1(sram_rdata[18]), .B2(n36), .Z(
        scan_rdata[18]) );
  AO22D0 U124 ( .A1(cr_rdata[4]), .A2(n43), .B1(sram_rdata[19]), .B2(n36), .Z(
        scan_rdata[19]) );
  AO22D0 U125 ( .A1(cr_rdata[5]), .A2(n43), .B1(sram_rdata[20]), .B2(n36), .Z(
        scan_rdata[20]) );
  AO22D0 U126 ( .A1(cr_rdata[6]), .A2(n43), .B1(sram_rdata[21]), .B2(n36), .Z(
        scan_rdata[21]) );
  AO22D0 U127 ( .A1(cr_rdata[7]), .A2(n43), .B1(sram_rdata[22]), .B2(n36), .Z(
        scan_rdata[22]) );
  AO22D0 U128 ( .A1(cr_rdata[8]), .A2(n44), .B1(sram_rdata[23]), .B2(n36), .Z(
        scan_rdata[23]) );
  AO22D0 U129 ( .A1(cr_rdata[9]), .A2(n44), .B1(sram_rdata[24]), .B2(n37), .Z(
        scan_rdata[24]) );
  AO22D0 U130 ( .A1(cr_rdata[10]), .A2(n44), .B1(sram_rdata[25]), .B2(n37), 
        .Z(scan_rdata[25]) );
  AO22D0 U131 ( .A1(cr_rdata[11]), .A2(n44), .B1(sram_rdata[26]), .B2(n37), 
        .Z(scan_rdata[26]) );
  AO22D0 U132 ( .A1(cr_rdata[12]), .A2(n44), .B1(sram_rdata[27]), .B2(n37), 
        .Z(scan_rdata[27]) );
  AO22D0 U133 ( .A1(cr_rdata[13]), .A2(n44), .B1(sram_rdata[28]), .B2(n37), 
        .Z(scan_rdata[28]) );
  AO22D0 U134 ( .A1(cr_rdata[14]), .A2(n44), .B1(sram_rdata[29]), .B2(n37), 
        .Z(scan_rdata[29]) );
  AO22D0 U135 ( .A1(cr_rdata[15]), .A2(n45), .B1(sram_rdata[30]), .B2(n37), 
        .Z(scan_rdata[30]) );
  AO22D0 U136 ( .A1(cr_rdata[16]), .A2(n45), .B1(sram_rdata[31]), .B2(n38), 
        .Z(scan_rdata[31]) );
  CKBD1 U137 ( .I(reg_ready), .Z(n39) );
  CKBD1 U138 ( .I(reg_ready), .Z(n40) );
  CKBD1 U139 ( .I(n41), .Z(n46) );
  CKBD1 U140 ( .I(reg_ready), .Z(n41) );
  CKBD1 U141 ( .I(scan_addr[13]), .Z(seg_id[2]) );
  CKBD1 U142 ( .I(scan_addr[12]), .Z(seg_id[1]) );
  CKBD1 U143 ( .I(scan_addr[11]), .Z(seg_id[0]) );
  CKBD1 U144 ( .I(scan_addr[14]), .Z(id_sel) );
  TIEL U145 ( .ZN(seg_id[3]) );
endmodule


module syn_pulse_gen ( clk, rst_n, scan_id, id_valid );
  input clk, rst_n, scan_id;
  output id_valid;
  wire   scan_id_d, scan_id_2d, id_hold, n1, n2;
  tri   clk;
  tri   rst_n;
  tri   id_valid;

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
        reg_wen, reg_ren, cr_wdata, cr_rdata, sr_rdata, reg_ready, seg_id, 
        id_sel );
  input [19:0] static_addr_group_mux;
  input [31:0] static_wdata_group_mux;
  output [31:0] static_rdata_group_mux;
  output [10:0] sram_addr;
  output [31:0] sram_wdata;
  input [31:0] sram_rdata;
  output [16:0] cr_wdata;
  input [16:0] cr_rdata;
  input [14:0] sr_rdata;
  output [3:0] seg_id;
  input clk, rst_n, static_wen_group_mux, static_ren_group_mux,
         scan_id_group_mux, sram_ready, reg_ready;
  output static_ready_group_mux, sram_ren, sram_wen, reg_wen, reg_ren, id_sel;
  wire   n2;
  tri   clk;
  tri   rst_n;
  tri   static_wen_group_mux;
  tri   static_ren_group_mux;
  tri   [19:0] static_addr_group_mux;
  tri   [31:0] static_wdata_group_mux;
  tri   [31:0] static_rdata_group_mux;
  tri   static_ready_group_mux;
  tri   id_valid;
  tri   scan_wen;
  tri   scan_ren;
  tri   scan_addr_15_0;
  tri   scan_addr_14_0;
  tri   scan_addr_13_0;
  tri   scan_addr_12_0;
  tri   scan_addr_11_0;
  tri   scan_addr_10_0;
  tri   scan_addr_9_0;
  tri   scan_addr_8_0;
  tri   scan_addr_7_0;
  tri   scan_addr_6_0;
  tri   scan_addr_5_0;
  tri   scan_addr_4_0;
  tri   scan_addr_3_0;
  tri   scan_addr_2_0;
  tri   scan_addr_1_0;
  tri   scan_addr_0_0;
  tri   scan_wdata_31_0;
  tri   scan_wdata_30_0;
  tri   scan_wdata_29_0;
  tri   scan_wdata_28_0;
  tri   scan_wdata_27_0;
  tri   scan_wdata_26_0;
  tri   scan_wdata_25_0;
  tri   scan_wdata_24_0;
  tri   scan_wdata_23_0;
  tri   scan_wdata_22_0;
  tri   scan_wdata_21_0;
  tri   scan_wdata_20_0;
  tri   scan_wdata_19_0;
  tri   scan_wdata_18_0;
  tri   scan_wdata_17_0;
  tri   scan_wdata_16_0;
  tri   scan_wdata_15_0;
  tri   scan_wdata_14_0;
  tri   scan_wdata_13_0;
  tri   scan_wdata_12_0;
  tri   scan_wdata_11_0;
  tri   scan_wdata_10_0;
  tri   scan_wdata_9_0;
  tri   scan_wdata_8_0;
  tri   scan_wdata_7_0;
  tri   scan_wdata_6_0;
  tri   scan_wdata_5_0;
  tri   scan_wdata_4_0;
  tri   scan_wdata_3_0;
  tri   scan_wdata_2_0;
  tri   scan_wdata_1_0;
  tri   scan_wdata_0_0;
  tri   scan_rdata_31_0;
  tri   scan_rdata_30_0;
  tri   scan_rdata_29_0;
  tri   scan_rdata_28_0;
  tri   scan_rdata_27_0;
  tri   scan_rdata_26_0;
  tri   scan_rdata_25_0;
  tri   scan_rdata_24_0;
  tri   scan_rdata_23_0;
  tri   scan_rdata_22_0;
  tri   scan_rdata_21_0;
  tri   scan_rdata_20_0;
  tri   scan_rdata_19_0;
  tri   scan_rdata_18_0;
  tri   scan_rdata_17_0;
  tri   scan_rdata_16_0;
  tri   scan_rdata_15_0;
  tri   scan_rdata_14_0;
  tri   scan_rdata_13_0;
  tri   scan_rdata_12_0;
  tri   scan_rdata_11_0;
  tri   scan_rdata_10_0;
  tri   scan_rdata_9_0;
  tri   scan_rdata_8_0;
  tri   scan_rdata_7_0;
  tri   scan_rdata_6_0;
  tri   scan_rdata_5_0;
  tri   scan_rdata_4_0;
  tri   scan_rdata_3_0;
  tri   scan_rdata_2_0;
  tri   scan_rdata_1_0;
  tri   scan_rdata_0_0;
  tri   scan_ready;

  rwctr rwctr_inst ( .clk(clk), .rst_n(rst_n), .id_valid(id_valid), 
        .static_wen(static_wen_group_mux), .static_ren(static_ren_group_mux), 
        .static_addr(static_addr_group_mux[11:0]), .static_wdata(
        static_wdata_group_mux), .static_ready(static_ready_group_mux), 
        .static_rdata(static_rdata_group_mux), .scan_wen(scan_wen), .scan_ren(
        scan_ren), .scan_addr({scan_addr_15_0, scan_addr_14_0, scan_addr_13_0, 
        scan_addr_12_0, scan_addr_11_0, scan_addr_10_0, scan_addr_9_0, 
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
        .scan_addr({scan_addr_15_0, scan_addr_14_0, scan_addr_13_0, 
        scan_addr_12_0, scan_addr_11_0, scan_addr_10_0, scan_addr_9_0, 
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
        .reg_ready(reg_ready), .seg_id({n2, seg_id[2:0]}), .id_sel(id_sel) );
  syn_pulse_gen syn_pulse_gen_inst ( .clk(clk), .rst_n(rst_n), .scan_id(
        scan_id_group_mux), .id_valid(id_valid) );
  TIEL U1 ( .ZN(seg_id[3]) );
endmodule

