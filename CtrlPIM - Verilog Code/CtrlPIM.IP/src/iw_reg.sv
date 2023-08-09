`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2021 15:41:42
// Design Name: 
// Module Name: Nbit_Register_wload
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


module iw_reg #(parameter N = 6)
(   input       [N-1:0]   D,
    input       [N-1:0]   MOV_in,
    input                 clk,
    input                 PIM_load,
    input                 Update_load,
    input                 Mov_load,
    output reg  [N-1:0]   Q);  
     
 
 always @(posedge clk)
 begin      
          if (PIM_load) 
              begin       
                 Q <= D; 
              end
          else if(Update_load)
              begin
                 Q <= Q-1;
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

