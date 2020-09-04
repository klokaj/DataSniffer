`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     AGH-UST
// Engineer:    Krzysztof £okaj 
// 
// Create Date: 03.09.2020 18:15:11
// Design Name: 
// Module Name: DataSniffer_tb
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


module DataSniffer_tb(

    );

reg [7:0] text [0:50];
integer i; 

reg clk, enable;
reg [7:0] data_in;

wire [7:0] data_out;
wire write;

DataSniffer dut(clk, enable, data_in, data_out, write);

always  begin 
    clk = 0;
    #5
    clk = 1;
    #5;
end

initial begin
    text = "a729 992 561ff729892561gsdf";           //Input String
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
       if(data_out == " ") begin
           $display("%c", data_out);
        end
       else begin
            $write("%c", data_out);
        end
   end

end  
    
    

endmodule
