`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 19:32:58
// Design Name: 
// Module Name: pipeline_tb
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


module pipeline_tb();
reg[7:0]op,A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7;
reg[8:0]R0;
reg[6:0]R1;
reg[5:0]R2;
reg[4:0]R3;
reg[3:0]R4;
reg[2:0]R5;
reg[1:0]R6;
reg R7, clk, reset, LSB, opr;
wire [8:0]Y0,Y1;
wire [8:0]S;
wire [1:0]Q;
reg [16:0]read_data[0:35];
integer i;

always #5 clk = ~clk;

initial 
begin
    $readmemb("input.txt", read_data);
    clk = 1;#10; 
    op=8'b00000001;reset=1;A0=8'b00000000;B0=8'b00000000;A1=8'b00000000;B1=8'b00000000;A2=8'b00000000;B2=8'b00000000;A3=8'b00000000;B3=8'b00000000;A4=8'b00000000;B4=8'b00000000;A5=8'b00000000;B5=8'b00000000;A6=8'b00000000;B6=8'b00000000;{A7,B7,opr}=read_data[0];
    for (i=1;i<36;i=i+1)
    begin
        if(i==8)
            reset = 0;
        else
            reset = 1;
        A0=A1; A1=A2; A2=A3; A3=A4; A4=A5; A5=A6; A6=A7; 
        B0=B1; B1=B2; B2=B3; B3=B4; B4=B5; B5=B6; B6=B7;
        {A7,B7,opr} = read_data[i];
        op = {op[6:0],opr};
        R0={S[8:7],R1[6:0]};R1[6:0]={S[6],R2[5:0]};R2[5:0]={S[5],R3[4:0]};R3[4:0]={S[4],R4[3:0]};R4[3:0]={S[3],R5[2:0]};R5[2:0]={S[2],R6[1:0]};R6[1:0]={S[1],R7};R7=S[0];
        #10;
    end
end
counter uut1(.clk(clk), .reset(reset), .Q(Q));
save_val uut2(.clk(clk), .Q(Q), .R0(R0), .Y0(Y0), .Y1(Y1));
always @(posedge clk)
begin
    if(Q==2)
    begin
        A7 = Y0[8:1];
        B7 = Y1[8:1];
        LSB = Y0[1]^Y1[1];
    end
end
pipeline_add uut4(.clk(clk), .op(op), .Q(Q), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .Y0(Y0[8:1]), .B0(B0), .B1(B1), .B2(B2), .B3(B3), .B4(B4), .B5(B5), .B6(B6), .B7(B7), .Y1(Y1[8:1]), .S(S));
endmodule
