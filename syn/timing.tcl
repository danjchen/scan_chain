# Timing setup for synthesis

# Clock period (ns)
# 10% uncertainty is a good estimation for RO
set clk_period 2
set clk_uncertainty 0.2
set clk_transition 0.2

set clk_name "clk"
set clk_port "clk"

#Create real clock if clock port is found
if {[sizeof_collection [get_ports clk]] > 0} {
  set clk_name "clk"
  set clk_port "clk"
  #If no waveform is specified, 50% duty cycle is assumed
  create_clock -name $clk_name -period $clk_period [get_ports $clk_port] 
  set_drive 0 [get_clocks $clk_name] 
}
#If not real clock then create virtual clock
if {[sizeof_collection [get_ports clk]] == 0} {
  set clk_name "vclk"
  create_clock -name $clk_name -period $clk_period 
}

set_clock_uncertainty $clk_uncertainty [get_clocks $clk_name]
#Propagated clock used for gated clocks only
#set_propagated_clock [get_clocks $clk_name]
set_clock_transition $clk_transition [get_clocks $clk_name]

set_wire_load_selection "WireAreaLowkCon"
set_wire_load_model -name "TSMC16K_Lowk_Conservative" -library "tcbn65lpbc" 
set_wire_load_mode "segmented" 

set typical_input_delay 0.150
set typical_output_delay 0.100
set typical_wire_load 0.010