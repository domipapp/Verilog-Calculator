`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:28 02/05/2020 
// Design Name: 
// Module Name:    calc_1 
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
module calc_3(
	 input rst,
	 input clk16M,
	 output [7:0] seg_n,
	 output [3:0] dig_n,
	 output [4:0] col_n,
    input [7:0] sw,
    input [3:0] bt
    );

assign col_n = 5'h1f;		//led mátrix tiltása

endmodule
