`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2020 17:28:32
// Design Name: 
// Module Name: Saving_tb
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


module Saving_tb(

    );
    
    reg [7:0] text [50:0];
    reg [7:0] data_in, data_out;
    reg enable, clk, short, long, ;
     
    integer i;
    
    Saving saving_uut(clk, enable, data_in, long, short, is_number, data_out, write);
    
    
 
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
    
    always @(negedge clk) begin
        if(write == 1) begin
            $display("%c", data_out);
        end
    
    end
    
    
    
endmodule
