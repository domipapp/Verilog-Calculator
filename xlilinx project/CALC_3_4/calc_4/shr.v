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
module shr(
	input clk, reset, enable, si,
	output reg [3:0] out
    );

always @ (posedge clk) begin
	if (reset)
		out <= 4'b1110;
	else if (enable)
		out <= {out[2:0], si};
end

endmodule
