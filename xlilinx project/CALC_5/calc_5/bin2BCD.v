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
module bin2BCD #(parameter bits=16)(
    input [bits-1:0] bin,
    input rst,
    input clk,
    input start,
	 output [3:0] dig1000,
	 output [3:0] dig100,
    output [3:0] dig10,
    output [3:0] dig1
    );
//az az alapelv, hogy ha egy 4 számjegyû decimális számot leosztunk 1000-el, az megadja az ezresek helyén lévõ számjegyet.
//Az osztó modul ezt kiszámolja és megadja a maradékot, amibõl 100-al való osztással megkapjuk a százasok helyén lévõ számjegyet
//és ez így tovább a tízesekre és egyesekre
wire [15:0] hundred;//összekötõ
wire ready_hundred;//indítja a következõ osztást, ha végzett
div_N #(.bits(bits)) div1(.clk(clk), .reset(rst), .start(start), .a(bin), .b(16'd1000), .div(dig1000), .mod(hundred), .rdy(ready_hundred));

wire [15:0] ten;//összekötõ
wire ready_ten;//indítja a következõ osztást, ha végzett
div_N #(.bits(bits)) div2(.clk(clk), .reset(rst), .start(ready_hundred), .a(hundred), .b(16'd100), .div(dig100), .mod(ten), .rdy(ready_ten));

div_N #(.bits(bits)) div3(.clk(clk), .reset(rst), .start(ready_ten), .a(ten), .b(16'd10), .div(dig10), .mod(dig1));

endmodule
