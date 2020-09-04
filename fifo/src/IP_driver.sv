`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2020 15:48:06
// Design Name: 
// Module Name: IP_driver
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


module IP_driver(
    input wire clk, wr_en, rd_en, srst,
    input wire [7:0] din,
    
    output wire empty,
    output wire [7:0] dout
    );
    
 
 fifo_generator_0 my_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty);
 
 
    
endmodule
