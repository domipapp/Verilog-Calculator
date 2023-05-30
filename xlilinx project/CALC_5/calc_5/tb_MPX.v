`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:20 03/25/2023
// Design Name:   MPX
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_MPX.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MPX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_MPX;

	// Inputs
	reg [15:0] I0;
	reg [15:0] I1;
	reg [15:0] I2;
	reg [15:0] I3;
	reg [3:0] s;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	MPX uut (
		.I0(I0), 
		.I1(I1), 
		.I2(I2), 
		.I3(I3), 
		.s(s), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		I0 = 0;
		I1 = 0;
		I2 = 0;
		I3 = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
		I0 = 1;
		I1 = 2;
		I2 = 3;
		I3 = 4;
		#10
		s = 4'b0001;
		#10
		s = 4'b0010;
		#10
		s = 4'b0100;
		#10
		s = 4'b1000;
        
		// Add stimulus here

	end
      
endmodule

