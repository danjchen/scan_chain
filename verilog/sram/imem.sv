//*******************************************************************************
//*        Software       : TSMC MEMORY COMPILER 2006.09.01.d.220a
//*        Technology     : 65 nm CMOS LOGIC Low Power LowK Cu 1P9M 1.2
//*                         High-vt logic, High-vt SRAM
//*        Memory Type    : TSMC 65nm low power SP SRAM Without Redundancy
//*        Library Name   : ts1n65lpll1024x16m16 ( user specify: TS1N65LPLL1024X16M16)
//*        Library Version: 220a
//*        Generated Time : 2026/01/31, 00:52:32
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

module TS1N65LPLL1024X16M16 ( 
			BIST, AWT,
			CLK, CEB, WEB,

			A, D, BWEB,

			AM, DM, BWEBM,

			Q,

			TSEL,

			CEBM, WEBM
	         		    );

// Define Parameter
parameter numWord = 1024;
parameter numRow = 64;
parameter numCM = 16;
parameter numBit = 16;
parameter numWordAddr = 10;
parameter numRowAddr = 6;
parameter numCMAddr = 4;

parameter Thold = 1.559;
parameter Tawtqh = 0.091;
parameter Tdqh = 0.336;
parameter Tbwqh = 0.371;
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


    specparam tCYC = 1.845;
    specparam tCKH = 0.277;
    specparam tCKL = 0.499;
    specparam tCS  = 0.460;
    specparam tCH  = 0.000;
    specparam tWS  = 0.438;
    specparam tWH  = 0.000;
    specparam tAS  = 0.452;
    specparam tAH  = 0.000;
    specparam tDS  = 0.384;
    specparam tDH  = 0.000;
    specparam tBWS = 0.413;
    specparam tBWH = 0.000;
    specparam tCD  = 1.641;
    specparam tHOLD  = 1.559;

    specparam tBISTS = 0.798;
    specparam tBISTH = 0.059;
    
    specparam tAWTQ = 0.328;
    specparam tAWTQH = 0.091;
    specparam tDQ = 0.641;
    specparam tDQH = 0.336;
    specparam tBWQ = 0.685;
    specparam tBWQH = 0.371;

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

