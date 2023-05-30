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
	 output [7:0] seg_n,
	 output [3:0] dig_n,
	 output [4:0] col_n,
    input [7:0] sw,//bemeneti operandusok
    input [3:0] bt//mûvelet választó
    );
localparam bits = 8;

assign col_n = 5'h1f;		//led mátrix tiltása

//operandusok
reg [3:0] a, b;
always@(posedge clk)begin 
	a <= sw[7:4];
	b <= sw[3:0];
end
//multiplexer összekötõ
wire [7:0] I[3:0];
wire [7:0] result;
//kivonás error
wire sub_err;
//osztás error
wire div_err;

add add(.a(a), .b(b), .out(I[0]));

a_sub_b #(.bits(bits)) a_sub_b(.a({4'h0,a}), .b({4'h0,b}), .out(I[1]), .sub_err(sub_err));

multiply multiply(.a(a), .b(b), .out(I[2]));

wire start;//cnt_256 div összekötõ, indítja az osztást, ha elszámolt 256-ig
CNTR #(.bits(bits)) cnt_256(.reset(rst), .enable(1),.clk(clk), .full(start));

div_N #(.bits(bits)) div(.clk(clk), .start(start), .reset(rst), .a({4'h0,a}), .b({4'h0,b}), .div(I[3]), .div_err(div_err));

MPX MPX(.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .s(bt), .out(result));
//error logic
assign ld = ((sub_err & bt[1])|(div_err & bt[3])) ? 8'hFF : result;



endmodule

