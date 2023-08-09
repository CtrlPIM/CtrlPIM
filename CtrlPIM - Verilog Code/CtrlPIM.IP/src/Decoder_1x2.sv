`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 17:55:31
// Design Name: 
// Module Name: Decoder_1x2
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


module Decoder_1x2(
input              call , //  4 bits from Control word derived from control memory
output reg  [1:0] decoder, //  Type of uCode operation
input              enable        //  
);

assign decoder = (enable) ? (1 << call) : 2'b0;

endmodule