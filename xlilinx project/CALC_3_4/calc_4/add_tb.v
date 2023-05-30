`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:22 03/19/2023
// Design Name:   add
// Module Name:   C:/Users/domip/Downloads/my_m123/CALC_3_4/calc_4/add_tb.v
// Project Name:  calc_4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module add_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Instantiate the Unit Under Test (UUT)
	add uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 3'b001;
		b = 3'b101;
        
		// Add stimulus here

	end
      
endmodule

