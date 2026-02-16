/*

   Delay 1 single port RAM
   read takes 1 cycle
   write takes 1 cycle
   Revisions:
      10/08/21: First created
      10/12/21: 
         usually SRAMS are not reset
         for APR purposes, reset's existence is better
*/

module spram 
#( parameter  WIDTH = 32,
   parameter  SIZE = 2048 
)
(
   input                          clk,
   input                          rst_n,
   input                          cen, 
   input                          wen,
   input                          ren,
   input  [10:0]                  addr,
   input  [WIDTH - 1 : 0]         wdata,
   input  [1:0]                   seg_id, 
   input                          id_sel, 
   output logic [WIDTH - 1 : 0]   rdata,
   output logic                   ready
);

  logic dmem_ren, dmem_wen, imem_ren, imem_wen;
  logic [14:0] imem_addr, dmem_addr; 
  logic [WIDTH - 1 : 0] imem_wdata, imem_rdata, dmem_wdata, dmem_rdata;
  logic [127:0] dmem_bweb; 

  TS1N65LPLL1024X16M16 imem( // imem instantiation
    .BIST(1'b0),
    .AWT(1'b0), // asynchronous write through
    .CLK(clk),
    .CEB(!cen),
    .WEB(!imem_wen), 
    .A(imem_addr), // address input 
    .D(imem_wdata), // data input 
    .BWEB(1'b0), // bit write enable 
    .CEBM('0),
    .WEBM('0),
    .AM('0),
    .DM('0),
    .BWEBM('0),
    .Q(imem_rdata), // output data 
    .TSEL(2'b01) // read margin
  ); 

  TS1N65LPLL2048X128M4 dmem( // dmem insantiation
    .BIST(1'b0),
    .AWT(1'b0), 
    .CLK(clk),
    .CEB(!cen), 
    .WEB(!dmem_wen)
    .A(dmem_addr),
    .D(), // todo: figure out how to write in correct data in correct place
    .BWEB(1'b1);
    .CEBM('0),
    .WEBM('0),
    .AM('0),
    .DM('0),
    .BWEBM('0),
    .Q(dmem_rdata),
    .TSEL(2'b01)
  ); 
 
   // SRAM write 
  always_comb begin 
    dmem_ren = id_sel ? ren : 1'b0;
    dmem_wen = id_sel ? wen : 1'b0; 
    imem_ren = !id_sel ? ren : 1'b0;
    imem_wen = !id_sel ? wen : 1'b0; 
  end 

  always_comb begin  
    imem_addr = !id_sel ? addr : '0; 
    dmem_addr = id_sel ? addr : '0; 
    imem_wdata = !id_sel ? wdata : '0; 
    dmem_wdata = id_sel ? wdata : '0; // dmem_wdata needs to select segments
  end 


  always_comb begin // dmem select logic 
    case(seg_id) 
        2'b00: begin 
          dmem_bweb = 8'h00111111; 
        end 

        2'b01: begin 
          dmem_bweb = 8'h11001111;
        end 

        2'b10: begin 
          dmem_bweb = 8'h00110011;          
        end 

        2'b11: begin  
          dmem_bweb = 8'h11111100;          
        end 
        
        default: begin 
          dmem_bweb = 8'h11111111;
        end 
    endcase
  end 


  always_comb begin 
    if(ren) begin 
      if(id_sel) begin 
        rdata = dmem_rdata; // dmem
      end else begin 
        rdata = imem_rdata; // imem
      end 
    end else begin 
      rdata = '0; 
    end 
  end 





endmodule 
