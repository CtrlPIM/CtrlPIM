`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2021 02:58:12
// Design Name: 
// Module Name: Address_Sequencing
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


module Address_Sequencing #(parameter ctrl_memory_size = 16,DEPTH = 65535,  stack_depth = 4)(opcode,CW,uCode_Addr,branch_type,mux_addr,load_ret_addr,clk,function4bit,function5bit,stack_empty,stack_push,stack_pop);
//module Address_Sequencing #(parameter ctrl_memory_size = 16,DEPTH = 65535)(opcode,CW,uCode_Addr,load_ret_addr);


  input [3:0] opcode;
  input [1:0] uCode_Addr;
  input       branch_type;
  input load_ret_addr;
  input [3:0] function4bit;
  input [4:0] function5bit;
  input stack_push;
  input stack_pop;
  input [31:0] CW;
  output reg [15:0] mux_addr;
 // output reg [31:0] CW;
  output stack_empty;
  input clk;
  reg [15:0] mux_out;
  reg [15:0] mux_incremented;
  reg [15:0] routine_out;
  reg [15:0] jump_ld_address;
  reg [15:0] branch_addr;
  reg [15:0] out_buf;
  
  
  
  
always @(posedge clk)
    begin              
             mux_incremented <= mux_addr +1; 
             mux_out <= mux_addr;   
    end
  
  
   MUX_Nbit_4x1#(ctrl_memory_size) INST1
(
.a(mux_incremented),            
.b((CW[31:16])),         
.c(routine_out),           
.d(jump_ld_address),           
.sel(uCode_Addr),         
.mux_out(mux_addr)      
);
  
/* Control_Memory_wrapper INST3
   (.clka_0(clk),
    .addra_0(mux_addr),
    .douta_0(CW));  */
    
    
  jump_ld_address       INST4(
        .opcode(opcode[3:0]),
        .function4bit(function4bit),
        .function5bit(function5bit),
        .jump_ld_address(jump_ld_address)
    );
    
    
ret_addr_Stack #(ctrl_memory_size, stack_depth)
INST5(
        .clk(clk),
        .reset((&uCode_Addr)),
        .q(routine_out),
        .d(mux_incremented),
        .push(stack_push),
        .pop(stack_pop),
    //    .full(),                  //needs to be addressed
        .empty(stack_empty)
    );  
    
    



endmodule 