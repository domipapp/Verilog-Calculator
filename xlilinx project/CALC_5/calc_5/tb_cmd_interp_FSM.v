`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:01:44 03/25/2023
// Design Name:   cmd_interp_FSM
// Module Name:   C:/Users/domip/Downloads/my_m123 18.15.21/my_m123/CALC_5/calc_5/tb_cmd_interp_FSM.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cmd_interp_FSM;

	// Inputs
	reg rst;
	reg clk;
	reg got_dig;
	reg got_op;
	reg got_eq;
	reg got_esc;

	// Outputs
	wire load_A1;
	wire load_A2;
	wire load_B1;
	wire load_B2;
	wire load_cmd;
	wire rdy;
	wire [2:0] state_out;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp_FSM uut (
		.rst(rst), 
		.clk(clk), 
		.got_dig(got_dig), 
		.got_op(got_op), 
		.got_eq(got_eq), 
		.got_esc(got_esc), 
		.load_A1(load_A1), 
		.load_A2(load_A2), 
		.load_B1(load_B1), 
		.load_B2(load_B2), 
		.load_cmd(load_cmd), 
		.rdy(rdy), 
		.state_out(state_out)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		got_dig = 0;
		got_op = 0;
		got_eq = 0;
		got_esc = 0;

		// Wait 100 ns for global reset to finish
		#100;
      got_dig = 1;
		#20
		got_dig = 0;
		#20
		got_dig = 1; 
		// Add stimulus here

	end
      
endmodule

