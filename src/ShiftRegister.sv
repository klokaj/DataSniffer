`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2020 13:21:53
// Design Name: 
// Module Name: ShiftRegister
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


module ShiftRegister(
    input wire clk, en,
    input wire [7:0] data_in, 
    input wire is_number, is_white, 

    output wire [7:0] data_out,
    output wire [11:0] is_number_out,
    output wire [11:0] is_white_out
    );
    
    
    wire [7:0] data_1, data_2, data_3, data_4, data_5, data_6, data_7, data_8, data_9, data_10, data_11;
    ShiftRegisterElem Shift_0(clk, en, data_in, is_number, is_white, data_1, is_number_out[0], is_white_out[0]);
    ShiftRegisterElem Shift_1(clk, en, data_1, is_number_out[0], is_white_out[0], data_2, is_number_out[1], is_white_out[1]);
    ShiftRegisterElem Shift_2(clk, en, data_2, is_number_out[1], is_white_out[1], data_3, is_number_out[2], is_white_out[2]);
    ShiftRegisterElem Shift_3(clk, en, data_3, is_number_out[2], is_white_out[2], data_4, is_number_out[3], is_white_out[3]);
    ShiftRegisterElem Shift_4(clk, en, data_4, is_number_out[3], is_white_out[3], data_5, is_number_out[4], is_white_out[4]);
    ShiftRegisterElem Shift_5(clk, en, data_5, is_number_out[4], is_white_out[4], data_6, is_number_out[5], is_white_out[5]);
    ShiftRegisterElem Shift_6(clk, en, data_6, is_number_out[5], is_white_out[5], data_7, is_number_out[6], is_white_out[6]);
    ShiftRegisterElem Shift_7(clk, en, data_7, is_number_out[6], is_white_out[6], data_8, is_number_out[7], is_white_out[7]);
    ShiftRegisterElem Shift_8(clk, en, data_8, is_number_out[7], is_white_out[7], data_9, is_number_out[8], is_white_out[8]);
    ShiftRegisterElem Shift_9(clk, en, data_9, is_number_out[8], is_white_out[8], data_10, is_number_out[9], is_white_out[9]);
    ShiftRegisterElem Shift_10(clk, en, data_10, is_number_out[9], is_white_out[9], data_11, is_number_out[10], is_white_out[10]);
    ShiftRegisterElem Shift_11(clk, en, data_11, is_number_out[10], is_white_out[10], data_out, is_number_out[11], is_white_out[11]);
    
    
    
    
endmodule
