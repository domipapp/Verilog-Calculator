`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:02 03/18/2023 
// Design Name: 
// Module Name:    CNTR 
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
module CNTR #(parameter bits=8)(
    input enable,
    input clk,
    input reset,
    output full,
    output [bits-1:0] q
    );
	 
reg [bits-1:0] counter = 0;	 
always@ (posedge clk)begin
	if(reset)
		counter <= 0;
	else if(enable)
		counter <= counter + 1;
end

assign q = counter;
assign full = (counter == (2**bits) - 1);

endmodule
