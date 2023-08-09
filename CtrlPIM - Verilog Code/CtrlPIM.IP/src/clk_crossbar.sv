`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2021 15:52:28
// Design Name: 
// Module Name: clk_crossbar
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


module clk_crossbar(
    input clk,
    output reg clk_crossbar
    );
    
    
   reg [3:0] counter = 0;
    
    always @(posedge clk)
        begin
        if (counter == 9)
            begin
            clk_crossbar <= 1;
            counter <= 0;
            end
    
        else
            begin       
             clk_crossbar <= 0;
             counter <= counter +1;            
            end        

    end
    
    
    
endmodule
