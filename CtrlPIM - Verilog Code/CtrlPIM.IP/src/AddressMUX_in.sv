`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 17:05:48
// Design Name: 
// Module Name: AddressMUX_in
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


module AddressMUX_in(
    output reg      S0,
    output reg      S1,
    input           eqz,
    input [15:0]    D,
    input           start_load,
    input           next_instr
    );
    
    assign S1 = (D[8]||start_load);
    assign S0 = (D[13]|| D[12]||D[11]||(D[10]&&(eqz))||(D[9]&&(!eqz))||start_load || next_instr);
    
endmodule
