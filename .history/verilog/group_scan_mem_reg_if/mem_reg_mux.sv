// Mem and reg mux
// This module selects the interface between the SRAM and the control registers.
// If the MSB of scan_addr is 0, the SRAM is selected; if it is 1, the control registers are selected.

module mem_reg_mux (
    // to scan_syn_ctr
    input  scan_ren,
    input  scan_wen,
    input  [11:0] scan_addr,
    input  [31:0] scan_wdata,
    output reg [31:0] scan_rdata,  
    output reg scan_ready,

    // to sram
    output reg sram_ren,
    output reg sram_wen,
    output reg [10:0] sram_addr,
    output reg [31:0] sram_wdata,
    input [31:0] sram_rdata,
    input sram_ready,
    
    // to resgiters  
    output reg ctr_ren,
    output reg ctr_wen,
    output reg [16:0] ctr1_wdata,
    output reg [14:0] ctr2_wdata,
    input  [16:0] ctr1_rdata,
    input  [14:0] ctr2_rdata,
    input  ctr_ready
);

    always @* begin
        scan_ready <= ctr_ready | sram_ready;
        scan_rdata <= ctr_ready ? {ctr1_rdata, ctr2_rdata} : (sram_ready ? sram_rdata : 32'h0);
    end

    always @* begin
        ctr_wen    =  scan_addr[11] ? scan_wen : 0;
        ctr_ren    =  scan_addr[11] ? scan_ren : 0;
        sram_wen   = !scan_addr[11] ? scan_wen : 0;
        sram_ren   = !scan_addr[11] ? scan_ren : 0;
    end

    always @* begin
        ctr1_wdata    =  scan_addr[11] ? scan_wdata[31:15] : 0;
        ctr2_wdata    =  scan_addr[11] ? scan_wdata[14:0]  : 0;
        sram_wdata    = !scan_addr[11] ? scan_wdata        : 0;
        sram_addr     = !scan_addr[11] ? scan_addr[10:0]   : 0;
    end

endmodule
