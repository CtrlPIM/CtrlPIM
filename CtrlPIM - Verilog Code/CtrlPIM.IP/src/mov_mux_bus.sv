`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2021 16:40:20
// Design Name: 
// Module Name: mov_mux_bus
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


module mov_mux_bus #(parameter bus_size = 10)(
input  [(bus_size-1):0]   in0, 
input  [(bus_size-1):0]   in1,            
input  [(bus_size-1):0]   in2,            
input  [(bus_size-1):0]   in3,            
input  [(bus_size-1):0]   in4,
input  [(bus_size-1):0]   in5,            
input  [(bus_size-1):0]   in6,            
input  [(bus_size-1):0]   in7,            
input  [(bus_size-1):0]   in8,
input  [(bus_size-1):0]   in9,            
input  [(bus_size-1):0]   in10,            
input  [(bus_size-1):0]   in11,            
input  [(bus_size-1):0]   in12,
input  [(bus_size-1):0]   in13,            
input  [(bus_size-1):0]   in14,            
input  [(bus_size-1):0]   in15,            
input  [3:0]              sel,         
output [(bus_size-1):0]   mux_out        
    );
    
    wire intermediate1,intermediate2,intermediate3,intermediate0;
    
    
        MUX_Nbit_4x1#(bus_size)
INST1   (
        .a(in0),          
        .b(in1),         
        .c(in2),           
        .d(in3),           
        .sel(sel[1:0]),          
        .mux_out(intermediate0)      
        );
        
            
        MUX_Nbit_4x1#(bus_size)
INST2   (
        .a(in4),          
        .b(in5),         
        .c(in6),           
        .d(in7),           
        .sel(sel[1:0]),          
        .mux_out(intermediate1)      
        );
        
            
        MUX_Nbit_4x1#(bus_size)
INST3   (
        .a(in8),          
        .b(in9),         
        .c(in10),           
        .d(in11),           
        .sel(sel[1:0]),          
        .mux_out(intermediate2)     
        );
        
            
        MUX_Nbit_4x1#(bus_size)
INST4   (
        .a(in12),          
        .b(in13),         
        .c(in14),           
        .d(in15),           
        .sel(sel[1:0]),          
        .mux_out(intermediate3)      
        );
        
            
        MUX_Nbit_4x1#(bus_size)
INST5   (
        .a(intermediate0),          
        .b(intermediate1),         
        .c(intermediate2),           
        .d(intermediate3),           
        .sel(sel[3:2]),          
        .mux_out(mux_out)      
        );
        
    
    
    
    
endmodule
