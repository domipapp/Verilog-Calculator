`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:20 03/18/2023 
// Design Name: 
// Module Name:    div_mux 
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
module div_mux #(parameter bits=8)(
    input [bits-1:0] a,
    input [bits-1:0] diff,
    input reset,
    input clk,
    input first_cycle,
    input update,
    output reg [bits-1:0] out
    );


always@ (posedge clk)begin
	if(reset)
		out <= 0;
	else
		case({update, first_cycle})
			2'b01: out <= a;
			2'b10: out <= diff;
			default: out <= a;
		endcase
end


endmodule
