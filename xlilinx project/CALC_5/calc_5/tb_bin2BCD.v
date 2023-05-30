`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:04 03/25/2023
// Design Name:   bin2BCD
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_bin2BCD.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin2BCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_bin2BCD;

	// Inputs
	reg [15:0] bin;
	reg rst;
	reg clk;
	reg start;

	// Outputs
	wire [3:0] dig1000;
	wire [3:0] dig100;
	wire [3:0] dig10;
	wire [3:0] dig1;

	// Instantiate the Unit Under Test (UUT)
	bin2BCD uut (
		.bin(bin), 
		.rst(rst), 
		.clk(clk), 
		.start(start), 
		.dig1000(dig1000), 
		.dig100(dig100), 
		.dig10(dig10), 
		.dig1(dig1)
	);
	always#2 clk = ~clk;
	initial begin
		// Initialize Inputs
		bin = 0;
		rst = 0;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
      bin = 16'd1111;
		#5
		start = 1;
		#5
		start = 0;
		// Add stimulus here

	end
      
endmodule

