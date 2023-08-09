`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2021 19:54:38
// Design Name: 
// Module Name: Flag_Registers
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


module Flag_Registers(
    output reg  [6:0]   flag,
    input               Col,
    input               Ziw1,
    input               Ziw2,
    input               Zimm,
    input               Co,
    input               Call,
    input               Sign,
    input               clk,
    input               flush
    );
    
 //   always @(posedge clk)
    always @(*)
    
    if(flush == 1)
    begin 
        flag <= 7'b0000000;
    end
    else
        begin 
         flag[0]       <= Col;
         flag[1]       <= Ziw1;
         flag[2]       <= Ziw2;
         flag[3]       <= Zimm;
         flag[4]       <= Co;
         flag[5]       <= Call;
         flag[6]       <= Sign;
         end
    
    
endmodule
