`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 14:46:38
// Design Name: 
// Module Name: MUX_8x1
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


module Flag_MUX 
(
input       [6:0]              flag,   
input       [2:0]              sel,         // Select input
output reg                     mux_out     // Mux output
);  

    
always@(*)
MUX : begin
 case (sel)
    3'b000 : mux_out = flag[0];
    3'b001 : mux_out = flag[1];
    3'b010 : mux_out = flag[2];
    3'b011 : mux_out = flag[3];
    3'b100 : mux_out = flag[4];
    3'b101 : mux_out = flag[5];
    3'b110 : mux_out = flag[6];
    3'b111 : mux_out = 1;
 endcase 
end 





endmodule