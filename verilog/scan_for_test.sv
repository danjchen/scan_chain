module scan_for_test( 
    // input signals
    input clk,
    input rst_n,

    // To the pads
    input scan_id,
    input scan_phi,
    input scan_phi_bar,
    input scan_data_in,
    output reg scan_data_out,
    input scan_load_chip,
    input scan_load_chain,

    // To SRAM
    output reg sram_ren,
    output reg sram_wen,
    output reg [10:0] sram_addr,
    output reg [31:0] sram_wdata,
    input [31:0] sram_rdata,
    input sram_ready,
    
    // To resgiters 
    output reg reg_wen,
    output reg reg_ren,

    // control register
    output reg [16:0] cr_wdata,
    input  [16:0] cr_rdata,

    // status register
    input  [14:0] sr_rdata,
    input  reg_ready  
);
    // block_scan
    reg static_wen;
    reg static_ren;
    reg [19:0]  static_addr;
    reg [32-1:0]  static_wdata;
    reg [31:0]  static_rdata;
    reg static_ready;

    reg  static_wen_A;
    reg  static_ren_A;
    reg  [19:0] static_addr_A;
    reg  [31:0] static_wdata_A;
    reg  [31:0] static_rdata_A;
    reg  static_ready_A;
    reg  scan_id_A;

    block_scan block_scan_inst (
        // Inputs & outputs to the group mux
        .static_wen(static_wen),
        .static_ren(static_ren),
        .static_addr(static_addr),
        .static_wdata(static_wdata),
        .static_rdata(static_rdata),
        .static_ready(static_ready),

        // To the pads
        .scan_phi(scan_phi),
        .scan_phi_bar(scan_phi_bar),
        .scan_data_in(scan_data_in),
        .scan_data_out(scan_data_out),
        .scan_load_chip(scan_load_chip),
        .scan_load_chain(scan_load_chain)
    );

    group_mux group_mux_inst(
         // Inputs & outputs to the pads
         .scan_id(scan_id),

         // To the group mux
        .static_wen(static_wen),
        .static_ren(static_ren),
        .static_addr(static_addr),
        .static_wdata(static_wdata),
        .static_rdata(static_rdata),
        .static_ready(static_ready),

         // To group A
        .static_wen_A(static_wen_A),
        .static_ren_A(static_ren_A),
        .static_addr_A(static_addr_A),
        .static_wdata_A(static_wdata_A),
        .static_rdata_A(static_rdata_A),
        .static_ready_A(static_ready_A),
        .scan_id_A(scan_id_A)
    );

    // group A
    group_scan_mem_reg_if group_scan_mem_reg_if_A(
        // Inputs & outputs to the group_mux
        .clk(clk),                   
        .rst_n(rst_n),               
        .static_wen_group_mux   (static_wen_A),
        .static_ren_group_mux   (static_ren_A),
        .static_addr_group_mux  (static_addr_A),
        .static_wdata_group_mux (static_wdata_A),
        .static_rdata_group_mux (static_rdata_A),
        .static_ready_group_mux (static_ready_A),
        .scan_id_group_mux      (scan_id_A),

        // To SRAM
        .sram_ren   (sram_ren),
        .sram_wen   (sram_wen),
        .sram_addr  (sram_addr),
        .sram_wdata (sram_wdata),
        .sram_rdata (sram_rdata),
        .sram_ready (sram_ready),

        // To registers
        .reg_wen     (reg_wen),
        .reg_ren     (reg_ren),
        .cr_wdata    (cr_wdata),
        .cr_rdata    (cr_rdata),
        .sr_rdata    (sr_rdata),
        .reg_ready   (reg_ready)
  );

endmodule 
