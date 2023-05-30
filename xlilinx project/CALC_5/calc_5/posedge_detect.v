`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:42 03/25/2023 
// Design Name: 
// Module Name:    posedge_detect 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module posedge_detect(input in,           	// Input signal for which positive edge has to be detected
                      input clk,					// Input signal for clock
							 input rst,							 
                      output reg out);        	// Output signal that gives a pulse when a positive edge occurs
 
    reg   in_dly;                          // Internal signal to store the delayed version of signal
 
    // This always block ensures that in_dly is exactly 1 clock behind in
always @ (posedge clk) begin	
	in_dly <= in;
	out <= in & ~in_dly & (~rst); 
 end
endmodule 
 

