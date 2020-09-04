`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof Lokaj
// 
// Create Date: 03.09.2020 17:17:18
// Design Name: 
// Module Name: Saving
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


module Saving(
    input wire clk, en,
    input wire [7:0] data_in,
    input wire is_number,
    input wire long, short,
    
    output reg [7:0] data_out,
    output reg write
    );
    
    localparam IDLE =  1'b0, SAVING = 1'b1;
    reg state, state_nxt; 
    reg [7:0] data_nxt; 
    reg [3:0] delay, delay_nxt; 
    reg wr; 
    
    //assign write = wr; 
    
    always @(posedge clk) begin
        if(en == 1)begin
            state <= state_nxt;
            delay <= delay_nxt;
            data_out <= data_nxt;
            write <= wr;
        end
    end
    
    always @* begin
        case(state)
            IDLE: begin
                if(long | short) begin
                    state_nxt = SAVING;
                    wr = 1;
                end
                else begin 
                    wr = 0;
                end
                data_nxt = data_in;
                delay_nxt = 0;
            end 
            SAVING: begin
                if(delay == 8) begin
                    state_nxt = IDLE;
                    data_nxt = " ";
                    wr = 1;
                end else
                if(is_number) begin
                    data_nxt = data_in;
                    delay_nxt = delay + 1; 
                    wr = 1;
                end
                else begin
                    wr = 0;
                    delay_nxt = delay;
                    data_nxt = data_in;
                end
            end 
            default: begin
                state_nxt = IDLE;
                data_nxt = data_in;
                wr = 0;
            end
        endcase
    end
    
    
endmodule
