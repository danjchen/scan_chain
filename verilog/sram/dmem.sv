//*******************************************************************************
//*        Software       : TSMC MEMORY COMPILER 2006.09.01.d.220a
//*        Technology     : 65 nm CMOS LOGIC Low Power LowK Cu 1P9M 1.2
//*                         High-vt logic, High-vt SRAM
//*        Memory Type    : TSMC 65nm low power SP SRAM Without Redundancy
//*        Library Name   : ts1n65lpll2048x128m4 ( user specify: TS1N65LPLL2048X128M4)
//*        Library Version: 220a
//*        Generated Time : 2026/02/03, 11:31:48
//*******************************************************************************
//*******************************************************************************
//*
//*STATEMENT OF USE
//*
//*This information contains confidential and proprietary information of TSMC.
//*No part of this information may be reproduced, transmitted, transcribed,
//*stored in a retrieval system, or translated into any human or computer
//*language, in any form or by any means, electronic, mechanical, magnetic,
//*optical, chemical, manual, or otherwise, without the prior written permission
//*of TSMC. This information was prepared for informational purpose and is for
//*use by TSMC's customers only. TSMC reserves the right to make changes in the
//*information at any time and without notice.
//*
//* Template Version : S_01_41201
//*******************************************************************************
//
//*     CLK         (I) - Clock
//*  	CEB 	    (I) - Chip enable
//*  	CEBM	    (I) - Chip enable for BIST
//*  	WEB 	    (I) - Write enable
//*  	WEBM	    (I) - Write enable for BIST
//*  	A[i]	    (I) - Address input
//*  	AM[i]	    (I) - Address input for BIST
//*  	D[j]	    (I) - Data input
//*  	DM[j]	    (I) - Data input for BIST
//*  	BWEB[j]     (I) - Bit-write enable
//*  	BWEBM[j]    (I) - Bit-write enable for BIST
//*  	Q[j]	    (O) - Output data
//*  	BIST	    (I) - BIST enable
//*  	AWT 	    (I) - Asynchronous write through
//*  	TSEL[1:0]   (I) - Read margin selection (default is 01)
//*





`timescale 1ns/1ps
`celldefine
`ifdef UNIT_DELAY
`define SRAM_DELAY 0.010
`else
`endif

module TS1N65LPLL2048X128M4 ( 
			BIST, AWT,
			CLK, CEB, WEB,

			A, D, BWEB,

			AM, DM, BWEBM,

			Q,

			TSEL,

			CEBM, WEBM
	         		    );

// Define Parameter
parameter numWord = 2048;
parameter numRow = 512;
parameter numCM = 4;
parameter numBit = 128;
parameter numWordAddr = 11;
parameter numRowAddr = 9;
parameter numCMAddr = 2;

parameter Thold = 2.233;
parameter Tawtqh = 0.150;
parameter Tdqh = 0.401;
parameter Tbwqh = 0.438;
parameter preloadFile = "sram.preload.data";
parameter numStuckAt = 20;


//=== IO Ports ===//

// Mode Control
input BIST, AWT;
			
// Normal Mode Input
input CLK;
input CEB;
input WEB;
input [numWordAddr-1:0] A;
input [numBit-1:0] D;
input [numBit-1:0] BWEB;

// BIST Mode Input
input CEBM;
input WEBM;
input [numWordAddr-1:0] AM;
input [numBit-1:0] DM;
input [numBit-1:0] BWEBM;

// Data Output
output [numBit-1:0] Q;

// Test Mode
input [1:0] TSEL;


//=== Internal Signals ===//

// Mode Control
wire BIST_i, AWT_i;
			
// Normal Mode Input
wire CLK_i;
wire CEB_i;
wire WEB_i;
wire [numWordAddr-1:0] A_i;
wire [numBit-1:0] D_i;
wire [numBit-1:0] BWEB_i;

// BIST Mode Input
wire CEBM_i;
wire WEBM_i;
wire [numWordAddr-1:0] AM_i;
wire [numBit-1:0] DM_i;
wire [numBit-1:0] BWEBM_i;

// Data Output
wire [numBit-1:0] Q_i;

// Test Mode
wire [1:0] TSEL_i;


//=== IO Buffers ===//

// Mode Control
buf (BIST_i, BIST);
buf (AWT_i, AWT);
			
// Normal Mode Input
buf (CLK_i, CLK);
buf (CEB_i, CEB);
buf (WEB_i, WEB);

buf (A_i[0], A[0]);
buf (A_i[1], A[1]);
buf (A_i[2], A[2]);
buf (A_i[3], A[3]);
buf (A_i[4], A[4]);
buf (A_i[5], A[5]);
buf (A_i[6], A[6]);
buf (A_i[7], A[7]);
buf (A_i[8], A[8]);
buf (A_i[9], A[9]);
buf (A_i[10], A[10]);

buf (D_i[0], D[0]);
buf (D_i[1], D[1]);
buf (D_i[2], D[2]);
buf (D_i[3], D[3]);
buf (D_i[4], D[4]);
buf (D_i[5], D[5]);
buf (D_i[6], D[6]);
buf (D_i[7], D[7]);
buf (D_i[8], D[8]);
buf (D_i[9], D[9]);
buf (D_i[10], D[10]);
buf (D_i[11], D[11]);
buf (D_i[12], D[12]);
buf (D_i[13], D[13]);
buf (D_i[14], D[14]);
buf (D_i[15], D[15]);
buf (D_i[16], D[16]);
buf (D_i[17], D[17]);
buf (D_i[18], D[18]);
buf (D_i[19], D[19]);
buf (D_i[20], D[20]);
buf (D_i[21], D[21]);
buf (D_i[22], D[22]);
buf (D_i[23], D[23]);
buf (D_i[24], D[24]);
buf (D_i[25], D[25]);
buf (D_i[26], D[26]);
buf (D_i[27], D[27]);
buf (D_i[28], D[28]);
buf (D_i[29], D[29]);
buf (D_i[30], D[30]);
buf (D_i[31], D[31]);
buf (D_i[32], D[32]);
buf (D_i[33], D[33]);
buf (D_i[34], D[34]);
buf (D_i[35], D[35]);
buf (D_i[36], D[36]);
buf (D_i[37], D[37]);
buf (D_i[38], D[38]);
buf (D_i[39], D[39]);
buf (D_i[40], D[40]);
buf (D_i[41], D[41]);
buf (D_i[42], D[42]);
buf (D_i[43], D[43]);
buf (D_i[44], D[44]);
buf (D_i[45], D[45]);
buf (D_i[46], D[46]);
buf (D_i[47], D[47]);
buf (D_i[48], D[48]);
buf (D_i[49], D[49]);
buf (D_i[50], D[50]);
buf (D_i[51], D[51]);
buf (D_i[52], D[52]);
buf (D_i[53], D[53]);
buf (D_i[54], D[54]);
buf (D_i[55], D[55]);
buf (D_i[56], D[56]);
buf (D_i[57], D[57]);
buf (D_i[58], D[58]);
buf (D_i[59], D[59]);
buf (D_i[60], D[60]);
buf (D_i[61], D[61]);
buf (D_i[62], D[62]);
buf (D_i[63], D[63]);
buf (D_i[64], D[64]);
buf (D_i[65], D[65]);
buf (D_i[66], D[66]);
buf (D_i[67], D[67]);
buf (D_i[68], D[68]);
buf (D_i[69], D[69]);
buf (D_i[70], D[70]);
buf (D_i[71], D[71]);
buf (D_i[72], D[72]);
buf (D_i[73], D[73]);
buf (D_i[74], D[74]);
buf (D_i[75], D[75]);
buf (D_i[76], D[76]);
buf (D_i[77], D[77]);
buf (D_i[78], D[78]);
buf (D_i[79], D[79]);
buf (D_i[80], D[80]);
buf (D_i[81], D[81]);
buf (D_i[82], D[82]);
buf (D_i[83], D[83]);
buf (D_i[84], D[84]);
buf (D_i[85], D[85]);
buf (D_i[86], D[86]);
buf (D_i[87], D[87]);
buf (D_i[88], D[88]);
buf (D_i[89], D[89]);
buf (D_i[90], D[90]);
buf (D_i[91], D[91]);
buf (D_i[92], D[92]);
buf (D_i[93], D[93]);
buf (D_i[94], D[94]);
buf (D_i[95], D[95]);
buf (D_i[96], D[96]);
buf (D_i[97], D[97]);
buf (D_i[98], D[98]);
buf (D_i[99], D[99]);
buf (D_i[100], D[100]);
buf (D_i[101], D[101]);
buf (D_i[102], D[102]);
buf (D_i[103], D[103]);
buf (D_i[104], D[104]);
buf (D_i[105], D[105]);
buf (D_i[106], D[106]);
buf (D_i[107], D[107]);
buf (D_i[108], D[108]);
buf (D_i[109], D[109]);
buf (D_i[110], D[110]);
buf (D_i[111], D[111]);
buf (D_i[112], D[112]);
buf (D_i[113], D[113]);
buf (D_i[114], D[114]);
buf (D_i[115], D[115]);
buf (D_i[116], D[116]);
buf (D_i[117], D[117]);
buf (D_i[118], D[118]);
buf (D_i[119], D[119]);
buf (D_i[120], D[120]);
buf (D_i[121], D[121]);
buf (D_i[122], D[122]);
buf (D_i[123], D[123]);
buf (D_i[124], D[124]);
buf (D_i[125], D[125]);
buf (D_i[126], D[126]);
buf (D_i[127], D[127]);

buf (BWEB_i[0], BWEB[0]);
buf (BWEB_i[1], BWEB[1]);
buf (BWEB_i[2], BWEB[2]);
buf (BWEB_i[3], BWEB[3]);
buf (BWEB_i[4], BWEB[4]);
buf (BWEB_i[5], BWEB[5]);
buf (BWEB_i[6], BWEB[6]);
buf (BWEB_i[7], BWEB[7]);
buf (BWEB_i[8], BWEB[8]);
buf (BWEB_i[9], BWEB[9]);
buf (BWEB_i[10], BWEB[10]);
buf (BWEB_i[11], BWEB[11]);
buf (BWEB_i[12], BWEB[12]);
buf (BWEB_i[13], BWEB[13]);
buf (BWEB_i[14], BWEB[14]);
buf (BWEB_i[15], BWEB[15]);
buf (BWEB_i[16], BWEB[16]);
buf (BWEB_i[17], BWEB[17]);
buf (BWEB_i[18], BWEB[18]);
buf (BWEB_i[19], BWEB[19]);
buf (BWEB_i[20], BWEB[20]);
buf (BWEB_i[21], BWEB[21]);
buf (BWEB_i[22], BWEB[22]);
buf (BWEB_i[23], BWEB[23]);
buf (BWEB_i[24], BWEB[24]);
buf (BWEB_i[25], BWEB[25]);
buf (BWEB_i[26], BWEB[26]);
buf (BWEB_i[27], BWEB[27]);
buf (BWEB_i[28], BWEB[28]);
buf (BWEB_i[29], BWEB[29]);
buf (BWEB_i[30], BWEB[30]);
buf (BWEB_i[31], BWEB[31]);
buf (BWEB_i[32], BWEB[32]);
buf (BWEB_i[33], BWEB[33]);
buf (BWEB_i[34], BWEB[34]);
buf (BWEB_i[35], BWEB[35]);
buf (BWEB_i[36], BWEB[36]);
buf (BWEB_i[37], BWEB[37]);
buf (BWEB_i[38], BWEB[38]);
buf (BWEB_i[39], BWEB[39]);
buf (BWEB_i[40], BWEB[40]);
buf (BWEB_i[41], BWEB[41]);
buf (BWEB_i[42], BWEB[42]);
buf (BWEB_i[43], BWEB[43]);
buf (BWEB_i[44], BWEB[44]);
buf (BWEB_i[45], BWEB[45]);
buf (BWEB_i[46], BWEB[46]);
buf (BWEB_i[47], BWEB[47]);
buf (BWEB_i[48], BWEB[48]);
buf (BWEB_i[49], BWEB[49]);
buf (BWEB_i[50], BWEB[50]);
buf (BWEB_i[51], BWEB[51]);
buf (BWEB_i[52], BWEB[52]);
buf (BWEB_i[53], BWEB[53]);
buf (BWEB_i[54], BWEB[54]);
buf (BWEB_i[55], BWEB[55]);
buf (BWEB_i[56], BWEB[56]);
buf (BWEB_i[57], BWEB[57]);
buf (BWEB_i[58], BWEB[58]);
buf (BWEB_i[59], BWEB[59]);
buf (BWEB_i[60], BWEB[60]);
buf (BWEB_i[61], BWEB[61]);
buf (BWEB_i[62], BWEB[62]);
buf (BWEB_i[63], BWEB[63]);
buf (BWEB_i[64], BWEB[64]);
buf (BWEB_i[65], BWEB[65]);
buf (BWEB_i[66], BWEB[66]);
buf (BWEB_i[67], BWEB[67]);
buf (BWEB_i[68], BWEB[68]);
buf (BWEB_i[69], BWEB[69]);
buf (BWEB_i[70], BWEB[70]);
buf (BWEB_i[71], BWEB[71]);
buf (BWEB_i[72], BWEB[72]);
buf (BWEB_i[73], BWEB[73]);
buf (BWEB_i[74], BWEB[74]);
buf (BWEB_i[75], BWEB[75]);
buf (BWEB_i[76], BWEB[76]);
buf (BWEB_i[77], BWEB[77]);
buf (BWEB_i[78], BWEB[78]);
buf (BWEB_i[79], BWEB[79]);
buf (BWEB_i[80], BWEB[80]);
buf (BWEB_i[81], BWEB[81]);
buf (BWEB_i[82], BWEB[82]);
buf (BWEB_i[83], BWEB[83]);
buf (BWEB_i[84], BWEB[84]);
buf (BWEB_i[85], BWEB[85]);
buf (BWEB_i[86], BWEB[86]);
buf (BWEB_i[87], BWEB[87]);
buf (BWEB_i[88], BWEB[88]);
buf (BWEB_i[89], BWEB[89]);
buf (BWEB_i[90], BWEB[90]);
buf (BWEB_i[91], BWEB[91]);
buf (BWEB_i[92], BWEB[92]);
buf (BWEB_i[93], BWEB[93]);
buf (BWEB_i[94], BWEB[94]);
buf (BWEB_i[95], BWEB[95]);
buf (BWEB_i[96], BWEB[96]);
buf (BWEB_i[97], BWEB[97]);
buf (BWEB_i[98], BWEB[98]);
buf (BWEB_i[99], BWEB[99]);
buf (BWEB_i[100], BWEB[100]);
buf (BWEB_i[101], BWEB[101]);
buf (BWEB_i[102], BWEB[102]);
buf (BWEB_i[103], BWEB[103]);
buf (BWEB_i[104], BWEB[104]);
buf (BWEB_i[105], BWEB[105]);
buf (BWEB_i[106], BWEB[106]);
buf (BWEB_i[107], BWEB[107]);
buf (BWEB_i[108], BWEB[108]);
buf (BWEB_i[109], BWEB[109]);
buf (BWEB_i[110], BWEB[110]);
buf (BWEB_i[111], BWEB[111]);
buf (BWEB_i[112], BWEB[112]);
buf (BWEB_i[113], BWEB[113]);
buf (BWEB_i[114], BWEB[114]);
buf (BWEB_i[115], BWEB[115]);
buf (BWEB_i[116], BWEB[116]);
buf (BWEB_i[117], BWEB[117]);
buf (BWEB_i[118], BWEB[118]);
buf (BWEB_i[119], BWEB[119]);
buf (BWEB_i[120], BWEB[120]);
buf (BWEB_i[121], BWEB[121]);
buf (BWEB_i[122], BWEB[122]);
buf (BWEB_i[123], BWEB[123]);
buf (BWEB_i[124], BWEB[124]);
buf (BWEB_i[125], BWEB[125]);
buf (BWEB_i[126], BWEB[126]);
buf (BWEB_i[127], BWEB[127]);

// BIST Mode Input
buf (CEBM_i, CEBM);
buf (WEBM_i, WEBM);

buf (AM_i[0], AM[0]);
buf (AM_i[1], AM[1]);
buf (AM_i[2], AM[2]);
buf (AM_i[3], AM[3]);
buf (AM_i[4], AM[4]);
buf (AM_i[5], AM[5]);
buf (AM_i[6], AM[6]);
buf (AM_i[7], AM[7]);
buf (AM_i[8], AM[8]);
buf (AM_i[9], AM[9]);
buf (AM_i[10], AM[10]);

