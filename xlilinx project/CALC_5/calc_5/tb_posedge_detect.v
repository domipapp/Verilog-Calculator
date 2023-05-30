`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:29:16 03/25/2023
// Design Name:   posedge_detect
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_posedge_detect.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: posedge_detect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_posedge_detect;

	// Inputs
	reg in;
	reg clk;
	reg rst;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	posedge_detect uut (
		.in(in), 
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);
		always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      in = 1;
		#50
		in = 0;
		#30
		in = 1;
		// Add stimulus here

	end
      
endmodule

