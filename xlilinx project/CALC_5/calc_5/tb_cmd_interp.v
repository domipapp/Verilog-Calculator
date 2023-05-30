`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:03:56 03/24/2023
// Design Name:   cmd_interp
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_cmd_interp.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cmd_interp;

	// Inputs
	reg start;
	reg [7:0] data;
	reg rst;
	reg clk;

	// Outputs
	wire [7:0] debug;
	wire rdy;
	wire [7:0] op_A;
	wire [7:0] op_B;
	wire [3:0] cmd;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp uut (
		.start(start), 
		.data(data), 
		.rst(rst), 
		.clk(clk), 
		.debug(debug), 
		.rdy(rdy), 
		.op_A(op_A), 
		.op_B(op_B), 
		.cmd(cmd)
	);

	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		start = 0;
		data = 0;
		rst = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish

		#100;
		rst = 0;
		#20
		data = 8'h31;//0
		#2 start = 1;
		#2 start = 0;
		#20
		data = 8'h35;//5
		#2 start = 1;
		#2 start = 0;
		#20
		data = 8'h2A;//*
		#2 start = 1;
		#2 start = 0;
		#20
		data = 8'h34;//4
		#2 start = 1;
		#2 start = 0;
		#20
		data = 8'h3D;//=
		#2 start = 1;
		#2 start = 0;
        
		// Add stimulus here

	end
      
endmodule

