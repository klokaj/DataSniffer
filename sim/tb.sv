`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH
// Engineer:    Krzysztof Lokaj
// 
// Create Date: 06.09.2020 22:43:01
// Design Name: 
// Module Name: mb_fifo_tb
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


module tb();

reg clk_n, clk_p;
wire [7:0] dout;
reg reset, reset_n;

wire uart_rx;
reg uart_tx;

mb_design_wrapper md_uut(
    .diff_clock_rtl_clk_n(clk_n),
    .diff_clock_rtl_clk_p(clk_p),
    .gpio_rtl_tri_io(dout),
    .reset_rtl(reset),
    .reset_rtl_0(reset_n),
    
    .uart_rtl_rxd(uart_tx),
    .uart_rtl_txd(uart_rx)
    );

Uart_print#(.BAUD_RATE(230400)) printer[](uart_rx, uart_sample);


initial
 begin
    uart_tx = 1'b1;
    reset = 1'b1;
    reset_n = 1'b0;
    #10 reset = 1'b0;
    reset_n = 1'b1;
 end

 initial
  begin
    clk_n = 1'b0; //set clk to 0
    clk_p = 1'b1;
  end
  always
  begin
    #5 clk_n = ~clk_n; //toggle clk every 5 time units
    clk_p  = ~clk_p;
  end

endmodule
