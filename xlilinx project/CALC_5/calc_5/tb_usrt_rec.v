`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:18:59 03/22/2023
// Design Name:   usrt_rec
// Module Name:   D:/Users/Student/Desktop/my_m123/CALC_5/calc_5/tb_usrt_rec.v
// Project Name:  calc_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: usrt_rec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_usrt_rec;

	// Inputs
	reg rst;
	reg clk;
	reg usrt_rx;
	reg usrt_clk;

	// Outputs
	wire [7:0] USRT_data;
	wire rdy;

	// Instantiate the Unit Under Test (UUT)
	usrt_rec uut (
		.rst(rst), 
		.clk(clk), 
		.usrt_rx(usrt_rx), 
		.usrt_clk(usrt_clk), 
		.USRT_data(USRT_data), 
		.rdy(rdy)
	);

	always #5 clk <= ~clk;
	always #40 usrt_clk <= ~usrt_clk;
	always #40 usrt_rx <= ~usrt_rx;
	
	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		usrt_rx = 0;
		usrt_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst <= 1;
		#10
		rst <= 0;
        
		// Add stimulus here

	end
      
endmodule

