`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2020 13:04:28
// Design Name: 
// Module Name: counter
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


module counter(clk,reset,Q);
    input clk, reset;
    output reg [1:0]Q;
    always @(negedge clk)
    begin
        if(reset==0)
            Q <= 0;
        else
        begin
            if(Q==2)
                Q = 0;
            else
                Q <= Q+1;
        end
    end
endmodule
