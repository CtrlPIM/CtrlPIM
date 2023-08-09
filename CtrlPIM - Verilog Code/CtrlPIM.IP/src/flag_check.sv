`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2021 14:25:40
// Design Name: 
// Module Name: flag_check
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


module flag_check(
 input [6:0]   flag,
 input [2:0] flag_sel,
 output eqz
    );
    
    wire mux_out;
    
    assign eqz = (mux_out==0) ? 1:0 ;
    
   
    
    Flag_MUX INST1
(
.flag(flag),   
.sel(flag_sel),    
.mux_out(mux_out)
);  

    
endmodule
