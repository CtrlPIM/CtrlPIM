`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2021 12:21:48
// Design Name: 
// Module Name: memory_addressing
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


module memory_addressing #(parameter address_size_memory = 10)(
            
            input [9:0]     dest_base,
            input [9:0]     src1_base,
            input [9:0]     src2_base,
            input [9:0]     temp_start,
            input           dest_sel,
            input [1:0]     src1_sel,
            input [1:0]     src2_sel,
            input           clk,
            input           reset,
            input           read,
            //  input CW_LSB,
            input  [31:0]   CW,
           
            output [9:0]    dest_addr,
            output [9:0]    src1_addr,
            output [9:0]    src2_addr,
            output [1:0]    mem_op,
            output fifo_empty
    );
    
            wire [9:0]    dest_FIFO_in;
            wire [9:0]    src1_FIFO_in;
            wire [9:0]    src2_FIFO_in;
            wire src_1_full,src_2_full,dest_full,mem_op_full;
            wire src_1_empty,src_2_empty,dest_empty,mem_op_empty;   
       
    assign fifo_empty =  src_1_empty && src_2_empty && dest_empty && mem_op_empty;
    

    
      MUX_Nbit_4x1#(address_size_memory) SRC1
(
.a(dest_base),               //dest_base
.b(src1_base),               //src1_base
.c(src2_base),               //src2_base
.d(temp_start),             //temp_start  
.sel(src1_sel),         
.mux_out(src1_FIFO_in)      
);
  
      MUX_Nbit_4x1#(address_size_memory) SRC2
(
.a(dest_base),               //dest_base
.b(src1_base),               //src1_base
.c(src2_base),               //src2_base
.d(temp_start),             //temp_start 
.sel(src2_sel),         
.mux_out(src2_FIFO_in)      
);

      MUX_Nbit_2x1#(address_size_memory) DEST
(
.a(dest_base),               //dest_base
.b(temp_start),              //temp_start      
.sel(dest_sel),         
.mux_out(dest_FIFO_in)      
);


  /*  
    
   FIFO DEST_FIFO 
        (.DATAOUT(dest_addr), 
         .full(dest_full),
         .empty(dest_empty),
         .clk(clk), 
         .reset(reset), 
         .wn(CW[0]), 
         .rn(0), 
         .DATAIN(dest_FIFO_in + CW[11:4])); 
         
    FIFO SRC1_FIFO 
        (.DATAOUT(src1_addr), 
         .full(src_1_full),
         .empty(src_1_empty),
         .clk(clk), 
         .reset(reset), 
         .wn(CW[0]), 
         .rn(0), 
         .DATAIN(src1_FIFO_in + CW[21:14]));
         
         
     FIFO SRC2_FIFO 
        (.DATAOUT(src2_addr), 
         .full(src_2_full),
         .empty(src_2_empty),
         .clk(clk), 
         .reset(reset), 
         .wn(CW[0]), 
         .rn(0), 
         .DATAIN(src2_FIFO_in + CW[31:24]));        

*/

FIFO_Out_wrapper FIFO
   (.clk(clk),
    .dest_empty(dest_empty),
    .dest_full(dest_full),
    .dest_in(dest_FIFO_in + CW[11:4]),
    .dest_out(dest_addr),
    .mem_op_empty(mem_op_empty),
    .mem_op_full(mem_op_full),
    .mem_op_in(CW[2:1]),
    .mem_op_out(mem_op),
    .read_enable(read),
    .reset(reset),
    .src1_empty(src_1_empty),
    .src1_full(src_1_full),
    .src1_in(src1_FIFO_in + CW[21:14]),
    .src1_out(src1_addr),
    .src2_empty(src_2_empty),
    .src2_full(src_2_full),
    .src2_in(src2_FIFO_in + CW[31:24]),
    .src2_out(src2_addr),
    .write_enable(CW[0])
    );

endmodule
