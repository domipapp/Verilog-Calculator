`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:14 03/25/2023
// Design Name:   div_N
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_divider.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: div_N
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_divider;

	// Inputs
	reg clk;
	reg start;
	reg reset;
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] div;
	wire [7:0] mod;
	wire ready;
	wire div_err;

	// Instantiate the Unit Under Test (UUT)
	div_N uut (
		.clk(clk), 
		.start(start), 
		.reset(reset), 
		.a(a), 
		.b(b), 
		.div(div), 
		.mod(mod), 
		.ready(ready), 
		.div_err(div_err)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		reset = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 8'h08;
		b = 8'h02;
		start = 1;
		#20
		start = 0;
        
		// Add stimulus here

	end
      
endmodule

