`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof £okaj
// 
// Create Date: 03.09.2020 13:38:32
// Design Name: 
// Module Name: Cmp_ShiftReg_tb
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


module Cmp_ShiftReg_tb(

    );
    
    
   reg [7:0] text [50:0];
   reg [7:0] data_in, data_out, data_i;
   reg enable, clk;
   
   wire [11:0] is_number_out, is_white_out;
   integer i;
   
   Comparison cmp_uut(clk, enable, data_in, data_i, is_number, is_white); 
   ShiftRegister shiftreg_uut(clk, enable, data_i, is_number, is_white, data_out, is_number_out, is_white_out); 

   always  begin 
        clk = 0;
        #5
        clk = 1;
        #5;
   end
    
   initial begin
        text = "pp2p 1h3c  traas20-02540kkkk";
        #1
        enable = 1;
        data_in = text[0];
        i = 0;
   end
    
    
   always @(negedge clk) begin 
        i = i + 1;
        if(i <= 25) begin
            data_in = text[i];    
        end
   end
endmodule
