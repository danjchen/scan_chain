// Mem and reg mux
// This module selects the interface between the SRAM and the control registers.
// If the MSB of scan_addr is 0, the SRAM is selected; if it is 1, the registers are selected.

module mem_reg_mux (
    // to scan_syn_ctr
    input  scan_ren,
    input  scan_wen,
    input  [15:0] scan_addr,// changed to 16 bits for our design
    input  [31:0] scan_wdata,
    output reg [31:0] scan_rdata,  
    output reg scan_ready,

    // to sram
    output reg sram_ren,
    output reg sram_wen,
    output reg [15:0] sram_addr, // changed to 16 bits for our design
    output reg [31:0] sram_wdata,
    input [31:0] sram_rdata,
    input sram_ready,
    
    // to resgiters 
    output reg reg_wen,
    output reg reg_ren,

    // control register
    output reg [16:0] cr_wdata,
    input  [16:0] cr_rdata,

    // status register
    input  [14:0] sr_rdata,
    input  reg_ready
);

    always @* begin
        scan_ready <= reg_ready | sram_ready;
        scan_rdata <= reg_ready ? {cr_rdata, sr_rdata} : (sram_ready ? sram_rdata : 32'h0);
    end

    always @* begin
        reg_wen    =  scan_addr[15] ? scan_wen : 0;
        reg_ren    =  scan_addr[15] ? scan_ren : 0;
        sram_wen   = !scan_addr[15] ? scan_wen : 0;
        sram_ren   = !scan_addr[15] ? scan_ren : 0;
    end

    always @* begin
        cr_wdata     =  scan_addr[15] ? scan_wdata[31:15] : 0;
        sram_wdata   = !scan_addr[15] ? scan_wdata        : 0;
        sram_addr    = !scan_addr[15] ? scan_addr[15:0]   : 0;
    end

endmodule
