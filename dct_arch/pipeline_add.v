`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 16:11:02
// Design Name: 
// Module Name: pipeline_add
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

`include "serial_add.v"

module pipeline_add(clk,op,Q,A0,A1,A2,A3,A4,A5,A6,A7,Y0,B0,B1,B2,B3,B4,B5,B6,B7,Y1,S);
    //Pipelined Architecture for the adder block 
    //The pipelining stages correspond to different bit positions (So that the delay in carry generation is not wasted)
    
    input clk;
    input [1:0]Q;
    input [7:0]op,A0,A1,A2,A3,A4,A5,A6,A7,Y0,B0,B1,B2,B3,B4,B5,B6,B7,Y1;
    output reg [8:0]S;
    reg [7:0]b;
    reg a7;
    reg c;
    //This output vector Sum should not be confused by the result 
    //the result is to be read in the specific manner mentioned in the README file
    wire [7:0]Y;
    wire [7:0]st;
//Remove useless wires
serial_add bit1(.clk(clk), .A(a7), .B(b[7]), .st_in(c), .sum(Y[0]), .st(st[0])); 
serial_add bit2(.clk(clk), .A(A6[1]), .B(b[6]), .st_in(st[0]), .sum(Y[1]), .st(st[1])); 
serial_add bit3(.clk(clk), .A(A5[2]), .B(b[5]), .st_in(st[1]), .sum(Y[2]), .st(st[2]));
serial_add bit4(.clk(clk), .A(A4[3]), .B(b[4]), .st_in(st[2]), .sum(Y[3]), .st(st[3]));
serial_add bit5(.clk(clk), .A(A3[4]), .B(b[3]), .st_in(st[3]), .sum(Y[4]), .st(st[4]));
serial_add bit6(.clk(clk), .A(A2[5]), .B(b[2]), .st_in(st[4]), .sum(Y[5]), .st(st[5]));
serial_add bit7(.clk(clk), .A(A1[6]), .B(b[1]), .st_in(st[5]), .sum(Y[6]), .st(st[6]));
serial_add bit8(.clk(clk), .A(A0[7]), .B(b[0]), .st_in(st[6]), .sum(Y[7]), .st(st[7]));

always @(posedge clk)
begin
    //Deciding the operand as per the sign of op
    //For subtraction, the second operand is negated and carry bit is made 1
    if(Q==2)
        a7 = Y0[0];
    else
        a7 = A7[0];
    if(op[0]==1'b1)
    begin
        if(Q==2)
        begin
            b[7] = ~Y1[0];
            c = 1;
        end
        else
        begin
            b[7] = ~B7[0];
            c = 1;
        end
    end
    else
    begin
        if(Q==2)
        begin
            b[7] = Y1[0];
            c = 0;
        end
        else
        begin
            b[7] = B7[0];
            c = 0;
        end
    end
    if(op[1]==1'b1)
        b[6] = ~B6[1];
    else
        b[6] = B6[1];
    if(op[2]==1'b1)
        b[5] = ~B5[2];
    else
        b[5] = B5[2];
    if(op[3]==1'b1)
        b[4] = ~B4[3];
    else
        b[4] = B4[3];
    if(op[4]==1'b1)
        b[3] = ~B3[4];
    else
        b[3] = B3[4];
    if(op[5]==1'b1)
        b[2] = ~B2[5];
    else
        b[2] = B2[5];
    if(op[6]==1'b1)
        b[1] = ~B1[6];
    else
        b[1] = B1[6];
    if(op[7]==1'b1)
        b[0] = ~B0[7];
    else
        b[0] = B0[7];
    S[8:0] = {st[7],Y[7:0]};
    //Carry bit in the final result  
end
endmodule