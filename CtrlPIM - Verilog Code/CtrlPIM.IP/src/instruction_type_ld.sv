`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2021 22:00:35
// Design Name: 
// Module Name: instruction_type_ld
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


module instruction_type_ld(
input   [3:0] CW_type,       //  4 bits from Control word derived from control memory
input   test_jmp_ld,
output reg  [15:0] instr_type   //  Type of uCode operation
    );
   
    assign instr_type = (test_jmp_ld) ? (1 << CW_type) : 8'b0 ;
    
    // instr_type [0] = INIT Type
    // instr_type [1] = V Type    
    // instr_type [2] = VV Type
    // instr_type [3] = I Type
    // instr_type [4] = CMASK Type
    // instr_type [5] = MASK Type    
    // instr_type [6] = TEMP Type
    // instr_type [7] = L/S  Type
    // instr_type [8] = LUI  Type
    // instr_type [9] = PIM_Load Type
    
    
    //Correct
    // instr_type[0] = INIT Type
    // instr_type[1] = CMASK Type.   
    // instr_type[2] = MASK Type.   
    // instr_type[3] = TEMP Type.
    // instr_type[4] = LUI  Type.
    // instr_type[5] = PIM_Load Type    
    // instr_type[6] = L/S  Type. 
    // instr_type[7] = V Type.
    // instr_type[8] = VV Type.
    // instr_type[9] = I Type
    
endmodule
