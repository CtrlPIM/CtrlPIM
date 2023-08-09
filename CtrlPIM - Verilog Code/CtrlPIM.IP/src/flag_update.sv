`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2021 12:14:38
// Design Name: 
// Module Name: flag_update
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


module flag_update(
                   input        col_PIM,
                   input  [5:0] iw1, 
                   input  [5:0] iw2,
                   input        imm_in,
                   input        Co_PIM,
                //   input [5:0]  opcode,
                   input call_mux,
                   input sign_PIM,
                   
                     output reg              Col,
                     output reg              Ziw1,
                     output reg              Ziw2,
                     output reg              Zimm,
                     output reg              Co,
                     output reg              Call,
                     output reg              Sign        
    );
    
    

  assign       Col        = col_PIM;
  assign       Ziw1       = (iw1>0) ? (1) : (0); 
  assign       Ziw2       = (iw2>0) ? (1) : (0);
  assign       Zimm       = imm_in;
  assign       Co         = Co_PIM;
  assign       Call       = call_mux;
  assign       Sign       = sign_PIM;
  
 
    
    
    
    
endmodule
