`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2020 22:09:17
// Design Name: 
// Module Name: Axi_Fifo_wrapper_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Axi_Fifo_wrapper_2(
input wire  clk, 
input wire wr_en, 
input wire rd_en,
input wire srst,
input wire [63:0] din,
output wire empty, 
output wire full,
output wire [63:0] dout

    );
 


  
   
  
  

  
   reg [7:0] wstrb;
   
   initial begin 
    wstrb = 8'b11111111;
    end;
  
  
  
  
  AXI_Fifo fifo(
   .s_aclk(clk), 
   .s_aresetn(arst), 
   
   .s_axi_wdata(s_axi_wdata),
   .s_axi_wvalid(wr_en),
   .s_axi_wready(n_full),
   .s_axi_wstrb(wstrb),
   
   
   
   .m_axi_wdata(dout),
   .m_axi_rvalid(rd_en),
   .m_axi_rready(n_empty)
   );
   
   
   assign full = !n_full;
   assign empty = !n_empty;
   
   
   
endmodule
