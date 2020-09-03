`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2020 13:37:54
// Design Name: 
// Module Name: NumberDetector
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


module NumberDetector(
    input wire clk, en,
    input wire [7:0] data_in,
    input wire is_number_in, is_white_in,
    
    output wire [7:0] data_out, 
    output wire long, short,
    output wire is_number_o
    //output wire [11:0] is_number_out, is_white_out
    );
    
    
    wire [11:0] is_number_out, is_white_out;
 
   assign is_number_o = is_number_out[11];
    
    ShiftRegister shift(clk, en, data_in, is_number_in, is_white_in, data_out, is_number_out, is_white_out);
    
    assign short = !is_number_out[2] & ( is_number_out[3] & is_number_out[4] & is_number_out[5] & is_number_out[6]
        & is_number_out[7] & is_number_out[8] & is_number_out[9] & is_number_out[10] & is_number_out[11]);
    
    
    assign long =  (!is_number_out[0] & is_number_out[1] & is_number_out[2] & is_number_out[3] &
                    is_white_out[4] & is_number_out[5] & is_number_out[6] & is_number_out[7]  &
                    is_white_out[8] & is_number_out[9] &  & is_number_out[10] & is_number_out[11]);  
    //assign  short = (is_number_out == 12'b111xxxxxxxxx);
    //assign short = (is_number_out == 12'b1111111110xx);
    //assign long = (is_number_out == 12'b111011101110) & (is_white_out == 12'b00010001000x);
    
    
    
    
endmodule
