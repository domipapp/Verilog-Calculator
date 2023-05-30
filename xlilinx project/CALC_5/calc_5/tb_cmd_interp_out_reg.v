`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:48:17 03/24/2023
// Design Name:   cmd_interp_out_reg
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_cmd_interp_out_reg.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp_out_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cmd_interp_out_reg;

	// Inputs
	reg [7:0] in1;
	reg [7:0] in2;
	reg clk;
	reg rst;
	reg load1;
	reg load2;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp_out_reg uut (
		.in1(in1), 
		.in2(in2), 
		.clk(clk), 
		.rst(rst), 
		.load1(load1), 
		.load2(load2), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		clk = 0;
		rst = 0;
		load1 = 0;
		load2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
        
		// Add stimulus here

	end
      
endmodule

