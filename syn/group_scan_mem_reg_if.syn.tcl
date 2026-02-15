# TCL script for Design Compiler

# Load common variables, artisan standard cells
source -verbose "common.tcl"

# Set top level name
set top_level "group_scan_mem_reg_if"

# Read system verilog files
read_sverilog "  ../verilog/group_scan_mem_reg_if/group_scan_mem_reg_if.sv\
                ../verilog/group_scan_mem_reg_if/mem_reg_mux.sv\
                ../verilog/group_scan_mem_reg_if/rwctr.sv\
                ../verilog/group_scan_mem_reg_if/syn_pulse_gen.sv"

list_designs
current_design $top_level

# Read timing constrints
# Set clock names, ports
source -verbose "timing.tcl"
source -verbose "scan_chain.tcl"
set_ideal_network rst_n
set_fix_multiple_port_nets -all

# Link the design
link

# Set maximum fanout of gates
set_max_fanout 8 $top_level 

# Configure the clock network
set_fix_hold [all_clocks] 
set_dont_touch_network [get_ports clk]

# Set delays: Input, Output
# set_driving_cell -lib_cell INVX1TR [all_inputs] -library typical
set_input_delay $typical_input_delay [all_inputs] -clock $clk_name 
remove_input_delay -clock $clk_name [find port $clk_port]
set_output_delay $typical_output_delay [all_outputs] -clock $clk_name 

# Set loading of outputs (unit: pF)
set_load $typical_wire_load [all_outputs] 

# Verify the design
check_design

# Uniquify repeated modules
uniquify

# Avoid feedthrough
# set_fix_multiple_port_nets -feedthroughs -buffer_constants

# Synthesize the design
compile -map_effort medium

# Rename modules, signals according to the naming rules
# Used for tool exchange
source -verbose "namingrules.tcl"

# Generate structural verilog netlist
write -hierarchy -format verilog -output "../verilog/group_scan_mem_reg_if/${top_level}.nl.v"

# Generate Standard Delay Format (SDF) file
write_sdf -context verilog "./${top_level}.syn.sdf"

# Correct the SDF with the artisan provided postprocessor
#exec ${ARTISAN}/synopsys/dc_postprocessor.pl -s ./${top_level}.temp.sdf -o ./${top_level}.dc.sdf

# Write SDC
write_sdc "./${top_level}.sdc"

# Generate report file
set maxpaths 20
set rpt_file "./${top_level}.dc.rpt"

check_design > $rpt_file
report_area  >> ${rpt_file}
report_power -hier -analysis_effort medium >> ${rpt_file}
report_design >> ${rpt_file}
report_cell >> ${rpt_file}
report_port -verbose >> ${rpt_file}
report_compile_options >> ${rpt_file}
report_constraint -all_violators -verbose >> ${rpt_file}
report_timing -path full -delay max -max_paths $maxpaths -nworst 100 >> ${rpt_file}
report_clocks >> ${rpt_file}
#Exit dc_shell
quit
