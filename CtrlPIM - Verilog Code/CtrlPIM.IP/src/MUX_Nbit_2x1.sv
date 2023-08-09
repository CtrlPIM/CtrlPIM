`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2021 01:56:22
// Design Name: 
// Module Name: MUX_2x1
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


module MUX_Nbit_2x1 #(parameter bus_size = 6)
(
input       [(bus_size-1):0]   a,    // Mux first input
input       [(bus_size-1):0]   b,    // Mux Second input
input                          sel,    // Select input
output reg  [(bus_size-1):0]   mux_out     // Mux output
);  

assign mux_out = (sel ? b : a); 

endmodule 