`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2021 02:23:57
// Design Name: 
// Module Name: MUX_4x1
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


module MUX_Nbit_4x1#(parameter bus_size = 16)
(
input  [(bus_size-1):0]   a,            // Mux first input
input  [(bus_size-1):0]   b,            // Mux Second input
input  [(bus_size-1):0]   c,            // Mux first input
input  [(bus_size-1):0]   d,            // Mux Second input
input  [1:0]              sel,          // Select input
output [(bus_size-1):0]                mux_out       // Mux output
);

assign mux_out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a); 

endmodule 
