////////////////////////////////////
///////////  Simulation  ///////////
////////////////////////////////////
// Step 1: module load
module load vscode/1.70.2
module load matlab/2022a
module load vcs/2023.12-SP2-1
module load verdi/2023.12-SP2-1

// Step 2
// Run simulation under vsim folder
cd vsim
make sim
// Check waveforms 
make verdi

// Step 3: Check DOUT
// Under matlab folder
DOUT_check.m
////////////////////////////////////
////////////////////////////////////

////////////////////////////////////////
//////////  Modify Example Code ////////
////////////////////////////////////////
Path: /verilog/group_scan_mem_reg_if

(1) group_scan_mem_reg_if.sv:
 - adjust bit width of "sram_addr" to fit your design     
 - add status register to monitor your core

(2) mem_reg_mux.sv:
 - adjust bit width of "sram_addr" and "static_addr" to fit your design

(3) rwctr.sv:
 - adjust bit width of "scan_addr" and "scan_addr_w" to fit your design

 
