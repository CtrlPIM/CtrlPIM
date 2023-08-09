`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2021 15:52:54
// Design Name: 
// Module Name: crossbarvec_bit
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


module crossbarvec_bit #(parameter num_crossbar = 1024, src_size = 10)(
    input clock,
    input [(num_crossbar -1):0] bitline,
    input [(src_size -1):0] C_start,
    input [(src_size -1):0] C_end,
    output reg crossbar_bit
    );

               
 always @(posedge clock)
  begin
    
    if (bitline <= C_end && bitline >= C_start )
                          begin
                          crossbar_bit <= 1'b1;        
                          end
    else 
                          begin
                          crossbar_bit <= 1'b0;     
                          end     
    end
  
endmodule
