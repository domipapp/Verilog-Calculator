`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:54 03/18/2023 
// Design Name: 
// Module Name:    CMP 
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
module CMP #(parameter bits=8)(
    input [bits-1:0] a,
    input [bits-1:0] b,
    output a_lower_than_b
    );
assign a_lower_than_b = ((a < b) ? 1 : 0);

endmodule
