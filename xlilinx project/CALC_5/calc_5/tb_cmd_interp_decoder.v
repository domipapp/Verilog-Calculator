`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:46 03/24/2023
// Design Name:   cmd_interp_decoder
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_cmd_interp_decoder.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cmd_interp_decoder;

	// Inputs
	reg [7:0] data;
	reg clk;
	reg rst;

	// Outputs
	wire got_dig;
	wire got_op;
	wire got_eq;
	wire got_esc;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp_decoder uut (
		.data(data), 
		.clk(clk), 
		.rst(rst), 
		.got_dig(got_dig), 
		.got_op(got_op), 
		.got_eq(got_eq), 
		.got_esc(got_esc)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		data = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		data = 8'h30;
		#10
		data = 8'h35;
		#10
		data = 8'h36;
		#10
		data = 8'h2A;
		#10
		data = 8'h2B;
		#10
		data = 8'h2C;
		#10
		data = 8'h2D;
		#10
		data = 8'h2E;
		#10
		data = 8'h3D;
		#10
		data = 8'h1B;
		#10
		data = 8'h0D;
        
		// Add stimulus here

	end
      
endmodule

