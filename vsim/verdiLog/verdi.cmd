verdiSetActWin -dock widgetDock_<Decl._Tree>
sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-sverilog" "-2012" "+define_FSDB_DUMP" "../verilog/test/sys_defs.vh" \
          "../verilog/group_scan_mem_reg_if/rwctr.sv" \
          "../verilog/group_scan_mem_reg_if/mem_reg_mux.sv" \
          "../verilog/group_scan_mem_reg_if/syn_pulse_gen.sv" \
          "../verilog/group_scan_mem_reg_if/group_scan_mem_reg_if.sv" \
          "../verilog/share/block_scan.sv" "../verilog/share/group_mux.sv" \
          "../verilog/scan_for_test.sv" "../verilog/reg/cs_reg.sv" \
          "../verilog/sram/spram.sv" "../verilog/test/test_scan.sv" \
          "../verilog/test/CLK_GEN.sv" "./tb_test_scan.sv" "-top" \
          "tb_test_scan" -autoalias
debLoadSimResult \
           /afs/umich.edu/group/e/ece598to/w26/group6/A_Team_Scan_Chain/vsim/tb_test_scan.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "500" "146" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.mem_reg_mux_inst" -win \
           $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.rwctr_inst" -win $_nTrace1
srcHBSelect "tb_test_scan.s1" -win $_nTrace1
srcHBSelect "tb_test_scan.s1" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.rwctr_inst" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.syn_pulse_gen_inst" -win \
           $_nTrace1
srcHBSelect "tb_test_scan.dut" -win $_nTrace1
srcSetScope "tb_test_scan.dut" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan.dut" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.block_scan_inst" -win $_nTrace1
srcSetScope "tb_test_scan.dut.block_scan_inst" -delim "." -win $_nTrace1
srcHBSelect "tb_test_scan.dut.block_scan_inst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_ren" -line 4 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_addr" -line 5 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_wdata" -line 6 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "static_rdata" -line 7 -pos 1 -win $_nTrace1
srcAction -pos 6 1 3 -win $_nTrace1 -name "static_rdata" -ctrlKey off
srcHBSelect "tb_test_scan.dut.block_scan_inst" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "tb_test_scan.cs_reg1" -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.block_scan_inst" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_mux_inst" -win $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.mem_reg_mux_inst" -win \
           $_nTrace1
srcHBSelect "tb_test_scan.dut.group_scan_mem_reg_if_A.syn_pulse_gen_inst" -win \
           $_nTrace1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
verdiSetActWin -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/block_scan_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/group_mux_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/group_scan_mem_reg_if_A"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/cs_reg1"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut"
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/group_scan_mem_reg_if_A"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/block_scan_inst"
wvGetSignalSetScope -win $_nWave2 "/tb_test_scan/dut/group_mux_inst"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_test_scan/dut/group_mux_inst/static_rdata\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_test_scan/dut/group_mux_inst/static_rdata\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 170881205754.738556 -snap {("G2" 0)}
