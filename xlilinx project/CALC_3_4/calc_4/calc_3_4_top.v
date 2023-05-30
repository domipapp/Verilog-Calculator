`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:28 02/05/2020 
// Design Name: 
// Module Name:    calc_1 
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
module calc_4(
	 input rst,
	 input clk16M,
    input [7:0] sw,//bemeneti operandusok
    input [3:0] bt,//mûvelet választó
	 output [7:0] seg_n,
	 output [3:0] dig_n,
	 output [4:0] col_n
    );
localparam bits = 8;

assign col_n = 5'h1f;//led mátrix tiltása

//operandusok
reg [3:0] a, b;
always@(posedge clk16M)begin 
	a <= sw[7:4];
	b <= sw[3:0];
end

wire [7:0] I[3:0];//multiplexer mûveletvégzõk összekötõ

//osztás error
wire div_err;

//Összeadás mûvelet
add #(.bits(bits)) add(.a(a), .b(b), .out(I[0]));

//Kivonás mûvelet
wire sub_err;//s_sub_b és error logika összekötõ, kivonás error
a_sub_b #(.bits(bits)) a_sub_b(.a({4'h0,a}), .b({4'h0,b}), .out(I[1]), .sub_err(sub_err));

//Szorzés mûvelet
multiply #(.bits(bits)) multiply(.a({4'h0,a}), .b({4'h0,b}), .out(I[2]));

wire start;//cnt_256 div összekötõ, indítja az osztást, ha elszámolt 256-ig
CNTR #(.bits(bits)) cnt_256(.reset(rst), .enable(1),.clk(clk16M), .full(start));

//Az osztandó tízszerese kerül a bemenetre, hogy a kijelzõn a tizedes pont után a törtrész jelenjen meg
div_N #(.bits(bits)) div(.clk(clk16M), .start(start), .reset(rst), .a(10*a), .b({4'h0,b}), .div(I[3]), .div_err(div_err));

//Mûvelet kiválasztó
wire [7:0] result;//MPX BCD modul összekötõ
MPX MPX(.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .s(bt), .out(result));

// BCD konverter példányosítása
wire start_BCD;
wire [3:0] BCDt, BCDo;
bin2BCD #(.bits(bits)) bcd(.bin(result), .rst(rst), .clk(clk16M), .start(start_BCD), .tens(BCDt), .ones(BCDo));

//error logika vizsgálat
wire err;
wire [3:0] error_logic;
assign err = ((bt[3]&div_err)|(bt[1]&sub_err));
assign error_logic = {(a>9), (b>9), err, err};

//Tizedespont logika
wire [3:0] dp_logic;
assign dp_logic = {1'b0,1'b0,bt[3],1'b0};

//Üres kijelzés logika
wire blank;
wire [3:0] blank_logic;
assign blank = (bt == 4'b0000);
assign blank_logic = {1'b0, 1'b0, blank, blank};

//A mûveleti eredmény BCD kódban kerül a kijelzõre, start_BCD jel a kijelzõ modul 100 Hz-es kimenõ jelérol meghajtva
disp_controll disp_controll(.dig3(a), .dig2(b),  .dig1(BCDt), .dig0(BCDo), .reset(rst), .clk(clk16M), .error(error_logic),
									 .dec_point(dp_logic), .blank(blank_logic), .seg_n(seg_n), .dig_n(dig_n), .out100Hz(start_BCD) );

endmodule

