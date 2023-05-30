`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:54:58 03/01/2023 
// Design Name: 
// Module Name:    divider 
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
module div_N #(parameter bits=8)(
		input clk, start, reset,
		input [bits-1:0] a, b,//bemeneti operandusok, a folyamatosan v�ltozik
		output [bits-1:0] div, mod,//div: eg�sz r�sz, mod: marad�k
		output ready, div_err
    );

wire is_b_zero;//b nulla-e
assign is_b_zero = (b == 0);

wire first_cycle;//reg3-4 �s CNT FSM �sszek�t�
wire [bits-1:0] mod_i;//reg3 a_sub_b, reg3 CMP, reg3 reg6 �sszek�t�, marad�k!
wire [bits-1:0] diff;//reg3 a_sub_b �sszek�t�, k�l�nbs�g!
wire update;//reg3 FSW �sszek�t�, osztand�t friss�teni kell!
div_mux #(.bits(bits)) reg3(.a(a), .diff(diff), .reset(reset), .clk(clk), .first_cycle(first_cycle), .update(update), .out(mod_i));

wire [bits-1:0] divider;//a_sub_b reg4, reg4 CMP �sszek�t�, oszt�!
a_sub_b #(.bits(bits)) a_sub_b(.a(mod_i), .b(divider), .out(diff));

d_flip_flop #(.bits(bits)) reg4(.d(b), .load(first_cycle), .reset(reset), .clk(clk), .q(divider));

wire a_lower_than_b;//CMP FSW �sszek�t�, a kisebb mint b?
CMP #(.bits(bits)) CMP(.a(mod_i), .b(divider), .a_lower_than_b(a_lower_than_b));

wire [bits-1:0] div_i;//CNT reg5 �sszek�t�, eredm�ny eg�sz r�sz
CNTR #(.bits(bits)) CNT(.reset(reset|first_cycle), .enable(update), .clk(clk), .q(div_i));

wire FSM_ready;//reg5-6-7 FSM �sszek�t�, oszt�s v�gzett
d_flip_flop #(.bits(bits)) reg5(.d(div_i), .load(FSM_ready), .reset(reset), .clk(clk), .q(div));

d_flip_flop #(.bits(bits)) reg6(.d(mod_i), .load(FSM_ready), .reset(reset), .clk(clk), .q(mod));

wire FSM_div_err;//reg7 FSM �sszek�t�, t�rt�nt-e hiba
d_flip_flop #(.bits(bits)) reg7(.d(FSM_div_err), .load(FSM_ready), .reset(reset), .clk(clk), .q(div_err));

d_flip_flop #(.bits(bits)) reg8(.d(FSM_ready), .load(1), .reset(reset), .clk(clk), .q(ready));

FSM FSM(.clk(clk), .reset(reset), .a_lower_than_b(a_lower_than_b), .is_b_zero(is_b_zero),
				.start(start), .first_cycle(first_cycle), .update(update), .error(FSM_div_err), .ready(FSM_ready));

endmodule
