`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:55 03/18/2023 
// Design Name: 
// Module Name:    MPX 
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
module MPX(
    input [15:0] I0,
	 input [15:0] I1,
	 input [15:0] I2,
	 input [15:0] I3,
    input [3:0] s,
    output reg [15:0] out
    );

always @ (*)
	case (s)
		4'b0001	:	out <= I0;
		4'b0010	:	out <= I1;
		4'b0100	:	out <= I2;
		4'b1000	:	out <= I3;
		default	:	out <= 0;
	endcase

endmodule