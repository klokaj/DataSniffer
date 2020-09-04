`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2020 22:51:26
// Design Name: 
// Module Name: Fifo_Wrapper_tb
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


module Fifo_Wrapper_tb(

    );
    reg clk, wr_en, rd_en, rst;
    reg [63:0] din;
    
    wire [1:0] resp;
    wire empty, full;
    wire [63:0] dout;
        
    
    
    
    
    fifo_generator_1 AXI_fifo(
        .s_aclk(clk),
        .s_aresetn(rst),
        .s_axi_wdata(din),
        .s_axi_wvalid(wr_en),
        .s_axi_wready(write_ready),
       
        .m_axi_wdata(dout),
        .m_axi_wvalid(read_ready),
        .m_axi_wready(rd_en)
      );
    
    
      always begin
          #10; clk <= !clk;   
      end
      
      initial begin
          clk = 0;
          //clk2 = 0;
          wr_en = 0;
          rd_en = 0;
          din = 0;
          rst = 0;
          #1 rst = 1;
      end
      
      integer i = 0;
  
      always @(posedge clk) begin
          wr_en = 1;
          din = i;
          i = i+1;
          
          if(i >= 15)begin
              rd_en = 1;
          end
      end
       
    
    
    
endmodule
