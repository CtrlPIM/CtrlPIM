`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2021 12:51:28
// Design Name: 
// Module Name: start_load
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


module start_load(
    input clk,
    output reg start_Load
    );
    
    localparam CLK0 = 1'b0;
    //           CLK1 = 1'b1;

 reg state;



always @(negedge clk)
//always @(posedge clk)
   begin
   start_Load <=1;
   state <=CLK0;
              case(state)
                CLK0:
                begin 
       start_Load <=0;
       state <=CLK0;     
                end 
  
            endcase
   end
   endmodule