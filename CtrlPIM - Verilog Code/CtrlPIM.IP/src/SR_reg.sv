`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2021 13:11:23
// Design Name: 
// Module Name: SR_reg
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


module SR_reg #(parameter N = 10)
(  
    input       [N-1:0]   MOV_in,
    input                 clk,

    input                 Mov_load,
    output reg  [N-1:0]   Q);  
     
 
 always @(posedge clk)
 begin      

          if(Mov_load)
              begin
                 Q <= MOV_in;
              end
          else 
              begin
                 Q <= Q;
              end   
              
              end
 endmodule 