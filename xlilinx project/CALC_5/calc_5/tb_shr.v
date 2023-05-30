`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:35:24 03/22/2023
// Design Name:   shr10
// Module Name:   D:/Users/Student/Desktop/my_m123/CALC_5/calc_5/tb_shr.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shr10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_shr;

	// Inputs
	reg clk;
	reg ld3ff;
	reg en;
	reg si;

	// Outputs
	wire [9:0] q;

	// Instantiate the Unit Under Test (UUT)
	shr10 uut (
		.clk(clk), 
		.ld3ff(ld3ff), 
		.en(en), 
		.si(si), 
		.q(q)
	);

	always #5 clk <= ~clk;
	always #7 si <= ~si;
	always #12 en <= ~en;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		ld3ff = 0;
		en = 0;
		si = 0;

		// Wait 100 ns for global reset to finish
		#100;
      ld3ff <= 1;
		#15 ld3ff <= 0;
		
		
		// Add stimulus here

	end
      
endmodule

