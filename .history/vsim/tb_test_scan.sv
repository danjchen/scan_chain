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
    // Group 1 SRAM
    // ------------------------------------------------------
    logic sram_ren_A;
    logic sram_wen_A;
    logic [10:0] sram_addr_A;
    logic [31:0] sram_wdata_A;
    logic [31:0] sram_rdata_A;
    logic sram_ready_A;

    // Group 1 control registers
    logic ctr_ren_A;
    logic ctr_wen_A;
    logic [16:0] ctr1_wdata_A;
    logic [16:0] ctr1_rdata_A;
    logic [14:0] ctr2_wdata_A;
    logic [14:0] ctr2_rdata_A;
    logic ctr_ready_A;

    // ------------------------------------------------------
    // Group 2 SRAM
    // ------------------------------------------------------
    logic sram_ren_B;
    logic sram_wen_B;
    logic [10:0] sram_addr_B;
    logic [31:0] sram_wdata_B;
    logic [31:0] sram_rdata_B;
    logic sram_ready_B;

    // Group 2 control registers
    logic ctr_ren_B;
    logic ctr_wen_B;
    logic [16:0] ctr1_wdata_B;
    logic [16:0] ctr1_rdata_B;
    logic [14:0] ctr2_wdata_B;
    logic [14:0] ctr2_rdata_B;
    logic ctr_ready_B;

   clk_gen c1 (.clk(clk), .rst_n(rst_n));


   // Group 1
   spram s1 (.clk(clk),
                .rst_n(rst_n), 
                .wen(sram_wen_A),
                .ren(sram_ren_A),
                .waddr(sram_addr_A),
                .raddr(sram_addr_A),
                .wdata(sram_wdata_A), 
                .rdata(sram_rdata_A), 
                .ready(sram_ready_A)); 

   ctr_reg ctr1 (
        .ctr1_wdata(ctr1_wdata_A),
        .ctr2_wdata(ctr2_wdata_A),
        .clk(clk),
        .rst_n(rst_n),
        .ctr_wen(ctr_wen_A),
        .ctr_ren(ctr_ren_A),
        .ctr1(ctr1_A),
        .ctr2(ctr2_A),
        .ctr1_rdata(ctr1_rdata_A),
        .ctr2_rdata(ctr2_rdata_A),
        .ctr_ready(ctr_ready_A)
    );

   // Group 2
   spram s2 (.clk(clk),
                .rst_n(rst_n), 
                .wen(sram_wen_B),
                .ren(sram_ren_B),
                .waddr(sram_addr_B),
                .raddr(sram_addr_B),
                .wdata(sram_wdata_B), 
                .rdata(sram_rdata_B), 
                .ready(sram_ready_B)); 

   ctr_reg ctr2 (
        .ctr1_wdata(ctr1_wdata_B),
        .ctr2_wdata(ctr2_wdata_B),
        .clk(clk),
        .rst_n(rst_n),
        .ctr_wen(ctr_wen_B),
        .ctr_ren(ctr_ren_B),
        .ctr1(ctr1_B),
        .ctr2(ctr2_B),
        .ctr1_rdata(ctr1_rdata_B),
        .ctr2_rdata(ctr2_rdata_B),
        .ctr_ready(ctr_ready_B)
    );

   test_scan ts1 (.*);


   scan_for_test dut (
        .clk_A(clk),
        .clk_B(clk),
        .rst_n(rst_n),

        // Pads
        .scan_id(scan_id),
        .scan_phi(scan_phi),
        .scan_phi_bar(scan_phi_bar),
        .scan_data_in(scan_data_in),
        .scan_data_out(scan_data_out),
        .scan_load_chip(scan_load_chip),
        .scan_load_chain(scan_load_chain),

        // Group 1
        .sram_ren_A(sram_ren_A),
        .sram_wen_A(sram_wen_A),
        .sram_addr_A(sram_addr_A),
        .sram_wdata_A(sram_wdata_A),
        .sram_rdata_A(sram_rdata_A),
        .sram_ready_A(sram_ready_A),
        .ctr_ren_A(ctr_ren_A),
        .ctr_wen_A(ctr_wen_A),
        .ctr1_wdata_A(ctr1_wdata_A),
        .ctr1_rdata_A(ctr1_rdata_A),
        .ctr2_wdata_A(ctr2_wdata_A),
        .ctr2_rdata_A(ctr2_rdata_A),
        .ctr_ready_A(ctr_ready_A),

        // Group 2
        .sram_ren_B(sram_ren_B),
        .sram_wen_B(sram_wen_B),
        .sram_addr_B(sram_addr_B),
        .sram_wdata_B(sram_wdata_B),
        .sram_rdata_B(sram_rdata_B),
        .sram_ready_B(sram_ready_B),
        .ctr_ren_B(ctr_ren_B),
        .ctr_wen_B(ctr_wen_B),
        .ctr1_wdata_B(ctr1_wdata_B),
        .ctr1_rdata_B(ctr1_rdata_B),
        .ctr2_wdata_B(ctr2_wdata_B),
        .ctr2_rdata_B(ctr2_rdata_B),
        .ctr_ready_B(ctr_ready_B)
    );

   initial begin
      file = $fopen("scan_data_out.txt", "w");
      $fsdbDumpfile("tb_test_scan.fsdb");
      $fsdbDumpvars(0, tb_test_scan, "+struct");
      $fsdbDumpvars("+mda");
      #(5000*`CLK_CYCLE)
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
