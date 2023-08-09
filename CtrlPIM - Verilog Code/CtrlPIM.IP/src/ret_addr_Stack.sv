`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2021 00:36:56
// Design Name: 
// Module Name: ret_addr_Stack
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


module ret_addr_Stack #(parameter WIDTH = 16, DEPTH = 4)(
	clk,
	reset,
	q,
	d,
	push,
	pop,
	full,
	empty
);



	input                      clk;
	input                      reset;
	input      [WIDTH - 1:0]   d;
	output reg [WIDTH - 1:0]   q;
	output                     full;
	output                     empty;
	input                      push;
	input                      pop;

	reg [DEPTH - 1:0] ptr;
	reg [WIDTH - 1:0] stack [0:(1 << DEPTH) - 1];

	always @(posedge clk) begin
		if (reset)
			ptr <= 0;
		else if (push)
			ptr <= ptr + 1;
		else if (pop)
			ptr <= ptr - 1;
	end

	always @(posedge clk) begin
		if (push || pop) begin
			if(push)
			begin
				stack[ptr] <= d;
			end	
            else
            begin
			q <= stack[ptr];
			end
		end
	end


assign empty = !(|ptr);
assign full  = !(|(ptr ^ DEPTH));


endmodule