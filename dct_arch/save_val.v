`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2020 13:15:51
// Design Name: 
// Module Name: save_val
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


module save_val(clk,Q,R0,Y0,Y1);
    input clk;
    input [1:0]Q;
    input [8:0]R0;
    output reg [8:0]Y0,Y1;
    always @(posedge clk)
    begin
        if(Q==0)
            Y0 = R0;
        else
        begin
            if(Q==1)
                Y1 = R0;
        end
    end
endmodule
