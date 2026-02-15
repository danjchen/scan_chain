module scan_for_test( 
    // input signals
    input clk_A,
    input clk_B,
    input rst_n,

    // To the pads
    input scan_id,
    input scan_phi,
    input scan_phi_bar,
    input scan_data_in,
    output reg scan_data_out,
    input scan_load_chip,
    input scan_load_chain,

    // Group 1
    output reg sram_ren_A,
    output reg sram_wen_A,
    output reg [10:0] sram_addr_A,
    output reg [31:0] sram_wdata_A,
    input [31:0] sram_rdata_A,
    input sram_ready_A,
    
    output reg ctr_ren_A,
    output reg ctr_wen_A,
    output reg [16:0] ctr1_wdata_A,
    input      [16:0] ctr1_rdata_A,
    output reg [14:0] ctr2_wdata_A,
    input      [14:0] ctr2_rdata_A,
    input ctr_ready_A,

    
);
    // block_scan
    reg static_wen;
    reg static_ren;
    reg [19:0]  static_addr;
    reg [32-1:0]  static_wdata;
    reg [31:0]  static_rdata;
    reg static_ready;

    reg  scan_id_A;
    reg  static_wen_A;
    reg  static_ren_A;
    reg  [19:0] static_addr_A;
    reg  [31:0] static_wdata_A;
    reg  [31:0] static_rdata_A;
    reg  static_ready_A;

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
        .scan_id_A(scan_id_A),
    );

    // group A
    group_scan_mem_reg_if group_scan_mem_reg_if_A(
        // Inputs & outputs to the group_mux
        .clk(clk_A),                   
        .rst_n(rst_n),               
        .static_wen_group_mux   (static_wen_A),
        .static_ren_group_mux   (static_ren_A),
        .static_addr_group_mux  (static_addr_A),
        .static_wdata_group_mux (static_wdata_A),
        .static_rdata_group_mux (static_rdata_A),
        .static_ready_group_mux (static_ready_A),
        .scan_id_group_mux      (scan_id_A),

        // To SRAM
        .sram_ren   (sram_ren_A),
        .sram_wen   (sram_wen_A),
        .sram_addr  (sram_addr_A),
        .sram_wdata (sram_wdata_A),
        .sram_rdata (sram_rdata_A),
        .sram_ready (sram_ready_A),

        // To control registers
        .ctr_ren     (ctr_ren_A),
        .ctr_wen     (ctr_wen_A),
        .ctr1_wdata  (ctr1_wdata_A),
        .ctr1_rdata  (ctr1_rdata_A),
        .ctr2_wdata  (ctr2_wdata_A),
        .ctr2_rdata  (ctr2_rdata_A),
        .ctr_ready   (ctr_ready_A)
    );

endmodule 
