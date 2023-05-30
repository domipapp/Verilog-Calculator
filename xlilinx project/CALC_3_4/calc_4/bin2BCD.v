`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:45 03/09/2023 
// Design Name: 
// Module Name:    bin2BCD 
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
module bin2BCD #(parameter bits=8)(
    input [7:0] bin,
    input rst,
    input clk,
    input start,
    output [3:0] tens,
    output [3:0] ones
    );

div_N #(.bits(bits)) div(.clk(clk), .reset(rst), .start(start), .a(bin), .b(8'd10), .div(tens), .mod(ones));

endmodule
