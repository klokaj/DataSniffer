`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH
// Engineer:    Krzysztof Lokaj
// 
// Create Date: 20.09.2020 12:14:04
// Design Name: 
// Module Name: Uart_print
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


module Uart_print(
    input wire uart_rx,
    output wire uart_sample
    );
    parameter BAUD_RATE = 230400;
    
   
   assign uart_sample = sample;
   
reg sample;
int HALF_PERIOD = (1000000000/(2*BAUD_RATE));
//localparam HALF_PERIOD = ((int)(1000000000/(2*BAUD_RATE))) ;
int i = 0;
int ctr = 0;
int data;

initial begin
sample = 0;

end



always @(negedge uart_rx) begin
    #HALF_PERIOD;
    //sample = 1;
    //#10;
    //sample = 0;
    data = 0;
    #HALF_PERIOD;

    for(i = 0; i < 8; i++) begin
        #HALF_PERIOD;
        sample = 1;
        #10;
        sample = 0;
       
        data = data + uart_rx*(2**(i));
  
        #HALF_PERIOD;
    end  
    $write("%c", data); 
    
    ctr = ctr + 1;
    if(ctr == 10)begin
        ctr = 0;
        $write("\n"); 
    end
    
end
   
    
    
    
endmodule
