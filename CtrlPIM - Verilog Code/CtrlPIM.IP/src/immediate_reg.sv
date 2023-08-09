`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2021 18:52:22
// Design Name: 
// Module Name: immediate_reg
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


module immediate_reg #(parameter N = 25)
(   input       [N-1:0]   D,
    input                 clk,
    input                 PIM_load,
    input                 Update_load,
    output reg  [N-1:0]   Q );  
     
 
 always @(posedge clk)
 begin      
          if (PIM_load) 
              begin       
                 Q <= D; 
              end
          else if(Update_load)
              begin
                 Q <= Q>>1;
              end
          else 
              begin
                 Q <= Q;
              end   
              
              end
 endmodule 
