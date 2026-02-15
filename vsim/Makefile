TARGET = test_scan
HEADERS = ../verilog/test/sys_defs.vh

TESTBENCH = ./tb_$(TARGET).sv
TESTBENCH_SYN = ./tb_$(TARGET)_syn.sv

SIM_FILES = ../verilog/group_scan_mem_reg_if/rwctr.sv\
            ../verilog/group_scan_mem_reg_if/mem_reg_mux.sv \
			../verilog/group_scan_mem_reg_if/syn_pulse_gen.sv \
			../verilog/group_scan_mem_reg_if/group_scan_mem_reg_if.sv \
			../verilog/share/block_scan.sv \
			../verilog/share/group_mux.sv \
		    ../verilog/scan_for_test.sv \
			../verilog/reg/cs_reg.sv \
			../verilog/sram/spram.sv \
			../verilog/test/test_scan.sv \
			../verilog/test/CLK_GEN.sv \

SIM_SYN_FILES = ../verilog/group_scan_mem_reg_if/group_scan_mem_reg_if.nl.v \
				../verilog/share/block_scan.sv \
				../verilog/share/group_mux.sv \
		    	../verilog/scan_for_test.sv \
				../verilog/reg/cs_reg.sv \
				../verilog/sram/spram.sv \
				../verilog/test/test_scan.sv \
				../verilog/test/CLK_GEN.sv \
	            /afs/umich.edu/class/eecs427/tsmc65/stdcells/tcbn65lp_220a/TSMCHOME/digital/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v

VCS = vcs -V -sverilog +vc -Mupdate -line -full64 -kdb +vcs+vcdpluson -debug_pp

VV         = vcs
VVOPTS     = +v2k +vc -sverilog +systemverilogext+sv  -timescale=1ns/1ps +vcs+lic+wait \
                +multisource_int_delays +plusarg_save +overlap -full64 -Mupdate -lca  +libext+.v+.vlib+.vh \
                 -cm_libs yv+celldefine  \
                +neg_tchk  \
				-debug_access+all -debug_pp \
				+noerrorIOPCWM +nowarnTFMPC \
				+notimingcheck \
				+vcs+dumparrays +memcbk

sim:clean	simv
	./simv | tee sim_program.log

simv:	$(HEADERS) $(SIM_FILES) $(TESTBENCH)
	$(VV) $(VVOPTS) $(HEADERS) $(SIM_FILES) $(TESTBENCH) -o simv

verdi:
	@ verdi -sverilog -2012 -autoalias +define_FSDB_DUMP $(HEADERS) $(SIM_FILES) $(TESTBENCH) -top tb_$(TARGET) -ssf ./tb_$(TARGET).fsdb &

syn_sim:clean	syn_simv
	./simv | tee sim_program.log

syn_simv: $(HEADERS) $(SIM_SYN_FILES) $(TESTBENCH_SYN)
	$(VV) $(VVOPTS) $(HEADERS) $(SIM_SYN_FILES) $(TESTBENCH_SYN) -o simv

syn_verdi:
	@ verdi -sverilog -2012 -autoalias +define_FSDB_DUMP $(HEADERS) $(SIM_SYN_FILES) $(TESTBENCH_SYN) -top tb_$(TARGET)_syn -ssf ./tb_$(TARGET)_syn.fsdb &

clean:
	rm -f DVEfiles/*log*
	rm -rf .simvision
	rm -rf novaslog
	rm -rf INCA_libs
	rm -rf novas.conf
	rm -rf *history
	rm -rf irun.key
	rm -rf *.log
	rm -rf novas.rc
	rm -rf *.shm
	rm -rf *fsdb
	rm -rf *csrc
	rm -rf *simv*
	rm -rf *key*
	rm -rf *daidir*
	rm -rf *txt*
