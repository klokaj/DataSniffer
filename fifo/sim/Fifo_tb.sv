`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2020 16:29:31
// Design Name: 
// Module Name: Fifo_tb
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


module Fifo_tb(

    );
    
    reg clk, wr_en, rd_en, srst;
    reg [63:0] din;
    
    wire [1:0] resp;
    wire empty, full;
    wire [63:0] dout;
        
    AxiFIFO_to_NativeFIFO fifo_uut(clk, wr_en, rd_en, srst, din, empty, full, dout);
    //Axi_Fifo_wrapper_2 fifo_uut(clk, wr_en, rd_en, srst, din, empty, full, dout);
    //Fifo_AXI_wrapper fifo_uut(clk, wr_en, rd_en, srst, din, empty, full, dout, resp);
   // IP_driver fifo_uut(clk, wr_en, rd_en, srst, din, empty, dout);
    
 
    
    always begin
        #10; clk <= !clk;   
    end
    
    initial begin
        clk = 0;
        //clk2 = 0;
        wr_en = 0;
        rd_en = 0;
        din = 0;
        srst = 0;
        #1 srst = 1;
    end
    
    integer i = 0;
    integer state = 0;
    
//    always @(posedge clk) begin
//        if(state == 0) begin
             
//             wr_en = 1;
//             din = i;
//             i = i + 1;
//             if( i == 25) begin
//                state = 1;       
//                wr_en = 0;
//                rd_en = 1;
//             end   
//        end
//        else begin
            
//            if(empty == 0) begin
//                $display("%d", dout);
//            end 
            
//            if(rd_en == 1 & empty == 1) begin
//                $display("%d error", dout);
//                rd_en = 0;
//            end 
    
//        end
//    end
    
    always @(posedge clk) begin
        wr_en = 1;
        din = i;
        i = i+1;
        
        if(i >= 20)begin
            rd_en = 1;
        end
    end
    
endmodule
