`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:03 03/18/2023 
// Design Name: 
// Module Name:    d_flip_flop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module d_flip_flop #(parameter bits=8)(
    input [bits-1:0] d,
    input load,
    input clk,
    input reset,
    output reg [bits-1:0] q
    );

always@ (posedge clk)begin
	if(reset)
		q <= 0;
	else if(load)
		q <= d;
	else
		q <= q;
end

endmodule
