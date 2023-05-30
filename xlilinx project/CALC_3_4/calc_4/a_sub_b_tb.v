`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:46 03/19/2023
// Design Name:   a_sub_b
// Module Name:   C:/Users/domip/Downloads/my_m123/CALC_3_4/calc_4/a_sub_b_tb.v
// Project Name:  calc_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: a_sub_b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module a_sub_b_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] out;
	wire sub_err;

	// Instantiate the Unit Under Test (UUT)
	a_sub_b uut (
		.a(a), 
		.b(b), 
		.out(out), 
		.sub_err(sub_err)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 a = 3'b001;
		 b = 3'b101;
		 #10;
		 a = 4'b1000;
		// Add stimulus here

	end
      
endmodule

