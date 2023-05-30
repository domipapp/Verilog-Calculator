`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:55:06 03/22/2023 
// Design Name: 
// Module Name:    negedge 
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
module negedge_detect(
    input in,
    input clk,
    input rst,
    output out
    );

reg [1:0] shr;

always @ (posedge clk)
	if (rst)
		shr <= 2'b00;
	else
		shr <= {shr[0], in};

assign out = (shr == 2'b10);

endmodule
