`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2021 14:55:49
// Design Name: 
// Module Name: mov_Decoder
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


module mov_Decoder(
input  wire [3:0]  mov_dest_bin   , //  4 bits from Control word derived from control memory
output reg  [15:0] mov_dest_decoder_out , //  Type of uCode operation
input  wire        enable        //  Control Operation = 0, PIM Operation = 1 
);

assign decoder_out = (enable) ? (1 << mov_dest_bin) : 16'b0 ;

endmodule