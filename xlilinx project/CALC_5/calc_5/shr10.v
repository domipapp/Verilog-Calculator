`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:26 03/08/2023 
// Design Name: 
// Module Name:    shr 
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
module shr10(
	input clk, ld3ff, en, si, // si: shift input
	output reg [9:0] q
    );

always @ (posedge clk) begin
	if (ld3ff)
		q <= 10'h3ff;
	else if (en)
		q <= {si, q[9:1]};
	else
		q <= q;
end

endmodule
