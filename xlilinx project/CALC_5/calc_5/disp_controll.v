`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:09:01 03/19/2023 
// Design Name: 
// Module Name:    disp_controll 
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
module disp_controll(
	input [3:0] dig0, dig1, dig2, dig3, error, dec_point, 				blank,
	//														legyen-e tizedespont		üres legyen-e
	input clk, reset,
	output [7:0] seg_n,
	output [3:0] dig_n,
	output out25Hz
    );

wire shr_enable;//cnt_40000 SHR4 összekötõ, engedélyezi a shiftelést
prediv cnt_40000(.rst(reset), .clk(clk), .full(shr_enable));//400hz

reg [3:0] cntr_25HZ = 0;
always@(posedge shr_enable)
	cntr_25HZ <= cntr_25HZ + 1;

//BCD sigit kiválasztó
wire [3:0] sel;//SHR4 MPX6_4_1 és SHR4 kimenet összekötõ, multiplexer kiválasztó jel
wire shr_in;//SHR4 kimenetét visszaköti enable-be
assign shr_in = sel[3];
shr SHR4(.reset(reset), .clk(clk), .enable(shr_enable), .si(shr_in), .out(sel));

wire selected_dec_point;//MPX6_4_1 kimenet összekötõ
wire [3:0] selected_num;//MPX6_4_1 hex_to_7seg összekötõ, kiválaasztott kijelzendõ számjegy
wire selected_error;//MPX6_4_1 hex_to_7seg összekötõ, kiválaasztott error
wire selected_blank;//MPX6_4_1 hex_to_7seg összekötõ, kiválaasztott blank
MPX6_4_1 MPX6_4_1(.S(~sel), .num0(dig0), .num1(dig1), .num2(dig2), .num3(dig3), .err0(error[0]), .err1(error[1]), .err2(error[2]), .err3(error[3]),
					  .blank0(blank[0]), .blank1(blank[1]), .blank2(blank[2]), .blank3(blank[3]), .dec_point0(dec_point[0]), .dec_point1(dec_point[1]),
					  .dec_point2(dec_point[2]), .dec_point3(dec_point[3]), .selected_num(selected_num), .selected_dec_point(selected_dec_point),
					  .selected_blank(selected_blank), .selected_error(selected_error));
				 
wire [6:0] seg;//hex_to_7seg kimenet összekötõ, szegmens vezérlõ
hex_to_7seg hex_to_7seg(.hex_dig(selected_num), .error(selected_error), .blank(selected_blank), .seg(seg));

assign seg_n = {(~selected_dec_point), seg};
assign dig_n = sel;
assign out25Hz = (cntr_25HZ == 0);

endmodule
