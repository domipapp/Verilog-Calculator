`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:57 03/24/2023 
// Design Name: 
// Module Name:    cmd_interp_out_reg 
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
module cmd_interp_out_reg(
    input [7:0] in,
    input clk,
    input rst,
	 input load1,
    input load2,
    output [7:0] out
    );

//ebben a regisizterben t�roljuk azt, amit majd a kimenetre kell t�lteni
reg [7:0] reg_in = 0;
always@(posedge clk)begin
	if(rst)
		reg_in <= 0;
	else if(load1)//ha els� sz�mot t�ltj�k, csak mag�ban
		reg_in <= in;
	else if(load2)//ha m�sodik sz�mot t�ltj�k, akkor az els� sz�m*10+m�sodik sz�m adja meg a helyes sz�m�rt�ket
		reg_in <= (out * 10) + in;
	else 
		reg_in <= reg_in;
end
//k�sleltetni kell 1 �rajellel a jelet, mert az els� felfut�sn�l a reg_in v�ltoztatjuk, �gy haz�rdmentes�t�nk
wire delayed_load1;
d_flip_flop #(.bits(1)) delay_load1(.d(load1), .reset(rst), .clk(clk), .load(1), .q(delayed_load1));
//k�sleltetni kell 1 �rajellel a jelet, mert az els� felfut�sn�l a reg_in v�ltoztatjuk, �gy haz�rdmentes�t�nk
wire delayed_load2;
d_flip_flop #(.bits(1)) delay_load2(.d(load2), .reset(rst), .clk(clk), .load(1), .q(delayed_load2));
//reg_in megfelel�en v�ltozik, a k�sleltetett load jelekkel t�lt�nk, ekkorra m�r �rv�nyes a reg_in �rt�ke
d_flip_flop #(.bits(8)) reg_out(.d(reg_in), .reset(rst), .clk(clk), .load(delayed_load1 | delayed_load2), .q(out));


endmodule
