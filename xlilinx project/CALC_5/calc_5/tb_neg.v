`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:41:24 03/22/2023
// Design Name:   negedge_detect
// Module Name:   D:/Users/Student/Desktop/my_m123/CALC_5/calc_5/tb_neg.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: negedge_detect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_neg;

	// Inputs
	reg in;
	reg clk;
	reg rst;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	negedge_detect uut (
		.in(in), 
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	always #5 clk <= ~clk;
	always #13 in <= ~in;
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst <= 1;
		#15 rst <= 0;
        
		// Add stimulus here

	end
      
endmodule

