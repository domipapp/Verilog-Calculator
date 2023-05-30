`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:30 03/18/2023 
// Design Name: 
// Module Name:    a_sub_b 
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
module a_sub_b #(parameter bits=8)(
    input [bits-1:0] a,
    input [bits-1:0] b,
    output [bits-1:0] out,
	 output sub_err
    );

	assign sub_err = (a<b);
	assign out = a-b;

endmodule

