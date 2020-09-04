`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof £okaj
// 
// Create Date: 03.09.2020 14:19:30
// Design Name: 
// Module Name: NumberDetector_tb
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


module NumberDetector_tb(

    );
    reg [7:0] text [0:50];
    integer i; 
    
    reg clk, enable;
    reg [7:0] data_in;
    
    wire [7:0] data_out, data_1, data_2; 
    wire long, short;

    wire [11:0] nr, white;
    wire write;
    
    
    
    Comparison cmp_uut(clk, enable, data_in, data_1, is_number, is_white);
    NumberDetector number_dtc_uut(clk, enable, data_1, is_number, is_white, data_2, long, short, is_number_out);
    Saving save_uut(clk, enable, data_2, is_number_out, long, short, data_out, write);
    
    
    always  begin 
            clk = 0;
            #5
            clk = 1;
            #5;
       end
        
       initial begin
            text = "a729 892 561ff729892561gsdf";
            #1
            enable = 1;
            data_in = text[0];
            i = 0;
       end
        
        
       always @(negedge clk) begin 
            i = i + 1;
            if(i <= 49) begin
                data_in = text[i];    
            end
       end
       
       always @(negedge clk) begin
           if(write == 1) begin
               $display("%c", data_out);
           end
       
       end
endmodule
