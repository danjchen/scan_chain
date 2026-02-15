`timescale 1ns/1ps
`define SCAN_DELAY #500

module test_scan(
   input               clk,
   input               rst_n,
   output   logic      scan_phi,
   output   logic      scan_phi_bar,
   output   logic      scan_data_in,
   output   logic      scan_load_chip,
   output   logic      scan_load_chain,
   input               scan_data_out,
   output   logic      scan_id
);
   
   // Scan
   initial scan_phi = 0;
   initial scan_phi_bar = 0;
   initial scan_data_in = 0;
   initial scan_load_chip = 0;
   initial scan_load_chain = 0;
   initial scan_id = 0;
   //-----------------------------------------
   //  Scan Chain Registers and Tasks
   //-----------------------------------------

   // Scan Registers and Initializations
   
`define SCAN_CHAIN_LENGTH 87

   reg [1-1:0] static_wen;
   reg [1-1:0] static_wen_read;
   initial static_wen      = 1'd0;
   initial static_wen_read = 1'd0;
   reg [1-1:0] static_ren;
   reg [1-1:0] static_ren_read;
   initial static_ren      = 1'd0;
   initial static_ren_read = 1'd0;
   reg [20-1:0] static_addr;
   reg [20-1:0] static_addr_read;
   initial static_addr      = 20'd0;
   initial static_addr_read = 20'd0;
   reg [32-1:0] static_wdata;
   reg [32-1:0] static_wdata_read;
   initial static_wdata      = 32'd0;
   initial static_wdata_read = 32'd0;
   reg [32-1:0] static_rdata;
   reg [32-1:0] static_rdata_read;
   initial static_rdata      = 32'd0;
   initial static_rdata_read = 32'd0;
   reg [1-1:0] static_ready;
   reg [1-1:0] static_ready_read;
   initial static_ready      = 1'd0;
   initial static_ready_read = 1'd0;
   // Scan chain tasks
   
   task load_chip;
      begin
         `SCAN_DELAY scan_load_chip = 1;
         `SCAN_DELAY scan_load_chip = 0;
         `SCAN_DELAY;
         `SCAN_DELAY;
         `SCAN_DELAY;
      end
   endtask

   task load_chain;
      begin
         `SCAN_DELAY scan_load_chain = 1;
         `SCAN_DELAY scan_phi = 1;
         `SCAN_DELAY scan_phi = 0;
         `SCAN_DELAY scan_phi_bar = 1;
         `SCAN_DELAY scan_phi_bar = 0;
         `SCAN_DELAY scan_load_chain = 0;
         `SCAN_DELAY;
         `SCAN_DELAY;
         `SCAN_DELAY;
         `SCAN_DELAY;
      end
   endtask

   task rotate_chain;
      
      integer i;
      
      reg [`SCAN_CHAIN_LENGTH-1:0] data_in;
      reg [`SCAN_CHAIN_LENGTH-1:0] data_out;
      
      begin
         data_in[0:0] = static_wen;
         data_in[1:1] = static_ren;
         data_in[21:2] = static_addr;
         data_in[53:22] = static_wdata;
         data_in[85:54] = static_rdata;
         data_in[86:86] = static_ready;

         for (i = 0; i < `SCAN_CHAIN_LENGTH; i=i+1) begin
            scan_data_in = data_in[0];
            data_out     = {scan_data_out, data_out[`SCAN_CHAIN_LENGTH-1:1]};
            `SCAN_DELAY scan_phi = 1;
            `SCAN_DELAY scan_phi = 0;
            `SCAN_DELAY scan_phi_bar = 1;
            `SCAN_DELAY scan_phi_bar = 0;
            `SCAN_DELAY data_in = data_in >> 1;
         end

         static_wen_read = data_out[0:0];
         static_ren_read = data_out[1:1];
         static_addr_read = data_out[21:2];
         static_wdata_read = data_out[53:22];
         static_rdata_read = data_out[85:54];
         static_ready_read = data_out[86:86];
      end
      
   endtask

   task write_stuff ();
      input [19:0]   addr_in;
      input [31:0]  wdata_in;
      begin
         static_wen = 1;
         static_ren = 0;
         static_addr = addr_in;
         static_wdata = wdata_in;
         static_rdata = 0;
         static_ready = 0;
         rotate_chain();
         load_chip();
         @(negedge clk)
         @(negedge clk)
         @(negedge clk)
         @(negedge clk)
         @(negedge clk)
         scan_id = ~scan_id;
      end 
   endtask
   
   logic dummy;

   task read_stuff ();
      input [19:0]  addr_in; // modify
      begin
         static_wen = 0;
         static_ren = 1;
         static_addr = addr_in;
         static_wdata = 0;
         static_rdata = 0;
         static_ready = 0;
         rotate_chain();
         load_chip();
         repeat(4) begin
         @(negedge clk)
         dummy = 1;
         end
         scan_id = ~scan_id;
         repeat(20) begin
         @(negedge clk)
         dummy = 1;
         end
         load_chain();
         rotate_chain();
      end 
   endtask
  
   initial begin
      #(`RESET_CYCLE*`CLK_CYCLE);
      dummy = 1;
      // write data to sram 
      write_stuff ({2'b00,18'h00001}, 32'h87654321);
      #(10*`CLK_CYCLE)

      // write data to ctr[14], resets core 
      write_stuff ({2'b00,18'h00800}, {17'h0400,15'h0000});
      #(10*`CLK_CYCLE)

      // write data to ctr[15], stops core 
      write_stuff ({2'b00,18'h00800}, {17'h0800,15'h0000});
      #(10*`CLK_CYCLE)

      // write data to ctr[16], starts core 
      write_stuff ({2'b00,18'h00800}, {17'h1000,15'h0000});
      #(10*`CLK_CYCLE)

      // During this time, the core writes status register 

      // read data from register
      read_stuff ({2'b00,18'h00800});
      #(10*`CLK_CYCLE) 

      // read data from sram
      read_stuff ({2'b00,18'h00001});
   end
 
endmodule // tbench	
