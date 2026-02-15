all: clean syn

clean:
	rm -rf dwsvf_*
	rm -f *.syn.v
	rm -f output.txt
	rm -f *.{log,sdf,rpt,svf,sdc,syn,pvl}

syn:
	dc_shell -tcl_mode -xg_mode -f group_scan_mem_reg_if.syn.tcl | tee output.txt

