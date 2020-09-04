`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof Lokaj
// 
// Create Date: 03.09.2020 13:16:58
// Design Name: 
// Module Name: ShiftRegisterElem
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


module ShiftRegisterElem(
    input wire clk, en, 
    input wire [7:0] data_in,
    input wire is_number_in, is_white_in,
    
    output reg [7:0] data_out, 
    output reg is_number_out, is_white_out
    );
    
    always @(posedge clk) begin
        if(en == 1) begin
            data_out <= data_in;
            is_number_out <= is_number_in;
            is_white_out <= is_white_in;
        end
    end
    
    
endmodule
