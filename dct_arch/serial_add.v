`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 17:36:30
// Design Name: 
// Module Name: serial_add
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


module serial_add(clk,A,B,st_in,sum,st);
    //Serial Adder based on the concept of Mealy Machine 

    input clk,A,B,st_in;
    output reg sum,st;
    parameter C0=0,C1=1;
    //The two states represented by C0 and C1 show the carry state of 0 and 1
            
    always @(negedge clk)       
    begin
        case(st_in)
        //Filled according to the FSM design (State transitions)
           C0:if((A==0)&(B==0))
              begin
                st = C0;
                sum = 0;
              end
              else if((A==0)&(B==1))
              begin
                st = C0;
                sum = 1;
              end
              else if((A==1)&(B==0))
              begin
                st = C0;
                sum = 1;
              end
              else if((A==1)&(B==1))
              begin
                st = C1;
                sum = 0;
              end
           C1:if((A==0)&(B==0))
              begin
                st = C0;
                sum = 1;
              end
              else if((A==0)&(B==1))
              begin
                st = C1;
                sum = 0;
              end
              else if((A==1)&(B==0))
              begin
                st = C1;
                sum = 0;
              end
              else if((A==1)&(B==1))
              begin
                st = C1;
                sum = 1;
              end
        endcase      
    end
endmodule
