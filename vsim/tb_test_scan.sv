//`timescale 1ns/1ps
`timescale 1ns/1ps
// 4X4 Array
module tb_test_scan;
   // universal
    int file;
    logic clk;
    logic rst_n;
    logic scan_id;

    // ------------------------------------------------------
    // Scan pad signals
    // ------------------------------------------------------
    logic scan_phi;
    logic scan_phi_bar;
    logic scan_data_in;
    logic scan_data_out;
    logic scan_load_chip;
    logic scan_load_chain;

    // ------------------------------------------------------
    // Group's SRAM
    // ------------------------------------------------------
   logic sram_ren;
   logic sram_wen;
   logic [10:0] sram_addr;
   logic [31:0] sram_wdata;
   logic [31:0] sram_rdata;
   logic sram_ready;

    // Group registers
   logic reg_wen;
   logic reg_ren;
   logic [16:0] cr_wdata;
   logic [16:0] cr;
   logic [16:0] cr_rdata;
   logic [14:0] sr_wdata_core;
   logic [14:0] sr;
   logic [14:0] sr_rdata;
   logic reg_ready;

   clk_gen c1 (.clk(clk), .rst_n(rst_n));

   // Group 1
   spram s1 (.clk(clk),
                .rst_n(rst_n), 
                .wen(sram_wen),
                .ren(sram_ren),
                .waddr(sram_addr),
                .raddr(sram_addr),
                .wdata(sram_wdata), 
                .rdata(sram_rdata), 
                .ready(sram_ready)); 

   cs_reg cs_reg1 (
        .clk(clk),
        .rst_n(rst_n),
        .reg_wen(reg_wen),
        .reg_ren(reg_ren),
        .cr_wdata(cr_wdata),
        .cr(cr),
        .cr_rdata(cr_rdata),
        .sr_wdata_core(sr_wdata_core),
        .sr(sr),
        .sr_rdata(sr_rdata),
        .reg_ready(reg_ready)
    );

   test_scan ts1 (.*);

   scan_for_test dut (
        .clk(clk),
        .rst_n(rst_n),

        // Pads
        .scan_id(scan_id),
        .scan_phi(scan_phi),
        .scan_phi_bar(scan_phi_bar),
        .scan_data_in(scan_data_in),
        .scan_data_out(scan_data_out),
        .scan_load_chip(scan_load_chip),
        .scan_load_chain(scan_load_chain),

        // To sram
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


   initial begin
      file = $fopen("scan_data_out.txt", "w");
      $fsdbDumpfile("tb_test_scan.fsdb");
      $fsdbDumpvars(0, tb_test_scan, "+struct");
      $fsdbDumpvars("+mda");
      // core initializes status register 
      sr_wdata_core = {1'h0,14'h0000};
      #(150*`CLK_CYCLE)

      // core sets done bit (sr[15]) to "1"
      sr_wdata_core = {1'h1,14'h0000};

      #(350*`CLK_CYCLE)
      $finish();
   end

   always begin
      `SCAN_DELAY
      `SCAN_DELAY
      `SCAN_DELAY
      `SCAN_DELAY
      `SCAN_DELAY
      $fwrite(file, "%b", scan_data_out);
      end

endmodule
