module group_scan_mem_reg_if(
    // Input signals
    input clk,
    input rst_n,
   
    // Inputs & outputs to the group_mux
    input static_wen_group_mux,
    input static_ren_group_mux,
    input [19:0] static_addr_group_mux,
    input [31:0] static_wdata_group_mux,
    output reg [31:0] static_rdata_group_mux,
    output reg  static_ready_group_mux,
    input scan_id_group_mux,

    // To SRAM
    output reg sram_ren,
    output reg sram_wen,
    output reg [10:0] sram_addr,
    output reg [31:0] sram_wdata,
    input [31:0] sram_rdata,
    input sram_ready,
    
    // To control registers 
    output reg  ctr_ren,
    output reg  ctr_wen,
    output reg [16:0] ctr1_wdata,
    input      [16:0] ctr1_rdata,
    output reg [14:0] ctr2_wdata,
    input      [14:0] ctr2_rdata,
    input ctr_ready
);

    // mem_reg_mux
    reg   scan_wen;
    reg   scan_ren;
    reg [11:0]  scan_addr;
    reg [31:0]  scan_wdata;
    reg [31:0]  scan_rdata;
    reg         scan_ready;

    // syn and pulse generator
    reg id_valid;

    // instiate rwctr 
    rwctr rwctr_inst(
        .clk(clk),                   // Connect clock
        .rst_n(rst_n),               // Connect reset
        .id_valid(id_valid),       // Connect scan_id from top level
        .static_wen(static_wen_group_mux), // Connect static_wen from top level
        .static_ren(static_ren_group_mux), // Connect static_ren from top level
        .static_addr(static_addr_group_mux[11:0]), // Connect static_addr from top level
        .static_wdata(static_wdata_group_mux), // Connect static_wdata from top level
        .static_ready(static_ready_group_mux), // Connect static_ready to top level
        .static_rdata(static_rdata_group_mux), // Connect static_rdata to top level
        .scan_wen(scan_wen),     // Connect scan_wen to top level
        .scan_ren(scan_ren),     // Connect scan_ren to top level
        .scan_addr(scan_addr),   // Connect scan_addr to top level
        .scan_wdata(scan_wdata), // Connect scan_wdata to top level
        .scan_rdata(scan_rdata), // Connect static_rdata to top level
        .scan_ready(scan_ready)  // Connect static_ready to top level
    );

   // instiate mem_reg_mux
   mem_reg_mux mem_reg_mux_inst (
        .scan_ren(scan_ren),    // Connect scan_ren from top level
        .scan_wen(scan_wen),    // Connect scan_wen from top level
        .scan_addr(scan_addr),  // Connect scan_addr from top level
        .scan_wdata(scan_wdata),// Connect scan_wdata from top level
        .scan_rdata(scan_rdata),// Connect scan_rdata to top level
        .scan_ready(scan_ready),// Connect scan_ready to top level
        .sram_ren(sram_ren),    // Connect sram_ren to top level
        .sram_wen(sram_wen),    // Connect sram_wen to top level
        .sram_wdata(sram_wdata),// Connect sram_wdata to top level
        .sram_rdata(sram_rdata),// Connect sram_rdata from top level
        .sram_ready(sram_ready),
        .sram_addr(sram_addr),
        .ctr_ren(ctr_ren),      // Connect ctr_ren to top level
        .ctr_wen(ctr_wen),      // Connect ctr_wen to top level
        .ctr1_wdata(ctr1_wdata),  // Connect ctr1_wdata to top level
        .ctr1_rdata(ctr1_rdata),  // Connect ctr1_rdata from top level
        .ctr_ready(ctr_ready),
        .ctr2_wdata(ctr2_wdata), // Connect ctr2_wdata from top level
        .ctr2_rdata(ctr2_rdata) // Connect ctr2_rdata from top level
    );

    syn_pulse_gen syn_pulse_gen_inst(
        .clk(clk),                   // Connect clock
        .rst_n(rst_n),               // Connect reset
        .scan_id(scan_id_group_mux),  // Connect scan_id from top level
        .id_valid(id_valid)          // Connect id_valid from top level
    );

endmodule 

