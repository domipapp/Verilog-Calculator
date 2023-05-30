`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:48 03/24/2023 
// Design Name: 
// Module Name:    MPX16_2_1 
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
module MPX16_2_1(
    input [15:0] I0,
    input [15:0] I1,
	 input s,
    output [15:0] out
    );

assign out = (s == 0 ? I0 : I1);
endmodule
