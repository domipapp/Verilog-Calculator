`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:51:46 03/26/2023
// Design Name:   cmd_interp_out_reg2
// Module Name:   C:/Users/domip/Downloads/my_m123/my_m123/CALC_5/calc_5/tb_cmd_interp_out_reg2.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp_out_reg2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cmd_interp_out_reg2;

	// Inputs
	reg [7:0] in;
	reg clk;
	reg rst;
	reg load1;
	reg load2;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp_out_reg2 uut (
		.in(in), 
		.clk(clk), 
		.rst(rst), 
		.load1(load1), 
		.load2(load2), 
		.out(out)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		rst = 0;
		load1 = 0;
		load2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		#15
		rst = 0;
       in = 8'd1;
		 load1 = 1;
		#15
		in = 8'd1;
		load1 = 0;
		load2 = 1;
		// Add stimulus here

	end
      
endmodule

