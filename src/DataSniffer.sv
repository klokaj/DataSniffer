`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof £okaj
// 
// Create Date: 03.09.2020 18:08:15
// Design Name: 
// Module Name: DataSniffer
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


module DataSniffer(
    input wire clk, en,
    input wire [7:0] data_in,
    
    output wire[7:0] data_out,
    output wire write
    );
    
    wire [7:0] data_1, data_2;
    
    
    Comparison cmp_unit (clk, en, data_in, data_1, is_number_1, is_whitespace_1);
    NumberDetector number_detector_unit (clk, en, data_1, is_number_1, is_whitespace_1, data_2, long, short, is_number_2);
    Saving saving_unit (clk, en, data_2, is_number_2, long, short, data_out, write);  
    
    
    
    
    
endmodule
