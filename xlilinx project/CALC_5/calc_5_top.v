`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:28 02/05/2020 
// Design Name: 
// Module Name:    calc_5 
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

module calc_5(
	 input [0:0] sw, //teszt funkci� sw[0]
	 input rst,
	 input clk16M,
	 input clk,				//USRT clk
	 input mosi,			//USRT RX
	 output [7:0] seg_n,
	 output [3:0] dig_n,
	 output [4:0] col_n,
	 output [7:0] ld
    );
localparam bits = 16;

assign col_n = 5'h1f;//led m�trix tilt�sa

//fogadja a bej�v� USART adatokat
wire usrt_rec_rdy;
wire [7:0] data;
usrt_rec usrt_rec(.rst(rst), .clk(clk16M), .usrt_rx(mosi), .usrt_clk(clk), .USRT_data(data), .rdy(usrt_rec_rdy));

//�rtelmezi az adatokat, legener�lja az A �s B operandusokat �s jelzi, hogy milyen m�veletet kell v�grehajtani
wire cmd_interp_rdy;//mikort�l �rv�nyesek az operandusok
wire [7:0] op_A, op_B;
wire [3:0] cmd_interp_cmd;
assign ld = {4'h0, cmd_interp_cmd};//als� 4 ledre kiker�l a v�gzett m�velet
wire no_cmd;
assign no_cmd = (cmd_interp_cmd == 4'b0000); //k�s�bbi logik�hoz
cmd_interp cmd_interp(.clk(clk16M), .rst(rst), .start(usrt_rec_rdy), .data(data), .cmd(cmd_interp_cmd), .rdy(cmd_interp_rdy), .op_A(op_A), .op_B(op_B));

wire [15:0] I[3:0];//multiplexer m�veletv�gz�k �sszek�t�

//�sszead�s m�velet
add #(.bits(bits)) add(.a(op_A), .b(op_B), .out(I[0]));

//Kivon�s m�velet
wire sub_err;//s_sub_b �s error logika �sszek�t�, kivon�s error
a_sub_b #(.bits(bits)) a_sub_b(.a(op_A), .b(op_B), .out(I[1]), .sub_err(sub_err));

//Szorz�s m�velet
multiply #(.bits(bits)) multiply(.a(op_A), .b(op_B), .out(I[2]));

//Oszt�s
wire div_err; //Oszt�s error
wire [7:0] result_div, result_mod;//kijelzend� sz�m sz�m�t�shoz
assign I[3] = (result_div * 16'd100) + result_mod;//a h�yados eg�sz r�sz�t 100-al felszorozva �s a marad�kot hozz�adva megkapjuk a 4 digiten kijelezhet� sz�mot
div_N #(.bits(8)) div(.clk(clk16M), .start(cmd_interp_rdy), .reset(rst), .a(op_A), .b(op_B), .div(result_div), .mod(result_mod), .div_err(div_err));//ok

//M�velet kiv�laszt�
wire [15:0] result;//MPX BCD modul �sszek�t�
MPX MPX(.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .s(cmd_interp_cmd), .out(result));//ok


// BCD konverter p�ld�nyos�t�sa
wire start_BCD;//25HZ jel a disp_controllb�l
wire [3:0] dig1000, dig100, dig10, dig1;
bin2BCD #(.bits(bits)) bcd(.bin(result), .rst(rst), .clk(clk16M), .start(start_BCD), .dig1000(dig1000), .dig100(dig100), .dig10(dig10), .dig1(dig1));

//kiv�lasztja, hogy az �rkezett operandusokat vagy a m�velet eredm�ny�t jelezze-e ki
wire [15:0] MPX16_2_1_out;
MPX16_2_1 MPX16_2_1(.I0({dig1000, dig100, dig10, dig1}), .I1({op_A, op_B}), .s(no_cmd & (sw == 1)), .out(MPX16_2_1_out));

//error logika vizsg�lat
wire err;
wire [3:0] error_logic;
assign err = (((cmd_interp_cmd == 4'b1000)&div_err)|((cmd_interp_cmd == 4'b0010)&sub_err));
assign error_logic = {err, err, err, err};

//Tizedespont logika
wire [3:0] dp_logic;
wire dp;
assign dp = no_cmd & (sw == 0);//lent: oszt�s m�velet van
assign dp_logic = {dp ,dp | (cmd_interp_cmd == 4'b1000) ,dp ,dp };

//�res kijelz�s logika
wire blank;
wire [3:0] blank_logic;
assign blank = ~((sw == 1)|(sw == 0 & ~no_cmd));
assign blank_logic = {blank, blank, blank, blank};

//A m�veleti eredm�ny BCD k�dban ker�l a kijelz�re, start_BCD jel a kijelz� modul 100 Hz-es kimen� jel�rol meghajtva
disp_controll disp_controll(.dig3(MPX16_2_1_out[15:12]), .dig2(MPX16_2_1_out[11:8]),  .dig1(MPX16_2_1_out[7:4]), .dig0(MPX16_2_1_out[3:0]), .reset(rst), .clk(clk16M), .error(error_logic),
									 .dec_point(dp_logic), .blank(blank_logic), .seg_n(seg_n), .dig_n(dig_n), .out25Hz(start_BCD) );//ok
									 
endmodule

