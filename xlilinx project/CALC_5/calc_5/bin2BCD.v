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
//az az alapelv, hogy ha egy 4 sz�mjegy� decim�lis sz�mot leosztunk 1000-el, az megadja az ezresek hely�n l�v� sz�mjegyet.
//Az oszt� modul ezt kisz�molja �s megadja a marad�kot, amib�l 100-al val� oszt�ssal megkapjuk a sz�zasok hely�n l�v� sz�mjegyet
//�s ez �gy tov�bb a t�zesekre �s egyesekre
wire [15:0] hundred;//�sszek�t�
wire ready_hundred;//ind�tja a k�vetkez� oszt�st, ha v�gzett
div_N #(.bits(bits)) div1(.clk(clk), .reset(rst), .start(start), .a(bin), .b(16'd1000), .div(dig1000), .mod(hundred), .rdy(ready_hundred));

wire [15:0] ten;//�sszek�t�
wire ready_ten;//ind�tja a k�vetkez� oszt�st, ha v�gzett
div_N #(.bits(bits)) div2(.clk(clk), .reset(rst), .start(ready_hundred), .a(hundred), .b(16'd100), .div(dig100), .mod(ten), .rdy(ready_ten));

div_N #(.bits(bits)) div3(.clk(clk), .reset(rst), .start(ready_ten), .a(ten), .b(16'd10), .div(dig10), .mod(dig1));

endmodule
