`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2021 14:25:11
// Design Name: 
// Module Name: jump_ld_address
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


module jump_ld_address(
input [3:0] opcode,
input [3:0] function4bit,
input [4:0] function5bit,
output reg [15:0] jump_ld_address
    );
    
        always @(opcode, function4bit, function5bit)
        begin 
                if(opcode == 4'b0110)              
                   begin
                        jump_ld_address <= (16'b0000000000000110+function4bit);
                   end
                else if(opcode == 4'b0111)  
                   begin
                        jump_ld_address <= (16'b0000000000100110+function4bit);
                   end  
                else if(opcode == 4'b1000)  
                   begin
                        jump_ld_address <= (16'b0000000000110110+function5bit);
                   end  
                else if(opcode == 4'b1001)  
                   begin
                        jump_ld_address <= (16'b0000000001010110+function5bit);
                   end    
                else 
                   begin
                        jump_ld_address <= {10'b0,opcode};
                   end                     
        end
endmodule
    

