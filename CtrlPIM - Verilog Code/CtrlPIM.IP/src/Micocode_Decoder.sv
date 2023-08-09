`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2021 00:07:45
// Design Name: 
// Module Name: uCode_Decoder
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


module uCode_Decoder(
input  wire [3:0]  CW_opcode   , //  4 bits from Control word derived from control memory
output reg  [15:0] decoder_out , //  Type of uCode operation
input  wire        enable        //  Control Operation = 0, PIM Operation = 1 
);

assign decoder_out = (enable) ? (1 << CW_opcode) : 16'b0 ;

endmodule