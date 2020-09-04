`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof Lokaj
// 
// Create Date: 03.09.2020 12:56:44
// Design Name: 
// Module Name: Comparison
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


module Comparison(
    input wire clk,
    input wire en,
    input wire [7:0] data_in,

    output reg [7:0] data_out,
    output reg is_number, 
    output reg is_white
);


reg is_number_nxt;
reg is_white_nxt; 

initial begin
    is_white = 0;
    is_number = 0;
    data_out = 0;
end


always @(posedge clk) begin
    if(en == 1) begin
        data_out <= data_in;
        is_number <= is_number_nxt;
        is_white <= is_white_nxt; 
    end    
end

always @* begin
    is_number_nxt = 0;
    is_white_nxt = 0;
    if(data_in >= 48 & data_in <= 57) begin
        is_number_nxt = 1;
    end
    
    if(data_in == " " | data_in == "-") begin
        is_white_nxt = 1;
    end
end

endmodule
