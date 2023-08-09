`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2021 11:40:17
// Design Name: 
// Module Name: ubr_update
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


module ubr_update(
    input ubr_set,
    input [4:0] CW,          //CW[9:5]
  //  input clk,         
    output reg ubr_src1,
    output reg ubr_src2,
    output reg ubr_iw1,
    output reg ubr_iw2,
    output reg ubr_dest
    );
    
    always @(ubr_set)
        begin 
               if(ubr_set)                
                   begin
                         ubr_dest   <= CW[0];
                         ubr_src1   <= CW[1];
                         ubr_src2   <= CW[2];
                         ubr_iw1    <= CW[3];
                         ubr_iw2    <= CW[4];
                   end
                else
                    begin
                         ubr_dest   <= 0;
                         ubr_src1   <= 0;
                         ubr_src2   <= 0;
                         ubr_iw1    <= 0;
                         ubr_iw2    <= 0;
                    end               
         end
    
    
    
endmodule
