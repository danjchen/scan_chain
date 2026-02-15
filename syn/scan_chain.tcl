# Reset signals
set_false_path   -through [get_ports rst_n]  

# These signals are asynchronized to chip's clk and run at very low frequency 
set_false_path   -through  [get_ports static_wen_group_mux] 
set_false_path   -through  [get_ports static_ren_group_mux]  
set_false_path   -through  [get_ports static_addr_group_mux] 
set_false_path   -through  [get_ports static_wdata_group_mux]  
set_false_path   -through  [get_ports static_rdata_group_mux]  
set_false_path   -through  [get_ports static_ready_group_mux]  
set_false_path   -through  [get_ports scan_id_group_mux]