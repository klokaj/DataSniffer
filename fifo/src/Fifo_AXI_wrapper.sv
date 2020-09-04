`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2020 19:40:29
// Design Name: 
// Module Name: Fifo_AXI_wrapper
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

module Fifo_AXI_wrapper(
input wire  clk, 
input wire wr_en, 
input wire rd_en,
input wire rst,
input wire [63:0] din,
output wire empty, 
output wire full,
output wire [63:0] dout
);
 

    
    fifo_generator_1 AXI_fifo(
     .s_aclk(clk),
     .s_aresetn(rst),
     .s_axi_wdata(din),
     .s_axi_wvalid(wr_en),
     .s_axi_wready(write_ready),
    
     .m_axi_wdata(dout),
     .m_axi_wvalid(read_ready),
     .m_axi_wready(rd_en)
   );
   
assign full  = !write_ready;
assign empty = !read_ready;   
   
endmodule