buf (DM_i[0], DM[0]);
buf (DM_i[1], DM[1]);
buf (DM_i[2], DM[2]);
buf (DM_i[3], DM[3]);
buf (DM_i[4], DM[4]);
buf (DM_i[5], DM[5]);
buf (DM_i[6], DM[6]);
buf (DM_i[7], DM[7]);
buf (DM_i[8], DM[8]);
buf (DM_i[9], DM[9]);
buf (DM_i[10], DM[10]);
buf (DM_i[11], DM[11]);
buf (DM_i[12], DM[12]);
buf (DM_i[13], DM[13]);
buf (DM_i[14], DM[14]);
buf (DM_i[15], DM[15]);
buf (DM_i[16], DM[16]);
buf (DM_i[17], DM[17]);
buf (DM_i[18], DM[18]);
buf (DM_i[19], DM[19]);
buf (DM_i[20], DM[20]);
buf (DM_i[21], DM[21]);
buf (DM_i[22], DM[22]);
buf (DM_i[23], DM[23]);
buf (DM_i[24], DM[24]);
buf (DM_i[25], DM[25]);
buf (DM_i[26], DM[26]);
buf (DM_i[27], DM[27]);
buf (DM_i[28], DM[28]);
buf (DM_i[29], DM[29]);
buf (DM_i[30], DM[30]);
buf (DM_i[31], DM[31]);
buf (DM_i[32], DM[32]);
buf (DM_i[33], DM[33]);
buf (DM_i[34], DM[34]);
buf (DM_i[35], DM[35]);
buf (DM_i[36], DM[36]);
buf (DM_i[37], DM[37]);
buf (DM_i[38], DM[38]);
buf (DM_i[39], DM[39]);
buf (DM_i[40], DM[40]);
buf (DM_i[41], DM[41]);
buf (DM_i[42], DM[42]);
buf (DM_i[43], DM[43]);
buf (DM_i[44], DM[44]);
buf (DM_i[45], DM[45]);
buf (DM_i[46], DM[46]);
buf (DM_i[47], DM[47]);
buf (DM_i[48], DM[48]);
buf (DM_i[49], DM[49]);
buf (DM_i[50], DM[50]);
buf (DM_i[51], DM[51]);
buf (DM_i[52], DM[52]);
buf (DM_i[53], DM[53]);
buf (DM_i[54], DM[54]);
buf (DM_i[55], DM[55]);
buf (DM_i[56], DM[56]);
buf (DM_i[57], DM[57]);
buf (DM_i[58], DM[58]);
buf (DM_i[59], DM[59]);
buf (DM_i[60], DM[60]);
buf (DM_i[61], DM[61]);
buf (DM_i[62], DM[62]);
buf (DM_i[63], DM[63]);
buf (DM_i[64], DM[64]);
buf (DM_i[65], DM[65]);
buf (DM_i[66], DM[66]);
buf (DM_i[67], DM[67]);
buf (DM_i[68], DM[68]);
buf (DM_i[69], DM[69]);
buf (DM_i[70], DM[70]);
buf (DM_i[71], DM[71]);
buf (DM_i[72], DM[72]);
buf (DM_i[73], DM[73]);
buf (DM_i[74], DM[74]);
buf (DM_i[75], DM[75]);
buf (DM_i[76], DM[76]);
buf (DM_i[77], DM[77]);
buf (DM_i[78], DM[78]);
buf (DM_i[79], DM[79]);
buf (DM_i[80], DM[80]);
buf (DM_i[81], DM[81]);
buf (DM_i[82], DM[82]);
buf (DM_i[83], DM[83]);
buf (DM_i[84], DM[84]);
buf (DM_i[85], DM[85]);
buf (DM_i[86], DM[86]);
buf (DM_i[87], DM[87]);
buf (DM_i[88], DM[88]);
buf (DM_i[89], DM[89]);
buf (DM_i[90], DM[90]);
buf (DM_i[91], DM[91]);
buf (DM_i[92], DM[92]);
buf (DM_i[93], DM[93]);
buf (DM_i[94], DM[94]);
buf (DM_i[95], DM[95]);
buf (DM_i[96], DM[96]);
buf (DM_i[97], DM[97]);
buf (DM_i[98], DM[98]);
buf (DM_i[99], DM[99]);
buf (DM_i[100], DM[100]);
buf (DM_i[101], DM[101]);
buf (DM_i[102], DM[102]);
buf (DM_i[103], DM[103]);
buf (DM_i[104], DM[104]);
buf (DM_i[105], DM[105]);
buf (DM_i[106], DM[106]);
buf (DM_i[107], DM[107]);
buf (DM_i[108], DM[108]);
buf (DM_i[109], DM[109]);
buf (DM_i[110], DM[110]);
buf (DM_i[111], DM[111]);
buf (DM_i[112], DM[112]);
buf (DM_i[113], DM[113]);
buf (DM_i[114], DM[114]);
buf (DM_i[115], DM[115]);
buf (DM_i[116], DM[116]);
buf (DM_i[117], DM[117]);
buf (DM_i[118], DM[118]);
buf (DM_i[119], DM[119]);
buf (DM_i[120], DM[120]);
buf (DM_i[121], DM[121]);
buf (DM_i[122], DM[122]);
buf (DM_i[123], DM[123]);
buf (DM_i[124], DM[124]);
buf (DM_i[125], DM[125]);
buf (DM_i[126], DM[126]);
buf (DM_i[127], DM[127]);

buf (BWEBM_i[0], BWEBM[0]);
buf (BWEBM_i[1], BWEBM[1]);
buf (BWEBM_i[2], BWEBM[2]);
buf (BWEBM_i[3], BWEBM[3]);
buf (BWEBM_i[4], BWEBM[4]);
buf (BWEBM_i[5], BWEBM[5]);
buf (BWEBM_i[6], BWEBM[6]);
buf (BWEBM_i[7], BWEBM[7]);
buf (BWEBM_i[8], BWEBM[8]);
buf (BWEBM_i[9], BWEBM[9]);
buf (BWEBM_i[10], BWEBM[10]);
buf (BWEBM_i[11], BWEBM[11]);
buf (BWEBM_i[12], BWEBM[12]);
buf (BWEBM_i[13], BWEBM[13]);
buf (BWEBM_i[14], BWEBM[14]);
buf (BWEBM_i[15], BWEBM[15]);
buf (BWEBM_i[16], BWEBM[16]);
buf (BWEBM_i[17], BWEBM[17]);
buf (BWEBM_i[18], BWEBM[18]);
buf (BWEBM_i[19], BWEBM[19]);
buf (BWEBM_i[20], BWEBM[20]);
buf (BWEBM_i[21], BWEBM[21]);
buf (BWEBM_i[22], BWEBM[22]);
buf (BWEBM_i[23], BWEBM[23]);
buf (BWEBM_i[24], BWEBM[24]);
buf (BWEBM_i[25], BWEBM[25]);
buf (BWEBM_i[26], BWEBM[26]);
buf (BWEBM_i[27], BWEBM[27]);
buf (BWEBM_i[28], BWEBM[28]);
buf (BWEBM_i[29], BWEBM[29]);
buf (BWEBM_i[30], BWEBM[30]);
buf (BWEBM_i[31], BWEBM[31]);
buf (BWEBM_i[32], BWEBM[32]);
buf (BWEBM_i[33], BWEBM[33]);
buf (BWEBM_i[34], BWEBM[34]);
buf (BWEBM_i[35], BWEBM[35]);
buf (BWEBM_i[36], BWEBM[36]);
buf (BWEBM_i[37], BWEBM[37]);
buf (BWEBM_i[38], BWEBM[38]);
buf (BWEBM_i[39], BWEBM[39]);
buf (BWEBM_i[40], BWEBM[40]);
buf (BWEBM_i[41], BWEBM[41]);
buf (BWEBM_i[42], BWEBM[42]);
buf (BWEBM_i[43], BWEBM[43]);
buf (BWEBM_i[44], BWEBM[44]);
buf (BWEBM_i[45], BWEBM[45]);
buf (BWEBM_i[46], BWEBM[46]);
buf (BWEBM_i[47], BWEBM[47]);
buf (BWEBM_i[48], BWEBM[48]);
buf (BWEBM_i[49], BWEBM[49]);
buf (BWEBM_i[50], BWEBM[50]);
buf (BWEBM_i[51], BWEBM[51]);
buf (BWEBM_i[52], BWEBM[52]);
buf (BWEBM_i[53], BWEBM[53]);
buf (BWEBM_i[54], BWEBM[54]);
buf (BWEBM_i[55], BWEBM[55]);
buf (BWEBM_i[56], BWEBM[56]);
buf (BWEBM_i[57], BWEBM[57]);
buf (BWEBM_i[58], BWEBM[58]);
buf (BWEBM_i[59], BWEBM[59]);
buf (BWEBM_i[60], BWEBM[60]);
buf (BWEBM_i[61], BWEBM[61]);
buf (BWEBM_i[62], BWEBM[62]);
buf (BWEBM_i[63], BWEBM[63]);
buf (BWEBM_i[64], BWEBM[64]);
buf (BWEBM_i[65], BWEBM[65]);
buf (BWEBM_i[66], BWEBM[66]);
buf (BWEBM_i[67], BWEBM[67]);
buf (BWEBM_i[68], BWEBM[68]);
buf (BWEBM_i[69], BWEBM[69]);
buf (BWEBM_i[70], BWEBM[70]);
buf (BWEBM_i[71], BWEBM[71]);
buf (BWEBM_i[72], BWEBM[72]);
buf (BWEBM_i[73], BWEBM[73]);
buf (BWEBM_i[74], BWEBM[74]);
buf (BWEBM_i[75], BWEBM[75]);
buf (BWEBM_i[76], BWEBM[76]);
buf (BWEBM_i[77], BWEBM[77]);
buf (BWEBM_i[78], BWEBM[78]);
buf (BWEBM_i[79], BWEBM[79]);
buf (BWEBM_i[80], BWEBM[80]);
buf (BWEBM_i[81], BWEBM[81]);
buf (BWEBM_i[82], BWEBM[82]);
buf (BWEBM_i[83], BWEBM[83]);
buf (BWEBM_i[84], BWEBM[84]);
buf (BWEBM_i[85], BWEBM[85]);
buf (BWEBM_i[86], BWEBM[86]);
buf (BWEBM_i[87], BWEBM[87]);
buf (BWEBM_i[88], BWEBM[88]);
buf (BWEBM_i[89], BWEBM[89]);
buf (BWEBM_i[90], BWEBM[90]);
buf (BWEBM_i[91], BWEBM[91]);
buf (BWEBM_i[92], BWEBM[92]);
buf (BWEBM_i[93], BWEBM[93]);
buf (BWEBM_i[94], BWEBM[94]);
buf (BWEBM_i[95], BWEBM[95]);
buf (BWEBM_i[96], BWEBM[96]);
buf (BWEBM_i[97], BWEBM[97]);
buf (BWEBM_i[98], BWEBM[98]);
buf (BWEBM_i[99], BWEBM[99]);
buf (BWEBM_i[100], BWEBM[100]);
buf (BWEBM_i[101], BWEBM[101]);
buf (BWEBM_i[102], BWEBM[102]);
buf (BWEBM_i[103], BWEBM[103]);
buf (BWEBM_i[104], BWEBM[104]);
buf (BWEBM_i[105], BWEBM[105]);
buf (BWEBM_i[106], BWEBM[106]);
buf (BWEBM_i[107], BWEBM[107]);
buf (BWEBM_i[108], BWEBM[108]);
buf (BWEBM_i[109], BWEBM[109]);
buf (BWEBM_i[110], BWEBM[110]);
buf (BWEBM_i[111], BWEBM[111]);
buf (BWEBM_i[112], BWEBM[112]);
buf (BWEBM_i[113], BWEBM[113]);
buf (BWEBM_i[114], BWEBM[114]);
buf (BWEBM_i[115], BWEBM[115]);
buf (BWEBM_i[116], BWEBM[116]);
buf (BWEBM_i[117], BWEBM[117]);
buf (BWEBM_i[118], BWEBM[118]);
buf (BWEBM_i[119], BWEBM[119]);
buf (BWEBM_i[120], BWEBM[120]);
buf (BWEBM_i[121], BWEBM[121]);
buf (BWEBM_i[122], BWEBM[122]);
buf (BWEBM_i[123], BWEBM[123]);
buf (BWEBM_i[124], BWEBM[124]);
buf (BWEBM_i[125], BWEBM[125]);
buf (BWEBM_i[126], BWEBM[126]);
buf (BWEBM_i[127], BWEBM[127]);

