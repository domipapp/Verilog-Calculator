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
	 input [0:0] sw, //teszt funkció sw[0]
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

assign col_n = 5'h1f;//led mátrix tiltása

//fogadja a bejövõ USART adatokat
wire usrt_rec_rdy;
wire [7:0] data;
usrt_rec usrt_rec(.rst(rst), .clk(clk16M), .usrt_rx(mosi), .usrt_clk(clk), .USRT_data(data), .rdy(usrt_rec_rdy));

//értelmezi az adatokat, legenerálja az A és B operandusokat és jelzi, hogy milyen mûveletet kell végrehajtani
wire cmd_interp_rdy;//mikortól érvényesek az operandusok
wire [7:0] op_A, op_B;
wire [3:0] cmd_interp_cmd;
assign ld = {4'h0, cmd_interp_cmd};//alsó 4 ledre kikerül a végzett mûvelet
wire no_cmd;
assign no_cmd = (cmd_interp_cmd == 4'b0000); //késõbbi logikához
cmd_interp cmd_interp(.clk(clk16M), .rst(rst), .start(usrt_rec_rdy), .data(data), .cmd(cmd_interp_cmd), .rdy(cmd_interp_rdy), .op_A(op_A), .op_B(op_B));

wire [15:0] I[3:0];//multiplexer mûveletvégzõk összekötõ

//Összeadás mûvelet
add #(.bits(bits)) add(.a(op_A), .b(op_B), .out(I[0]));

//Kivonás mûvelet
wire sub_err;//s_sub_b és error logika összekötõ, kivonás error
a_sub_b #(.bits(bits)) a_sub_b(.a(op_A), .b(op_B), .out(I[1]), .sub_err(sub_err));

//Szorzés mûvelet
multiply #(.bits(bits)) multiply(.a(op_A), .b(op_B), .out(I[2]));

//Osztás
wire div_err; //Osztás error
wire [7:0] result_div, result_mod;//kijelzendõ szám számításhoz
assign I[3] = (result_div * 16'd100) + result_mod;//a háyados egész részét 100-al felszorozva és a maradékot hozzáadva megkapjuk a 4 digiten kijelezhetõ számot
div_N #(.bits(8)) div(.clk(clk16M), .start(cmd_interp_rdy), .reset(rst), .a(op_A), .b(op_B), .div(result_div), .mod(result_mod), .div_err(div_err));//ok

//Mûvelet kiválasztó
wire [15:0] result;//MPX BCD modul összekötõ
MPX MPX(.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .s(cmd_interp_cmd), .out(result));//ok


// BCD konverter példányosítása
wire start_BCD;//25HZ jel a disp_controllból
wire [3:0] dig1000, dig100, dig10, dig1;
bin2BCD #(.bits(bits)) bcd(.bin(result), .rst(rst), .clk(clk16M), .start(start_BCD), .dig1000(dig1000), .dig100(dig100), .dig10(dig10), .dig1(dig1));

//kiválasztja, hogy az érkezett operandusokat vagy a mûvelet eredményét jelezze-e ki
wire [15:0] MPX16_2_1_out;
MPX16_2_1 MPX16_2_1(.I0({dig1000, dig100, dig10, dig1}), .I1({op_A, op_B}), .s(no_cmd & (sw == 1)), .out(MPX16_2_1_out));

//error logika vizsgálat
wire err;
wire [3:0] error_logic;
assign err = (((cmd_interp_cmd == 4'b1000)&div_err)|((cmd_interp_cmd == 4'b0010)&sub_err));
assign error_logic = {err, err, err, err};

//Tizedespont logika
wire [3:0] dp_logic;
wire dp;
assign dp = no_cmd & (sw == 0);//lent: osztás mûvelet van
assign dp_logic = {dp ,dp | (cmd_interp_cmd == 4'b1000) ,dp ,dp };

//Üres kijelzés logika
wire blank;
wire [3:0] blank_logic;
assign blank = ~((sw == 1)|(sw == 0 & ~no_cmd));
assign blank_logic = {blank, blank, blank, blank};

//A mûveleti eredmény BCD kódban kerül a kijelzõre, start_BCD jel a kijelzõ modul 100 Hz-es kimenõ jelérol meghajtva
disp_controll disp_controll(.dig3(MPX16_2_1_out[15:12]), .dig2(MPX16_2_1_out[11:8]),  .dig1(MPX16_2_1_out[7:4]), .dig0(MPX16_2_1_out[3:0]), .reset(rst), .clk(clk16M), .error(error_logic),
									 .dec_point(dp_logic), .blank(blank_logic), .seg_n(seg_n), .dig_n(dig_n), .out25Hz(start_BCD) );//ok
									 
endmodule

