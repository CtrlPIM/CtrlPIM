`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2021 17:12:37
// Design Name: 
// Module Name: crossbar_reg
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


module crossbar_reg #(parameter N = 10)
(   input       [N-1:0]   D,
    input                 clk,
    input                 PIM_load,
    output reg  [N-1:0]   Q);  
     
 
 always @(posedge clk)
 begin      
          if (PIM_load) 
              begin       
                 Q <=  D; 
              end
          else 
              begin
                 Q <= Q;
              end   
        end      
 endmodule 