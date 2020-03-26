`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 11:10:56
// Design Name: 
// Module Name: serial_tb
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


module serial_tb();
    reg clk, reset, A, B, st_in;
    wire S, st;
    always #5 clk = ~clk;
    initial 
    begin
         clk = 1; reset = 1; #5;
         reset = 0; #5;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 0; B = 1; st_in = st; #10;
         reset = 1; A = 1; B = 1; st_in = st; #5;
         reset = 0; #5;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 1; B = 0; st_in = st; #10;
         reset = 1; A = 0; B = 1; st_in = st; #5;
         reset = 0; #5;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 1; B = 1; st_in = st; #10;
         reset = 1; A = 0; B = 0; st_in = st; #10;
         reset = 1; A = 0; B = 1; st_in = st; #10;
    end 
    serial_add uut(.clk(clk), .reset(reset), .A(A), .B(B), .st_in(st_in), .sum(S), .st(st));
endmodule
