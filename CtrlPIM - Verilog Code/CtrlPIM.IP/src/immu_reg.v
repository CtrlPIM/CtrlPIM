`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2022 23:47:37
// Design Name: 
// Module Name: immu_reg
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


module immu_reg #(parameter N = 38)
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
