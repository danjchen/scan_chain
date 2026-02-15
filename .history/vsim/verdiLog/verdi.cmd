verdiSetActWin -dock widgetDock_<Decl._Tree>
sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-sverilog" "-2012" "+define_FSDB_DUMP" "../verilog/test/sys_defs.vh" \
          "../verilog/group_scan_mem_reg_if/rwctr.sv" \
          "../verilog/group_scan_mem_reg_if/mem_reg_mux.sv" \
          "../verilog/group_scan_mem_reg_if/syn_pulse_gen.sv" \
          "../verilog/group_scan_mem_reg_if/group_scan_mem_reg_if.sv" \
          "../verilog/block_scan.sv" "../verilog/group_mux.sv" \
          "../verilog/scan_for_test.sv" "../verilog/reg/ctr_reg.sv" \
          "../verilog/sram/spram.sv" "../verilog/test/test_scan.sv" \
          "../verilog/test/CLK_GEN.sv" "./tb_test_scan.sv" "-top" \
          "tb_test_scan" -autoalias
debLoadSimResult \
           /afs/umich.edu/group/e/ece598to/w26/tutorial/A_Team_Scan_Chain/vsim/tb_test_scan.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
srcHBSelect "tb_test_scan.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_test_scan.s2" -win $_nTrace1
srcSetScope "tb_test_scan.s2" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan.s2" -win $_nTrace1
srcHBSelect "tb_test_scan.dut" -win $_nTrace1
srcSetScope "tb_test_scan.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan.dut" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_mux_inst" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_mux_inst" -win $_nTrace1
srcSetScope "tb_test_scan.dut.group_mux_inst" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_mux_inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_addr" -line 6 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvAddSignal -win $_nWave2 "/tb_test_scan/dut/group_mux_inst/static_addr\[19:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetCursor -win $_nWave2 873098201936.376221 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel_A" -line 80 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 "/tb_test_scan/dut/group_mux_inst/sel_A"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "sel_B" -line 81 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 "/tb_test_scan/dut/group_mux_inst/sel_B"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetCursor -win $_nWave2 1997648686030.428711 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 1673642352661.879150 -snap {("G2" 0)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_addr" -line 6 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 "/tb_test_scan/dut/group_mux_inst/static_addr\[19:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetCursor -win $_nWave2 1680615862464.636963 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_test_scan.ctr1" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_test_scan" -win $_nTrace1
srcSetScope "tb_test_scan" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_ren_A" -line 32 -pos 1 -win $_nTrace1
srcAction -pos 31 3 6 -win $_nTrace1 -name "ctr_ren_A" -ctrlKey off
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_test_scan" -win $_nTrace1
srcSetScope "tb_test_scan" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_ren_A" -line 32 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 "/tb_test_scan/ctr_ren_A"
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_wen_A" -line 33 -pos 1 -win $_nTrace1
srcAction -pos 32 3 6 -win $_nTrace1 -name "ctr_wen_A" -ctrlKey off
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.mem_reg_mux_inst" -win \
           $_nTrace1
srcSetScope "tb_test_scan.dut.group_scan_mem_reg_if_A.mem_reg_mux_inst" -delim \
           "." -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.mem_reg_mux_inst" -win \
           $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_test_scan" -win $_nTrace1
srcSetScope "tb_test_scan" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_wen_A" -line 25 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_ren_A" -line 24 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {24 25 4 4 8 8}
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_wen_A" -line 25 -pos 1 -win $_nTrace1
srcSelect -signal "sram_ren_A" -line 24 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvAddSignal -win $_nWave2 "/tb_test_scan/sram_wen_A" "/tb_test_scan/sram_ren_A"
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
verdiSetActWin -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_addr_A" -line 26 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_wdata_A" -line 27 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_addr_A" -line 26 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_wdata_A" -line 27 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_addr_A" -line 26 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_rdata_A" -line 28 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_ready_A" -line 29 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_ren_A" -line 32 -pos 1 -win $_nTrace1
srcSelect -win $_nTrace1 -range {32 33 4 4 8 6}
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_wen_A" -line 33 -pos 1 -win $_nTrace1
srcSelect -signal "ctr_ren_A" -line 32 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 "/tb_test_scan/ctr_wen_A" "/tb_test_scan/ctr_ren_A"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetCursor -win $_nWave2 1687589372267.396484 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvZoom -win $_nWave2 0.000000 3724599126312.857910
wvSetCursor -win $_nWave2 1013974425222.637939 -snap {("G2" 0)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ctr_ren_A" -line 32 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_ren_B" -line 43 -pos 1 -win $_nTrace1
srcSelect -signal "sram_wen_B" -line 44 -pos 1 -win $_nTrace1
srcSelect -signal "ctr_ren_B" -line 51 -pos 1 -win $_nTrace1
srcSelect -signal "ctr_wen_B" -line 52 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvAddSignal -win $_nWave2 "/tb_test_scan/sram_ren_B" "/tb_test_scan/sram_wen_B" \
           "/tb_test_scan/ctr_ren_B" "/tb_test_scan/ctr_wen_B"
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetCursor -win $_nWave2 1385430402779.445801 -snap {("G1" 9)}
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2188578462361.733398 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1520961637833.956787 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 1746847029591.475098 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1631394496026.521484 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1726768328101.917969 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2273912943692.351562 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 3006785548061.188477 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 3548910488279.232422 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 3388280876362.775391 -snap {("G2" 0)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave2 1651473197516.078613 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvSetWindowTimeUnit -win $_nWave2 1.000000 us
wvZoom -win $_nWave2 0.000000 3493.694059
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_rdata_B" -line 47 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_addr_B" -line 45 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 "/tb_test_scan/sram_addr_B\[10:0\]"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "sram_addr_A" -line 26 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvAddSignal -win $_nWave2 "/tb_test_scan/sram_addr_A\[10:0\]"
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2542.176871 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 2542.176871 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 2645.238095 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2817.006803 -snap {("G1" 1)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
verdiSetActWin -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 1020.408163 1063.988095
wvZoom -win $_nWave2 1039.885725 1044.184425
wvZoom -win $_nWave2 1042.950377 1043.321761
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 34.353741 1614.625850
wvZoom -win $_nWave2 983.592022 1081.418390
wvZoom -win $_nWave2 1038.161833 1047.545178
wvZoom -win $_nWave2 1042.623709 1043.587577
wvZoom -win $_nWave2 1043.118101 1043.188260
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 824.489796 1992.517007
wvZoom -win $_nWave2 1641.314267 1705.674950
wvZoom -win $_nWave2 1679.930677 1686.541876
wvZoom -win $_nWave2 1682.741561 1683.470142
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 10 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 6)}
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debExit
