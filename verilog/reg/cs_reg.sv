// control and status registers
module cs_reg (
    input             clk,
    input             rst_n,
    input             reg_wen,
    input             reg_ren,

    // control register
    input      [16:0] cr_wdata,
    output     reg [16:0] cr,
    output     reg [16:0] cr_rdata,

    // status register (read only for scan chain)
    input      [14:0] sr_wdata_core,
    output     reg [14:0] sr,
    output     reg [14:0] sr_rdata,

    // Handshake bit for read 
    output     reg        reg_ready
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cr         <= 17'h0;
            sr         <= 15'h0;
            cr_rdata   <= 17'h0;
            sr_rdata   <= 15'h0;
            reg_ready   <= 0;
            end 
        else begin
                if (reg_wen) 
                    begin
                    cr        <= cr_wdata;
                    reg_ready <= 0;
                    end 
                else begin 
                     if (reg_ren) 
                          begin
                          cr_rdata <= cr;
                          sr_rdata <= sr;
                          reg_ready  <= 1;
                          end  
                     else begin
                          cr_rdata <= 0;
                          sr_rdata <= 0;
                          reg_ready  <= 0;
                     end
                     end
                sr <= sr_wdata_core;
              end
    end

endmodule
