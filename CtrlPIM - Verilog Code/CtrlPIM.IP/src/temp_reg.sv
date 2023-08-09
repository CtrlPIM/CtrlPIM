`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2021 13:57:45
// Design Name: 
// Module Name: temp_reg
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


module temp_reg #(parameter N = 10)
(   input       [N-1:0]   D,
    input       [N-1:0]   MOV_in,
    input                 clk,
    input                 PIM_load,
    input                 Mov_load,
    output reg  [N-1:0]   Q);  
     
 
 always @(posedge clk)
 begin      
          if (PIM_load) 
              begin       
                 Q <=  D; 
              end
          else if(Mov_load)
              begin
                 Q <= MOV_in;
              end
          else 
              begin
                 Q <= Q;
              end   
        end      
 endmodule 