// Data Output
nmos (Q[0], Q_i[0], 1'b1);
nmos (Q[1], Q_i[1], 1'b1);
nmos (Q[2], Q_i[2], 1'b1);
nmos (Q[3], Q_i[3], 1'b1);
nmos (Q[4], Q_i[4], 1'b1);
nmos (Q[5], Q_i[5], 1'b1);
nmos (Q[6], Q_i[6], 1'b1);
nmos (Q[7], Q_i[7], 1'b1);
nmos (Q[8], Q_i[8], 1'b1);
nmos (Q[9], Q_i[9], 1'b1);
nmos (Q[10], Q_i[10], 1'b1);
nmos (Q[11], Q_i[11], 1'b1);
nmos (Q[12], Q_i[12], 1'b1);
nmos (Q[13], Q_i[13], 1'b1);
nmos (Q[14], Q_i[14], 1'b1);
nmos (Q[15], Q_i[15], 1'b1);
nmos (Q[16], Q_i[16], 1'b1);
nmos (Q[17], Q_i[17], 1'b1);
nmos (Q[18], Q_i[18], 1'b1);
nmos (Q[19], Q_i[19], 1'b1);
nmos (Q[20], Q_i[20], 1'b1);
nmos (Q[21], Q_i[21], 1'b1);
nmos (Q[22], Q_i[22], 1'b1);
nmos (Q[23], Q_i[23], 1'b1);
nmos (Q[24], Q_i[24], 1'b1);
nmos (Q[25], Q_i[25], 1'b1);
nmos (Q[26], Q_i[26], 1'b1);
nmos (Q[27], Q_i[27], 1'b1);
nmos (Q[28], Q_i[28], 1'b1);
nmos (Q[29], Q_i[29], 1'b1);
nmos (Q[30], Q_i[30], 1'b1);
nmos (Q[31], Q_i[31], 1'b1);
nmos (Q[32], Q_i[32], 1'b1);
nmos (Q[33], Q_i[33], 1'b1);
nmos (Q[34], Q_i[34], 1'b1);
nmos (Q[35], Q_i[35], 1'b1);
nmos (Q[36], Q_i[36], 1'b1);
nmos (Q[37], Q_i[37], 1'b1);
nmos (Q[38], Q_i[38], 1'b1);
nmos (Q[39], Q_i[39], 1'b1);
nmos (Q[40], Q_i[40], 1'b1);
nmos (Q[41], Q_i[41], 1'b1);
nmos (Q[42], Q_i[42], 1'b1);
nmos (Q[43], Q_i[43], 1'b1);
nmos (Q[44], Q_i[44], 1'b1);
nmos (Q[45], Q_i[45], 1'b1);
nmos (Q[46], Q_i[46], 1'b1);
nmos (Q[47], Q_i[47], 1'b1);
nmos (Q[48], Q_i[48], 1'b1);
nmos (Q[49], Q_i[49], 1'b1);
nmos (Q[50], Q_i[50], 1'b1);
nmos (Q[51], Q_i[51], 1'b1);
nmos (Q[52], Q_i[52], 1'b1);
nmos (Q[53], Q_i[53], 1'b1);
nmos (Q[54], Q_i[54], 1'b1);
nmos (Q[55], Q_i[55], 1'b1);
nmos (Q[56], Q_i[56], 1'b1);
nmos (Q[57], Q_i[57], 1'b1);
nmos (Q[58], Q_i[58], 1'b1);
nmos (Q[59], Q_i[59], 1'b1);
nmos (Q[60], Q_i[60], 1'b1);
nmos (Q[61], Q_i[61], 1'b1);
nmos (Q[62], Q_i[62], 1'b1);
nmos (Q[63], Q_i[63], 1'b1);
nmos (Q[64], Q_i[64], 1'b1);
nmos (Q[65], Q_i[65], 1'b1);
nmos (Q[66], Q_i[66], 1'b1);
nmos (Q[67], Q_i[67], 1'b1);
nmos (Q[68], Q_i[68], 1'b1);
nmos (Q[69], Q_i[69], 1'b1);
nmos (Q[70], Q_i[70], 1'b1);
nmos (Q[71], Q_i[71], 1'b1);
nmos (Q[72], Q_i[72], 1'b1);
nmos (Q[73], Q_i[73], 1'b1);
nmos (Q[74], Q_i[74], 1'b1);
nmos (Q[75], Q_i[75], 1'b1);
nmos (Q[76], Q_i[76], 1'b1);
nmos (Q[77], Q_i[77], 1'b1);
nmos (Q[78], Q_i[78], 1'b1);
nmos (Q[79], Q_i[79], 1'b1);
nmos (Q[80], Q_i[80], 1'b1);
nmos (Q[81], Q_i[81], 1'b1);
nmos (Q[82], Q_i[82], 1'b1);
nmos (Q[83], Q_i[83], 1'b1);
nmos (Q[84], Q_i[84], 1'b1);
nmos (Q[85], Q_i[85], 1'b1);
nmos (Q[86], Q_i[86], 1'b1);
nmos (Q[87], Q_i[87], 1'b1);
nmos (Q[88], Q_i[88], 1'b1);
nmos (Q[89], Q_i[89], 1'b1);
nmos (Q[90], Q_i[90], 1'b1);
nmos (Q[91], Q_i[91], 1'b1);
nmos (Q[92], Q_i[92], 1'b1);
nmos (Q[93], Q_i[93], 1'b1);
nmos (Q[94], Q_i[94], 1'b1);
nmos (Q[95], Q_i[95], 1'b1);
nmos (Q[96], Q_i[96], 1'b1);
nmos (Q[97], Q_i[97], 1'b1);
nmos (Q[98], Q_i[98], 1'b1);
nmos (Q[99], Q_i[99], 1'b1);
nmos (Q[100], Q_i[100], 1'b1);
nmos (Q[101], Q_i[101], 1'b1);
nmos (Q[102], Q_i[102], 1'b1);
nmos (Q[103], Q_i[103], 1'b1);
nmos (Q[104], Q_i[104], 1'b1);
nmos (Q[105], Q_i[105], 1'b1);
nmos (Q[106], Q_i[106], 1'b1);
nmos (Q[107], Q_i[107], 1'b1);
nmos (Q[108], Q_i[108], 1'b1);
nmos (Q[109], Q_i[109], 1'b1);
nmos (Q[110], Q_i[110], 1'b1);
nmos (Q[111], Q_i[111], 1'b1);
nmos (Q[112], Q_i[112], 1'b1);
nmos (Q[113], Q_i[113], 1'b1);
nmos (Q[114], Q_i[114], 1'b1);
nmos (Q[115], Q_i[115], 1'b1);
nmos (Q[116], Q_i[116], 1'b1);
nmos (Q[117], Q_i[117], 1'b1);
nmos (Q[118], Q_i[118], 1'b1);
nmos (Q[119], Q_i[119], 1'b1);
nmos (Q[120], Q_i[120], 1'b1);
nmos (Q[121], Q_i[121], 1'b1);
nmos (Q[122], Q_i[122], 1'b1);
nmos (Q[123], Q_i[123], 1'b1);
nmos (Q[124], Q_i[124], 1'b1);
nmos (Q[125], Q_i[125], 1'b1);
nmos (Q[126], Q_i[126], 1'b1);
nmos (Q[127], Q_i[127], 1'b1);

// Test Mode
buf (TSEL_i[0], TSEL[0]);
buf (TSEL_i[1], TSEL[1]);

//=== Data Structure ===//
reg [numBit-1:0] MEMORY[numRow-1:0][numCM-1:0];
reg [numBit-1:0] Q_d, Q_d1, Q_awt, Q_awt1;
reg [numBit-1:0] PRELOAD[0:numWord-1];

reg [numBit-1:0] DIN_tmp, ERR_tmp;
reg [numWordAddr-1:0] stuckAt0Addr [numStuckAt:0];
reg [numWordAddr-1:0] stuckAt1Addr [numStuckAt:0];
reg [numBit-1:0] stuckAt0Bit [numStuckAt:0];
reg [numBit-1:0] stuckAt1Bit [numStuckAt:0];

integer i, j;

reg read_flag, write_flag, idle_flag;


`ifdef UNIT_DELAY
`else
reg notify_clk;
reg notify_bist;
reg notify_ceb;
reg notify_web;
reg notify_addr;
reg notify_din;
reg notify_bweb;
`endif	


wire iCEB = BIST_i ? CEBM_i : CEB_i;
wire iWEB = BIST_i ? WEBM_i : WEB_i;
wire [numWordAddr-1:0] iA = BIST_i ? AM_i : A_i;
wire [numWordAddr-numCMAddr-1:0] iRowAddr = iA[numWordAddr-1:numCMAddr];
wire [numCMAddr-1:0] iColAddr = iA[numCMAddr-1:0];
wire [numBit-1:0] iD = BIST_i ? DM_i : D_i;
wire [numBit-1:0] iBWEB = BIST_i ? BWEBM_i : BWEB_i;


`ifdef UNIT_DELAY
`else
wire check_read = read_flag;
wire check_write = write_flag;
wire check_noidle = ~idle_flag;
wire check_read_norm = check_read & ~BIST;
wire check_read_bist = check_read & BIST;
wire check_write_norm = check_write & ~BIST;
wire check_write_bist = check_write & BIST;
wire check_noidle_norm = check_noidle & ~BIST;
wire check_noidle_bist = check_noidle & BIST;
`endif

assign Q_i = AWT_i ? Q_awt : Q_d;


`ifdef UNIT_DELAY
`else
specify

    specparam PATHPULSE$CLK$Q = ( 0, 0.001 );
				
    specparam PATHPULSE$AWT$Q = ( 0, 0.001 );
    specparam PATHPULSE$DM$Q = ( 0, 0.001 );
    specparam PATHPULSE$BWEBM$Q = ( 0, 0.001 );
    specparam PATHPULSE$D$Q = ( 0, 0.001 );
    specparam PATHPULSE$BWEB$Q = ( 0, 0.001 );


    specparam tCYC = 2.603;
    specparam tCKH = 0.316;
    specparam tCKL = 0.542;
    specparam tCS  = 0.460;
    specparam tCH  = 0.000;
    specparam tWS  = 0.471;
    specparam tWH  = 0.000;
    specparam tAS  = 0.489;
    specparam tAH  = 0.000;
    specparam tDS  = 0.381;
    specparam tDH  = 0.000;
    specparam tBWS = 0.369;
    specparam tBWH = 0.000;
    specparam tCD  = 2.350;
    specparam tHOLD  = 2.233;

    specparam tBISTS = 0.908;
    specparam tBISTH = 0.048;
    
    specparam tAWTQ = 0.403;
    specparam tAWTQH = 0.150;
    specparam tDQ = 0.778;
    specparam tDQH = 0.401;
    specparam tBWQ = 0.824;
    specparam tBWQH = 0.438;

// awt timing check 

    (posedge AWT => (Q[0] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[1] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[2] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[3] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[4] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[5] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[6] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[7] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[8] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[9] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[10] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[11] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[12] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[13] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[14] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[15] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[16] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[17] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[18] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[19] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[20] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[21] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[22] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[23] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[24] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[25] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[26] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[27] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[28] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[29] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[30] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[31] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[32] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[33] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[34] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[35] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[36] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[37] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[38] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[39] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[40] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[41] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[42] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[43] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[44] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[45] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[46] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[47] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[48] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[49] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[50] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[51] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[52] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[53] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[54] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[55] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[56] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[57] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[58] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[59] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[60] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[61] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[62] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[63] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[64] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[65] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[66] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[67] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[68] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[69] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[70] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[71] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[72] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[73] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[74] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[75] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[76] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[77] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[78] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[79] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[80] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[81] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[82] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[83] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[84] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[85] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[86] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[87] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[88] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[89] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[90] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[91] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[92] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[93] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[94] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[95] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[96] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[97] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[98] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[99] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[100] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[101] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[102] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[103] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[104] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[105] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[106] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[107] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[108] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[109] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[110] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[111] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[112] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[113] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[114] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[115] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[116] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[117] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[118] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[119] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[120] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[121] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[122] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[123] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[124] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[125] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[126] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);
    (posedge AWT => (Q[127] : 1'bx)) = (tAWTQ, tAWTQ, tAWTQH, tAWTQ, tAWTQH, tAWTQ);

    if(AWT & !BIST) (posedge D[0] => (Q[0] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[0] => (Q[0] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[1] => (Q[1] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[1] => (Q[1] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[2] => (Q[2] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[2] => (Q[2] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[3] => (Q[3] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[3] => (Q[3] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[4] => (Q[4] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[4] => (Q[4] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[5] => (Q[5] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[5] => (Q[5] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[6] => (Q[6] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[6] => (Q[6] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[7] => (Q[7] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[7] => (Q[7] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[8] => (Q[8] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[8] => (Q[8] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[9] => (Q[9] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[9] => (Q[9] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[10] => (Q[10] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[10] => (Q[10] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[11] => (Q[11] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[11] => (Q[11] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[12] => (Q[12] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[12] => (Q[12] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[13] => (Q[13] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[13] => (Q[13] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[14] => (Q[14] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[14] => (Q[14] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[15] => (Q[15] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[15] => (Q[15] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[16] => (Q[16] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[16] => (Q[16] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[17] => (Q[17] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[17] => (Q[17] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[18] => (Q[18] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[18] => (Q[18] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[19] => (Q[19] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[19] => (Q[19] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[20] => (Q[20] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[20] => (Q[20] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[21] => (Q[21] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[21] => (Q[21] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[22] => (Q[22] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[22] => (Q[22] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[23] => (Q[23] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[23] => (Q[23] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[24] => (Q[24] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[24] => (Q[24] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[25] => (Q[25] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[25] => (Q[25] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[26] => (Q[26] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[26] => (Q[26] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[27] => (Q[27] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[27] => (Q[27] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[28] => (Q[28] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[28] => (Q[28] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[29] => (Q[29] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[29] => (Q[29] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[30] => (Q[30] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[30] => (Q[30] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[31] => (Q[31] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[31] => (Q[31] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[32] => (Q[32] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[32] => (Q[32] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[33] => (Q[33] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[33] => (Q[33] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[34] => (Q[34] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[34] => (Q[34] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[35] => (Q[35] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[35] => (Q[35] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[36] => (Q[36] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[36] => (Q[36] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[37] => (Q[37] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[37] => (Q[37] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[38] => (Q[38] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[38] => (Q[38] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[39] => (Q[39] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[39] => (Q[39] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[40] => (Q[40] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[40] => (Q[40] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[41] => (Q[41] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[41] => (Q[41] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[42] => (Q[42] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[42] => (Q[42] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[43] => (Q[43] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[43] => (Q[43] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[44] => (Q[44] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[44] => (Q[44] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[45] => (Q[45] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[45] => (Q[45] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[46] => (Q[46] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[46] => (Q[46] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[47] => (Q[47] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[47] => (Q[47] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[48] => (Q[48] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[48] => (Q[48] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[49] => (Q[49] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[49] => (Q[49] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[50] => (Q[50] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[50] => (Q[50] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[51] => (Q[51] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[51] => (Q[51] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[52] => (Q[52] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[52] => (Q[52] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[53] => (Q[53] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[53] => (Q[53] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[54] => (Q[54] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[54] => (Q[54] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[55] => (Q[55] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[55] => (Q[55] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[56] => (Q[56] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[56] => (Q[56] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[57] => (Q[57] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[57] => (Q[57] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[58] => (Q[58] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[58] => (Q[58] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[59] => (Q[59] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[59] => (Q[59] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[60] => (Q[60] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[60] => (Q[60] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[61] => (Q[61] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[61] => (Q[61] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[62] => (Q[62] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[62] => (Q[62] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[63] => (Q[63] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[63] => (Q[63] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[64] => (Q[64] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[64] => (Q[64] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[65] => (Q[65] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[65] => (Q[65] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[66] => (Q[66] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[66] => (Q[66] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[67] => (Q[67] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[67] => (Q[67] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[68] => (Q[68] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[68] => (Q[68] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[69] => (Q[69] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[69] => (Q[69] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[70] => (Q[70] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[70] => (Q[70] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[71] => (Q[71] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[71] => (Q[71] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[72] => (Q[72] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[72] => (Q[72] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[73] => (Q[73] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[73] => (Q[73] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[74] => (Q[74] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[74] => (Q[74] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[75] => (Q[75] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[75] => (Q[75] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[76] => (Q[76] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[76] => (Q[76] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[77] => (Q[77] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[77] => (Q[77] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[78] => (Q[78] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[78] => (Q[78] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[79] => (Q[79] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[79] => (Q[79] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[80] => (Q[80] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[80] => (Q[80] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[81] => (Q[81] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[81] => (Q[81] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[82] => (Q[82] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[82] => (Q[82] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[83] => (Q[83] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[83] => (Q[83] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[84] => (Q[84] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[84] => (Q[84] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[85] => (Q[85] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[85] => (Q[85] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[86] => (Q[86] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[86] => (Q[86] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[87] => (Q[87] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[87] => (Q[87] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[88] => (Q[88] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[88] => (Q[88] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[89] => (Q[89] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[89] => (Q[89] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[90] => (Q[90] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[90] => (Q[90] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[91] => (Q[91] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[91] => (Q[91] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[92] => (Q[92] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[92] => (Q[92] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[93] => (Q[93] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[93] => (Q[93] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[94] => (Q[94] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[94] => (Q[94] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[95] => (Q[95] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[95] => (Q[95] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[96] => (Q[96] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[96] => (Q[96] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[97] => (Q[97] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[97] => (Q[97] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[98] => (Q[98] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[98] => (Q[98] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[99] => (Q[99] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[99] => (Q[99] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[100] => (Q[100] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[100] => (Q[100] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[101] => (Q[101] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[101] => (Q[101] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[102] => (Q[102] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[102] => (Q[102] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[103] => (Q[103] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[103] => (Q[103] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[104] => (Q[104] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[104] => (Q[104] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[105] => (Q[105] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[105] => (Q[105] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[106] => (Q[106] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[106] => (Q[106] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[107] => (Q[107] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[107] => (Q[107] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[108] => (Q[108] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[108] => (Q[108] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[109] => (Q[109] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[109] => (Q[109] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[110] => (Q[110] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[110] => (Q[110] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[111] => (Q[111] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[111] => (Q[111] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[112] => (Q[112] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[112] => (Q[112] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[113] => (Q[113] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[113] => (Q[113] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[114] => (Q[114] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[114] => (Q[114] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[115] => (Q[115] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[115] => (Q[115] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[116] => (Q[116] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[116] => (Q[116] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[117] => (Q[117] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[117] => (Q[117] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[118] => (Q[118] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[118] => (Q[118] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[119] => (Q[119] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[119] => (Q[119] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[120] => (Q[120] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[120] => (Q[120] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[121] => (Q[121] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[121] => (Q[121] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[122] => (Q[122] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[122] => (Q[122] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[123] => (Q[123] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[123] => (Q[123] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[124] => (Q[124] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[124] => (Q[124] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[125] => (Q[125] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[125] => (Q[125] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[126] => (Q[126] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[126] => (Q[126] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (posedge D[127] => (Q[127] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & !BIST) (negedge D[127] => (Q[127] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);

    if(AWT & !BIST) (posedge BWEB[0] => (Q[0] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[0] => (Q[0] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[1] => (Q[1] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[1] => (Q[1] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[2] => (Q[2] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[2] => (Q[2] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[3] => (Q[3] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[3] => (Q[3] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[4] => (Q[4] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[4] => (Q[4] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[5] => (Q[5] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[5] => (Q[5] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[6] => (Q[6] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[6] => (Q[6] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[7] => (Q[7] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[7] => (Q[7] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[8] => (Q[8] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[8] => (Q[8] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[9] => (Q[9] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[9] => (Q[9] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[10] => (Q[10] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[10] => (Q[10] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[11] => (Q[11] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[11] => (Q[11] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[12] => (Q[12] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[12] => (Q[12] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[13] => (Q[13] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[13] => (Q[13] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[14] => (Q[14] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[14] => (Q[14] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[15] => (Q[15] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[15] => (Q[15] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[16] => (Q[16] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[16] => (Q[16] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[17] => (Q[17] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[17] => (Q[17] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[18] => (Q[18] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[18] => (Q[18] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[19] => (Q[19] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[19] => (Q[19] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[20] => (Q[20] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[20] => (Q[20] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[21] => (Q[21] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[21] => (Q[21] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[22] => (Q[22] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[22] => (Q[22] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[23] => (Q[23] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[23] => (Q[23] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[24] => (Q[24] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[24] => (Q[24] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[25] => (Q[25] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[25] => (Q[25] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[26] => (Q[26] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[26] => (Q[26] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[27] => (Q[27] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[27] => (Q[27] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[28] => (Q[28] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[28] => (Q[28] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[29] => (Q[29] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[29] => (Q[29] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[30] => (Q[30] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[30] => (Q[30] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[31] => (Q[31] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[31] => (Q[31] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[32] => (Q[32] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[32] => (Q[32] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[33] => (Q[33] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[33] => (Q[33] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[34] => (Q[34] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[34] => (Q[34] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[35] => (Q[35] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[35] => (Q[35] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[36] => (Q[36] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[36] => (Q[36] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[37] => (Q[37] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[37] => (Q[37] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[38] => (Q[38] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[38] => (Q[38] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[39] => (Q[39] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[39] => (Q[39] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[40] => (Q[40] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[40] => (Q[40] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[41] => (Q[41] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[41] => (Q[41] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[42] => (Q[42] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[42] => (Q[42] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[43] => (Q[43] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[43] => (Q[43] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[44] => (Q[44] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[44] => (Q[44] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[45] => (Q[45] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[45] => (Q[45] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[46] => (Q[46] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[46] => (Q[46] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[47] => (Q[47] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[47] => (Q[47] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[48] => (Q[48] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[48] => (Q[48] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[49] => (Q[49] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[49] => (Q[49] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[50] => (Q[50] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[50] => (Q[50] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[51] => (Q[51] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[51] => (Q[51] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[52] => (Q[52] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[52] => (Q[52] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[53] => (Q[53] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[53] => (Q[53] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[54] => (Q[54] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[54] => (Q[54] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[55] => (Q[55] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[55] => (Q[55] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[56] => (Q[56] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[56] => (Q[56] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[57] => (Q[57] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[57] => (Q[57] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[58] => (Q[58] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[58] => (Q[58] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[59] => (Q[59] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[59] => (Q[59] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[60] => (Q[60] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[60] => (Q[60] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[61] => (Q[61] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[61] => (Q[61] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[62] => (Q[62] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[62] => (Q[62] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[63] => (Q[63] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[63] => (Q[63] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[64] => (Q[64] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[64] => (Q[64] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[65] => (Q[65] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[65] => (Q[65] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[66] => (Q[66] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[66] => (Q[66] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[67] => (Q[67] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[67] => (Q[67] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[68] => (Q[68] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[68] => (Q[68] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[69] => (Q[69] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[69] => (Q[69] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[70] => (Q[70] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[70] => (Q[70] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[71] => (Q[71] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[71] => (Q[71] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[72] => (Q[72] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[72] => (Q[72] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[73] => (Q[73] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[73] => (Q[73] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[74] => (Q[74] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[74] => (Q[74] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[75] => (Q[75] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[75] => (Q[75] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[76] => (Q[76] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[76] => (Q[76] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[77] => (Q[77] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[77] => (Q[77] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[78] => (Q[78] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[78] => (Q[78] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[79] => (Q[79] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[79] => (Q[79] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[80] => (Q[80] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[80] => (Q[80] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[81] => (Q[81] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[81] => (Q[81] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[82] => (Q[82] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[82] => (Q[82] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[83] => (Q[83] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[83] => (Q[83] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[84] => (Q[84] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[84] => (Q[84] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[85] => (Q[85] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[85] => (Q[85] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[86] => (Q[86] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[86] => (Q[86] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[87] => (Q[87] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[87] => (Q[87] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[88] => (Q[88] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[88] => (Q[88] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[89] => (Q[89] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[89] => (Q[89] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[90] => (Q[90] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[90] => (Q[90] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[91] => (Q[91] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[91] => (Q[91] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[92] => (Q[92] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[92] => (Q[92] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[93] => (Q[93] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[93] => (Q[93] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[94] => (Q[94] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[94] => (Q[94] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[95] => (Q[95] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[95] => (Q[95] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[96] => (Q[96] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[96] => (Q[96] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[97] => (Q[97] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[97] => (Q[97] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[98] => (Q[98] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[98] => (Q[98] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[99] => (Q[99] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[99] => (Q[99] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[100] => (Q[100] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[100] => (Q[100] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[101] => (Q[101] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[101] => (Q[101] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[102] => (Q[102] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[102] => (Q[102] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[103] => (Q[103] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[103] => (Q[103] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[104] => (Q[104] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[104] => (Q[104] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[105] => (Q[105] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[105] => (Q[105] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[106] => (Q[106] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[106] => (Q[106] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[107] => (Q[107] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[107] => (Q[107] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[108] => (Q[108] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[108] => (Q[108] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[109] => (Q[109] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[109] => (Q[109] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[110] => (Q[110] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[110] => (Q[110] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[111] => (Q[111] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[111] => (Q[111] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[112] => (Q[112] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[112] => (Q[112] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[113] => (Q[113] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[113] => (Q[113] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[114] => (Q[114] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[114] => (Q[114] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[115] => (Q[115] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[115] => (Q[115] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[116] => (Q[116] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[116] => (Q[116] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[117] => (Q[117] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[117] => (Q[117] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[118] => (Q[118] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[118] => (Q[118] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[119] => (Q[119] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[119] => (Q[119] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[120] => (Q[120] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[120] => (Q[120] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[121] => (Q[121] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[121] => (Q[121] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[122] => (Q[122] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[122] => (Q[122] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[123] => (Q[123] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[123] => (Q[123] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[124] => (Q[124] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[124] => (Q[124] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[125] => (Q[125] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[125] => (Q[125] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[126] => (Q[126] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[126] => (Q[126] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (posedge BWEB[127] => (Q[127] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & !BIST) (negedge BWEB[127] => (Q[127] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);

    if(AWT & BIST) (posedge DM[0] => (Q[0] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[0] => (Q[0] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[1] => (Q[1] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[1] => (Q[1] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[2] => (Q[2] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[2] => (Q[2] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[3] => (Q[3] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[3] => (Q[3] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[4] => (Q[4] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[4] => (Q[4] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[5] => (Q[5] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[5] => (Q[5] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[6] => (Q[6] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[6] => (Q[6] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[7] => (Q[7] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[7] => (Q[7] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[8] => (Q[8] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[8] => (Q[8] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[9] => (Q[9] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[9] => (Q[9] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[10] => (Q[10] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[10] => (Q[10] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[11] => (Q[11] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[11] => (Q[11] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[12] => (Q[12] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[12] => (Q[12] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[13] => (Q[13] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[13] => (Q[13] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[14] => (Q[14] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[14] => (Q[14] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[15] => (Q[15] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[15] => (Q[15] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[16] => (Q[16] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[16] => (Q[16] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[17] => (Q[17] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[17] => (Q[17] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[18] => (Q[18] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[18] => (Q[18] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[19] => (Q[19] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[19] => (Q[19] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[20] => (Q[20] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[20] => (Q[20] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[21] => (Q[21] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[21] => (Q[21] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[22] => (Q[22] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[22] => (Q[22] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[23] => (Q[23] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[23] => (Q[23] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[24] => (Q[24] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[24] => (Q[24] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[25] => (Q[25] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[25] => (Q[25] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[26] => (Q[26] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[26] => (Q[26] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[27] => (Q[27] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[27] => (Q[27] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[28] => (Q[28] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[28] => (Q[28] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[29] => (Q[29] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[29] => (Q[29] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[30] => (Q[30] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[30] => (Q[30] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[31] => (Q[31] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[31] => (Q[31] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[32] => (Q[32] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[32] => (Q[32] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[33] => (Q[33] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[33] => (Q[33] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[34] => (Q[34] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[34] => (Q[34] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[35] => (Q[35] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[35] => (Q[35] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[36] => (Q[36] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[36] => (Q[36] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[37] => (Q[37] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[37] => (Q[37] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[38] => (Q[38] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[38] => (Q[38] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[39] => (Q[39] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[39] => (Q[39] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[40] => (Q[40] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[40] => (Q[40] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[41] => (Q[41] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[41] => (Q[41] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[42] => (Q[42] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[42] => (Q[42] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[43] => (Q[43] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[43] => (Q[43] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[44] => (Q[44] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[44] => (Q[44] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[45] => (Q[45] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[45] => (Q[45] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[46] => (Q[46] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[46] => (Q[46] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[47] => (Q[47] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[47] => (Q[47] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[48] => (Q[48] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[48] => (Q[48] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[49] => (Q[49] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[49] => (Q[49] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[50] => (Q[50] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[50] => (Q[50] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[51] => (Q[51] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[51] => (Q[51] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[52] => (Q[52] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[52] => (Q[52] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[53] => (Q[53] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[53] => (Q[53] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[54] => (Q[54] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[54] => (Q[54] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[55] => (Q[55] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[55] => (Q[55] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[56] => (Q[56] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[56] => (Q[56] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[57] => (Q[57] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[57] => (Q[57] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[58] => (Q[58] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[58] => (Q[58] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[59] => (Q[59] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[59] => (Q[59] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[60] => (Q[60] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[60] => (Q[60] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[61] => (Q[61] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[61] => (Q[61] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[62] => (Q[62] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[62] => (Q[62] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[63] => (Q[63] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[63] => (Q[63] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[64] => (Q[64] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[64] => (Q[64] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[65] => (Q[65] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[65] => (Q[65] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[66] => (Q[66] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[66] => (Q[66] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[67] => (Q[67] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[67] => (Q[67] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[68] => (Q[68] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[68] => (Q[68] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[69] => (Q[69] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[69] => (Q[69] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[70] => (Q[70] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[70] => (Q[70] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[71] => (Q[71] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[71] => (Q[71] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[72] => (Q[72] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[72] => (Q[72] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[73] => (Q[73] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[73] => (Q[73] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[74] => (Q[74] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[74] => (Q[74] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[75] => (Q[75] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[75] => (Q[75] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[76] => (Q[76] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[76] => (Q[76] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[77] => (Q[77] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[77] => (Q[77] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[78] => (Q[78] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[78] => (Q[78] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[79] => (Q[79] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[79] => (Q[79] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[80] => (Q[80] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[80] => (Q[80] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[81] => (Q[81] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[81] => (Q[81] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[82] => (Q[82] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[82] => (Q[82] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[83] => (Q[83] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[83] => (Q[83] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[84] => (Q[84] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[84] => (Q[84] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[85] => (Q[85] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[85] => (Q[85] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[86] => (Q[86] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[86] => (Q[86] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[87] => (Q[87] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[87] => (Q[87] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[88] => (Q[88] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[88] => (Q[88] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[89] => (Q[89] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[89] => (Q[89] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[90] => (Q[90] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[90] => (Q[90] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[91] => (Q[91] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[91] => (Q[91] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[92] => (Q[92] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[92] => (Q[92] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[93] => (Q[93] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[93] => (Q[93] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[94] => (Q[94] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[94] => (Q[94] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[95] => (Q[95] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[95] => (Q[95] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[96] => (Q[96] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[96] => (Q[96] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[97] => (Q[97] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[97] => (Q[97] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[98] => (Q[98] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[98] => (Q[98] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[99] => (Q[99] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[99] => (Q[99] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[100] => (Q[100] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[100] => (Q[100] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[101] => (Q[101] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[101] => (Q[101] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[102] => (Q[102] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[102] => (Q[102] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[103] => (Q[103] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[103] => (Q[103] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[104] => (Q[104] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[104] => (Q[104] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[105] => (Q[105] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[105] => (Q[105] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[106] => (Q[106] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[106] => (Q[106] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[107] => (Q[107] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[107] => (Q[107] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[108] => (Q[108] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[108] => (Q[108] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[109] => (Q[109] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[109] => (Q[109] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[110] => (Q[110] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[110] => (Q[110] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[111] => (Q[111] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[111] => (Q[111] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[112] => (Q[112] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[112] => (Q[112] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[113] => (Q[113] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[113] => (Q[113] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[114] => (Q[114] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[114] => (Q[114] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[115] => (Q[115] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[115] => (Q[115] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[116] => (Q[116] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[116] => (Q[116] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[117] => (Q[117] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[117] => (Q[117] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[118] => (Q[118] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[118] => (Q[118] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[119] => (Q[119] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[119] => (Q[119] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[120] => (Q[120] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[120] => (Q[120] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[121] => (Q[121] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[121] => (Q[121] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[122] => (Q[122] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[122] => (Q[122] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[123] => (Q[123] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[123] => (Q[123] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[124] => (Q[124] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[124] => (Q[124] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[125] => (Q[125] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[125] => (Q[125] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[126] => (Q[126] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[126] => (Q[126] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (posedge DM[127] => (Q[127] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);
    if(AWT & BIST) (negedge DM[127] => (Q[127] : 1'bx)) = (tDQ, tDQ, tDQH, tDQ, tDQH, tDQ);

    if(AWT & BIST) (posedge BWEBM[0] => (Q[0] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[0] => (Q[0] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[1] => (Q[1] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[1] => (Q[1] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[2] => (Q[2] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[2] => (Q[2] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[3] => (Q[3] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[3] => (Q[3] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[4] => (Q[4] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[4] => (Q[4] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[5] => (Q[5] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[5] => (Q[5] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[6] => (Q[6] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[6] => (Q[6] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[7] => (Q[7] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[7] => (Q[7] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[8] => (Q[8] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[8] => (Q[8] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[9] => (Q[9] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[9] => (Q[9] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[10] => (Q[10] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[10] => (Q[10] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[11] => (Q[11] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[11] => (Q[11] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[12] => (Q[12] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[12] => (Q[12] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[13] => (Q[13] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[13] => (Q[13] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[14] => (Q[14] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[14] => (Q[14] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[15] => (Q[15] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[15] => (Q[15] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[16] => (Q[16] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[16] => (Q[16] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[17] => (Q[17] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[17] => (Q[17] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[18] => (Q[18] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[18] => (Q[18] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[19] => (Q[19] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[19] => (Q[19] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[20] => (Q[20] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[20] => (Q[20] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[21] => (Q[21] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[21] => (Q[21] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[22] => (Q[22] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[22] => (Q[22] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[23] => (Q[23] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[23] => (Q[23] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[24] => (Q[24] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[24] => (Q[24] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[25] => (Q[25] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[25] => (Q[25] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[26] => (Q[26] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[26] => (Q[26] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[27] => (Q[27] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[27] => (Q[27] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[28] => (Q[28] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[28] => (Q[28] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[29] => (Q[29] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[29] => (Q[29] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[30] => (Q[30] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[30] => (Q[30] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[31] => (Q[31] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[31] => (Q[31] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[32] => (Q[32] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[32] => (Q[32] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[33] => (Q[33] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[33] => (Q[33] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[34] => (Q[34] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[34] => (Q[34] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[35] => (Q[35] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[35] => (Q[35] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[36] => (Q[36] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[36] => (Q[36] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[37] => (Q[37] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[37] => (Q[37] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[38] => (Q[38] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[38] => (Q[38] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[39] => (Q[39] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[39] => (Q[39] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[40] => (Q[40] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[40] => (Q[40] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[41] => (Q[41] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[41] => (Q[41] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[42] => (Q[42] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[42] => (Q[42] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[43] => (Q[43] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[43] => (Q[43] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[44] => (Q[44] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[44] => (Q[44] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[45] => (Q[45] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[45] => (Q[45] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[46] => (Q[46] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[46] => (Q[46] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[47] => (Q[47] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[47] => (Q[47] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[48] => (Q[48] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[48] => (Q[48] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[49] => (Q[49] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[49] => (Q[49] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[50] => (Q[50] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[50] => (Q[50] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[51] => (Q[51] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[51] => (Q[51] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[52] => (Q[52] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[52] => (Q[52] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[53] => (Q[53] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[53] => (Q[53] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[54] => (Q[54] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[54] => (Q[54] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[55] => (Q[55] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[55] => (Q[55] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[56] => (Q[56] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[56] => (Q[56] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[57] => (Q[57] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[57] => (Q[57] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[58] => (Q[58] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[58] => (Q[58] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[59] => (Q[59] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[59] => (Q[59] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[60] => (Q[60] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[60] => (Q[60] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[61] => (Q[61] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[61] => (Q[61] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[62] => (Q[62] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[62] => (Q[62] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[63] => (Q[63] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[63] => (Q[63] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[64] => (Q[64] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[64] => (Q[64] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[65] => (Q[65] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[65] => (Q[65] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[66] => (Q[66] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[66] => (Q[66] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[67] => (Q[67] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[67] => (Q[67] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[68] => (Q[68] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[68] => (Q[68] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[69] => (Q[69] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[69] => (Q[69] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[70] => (Q[70] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[70] => (Q[70] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[71] => (Q[71] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[71] => (Q[71] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[72] => (Q[72] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[72] => (Q[72] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[73] => (Q[73] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[73] => (Q[73] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[74] => (Q[74] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[74] => (Q[74] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[75] => (Q[75] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[75] => (Q[75] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[76] => (Q[76] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[76] => (Q[76] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[77] => (Q[77] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[77] => (Q[77] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[78] => (Q[78] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[78] => (Q[78] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[79] => (Q[79] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[79] => (Q[79] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[80] => (Q[80] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[80] => (Q[80] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[81] => (Q[81] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[81] => (Q[81] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[82] => (Q[82] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[82] => (Q[82] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[83] => (Q[83] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[83] => (Q[83] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[84] => (Q[84] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[84] => (Q[84] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[85] => (Q[85] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[85] => (Q[85] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[86] => (Q[86] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[86] => (Q[86] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[87] => (Q[87] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[87] => (Q[87] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[88] => (Q[88] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[88] => (Q[88] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[89] => (Q[89] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[89] => (Q[89] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[90] => (Q[90] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[90] => (Q[90] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[91] => (Q[91] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[91] => (Q[91] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[92] => (Q[92] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[92] => (Q[92] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[93] => (Q[93] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[93] => (Q[93] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[94] => (Q[94] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[94] => (Q[94] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[95] => (Q[95] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[95] => (Q[95] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[96] => (Q[96] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[96] => (Q[96] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[97] => (Q[97] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[97] => (Q[97] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[98] => (Q[98] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[98] => (Q[98] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[99] => (Q[99] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[99] => (Q[99] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[100] => (Q[100] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[100] => (Q[100] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[101] => (Q[101] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[101] => (Q[101] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[102] => (Q[102] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[102] => (Q[102] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[103] => (Q[103] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[103] => (Q[103] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[104] => (Q[104] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[104] => (Q[104] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[105] => (Q[105] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[105] => (Q[105] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[106] => (Q[106] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[106] => (Q[106] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[107] => (Q[107] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[107] => (Q[107] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[108] => (Q[108] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[108] => (Q[108] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[109] => (Q[109] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[109] => (Q[109] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[110] => (Q[110] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[110] => (Q[110] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[111] => (Q[111] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[111] => (Q[111] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[112] => (Q[112] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[112] => (Q[112] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[113] => (Q[113] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[113] => (Q[113] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[114] => (Q[114] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[114] => (Q[114] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[115] => (Q[115] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[115] => (Q[115] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[116] => (Q[116] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[116] => (Q[116] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[117] => (Q[117] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[117] => (Q[117] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[118] => (Q[118] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[118] => (Q[118] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[119] => (Q[119] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[119] => (Q[119] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[120] => (Q[120] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[120] => (Q[120] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[121] => (Q[121] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[121] => (Q[121] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[122] => (Q[122] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[122] => (Q[122] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[123] => (Q[123] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[123] => (Q[123] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[124] => (Q[124] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[124] => (Q[124] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[125] => (Q[125] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[125] => (Q[125] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[126] => (Q[126] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[126] => (Q[126] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (posedge BWEBM[127] => (Q[127] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);
    if(AWT & BIST) (negedge BWEBM[127] => (Q[127] : 1'bx)) = (tBWQ, tBWQ, tBWQH, tBWQ, tBWQH, tBWQ);


    if (!AWT) (posedge CLK => (Q[0] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[1] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[2] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[3] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[4] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[5] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[6] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[7] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[8] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[9] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[10] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[11] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[12] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[13] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[14] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[15] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[16] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[17] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[18] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[19] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[20] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[21] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[22] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[23] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[24] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[25] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[26] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[27] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[28] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[29] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[30] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[31] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[32] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[33] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[34] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[35] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[36] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[37] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[38] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[39] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[40] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[41] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[42] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[43] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[44] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[45] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[46] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[47] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[48] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[49] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[50] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[51] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[52] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[53] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[54] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[55] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[56] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[57] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[58] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[59] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[60] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[61] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[62] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[63] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[64] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[65] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[66] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[67] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[68] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[69] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[70] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[71] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[72] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[73] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[74] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[75] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[76] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[77] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[78] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[79] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[80] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[81] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[82] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[83] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[84] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[85] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[86] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[87] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[88] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[89] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[90] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[91] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[92] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[93] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[94] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[95] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[96] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[97] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[98] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[99] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[100] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[101] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[102] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[103] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[104] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[105] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[106] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[107] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[108] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[109] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[110] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[111] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[112] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[113] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[114] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[115] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[116] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[117] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[118] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[119] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[120] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[121] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[122] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[123] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[124] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[125] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[126] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if (!AWT) (posedge CLK => (Q[127] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);

// normal mode timing check 

    $period(posedge CLK &&& check_noidle_norm, tCYC, notify_clk);
    $width(posedge CLK &&& check_noidle_norm, tCKH, 0, notify_clk);
    $width(negedge CLK &&& check_noidle_norm, tCKL, 0, notify_clk);

    $setup(negedge BIST, posedge CLK, tBISTS, notify_bist);
    $setup(posedge BIST, posedge CLK, tBISTS, notify_bist);
    $hold(posedge CLK, negedge BIST, tBISTH, notify_bist);
    $hold(posedge CLK, posedge BIST, tBISTH, notify_bist);

    $setup(negedge CEB, posedge CLK &&& ~BIST, tCS, notify_ceb);
    $setup(posedge CEB, posedge CLK &&& ~BIST, tCS, notify_ceb);
    $hold(posedge CLK &&& ~BIST, negedge CEB, tCH, notify_ceb);
    $hold(posedge CLK &&& ~BIST, posedge CEB, tCH, notify_ceb);

    $setup(negedge WEB, posedge CLK &&& check_noidle_norm, tWS, notify_web);
    $setup(posedge WEB, posedge CLK &&& check_noidle_norm, tWS, notify_web);
    $hold(posedge CLK &&& check_noidle_norm, negedge WEB, tWH, notify_web);
    $hold(posedge CLK &&& check_noidle_norm, posedge WEB, tWH, notify_web);

    $setup(negedge A[0], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[1], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[2], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[3], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[4], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[5], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[6], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[7], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[8], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[9], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(negedge A[10], posedge CLK &&& check_noidle_norm, tAS, notify_addr);

    $setup(posedge A[0], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[1], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[2], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[3], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[4], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[5], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[6], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[7], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[8], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[9], posedge CLK &&& check_noidle_norm, tAS, notify_addr);
    $setup(posedge A[10], posedge CLK &&& check_noidle_norm, tAS, notify_addr);

    $hold(posedge CLK &&& check_noidle_norm, negedge A[0], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[1], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[2], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[3], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[4], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[5], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[6], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[7], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[8], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[9], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, negedge A[10], tAH, notify_addr);

    $hold(posedge CLK &&& check_noidle_norm, posedge A[0], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[1], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[2], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[3], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[4], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[5], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[6], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[7], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[8], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[9], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_norm, posedge A[10], tAH, notify_addr);


    $setup(negedge D[0], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[1], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[2], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[3], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[4], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[5], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[6], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[7], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[8], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[9], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[10], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[11], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[12], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[13], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[14], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[15], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[16], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[17], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[18], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[19], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[20], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[21], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[22], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[23], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[24], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[25], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[26], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[27], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[28], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[29], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[30], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[31], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[32], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[33], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[34], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[35], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[36], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[37], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[38], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[39], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[40], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[41], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[42], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[43], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[44], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[45], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[46], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[47], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[48], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[49], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[50], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[51], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[52], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[53], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[54], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[55], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[56], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[57], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[58], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[59], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[60], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[61], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[62], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[63], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[64], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[65], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[66], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[67], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[68], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[69], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[70], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[71], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[72], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[73], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[74], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[75], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[76], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[77], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[78], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[79], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[80], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[81], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[82], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[83], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[84], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[85], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[86], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[87], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[88], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[89], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[90], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[91], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[92], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[93], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[94], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[95], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[96], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[97], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[98], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[99], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[100], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[101], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[102], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[103], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[104], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[105], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[106], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[107], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[108], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[109], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[110], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[111], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[112], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[113], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[114], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[115], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[116], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[117], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[118], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[119], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[120], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[121], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[122], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[123], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[124], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[125], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[126], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(negedge D[127], posedge CLK &&& check_write_norm, tDS, notify_din);

    $setup(posedge D[0], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[1], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[2], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[3], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[4], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[5], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[6], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[7], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[8], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[9], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[10], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[11], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[12], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[13], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[14], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[15], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[16], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[17], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[18], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[19], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[20], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[21], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[22], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[23], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[24], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[25], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[26], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[27], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[28], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[29], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[30], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[31], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[32], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[33], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[34], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[35], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[36], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[37], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[38], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[39], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[40], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[41], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[42], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[43], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[44], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[45], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[46], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[47], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[48], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[49], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[50], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[51], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[52], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[53], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[54], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[55], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[56], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[57], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[58], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[59], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[60], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[61], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[62], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[63], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[64], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[65], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[66], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[67], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[68], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[69], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[70], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[71], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[72], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[73], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[74], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[75], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[76], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[77], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[78], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[79], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[80], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[81], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[82], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[83], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[84], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[85], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[86], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[87], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[88], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[89], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[90], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[91], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[92], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[93], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[94], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[95], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[96], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[97], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[98], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[99], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[100], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[101], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[102], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[103], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[104], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[105], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[106], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[107], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[108], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[109], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[110], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[111], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[112], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[113], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[114], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[115], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[116], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[117], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[118], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[119], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[120], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[121], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[122], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[123], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[124], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[125], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[126], posedge CLK &&& check_write_norm, tDS, notify_din);
    $setup(posedge D[127], posedge CLK &&& check_write_norm, tDS, notify_din);

    $hold(posedge CLK &&& check_write_norm, negedge D[0], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[1], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[2], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[3], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[4], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[5], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[6], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[7], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[8], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[9], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[10], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[11], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[12], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[13], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[14], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[15], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[16], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[17], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[18], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[19], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[20], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[21], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[22], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[23], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[24], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[25], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[26], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[27], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[28], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[29], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[30], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[31], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[32], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[33], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[34], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[35], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[36], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[37], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[38], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[39], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[40], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[41], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[42], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[43], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[44], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[45], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[46], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[47], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[48], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[49], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[50], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[51], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[52], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[53], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[54], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[55], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[56], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[57], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[58], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[59], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[60], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[61], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[62], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[63], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[64], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[65], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[66], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[67], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[68], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[69], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[70], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[71], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[72], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[73], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[74], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[75], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[76], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[77], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[78], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[79], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[80], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[81], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[82], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[83], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[84], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[85], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[86], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[87], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[88], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[89], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[90], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[91], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[92], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[93], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[94], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[95], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[96], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[97], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[98], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[99], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[100], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[101], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[102], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[103], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[104], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[105], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[106], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[107], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[108], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[109], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[110], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[111], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[112], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[113], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[114], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[115], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[116], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[117], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[118], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[119], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[120], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[121], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[122], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[123], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[124], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[125], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[126], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, negedge D[127], tDH, notify_din);

    $hold(posedge CLK &&& check_write_norm, posedge D[0], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[1], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[2], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[3], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[4], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[5], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[6], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[7], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[8], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[9], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[10], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[11], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[12], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[13], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[14], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[15], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[16], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[17], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[18], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[19], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[20], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[21], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[22], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[23], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[24], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[25], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[26], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[27], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[28], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[29], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[30], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[31], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[32], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[33], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[34], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[35], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[36], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[37], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[38], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[39], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[40], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[41], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[42], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[43], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[44], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[45], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[46], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[47], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[48], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[49], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[50], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[51], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[52], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[53], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[54], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[55], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[56], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[57], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[58], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[59], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[60], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[61], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[62], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[63], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[64], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[65], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[66], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[67], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[68], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[69], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[70], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[71], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[72], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[73], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[74], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[75], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[76], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[77], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[78], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[79], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[80], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[81], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[82], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[83], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[84], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[85], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[86], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[87], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[88], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[89], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[90], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[91], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[92], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[93], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[94], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[95], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[96], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[97], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[98], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[99], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[100], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[101], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[102], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[103], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[104], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[105], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[106], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[107], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[108], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[109], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[110], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[111], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[112], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[113], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[114], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[115], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[116], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[117], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[118], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[119], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[120], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[121], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[122], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[123], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[124], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[125], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[126], tDH, notify_din);
    $hold(posedge CLK &&& check_write_norm, posedge D[127], tDH, notify_din);

    $setup(negedge BWEB[0], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[1], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[2], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[3], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[4], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[5], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[6], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[7], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[8], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[9], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[10], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[11], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[12], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[13], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[14], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[15], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[16], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[17], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[18], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[19], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[20], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[21], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[22], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[23], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[24], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[25], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[26], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[27], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[28], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[29], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[30], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[31], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[32], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[33], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[34], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[35], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[36], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[37], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[38], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[39], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[40], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[41], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[42], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[43], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[44], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[45], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[46], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[47], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[48], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[49], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[50], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[51], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[52], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[53], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[54], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[55], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[56], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[57], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[58], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[59], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[60], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[61], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[62], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[63], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[64], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[65], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[66], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[67], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[68], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[69], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[70], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[71], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[72], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[73], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[74], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[75], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[76], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[77], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[78], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[79], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[80], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[81], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[82], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[83], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[84], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[85], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[86], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[87], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[88], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[89], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[90], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[91], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[92], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[93], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[94], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[95], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[96], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[97], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[98], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[99], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[100], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[101], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[102], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[103], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[104], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[105], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[106], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[107], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[108], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[109], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[110], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[111], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[112], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[113], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[114], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[115], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[116], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[117], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[118], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[119], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[120], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[121], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[122], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[123], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[124], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[125], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[126], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(negedge BWEB[127], posedge CLK &&& check_write_norm, tBWS, notify_bweb);

    $setup(posedge BWEB[0], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[1], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[2], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[3], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[4], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[5], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[6], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[7], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[8], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[9], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[10], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[11], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[12], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[13], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[14], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[15], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[16], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[17], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[18], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[19], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[20], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[21], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[22], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[23], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[24], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[25], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[26], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[27], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[28], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[29], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[30], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[31], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[32], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[33], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[34], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[35], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[36], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[37], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[38], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[39], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[40], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[41], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[42], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[43], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[44], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[45], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[46], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[47], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[48], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[49], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[50], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[51], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[52], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[53], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[54], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[55], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[56], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[57], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[58], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[59], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[60], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[61], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[62], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[63], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[64], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[65], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[66], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[67], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[68], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[69], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[70], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[71], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[72], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[73], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[74], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[75], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[76], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[77], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[78], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[79], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[80], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[81], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[82], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[83], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[84], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[85], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[86], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[87], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[88], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[89], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[90], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[91], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[92], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[93], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[94], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[95], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[96], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[97], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[98], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[99], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[100], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[101], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[102], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[103], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[104], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[105], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[106], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[107], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[108], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[109], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[110], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[111], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[112], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[113], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[114], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[115], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[116], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[117], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[118], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[119], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[120], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[121], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[122], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[123], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[124], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[125], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[126], posedge CLK &&& check_write_norm, tBWS, notify_bweb);
    $setup(posedge BWEB[127], posedge CLK &&& check_write_norm, tBWS, notify_bweb);

    $hold(posedge CLK &&& check_write_norm, negedge BWEB[0], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[1], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[2], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[3], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[4], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[5], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[6], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[7], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[8], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[9], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[10], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[11], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[12], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[13], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[14], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[15], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[16], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[17], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[18], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[19], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[20], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[21], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[22], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[23], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[24], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[25], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[26], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[27], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[28], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[29], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[30], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[31], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[32], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[33], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[34], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[35], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[36], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[37], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[38], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[39], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[40], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[41], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[42], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[43], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[44], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[45], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[46], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[47], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[48], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[49], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[50], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[51], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[52], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[53], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[54], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[55], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[56], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[57], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[58], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[59], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[60], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[61], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[62], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[63], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[64], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[65], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[66], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[67], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[68], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[69], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[70], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[71], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[72], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[73], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[74], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[75], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[76], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[77], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[78], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[79], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[80], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[81], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[82], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[83], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[84], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[85], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[86], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[87], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[88], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[89], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[90], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[91], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[92], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[93], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[94], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[95], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[96], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[97], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[98], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[99], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[100], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[101], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[102], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[103], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[104], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[105], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[106], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[107], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[108], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[109], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[110], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[111], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[112], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[113], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[114], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[115], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[116], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[117], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[118], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[119], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[120], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[121], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[122], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[123], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[124], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[125], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[126], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, negedge BWEB[127], tBWH, notify_bweb);

    $hold(posedge CLK &&& check_write_norm, posedge BWEB[0], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[1], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[2], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[3], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[4], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[5], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[6], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[7], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[8], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[9], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[10], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[11], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[12], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[13], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[14], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[15], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[16], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[17], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[18], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[19], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[20], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[21], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[22], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[23], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[24], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[25], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[26], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[27], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[28], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[29], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[30], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[31], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[32], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[33], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[34], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[35], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[36], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[37], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[38], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[39], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[40], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[41], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[42], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[43], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[44], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[45], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[46], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[47], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[48], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[49], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[50], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[51], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[52], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[53], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[54], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[55], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[56], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[57], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[58], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[59], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[60], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[61], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[62], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[63], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[64], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[65], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[66], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[67], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[68], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[69], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[70], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[71], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[72], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[73], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[74], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[75], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[76], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[77], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[78], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[79], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[80], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[81], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[82], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[83], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[84], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[85], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[86], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[87], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[88], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[89], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[90], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[91], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[92], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[93], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[94], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[95], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[96], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[97], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[98], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[99], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[100], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[101], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[102], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[103], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[104], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[105], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[106], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[107], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[108], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[109], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[110], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[111], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[112], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[113], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[114], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[115], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[116], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[117], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[118], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[119], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[120], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[121], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[122], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[123], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[124], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[125], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[126], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_norm, posedge BWEB[127], tBWH, notify_bweb);


// BIST mode timing check 

    $period(posedge CLK &&& check_noidle_bist, tCYC, notify_clk);
    $width(posedge CLK &&& check_noidle_bist, tCKH, 0, notify_clk);
    $width(negedge CLK &&& check_noidle_bist, tCKL, 0, notify_clk);

    $setup(negedge CEBM, posedge CLK &&& BIST, tCS, notify_ceb);
    $setup(posedge CEBM, posedge CLK &&& BIST, tCS, notify_ceb);
    $hold(posedge CLK &&& BIST, negedge CEBM, tCH, notify_ceb);
    $hold(posedge CLK &&& BIST, posedge CEBM, tCH, notify_ceb);

    $setup(negedge WEBM, posedge CLK &&& check_noidle_bist, tWS, notify_web);
    $setup(posedge WEBM, posedge CLK &&& check_noidle_bist, tWS, notify_web);
    $hold(posedge CLK &&& check_noidle_bist, negedge WEBM, tWH, notify_web);
    $hold(posedge CLK &&& check_noidle_bist, posedge WEBM, tWH, notify_web);

    $setup(negedge AM[0], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[1], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[2], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[3], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[4], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[5], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[6], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[7], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[8], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[9], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(negedge AM[10], posedge CLK &&& check_noidle_bist, tAS, notify_addr);

    $setup(posedge AM[0], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[1], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[2], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[3], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[4], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[5], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[6], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[7], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[8], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[9], posedge CLK &&& check_noidle_bist, tAS, notify_addr);
    $setup(posedge AM[10], posedge CLK &&& check_noidle_bist, tAS, notify_addr);

    $hold(posedge CLK &&& check_noidle_bist, negedge AM[0], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[1], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[2], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[3], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[4], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[5], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[6], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[7], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[8], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[9], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, negedge AM[10], tAH, notify_addr);

    $hold(posedge CLK &&& check_noidle_bist, posedge AM[0], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[1], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[2], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[3], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[4], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[5], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[6], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[7], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[8], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[9], tAH, notify_addr);
    $hold(posedge CLK &&& check_noidle_bist, posedge AM[10], tAH, notify_addr);

    $setup(negedge DM[0], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[1], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[2], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[3], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[4], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[5], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[6], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[7], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[8], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[9], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[10], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[11], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[12], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[13], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[14], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[15], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[16], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[17], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[18], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[19], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[20], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[21], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[22], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[23], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[24], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[25], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[26], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[27], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[28], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[29], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[30], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[31], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[32], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[33], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[34], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[35], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[36], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[37], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[38], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[39], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[40], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[41], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[42], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[43], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[44], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[45], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[46], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[47], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[48], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[49], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[50], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[51], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[52], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[53], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[54], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[55], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[56], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[57], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[58], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[59], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[60], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[61], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[62], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[63], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[64], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[65], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[66], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[67], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[68], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[69], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[70], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[71], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[72], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[73], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[74], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[75], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[76], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[77], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[78], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[79], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[80], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[81], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[82], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[83], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[84], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[85], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[86], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[87], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[88], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[89], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[90], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[91], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[92], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[93], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[94], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[95], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[96], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[97], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[98], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[99], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[100], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[101], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[102], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[103], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[104], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[105], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[106], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[107], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[108], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[109], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[110], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[111], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[112], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[113], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[114], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[115], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[116], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[117], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[118], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[119], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[120], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[121], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[122], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[123], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[124], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[125], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[126], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(negedge DM[127], posedge CLK &&& check_write_bist, tDS, notify_din);

    $setup(posedge DM[0], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[1], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[2], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[3], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[4], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[5], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[6], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[7], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[8], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[9], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[10], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[11], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[12], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[13], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[14], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[15], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[16], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[17], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[18], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[19], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[20], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[21], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[22], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[23], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[24], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[25], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[26], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[27], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[28], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[29], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[30], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[31], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[32], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[33], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[34], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[35], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[36], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[37], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[38], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[39], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[40], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[41], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[42], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[43], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[44], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[45], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[46], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[47], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[48], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[49], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[50], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[51], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[52], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[53], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[54], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[55], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[56], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[57], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[58], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[59], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[60], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[61], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[62], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[63], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[64], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[65], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[66], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[67], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[68], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[69], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[70], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[71], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[72], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[73], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[74], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[75], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[76], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[77], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[78], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[79], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[80], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[81], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[82], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[83], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[84], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[85], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[86], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[87], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[88], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[89], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[90], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[91], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[92], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[93], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[94], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[95], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[96], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[97], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[98], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[99], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[100], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[101], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[102], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[103], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[104], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[105], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[106], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[107], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[108], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[109], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[110], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[111], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[112], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[113], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[114], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[115], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[116], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[117], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[118], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[119], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[120], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[121], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[122], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[123], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[124], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[125], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[126], posedge CLK &&& check_write_bist, tDS, notify_din);
    $setup(posedge DM[127], posedge CLK &&& check_write_bist, tDS, notify_din);

    $hold(posedge CLK &&& check_write_bist, negedge DM[0], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[1], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[2], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[3], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[4], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[5], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[6], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[7], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[8], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[9], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[10], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[11], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[12], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[13], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[14], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[15], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[16], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[17], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[18], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[19], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[20], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[21], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[22], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[23], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[24], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[25], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[26], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[27], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[28], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[29], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[30], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[31], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[32], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[33], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[34], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[35], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[36], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[37], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[38], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[39], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[40], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[41], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[42], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[43], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[44], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[45], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[46], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[47], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[48], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[49], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[50], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[51], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[52], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[53], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[54], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[55], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[56], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[57], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[58], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[59], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[60], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[61], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[62], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[63], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[64], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[65], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[66], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[67], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[68], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[69], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[70], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[71], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[72], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[73], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[74], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[75], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[76], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[77], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[78], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[79], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[80], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[81], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[82], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[83], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[84], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[85], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[86], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[87], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[88], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[89], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[90], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[91], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[92], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[93], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[94], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[95], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[96], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[97], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[98], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[99], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[100], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[101], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[102], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[103], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[104], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[105], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[106], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[107], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[108], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[109], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[110], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[111], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[112], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[113], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[114], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[115], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[116], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[117], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[118], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[119], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[120], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[121], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[122], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[123], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[124], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[125], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[126], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, negedge DM[127], tDH, notify_din);

    $hold(posedge CLK &&& check_write_bist, posedge DM[0], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[1], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[2], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[3], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[4], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[5], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[6], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[7], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[8], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[9], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[10], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[11], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[12], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[13], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[14], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[15], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[16], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[17], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[18], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[19], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[20], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[21], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[22], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[23], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[24], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[25], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[26], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[27], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[28], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[29], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[30], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[31], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[32], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[33], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[34], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[35], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[36], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[37], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[38], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[39], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[40], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[41], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[42], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[43], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[44], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[45], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[46], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[47], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[48], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[49], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[50], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[51], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[52], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[53], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[54], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[55], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[56], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[57], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[58], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[59], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[60], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[61], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[62], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[63], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[64], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[65], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[66], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[67], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[68], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[69], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[70], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[71], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[72], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[73], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[74], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[75], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[76], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[77], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[78], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[79], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[80], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[81], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[82], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[83], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[84], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[85], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[86], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[87], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[88], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[89], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[90], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[91], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[92], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[93], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[94], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[95], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[96], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[97], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[98], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[99], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[100], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[101], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[102], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[103], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[104], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[105], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[106], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[107], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[108], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[109], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[110], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[111], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[112], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[113], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[114], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[115], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[116], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[117], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[118], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[119], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[120], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[121], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[122], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[123], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[124], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[125], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[126], tDH, notify_din);
    $hold(posedge CLK &&& check_write_bist, posedge DM[127], tDH, notify_din);

    $setup(negedge BWEBM[0], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[1], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[2], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[3], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[4], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[5], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[6], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[7], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[8], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[9], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[10], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[11], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[12], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[13], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[14], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[15], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[16], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[17], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[18], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[19], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[20], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[21], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[22], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[23], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[24], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[25], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[26], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[27], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[28], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[29], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[30], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[31], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[32], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[33], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[34], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[35], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[36], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[37], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[38], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[39], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[40], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[41], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[42], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[43], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[44], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[45], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[46], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[47], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[48], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[49], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[50], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[51], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[52], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[53], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[54], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[55], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[56], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[57], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[58], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[59], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[60], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[61], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[62], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[63], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[64], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[65], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[66], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[67], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[68], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[69], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[70], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[71], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[72], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[73], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[74], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[75], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[76], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[77], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[78], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[79], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[80], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[81], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[82], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[83], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[84], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[85], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[86], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[87], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[88], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[89], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[90], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[91], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[92], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[93], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[94], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[95], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[96], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[97], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[98], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[99], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[100], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[101], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[102], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[103], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[104], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[105], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[106], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[107], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[108], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[109], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[110], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[111], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[112], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[113], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[114], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[115], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[116], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[117], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[118], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[119], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[120], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[121], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[122], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[123], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[124], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[125], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[126], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(negedge BWEBM[127], posedge CLK &&& check_write_bist, tBWS, notify_bweb);

    $setup(posedge BWEBM[0], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[1], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[2], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[3], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[4], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[5], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[6], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[7], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[8], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[9], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[10], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[11], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[12], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[13], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[14], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[15], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[16], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[17], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[18], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[19], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[20], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[21], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[22], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[23], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[24], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[25], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[26], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[27], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[28], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[29], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[30], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[31], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[32], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[33], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[34], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[35], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[36], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[37], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[38], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[39], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[40], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[41], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[42], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[43], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[44], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[45], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[46], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[47], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[48], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[49], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[50], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[51], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[52], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[53], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[54], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[55], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[56], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[57], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[58], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[59], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[60], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[61], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[62], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[63], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[64], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[65], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[66], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[67], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[68], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[69], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[70], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[71], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[72], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[73], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[74], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[75], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[76], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[77], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[78], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[79], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[80], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[81], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[82], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[83], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[84], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[85], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[86], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[87], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[88], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[89], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[90], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[91], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[92], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[93], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[94], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[95], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[96], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[97], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[98], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[99], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[100], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[101], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[102], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[103], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[104], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[105], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[106], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[107], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[108], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[109], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[110], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[111], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[112], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[113], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[114], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[115], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[116], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[117], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[118], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[119], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[120], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[121], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[122], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[123], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[124], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[125], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[126], posedge CLK &&& check_write_bist, tBWS, notify_bweb);
    $setup(posedge BWEBM[127], posedge CLK &&& check_write_bist, tBWS, notify_bweb);

    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[0], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[1], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[2], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[3], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[4], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[5], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[6], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[7], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[8], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[9], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[10], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[11], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[12], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[13], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[14], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[15], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[16], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[17], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[18], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[19], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[20], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[21], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[22], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[23], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[24], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[25], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[26], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[27], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[28], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[29], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[30], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[31], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[32], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[33], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[34], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[35], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[36], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[37], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[38], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[39], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[40], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[41], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[42], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[43], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[44], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[45], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[46], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[47], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[48], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[49], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[50], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[51], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[52], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[53], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[54], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[55], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[56], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[57], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[58], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[59], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[60], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[61], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[62], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[63], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[64], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[65], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[66], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[67], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[68], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[69], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[70], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[71], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[72], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[73], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[74], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[75], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[76], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[77], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[78], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[79], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[80], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[81], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[82], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[83], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[84], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[85], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[86], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[87], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[88], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[89], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[90], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[91], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[92], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[93], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[94], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[95], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[96], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[97], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[98], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[99], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[100], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[101], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[102], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[103], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[104], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[105], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[106], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[107], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[108], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[109], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[110], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[111], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[112], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[113], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[114], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[115], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[116], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[117], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[118], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[119], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[120], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[121], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[122], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[123], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[124], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[125], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[126], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, negedge BWEBM[127], tBWH, notify_bweb);

    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[0], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[1], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[2], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[3], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[4], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[5], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[6], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[7], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[8], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[9], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[10], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[11], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[12], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[13], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[14], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[15], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[16], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[17], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[18], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[19], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[20], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[21], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[22], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[23], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[24], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[25], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[26], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[27], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[28], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[29], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[30], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[31], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[32], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[33], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[34], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[35], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[36], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[37], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[38], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[39], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[40], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[41], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[42], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[43], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[44], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[45], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[46], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[47], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[48], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[49], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[50], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[51], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[52], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[53], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[54], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[55], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[56], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[57], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[58], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[59], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[60], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[61], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[62], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[63], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[64], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[65], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[66], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[67], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[68], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[69], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[70], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[71], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[72], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[73], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[74], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[75], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[76], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[77], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[78], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[79], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[80], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[81], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[82], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[83], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[84], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[85], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[86], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[87], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[88], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[89], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[90], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[91], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[92], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[93], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[94], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[95], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[96], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[97], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[98], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[99], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[100], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[101], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[102], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[103], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[104], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[105], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[106], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[107], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[108], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[109], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[110], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[111], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[112], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[113], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[114], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[115], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[116], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[117], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[118], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[119], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[120], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[121], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[122], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[123], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[124], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[125], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[126], tBWH, notify_bweb);
    $hold(posedge CLK &&& check_write_bist, posedge BWEBM[127], tBWH, notify_bweb);


endspecify
`endif


initial begin

    read_flag = 0;
    write_flag = 0;
    idle_flag = 0;
    
end

always @(BIST_i) begin

    if (BIST_i === 1'bx || BIST_i === 1'bz) begin
    `ifdef no_warning
    `else
    	$display("\tWarning %m : input BIST unknown/high-Z in read cycle at simulation time %.1f\n", $realtime);
    `endif	
	Q_d1 = {numBit{1'bx}};
	xMemoryAll;
    end

end

always @(posedge CLK_i) begin

    if (iCEB === 1'b0) begin
    	idle_flag = 0;
    	if (iWEB === 1'b1) begin    	// read
	    read_flag = 1;
	    if ( ^iA === 1'bx ) begin
    `ifdef no_warning
    `else
	    	$display("\tWarning %m : input A unknown/high-Z in read cycle at simulation time %.1f\n", $realtime);
    `endif
		Q_d1 = {numBit{1'bx}};
	    end
	    else if (iA >= numWord) begin
    `ifdef no_warning
    `else
	    	$display("\tWarning %m : address exceed word depth in read cycle at simulation time %.1f\n", $realtime);
    `endif
	    end
	    else begin

    	    	Q_d1 = MEMORY[iRowAddr][iColAddr];
	    end
	end
	else if (iWEB === 1'b0) begin	// write
	    write_flag = 1;

	    if ( ^iA === 1'bx ) begin
    `ifdef no_warning
    `else
	    	$display("\tWarning %m : input A unknown/high-Z in write cycle at simulation time %.1f\n", $realtime);
    `endif
		xMemoryAll;
	    end
	    else if (iA >= numWord) begin
    `ifdef no_warning
    `else
	    	$display("\tWarning %m : address exceed word depth in write cycle at simulation time %.1f\n", $realtime);
    `endif
	    end
	    else begin

		    if ( ^iD === 1'bx ) begin
    `ifdef no_warning
    `else
		    	$display("\tWarning %m : input D unknown/high-Z in write cycle at simulation time %.1f\n", $realtime);
    `endif
		    end
		    if ( ^iBWEB === 1'bx ) begin
    `ifdef no_warning
    `else
		    	$display("\tWarning %m : input BWEB unknown/high-Z in write cycle at simulation time %.1f\n", $realtime);
    `endif
		    end

    	    	    DIN_tmp = MEMORY[iRowAddr][iColAddr];

    	    	    for (i = 0; i < numBit; i = i + 1) begin
    	    	    	if (iBWEB[i] === 1'b0) begin
    	    	    	    DIN_tmp[i] = iD[i];
    	    	    	end
    	    	    	else if (iBWEB[i] === 1'bx) begin
    	    	    	    DIN_tmp[i] = 1'bx;
    	    	    	end

    	    	    end

    	    	    if ( isStuckAt0(iA) || isStuckAt1(iA) ) begin
    	    	    	combineErrors(iA, ERR_tmp);
    	    	    	for (j = 0; j < numBit; j = j + 1) begin
    	    	    	    if (ERR_tmp[j] === 1'b0) begin
    	    	    	    	DIN_tmp[j] = 1'b0;					
    	    	    	    	end
    	    	    	    else if (ERR_tmp[j] === 1'b1) begin
    	    	    	    	DIN_tmp[j] = 1'b1;
    	    	    	    end
    	    	    	end
    	    	    end

    	    	    MEMORY[iRowAddr][iColAddr] = DIN_tmp;

	    end
	end
	else begin
    `ifdef no_warning
    `else
    	    $display("\tWarning %m : input WEB unknown/high-Z at simulation time %.1f\n", $realtime);
    `endif
	    if ( ^iA === 1'bx ) begin
	    	Q_d1 = {numBit{1'bx}};
		xMemoryAll;
	    end
	    else begin
	    	Q_d1 = {numBit{1'bx}};
		xMemoryAll;
	    end
	end
    end
    else if (iCEB === 1'b1) begin
    	idle_flag = 1;
    end
    else begin
    `ifdef no_warning
    `else
    	$display("\tWarning %m : input CEB unknown/high-Z at simulation time %.1f\n", $realtime);
    `endif
	Q_d1 = {numBit{1'bx}};
	xMemoryAll;
    end
end


always @(CLK_i) begin

    if (CLK_i === 1'bx || CLK_i === 1'bz) begin
    	if (iCEB !== 1'b1) begin
    `ifdef no_warning
    `else
    	    $display("\tWarning %m : input CLK unknown/high-Z at simulation time %.1f\n", $realtime);
    `endif
	    Q_d1 = {numBit{1'bx}};
	    xMemoryAll;
	end
	read_flag = 0;
	write_flag = 0;
    end
    else if (CLK_i === 1'b0) begin
	read_flag = 0;
	write_flag = 0;
    end
end

always @(posedge CLK_i) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
    Q_d = Q_d1;
`else
    if (iCEB === 1'b0 && iWEB === 1'b1) begin
      #(Thold);
      Q_d = {numBit{1'bx}};
      #(0.001);
      Q_d = Q_d1;
    end
`endif	//end `ifdef UNIT_DELAY
end

`ifdef UNIT_DELAY
`else
always @(Q_d1) begin
    Q_d = Q_d1;
end
`endif	//end `ifdef UNIT_DELAY

always @(AWT_i) begin

    if (AWT_i === 1'bx || AWT_i === 1'bz) begin
    `ifdef no_warning
    `else
    	$display("\tWarning %m : input AWT unknown/high-Z at simulation time %.1f\n", $realtime);
    `endif
    	Q_d = {numBit{1'bx}};
    	Q_awt = {numBit{1'bx}};
    end
    else begin
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else	
    	#(Tawtqh);
`endif
    	Q_d = {numBit{1'bx}};
    	Q_awt = {numBit{1'bx}};
    	#(0.001);
    	Q_d = Q_d1;
    	Q_awt = Q_awt1;
    end
end

always @(iD or iBWEB) begin
	    Q_awt1 = iD ^ iBWEB;
end


// this coding style works fine in both NC-Verilog and VCS
always @(iD[0]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[0] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[0] = Q_awt1[0];
end
always @(iD[1]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[1] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[1] = Q_awt1[1];
end
always @(iD[2]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[2] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[2] = Q_awt1[2];
end
always @(iD[3]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[3] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[3] = Q_awt1[3];
end
always @(iD[4]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[4] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[4] = Q_awt1[4];
end
always @(iD[5]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[5] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[5] = Q_awt1[5];
end
always @(iD[6]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[6] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[6] = Q_awt1[6];
end
always @(iD[7]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[7] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[7] = Q_awt1[7];
end
always @(iD[8]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[8] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[8] = Q_awt1[8];
end
always @(iD[9]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[9] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[9] = Q_awt1[9];
end
always @(iD[10]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[10] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[10] = Q_awt1[10];
end
always @(iD[11]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[11] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[11] = Q_awt1[11];
end
always @(iD[12]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[12] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[12] = Q_awt1[12];
end
always @(iD[13]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[13] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[13] = Q_awt1[13];
end
always @(iD[14]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[14] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[14] = Q_awt1[14];
end
always @(iD[15]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[15] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[15] = Q_awt1[15];
end
always @(iD[16]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[16] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[16] = Q_awt1[16];
end
always @(iD[17]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[17] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[17] = Q_awt1[17];
end
always @(iD[18]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[18] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[18] = Q_awt1[18];
end
always @(iD[19]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[19] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[19] = Q_awt1[19];
end
always @(iD[20]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[20] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[20] = Q_awt1[20];
end
always @(iD[21]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[21] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[21] = Q_awt1[21];
end
always @(iD[22]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[22] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[22] = Q_awt1[22];
end
always @(iD[23]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[23] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[23] = Q_awt1[23];
end
always @(iD[24]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[24] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[24] = Q_awt1[24];
end
always @(iD[25]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[25] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[25] = Q_awt1[25];
end
always @(iD[26]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[26] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[26] = Q_awt1[26];
end
always @(iD[27]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[27] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[27] = Q_awt1[27];
end
always @(iD[28]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[28] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[28] = Q_awt1[28];
end
always @(iD[29]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[29] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[29] = Q_awt1[29];
end
always @(iD[30]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[30] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[30] = Q_awt1[30];
end
always @(iD[31]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[31] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[31] = Q_awt1[31];
end
always @(iD[32]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[32] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[32] = Q_awt1[32];
end
always @(iD[33]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[33] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[33] = Q_awt1[33];
end
always @(iD[34]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[34] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[34] = Q_awt1[34];
end
always @(iD[35]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[35] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[35] = Q_awt1[35];
end
always @(iD[36]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[36] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[36] = Q_awt1[36];
end
always @(iD[37]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[37] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[37] = Q_awt1[37];
end
always @(iD[38]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[38] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[38] = Q_awt1[38];
end
always @(iD[39]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[39] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[39] = Q_awt1[39];
end
always @(iD[40]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[40] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[40] = Q_awt1[40];
end
always @(iD[41]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[41] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[41] = Q_awt1[41];
end
always @(iD[42]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[42] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[42] = Q_awt1[42];
end
always @(iD[43]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[43] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[43] = Q_awt1[43];
end
always @(iD[44]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[44] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[44] = Q_awt1[44];
end
always @(iD[45]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[45] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[45] = Q_awt1[45];
end
always @(iD[46]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[46] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[46] = Q_awt1[46];
end
always @(iD[47]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[47] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[47] = Q_awt1[47];
end
always @(iD[48]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[48] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[48] = Q_awt1[48];
end
always @(iD[49]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[49] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[49] = Q_awt1[49];
end
always @(iD[50]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[50] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[50] = Q_awt1[50];
end
always @(iD[51]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[51] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[51] = Q_awt1[51];
end
always @(iD[52]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[52] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[52] = Q_awt1[52];
end
always @(iD[53]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[53] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[53] = Q_awt1[53];
end
always @(iD[54]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[54] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[54] = Q_awt1[54];
end
always @(iD[55]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[55] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[55] = Q_awt1[55];
end
always @(iD[56]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[56] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[56] = Q_awt1[56];
end
always @(iD[57]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[57] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[57] = Q_awt1[57];
end
always @(iD[58]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[58] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[58] = Q_awt1[58];
end
always @(iD[59]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[59] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[59] = Q_awt1[59];
end
always @(iD[60]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[60] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[60] = Q_awt1[60];
end
always @(iD[61]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[61] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[61] = Q_awt1[61];
end
always @(iD[62]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[62] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[62] = Q_awt1[62];
end
always @(iD[63]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[63] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[63] = Q_awt1[63];
end
always @(iD[64]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[64] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[64] = Q_awt1[64];
end
always @(iD[65]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[65] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[65] = Q_awt1[65];
end
always @(iD[66]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[66] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[66] = Q_awt1[66];
end
always @(iD[67]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[67] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[67] = Q_awt1[67];
end
always @(iD[68]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[68] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[68] = Q_awt1[68];
end
always @(iD[69]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[69] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[69] = Q_awt1[69];
end
always @(iD[70]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[70] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[70] = Q_awt1[70];
end
always @(iD[71]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[71] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[71] = Q_awt1[71];
end
always @(iD[72]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[72] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[72] = Q_awt1[72];
end
always @(iD[73]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[73] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[73] = Q_awt1[73];
end
always @(iD[74]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[74] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[74] = Q_awt1[74];
end
always @(iD[75]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[75] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[75] = Q_awt1[75];
end
always @(iD[76]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[76] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[76] = Q_awt1[76];
end
always @(iD[77]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[77] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[77] = Q_awt1[77];
end
always @(iD[78]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[78] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[78] = Q_awt1[78];
end
always @(iD[79]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[79] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[79] = Q_awt1[79];
end
always @(iD[80]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[80] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[80] = Q_awt1[80];
end
always @(iD[81]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[81] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[81] = Q_awt1[81];
end
always @(iD[82]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[82] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[82] = Q_awt1[82];
end
always @(iD[83]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[83] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[83] = Q_awt1[83];
end
always @(iD[84]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[84] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[84] = Q_awt1[84];
end
always @(iD[85]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[85] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[85] = Q_awt1[85];
end
always @(iD[86]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[86] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[86] = Q_awt1[86];
end
always @(iD[87]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[87] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[87] = Q_awt1[87];
end
always @(iD[88]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[88] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[88] = Q_awt1[88];
end
always @(iD[89]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[89] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[89] = Q_awt1[89];
end
always @(iD[90]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[90] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[90] = Q_awt1[90];
end
always @(iD[91]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[91] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[91] = Q_awt1[91];
end
always @(iD[92]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[92] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[92] = Q_awt1[92];
end
always @(iD[93]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[93] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[93] = Q_awt1[93];
end
always @(iD[94]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[94] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[94] = Q_awt1[94];
end
always @(iD[95]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[95] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[95] = Q_awt1[95];
end
always @(iD[96]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[96] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[96] = Q_awt1[96];
end
always @(iD[97]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[97] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[97] = Q_awt1[97];
end
always @(iD[98]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[98] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[98] = Q_awt1[98];
end
always @(iD[99]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[99] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[99] = Q_awt1[99];
end
always @(iD[100]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[100] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[100] = Q_awt1[100];
end
always @(iD[101]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[101] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[101] = Q_awt1[101];
end
always @(iD[102]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[102] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[102] = Q_awt1[102];
end
always @(iD[103]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[103] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[103] = Q_awt1[103];
end
always @(iD[104]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[104] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[104] = Q_awt1[104];
end
always @(iD[105]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[105] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[105] = Q_awt1[105];
end
always @(iD[106]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[106] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[106] = Q_awt1[106];
end
always @(iD[107]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[107] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[107] = Q_awt1[107];
end
always @(iD[108]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[108] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[108] = Q_awt1[108];
end
always @(iD[109]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[109] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[109] = Q_awt1[109];
end
always @(iD[110]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[110] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[110] = Q_awt1[110];
end
always @(iD[111]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[111] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[111] = Q_awt1[111];
end
always @(iD[112]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[112] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[112] = Q_awt1[112];
end
always @(iD[113]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[113] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[113] = Q_awt1[113];
end
always @(iD[114]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[114] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[114] = Q_awt1[114];
end
always @(iD[115]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[115] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[115] = Q_awt1[115];
end
always @(iD[116]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[116] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[116] = Q_awt1[116];
end
always @(iD[117]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[117] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[117] = Q_awt1[117];
end
always @(iD[118]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[118] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[118] = Q_awt1[118];
end
always @(iD[119]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[119] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[119] = Q_awt1[119];
end
always @(iD[120]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[120] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[120] = Q_awt1[120];
end
always @(iD[121]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[121] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[121] = Q_awt1[121];
end
always @(iD[122]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[122] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[122] = Q_awt1[122];
end
always @(iD[123]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[123] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[123] = Q_awt1[123];
end
always @(iD[124]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[124] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[124] = Q_awt1[124];
end
always @(iD[125]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[125] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[125] = Q_awt1[125];
end
always @(iD[126]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[126] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[126] = Q_awt1[126];
end
always @(iD[127]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tdqh);
    Q_awt[127] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[127] = Q_awt1[127];
end

always @(iBWEB[0]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[0] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[0] = Q_awt1[0];
end
always @(iBWEB[1]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[1] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[1] = Q_awt1[1];
end
always @(iBWEB[2]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[2] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[2] = Q_awt1[2];
end
always @(iBWEB[3]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[3] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[3] = Q_awt1[3];
end
always @(iBWEB[4]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[4] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[4] = Q_awt1[4];
end
always @(iBWEB[5]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[5] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[5] = Q_awt1[5];
end
always @(iBWEB[6]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[6] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[6] = Q_awt1[6];
end
always @(iBWEB[7]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[7] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[7] = Q_awt1[7];
end
always @(iBWEB[8]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[8] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[8] = Q_awt1[8];
end
always @(iBWEB[9]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[9] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[9] = Q_awt1[9];
end
always @(iBWEB[10]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[10] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[10] = Q_awt1[10];
end
always @(iBWEB[11]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[11] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[11] = Q_awt1[11];
end
always @(iBWEB[12]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[12] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[12] = Q_awt1[12];
end
always @(iBWEB[13]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[13] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[13] = Q_awt1[13];
end
always @(iBWEB[14]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[14] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[14] = Q_awt1[14];
end
always @(iBWEB[15]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[15] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[15] = Q_awt1[15];
end
always @(iBWEB[16]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[16] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[16] = Q_awt1[16];
end
always @(iBWEB[17]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[17] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[17] = Q_awt1[17];
end
always @(iBWEB[18]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[18] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[18] = Q_awt1[18];
end
always @(iBWEB[19]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[19] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[19] = Q_awt1[19];
end
always @(iBWEB[20]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[20] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[20] = Q_awt1[20];
end
always @(iBWEB[21]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[21] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[21] = Q_awt1[21];
end
always @(iBWEB[22]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[22] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[22] = Q_awt1[22];
end
always @(iBWEB[23]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[23] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[23] = Q_awt1[23];
end
always @(iBWEB[24]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[24] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[24] = Q_awt1[24];
end
always @(iBWEB[25]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[25] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[25] = Q_awt1[25];
end
always @(iBWEB[26]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[26] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[26] = Q_awt1[26];
end
always @(iBWEB[27]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[27] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[27] = Q_awt1[27];
end
always @(iBWEB[28]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[28] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[28] = Q_awt1[28];
end
always @(iBWEB[29]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[29] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[29] = Q_awt1[29];
end
always @(iBWEB[30]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[30] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[30] = Q_awt1[30];
end
always @(iBWEB[31]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[31] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[31] = Q_awt1[31];
end
always @(iBWEB[32]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[32] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[32] = Q_awt1[32];
end
always @(iBWEB[33]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[33] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[33] = Q_awt1[33];
end
always @(iBWEB[34]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[34] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[34] = Q_awt1[34];
end
always @(iBWEB[35]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[35] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[35] = Q_awt1[35];
end
always @(iBWEB[36]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[36] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[36] = Q_awt1[36];
end
always @(iBWEB[37]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[37] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[37] = Q_awt1[37];
end
always @(iBWEB[38]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[38] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[38] = Q_awt1[38];
end
always @(iBWEB[39]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[39] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[39] = Q_awt1[39];
end
always @(iBWEB[40]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[40] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[40] = Q_awt1[40];
end
always @(iBWEB[41]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[41] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[41] = Q_awt1[41];
end
always @(iBWEB[42]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[42] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[42] = Q_awt1[42];
end
always @(iBWEB[43]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[43] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[43] = Q_awt1[43];
end
always @(iBWEB[44]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[44] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[44] = Q_awt1[44];
end
always @(iBWEB[45]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[45] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[45] = Q_awt1[45];
end
always @(iBWEB[46]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[46] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[46] = Q_awt1[46];
end
always @(iBWEB[47]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[47] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[47] = Q_awt1[47];
end
always @(iBWEB[48]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[48] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[48] = Q_awt1[48];
end
always @(iBWEB[49]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[49] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[49] = Q_awt1[49];
end
always @(iBWEB[50]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[50] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[50] = Q_awt1[50];
end
always @(iBWEB[51]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[51] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[51] = Q_awt1[51];
end
always @(iBWEB[52]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[52] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[52] = Q_awt1[52];
end
always @(iBWEB[53]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[53] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[53] = Q_awt1[53];
end
always @(iBWEB[54]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[54] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[54] = Q_awt1[54];
end
always @(iBWEB[55]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[55] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[55] = Q_awt1[55];
end
always @(iBWEB[56]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[56] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[56] = Q_awt1[56];
end
always @(iBWEB[57]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[57] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[57] = Q_awt1[57];
end
always @(iBWEB[58]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[58] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[58] = Q_awt1[58];
end
always @(iBWEB[59]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[59] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[59] = Q_awt1[59];
end
always @(iBWEB[60]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[60] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[60] = Q_awt1[60];
end
always @(iBWEB[61]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[61] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[61] = Q_awt1[61];
end
always @(iBWEB[62]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[62] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[62] = Q_awt1[62];
end
always @(iBWEB[63]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[63] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[63] = Q_awt1[63];
end
always @(iBWEB[64]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[64] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[64] = Q_awt1[64];
end
always @(iBWEB[65]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[65] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[65] = Q_awt1[65];
end
always @(iBWEB[66]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[66] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[66] = Q_awt1[66];
end
always @(iBWEB[67]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[67] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[67] = Q_awt1[67];
end
always @(iBWEB[68]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[68] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[68] = Q_awt1[68];
end
always @(iBWEB[69]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[69] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[69] = Q_awt1[69];
end
always @(iBWEB[70]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[70] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[70] = Q_awt1[70];
end
always @(iBWEB[71]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[71] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[71] = Q_awt1[71];
end
always @(iBWEB[72]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[72] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[72] = Q_awt1[72];
end
always @(iBWEB[73]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[73] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[73] = Q_awt1[73];
end
always @(iBWEB[74]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[74] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[74] = Q_awt1[74];
end
always @(iBWEB[75]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[75] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[75] = Q_awt1[75];
end
always @(iBWEB[76]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[76] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[76] = Q_awt1[76];
end
always @(iBWEB[77]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[77] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[77] = Q_awt1[77];
end
always @(iBWEB[78]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[78] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[78] = Q_awt1[78];
end
always @(iBWEB[79]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[79] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[79] = Q_awt1[79];
end
always @(iBWEB[80]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[80] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[80] = Q_awt1[80];
end
always @(iBWEB[81]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[81] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[81] = Q_awt1[81];
end
always @(iBWEB[82]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[82] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[82] = Q_awt1[82];
end
always @(iBWEB[83]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[83] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[83] = Q_awt1[83];
end
always @(iBWEB[84]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[84] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[84] = Q_awt1[84];
end
always @(iBWEB[85]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[85] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[85] = Q_awt1[85];
end
always @(iBWEB[86]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[86] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[86] = Q_awt1[86];
end
always @(iBWEB[87]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[87] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[87] = Q_awt1[87];
end
always @(iBWEB[88]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[88] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[88] = Q_awt1[88];
end
always @(iBWEB[89]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[89] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[89] = Q_awt1[89];
end
always @(iBWEB[90]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[90] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[90] = Q_awt1[90];
end
always @(iBWEB[91]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[91] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[91] = Q_awt1[91];
end
always @(iBWEB[92]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[92] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[92] = Q_awt1[92];
end
always @(iBWEB[93]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[93] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[93] = Q_awt1[93];
end
always @(iBWEB[94]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[94] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[94] = Q_awt1[94];
end
always @(iBWEB[95]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[95] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[95] = Q_awt1[95];
end
always @(iBWEB[96]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[96] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[96] = Q_awt1[96];
end
always @(iBWEB[97]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[97] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[97] = Q_awt1[97];
end
always @(iBWEB[98]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[98] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[98] = Q_awt1[98];
end
always @(iBWEB[99]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[99] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[99] = Q_awt1[99];
end
always @(iBWEB[100]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[100] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[100] = Q_awt1[100];
end
always @(iBWEB[101]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[101] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[101] = Q_awt1[101];
end
always @(iBWEB[102]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[102] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[102] = Q_awt1[102];
end
always @(iBWEB[103]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[103] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[103] = Q_awt1[103];
end
always @(iBWEB[104]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[104] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[104] = Q_awt1[104];
end
always @(iBWEB[105]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[105] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[105] = Q_awt1[105];
end
always @(iBWEB[106]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[106] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[106] = Q_awt1[106];
end
always @(iBWEB[107]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[107] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[107] = Q_awt1[107];
end
always @(iBWEB[108]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[108] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[108] = Q_awt1[108];
end
always @(iBWEB[109]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[109] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[109] = Q_awt1[109];
end
always @(iBWEB[110]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[110] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[110] = Q_awt1[110];
end
always @(iBWEB[111]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[111] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[111] = Q_awt1[111];
end
always @(iBWEB[112]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[112] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[112] = Q_awt1[112];
end
always @(iBWEB[113]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[113] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[113] = Q_awt1[113];
end
always @(iBWEB[114]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[114] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[114] = Q_awt1[114];
end
always @(iBWEB[115]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[115] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[115] = Q_awt1[115];
end
always @(iBWEB[116]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[116] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[116] = Q_awt1[116];
end
always @(iBWEB[117]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[117] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[117] = Q_awt1[117];
end
always @(iBWEB[118]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[118] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[118] = Q_awt1[118];
end
always @(iBWEB[119]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[119] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[119] = Q_awt1[119];
end
always @(iBWEB[120]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[120] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[120] = Q_awt1[120];
end
always @(iBWEB[121]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[121] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[121] = Q_awt1[121];
end
always @(iBWEB[122]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[122] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[122] = Q_awt1[122];
end
always @(iBWEB[123]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[123] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[123] = Q_awt1[123];
end
always @(iBWEB[124]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[124] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[124] = Q_awt1[124];
end
always @(iBWEB[125]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[125] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[125] = Q_awt1[125];
end
always @(iBWEB[126]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[126] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[126] = Q_awt1[126];
end
always @(iBWEB[127]) begin

`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`else
    #(Tbwqh);
    Q_awt[127] = 1'bx;
    #(0.001);
`endif	//end `ifdef UNIT_DELAY
    Q_awt[127] = Q_awt1[127];
end

always @(CLK_i or TSEL_i) begin
    if((TSEL_i !== 2'b01) && ($realtime > 0) ) begin
        $display("\tError %m : input TSEL should be set to 2'b01 at simulation time %.1f\n", $realtime);
        $display("\tError %m : Please refer to the databook for the TSEL setting\n");
`ifdef UNIT_DELAY
	#(`SRAM_DELAY);
`endif
        Q_d = {numBit{1'bx}};
        xMemoryAll;
    end
end


`ifdef UNIT_DELAY
`else
always @(notify_clk) begin

    Q_d1 = {numBit{1'bx}};
    xMemoryAll;

end

always @(notify_bist) begin

    Q_d1 = {numBit{1'bx}};
    xMemoryAll;

end

always @(notify_ceb) begin

    Q_d1 = {numBit{1'bx}};
    xMemoryAll;
    read_flag = 0;
    write_flag = 0;

end

always @(notify_web) begin

    Q_d1 = {numBit{1'bx}};
    xMemoryAll;
    read_flag = 0;
    write_flag = 0;

end

always @(notify_addr) begin

    if (iWEB === 1'b1) begin
    	Q_d1 = {numBit{1'bx}};
    	xMemoryAll;
    end
    else if (iWEB === 1'b0) begin
    	xMemoryAll;
    end
    else begin
    	Q_d1 = {numBit{1'bx}};
	xMemoryAll;
    end
    
    read_flag = 0;
    write_flag = 0;

end

always @(notify_din) begin

    if ( ^iA === 1'bx ) begin
    	xMemoryAll;
    end
    else begin
    	xMemoryWord(iA);
    end
    
    write_flag = 0;

end

always @(notify_bweb) begin

    if ( ^iA === 1'bx ) begin
    	xMemoryAll;
    end
    else begin
    	xMemoryWord(iA);
    end
    
    write_flag = 0;

end

`endif	//end `ifdef UNIT_DELAY

task xMemoryAll;
reg [numRowAddr:0] row;
reg [numCMAddr:0] col;
begin
    for (row = 0; row < numRow; row = row + 1) begin
    	for (col = 0; col < numCM; col = col + 1) begin
    	    MEMORY[row][col] = {numBit{1'bx}};
	end
    end
end
endtask


task xMemoryWord;
input [numWordAddr-1:0] addr;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin

    {row, col} = addr;
    MEMORY[row][col] = {numBit{1'bx}};

end
endtask

task preloadData;
reg [numWordAddr:0] w;
reg [numWordAddr-numCMAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin

    `ifdef no_warning
    `else
    $display("Preloading data from file %s", preloadFile);
    `endif
    $readmemb(preloadFile, PRELOAD);

    for (w = 0; w < numWord; w = w + 1) begin
    	{row, col} = w;
    	MEMORY[row][col] = PRELOAD[w];
    end
 
end
endtask


/*
 * task injectSA - to inject a stuck-at error, please use hierarchical reference to call the injectSA task from the wrapper module
 *  	input addr - the address location where the defect is to be introduced
 *  	input bit - the bit location of the specified address where the defect is to occur
 *  	input type - specify whether it's a s-a-0 (type = 0) or a s-a-1 (type = 1) fault
 *
 *  	Multiple faults can be injected at the same address, regardless of the type.  This means that an address location can have 
 *  	certain bits having stuck-at-0 faults while other bits have the stuck-at-1 defect.
 *
 * Examples:
 *  	injectSA(0, 0, 0);  - injects a s-a-0 fault at address 0, bit 0
 *  	injectSA(1, 0, 1);  - injects a s-a-1 fault at address 1, bit 0
 *  	injectSA(1, 1, 0);  - injects a s-a-0 fault at address 1, bit 1
 *  	injectSA(1, 2, 1);  - injects a s-a-1 fault at address 1, bit 2
 *  	injectSA(1, 3, 1);  - injects a s-a-1 fault at address 1, bit 3
 *  	injectSA(2, 2, 1);  - injects a s-a-1 fault at address 2, bit 2
 *  	injectSA(14, 2, 0); - injects a s-a-0 fault at address 14, bit 2
 *
 */
task injectSA;
input [numWordAddr-1:0] addr;
input integer bitn;
input typen;
reg [numStuckAt:0] i;
reg [numBit-1:0] btmp;
begin

    if ( typen == 0 ) begin
    
    	for (i = 0; i < numStuckAt; i = i + 1) begin
	
    	    if ( ^stuckAt0Addr[i] === 1'bx ) begin
	    	stuckAt0Addr[i] = addr;
		btmp = {numBit{1'bx}};
		btmp[bitn] = 1'b0;
		stuckAt0Bit[i] = btmp;
	    	i = numStuckAt;

    `ifdef no_warning
    `else
		$display("First s-a-0 error injected at address location %d = %b", addr, btmp);
    `endif
	    	i = numStuckAt;
	    end
	    else if ( stuckAt0Addr[i] === addr ) begin
	    	btmp = stuckAt0Bit[i];
		btmp[bitn] = 1'b0;
		stuckAt0Bit[i] = btmp;
		
    `ifdef no_warning
    `else
		$display("More s-a-0 error injected at address location %d = %b", addr, btmp);
    `endif
	    	i = numStuckAt;
	    end	    
	end
	
    end
    else if (typen == 1) begin
    
    	for (i = 0; i < numStuckAt; i = i + 1) begin
	
    	    if ( ^stuckAt1Addr[i] === 1'bx ) begin
	    	stuckAt1Addr[i] = addr;
		btmp = {numBit{1'bx}};
		btmp[bitn] = 1'b1;
		stuckAt1Bit[i] = btmp;
	    	i = numStuckAt;

    `ifdef no_warning
    `else
		$display("First s-a-1 error injected at address location %d = %b", addr, btmp);
    `endif
	    	i = numStuckAt;
	    end
	    else if ( stuckAt1Addr[i] === addr ) begin
	    	btmp = stuckAt1Bit[i];
		btmp[bitn] = 1'b1;
		stuckAt1Bit[i] = btmp;
		
    `ifdef no_warning
    `else
		$display("More s-a-1 error injected at address location %d = %b", addr, btmp);
    `endif
	    	i = numStuckAt;
	    end	    
	end
	
    end

end
endtask


task combineErrors;
input [numWordAddr-1:0] addr;
output [numBit-1:0] errors;
integer j;
reg [numBit-1:0] btmp;
begin

    errors = {numBit{1'bx}};
    if ( isStuckAt0(addr) ) begin
	btmp = stuckAt0Bit[getStuckAt0Index(addr)];
    	for ( j = 0; j < numBit; j = j + 1 ) begin
	    if ( btmp[j] === 1'b0 ) begin
	    	errors[j] = 1'b0;
	    end
	end
    end
    if ( isStuckAt1(addr) ) begin
    	btmp = stuckAt1Bit[getStuckAt1Index(addr)];
    	for ( j = 0; j < numBit; j = j + 1 ) begin
	    if ( btmp[j] === 1'b1 ) begin
	    	errors[j] = 1'b1;
	    end
	end
    end

end
endtask


function [numStuckAt-1:0] getStuckAt0Index;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
begin

    for (i = 0; i < numStuckAt; i = i + 1) begin
    
    	if (stuckAt0Addr[i] === addr) begin
	    getStuckAt0Index = i;
	end
    
    end

end
endfunction


function [numStuckAt-1:0] getStuckAt1Index;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
begin

    for (i = 0; i < numStuckAt; i = i + 1) begin
    
    	if (stuckAt1Addr[i] === addr) begin
	    getStuckAt1Index = i;
	end
    
    end

end
endfunction


function isStuckAt0;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
reg flag;
begin

    flag = 0;
    for (i = 0; i < numStuckAt; i = i + 1) begin

    	if (stuckAt0Addr[i] === addr) begin
    	    flag = 1;
	    i = numStuckAt;
	end

    end

    isStuckAt0 = flag;

end
endfunction


function isStuckAt1;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
reg flag;
begin

    flag = 0;
    for (i = 0; i < numStuckAt; i = i + 1) begin

    	if (stuckAt1Addr[i] === addr) begin
	    flag = 1;
	    i = numStuckAt;
	end

    end

    isStuckAt1 = flag;

end
endfunction

task printMemory;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
reg [numRowAddr:0] row_index;
reg [numCMAddr:0] col_index;
reg [numBit-1:0] temp;
begin
    $display("\n\nDumping memory content at %.1f...\n", $realtime);
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
    	for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
 	        row=row_index;
	        col=col_index;
    	    $display("[%d] = %b", {row, col}, MEMORY[row][col]);
	    end
    end    
    $display("\n\n");
end
endtask

task printMemoryFromTo;
input [numWordAddr-1:0] addr1;
input [numWordAddr-1:0] addr2;
reg [numWordAddr:0] addr;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin

    `ifdef no_warning
    `else
    $display("\n\nDumping memory content at %.1f...\n", $realtime);
    `endif
    
    for (addr = addr1; addr < addr2; addr = addr + 1) begin
    	{row, col} = addr;
    `ifdef no_warning
    `else
    	$display("[%d] = %b", addr, MEMORY[row][col]);
    `endif
    end    
    
    `ifdef no_warning
    `else
    $display("\n\n");
    `endif
    
end
endtask


endmodule
`endcelldefine

