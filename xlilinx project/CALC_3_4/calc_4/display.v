`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:36 03/08/2023 
// Design Name: 
// Module Name:    display 
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
module display(
	input [3:0] dig0, dig1, dig2, dig3, err, dp, blank,
	input clk, rst,
	output [7:0] seg_n,
	output [3:0] dig_n,
	output out100Hz
    );

wire shr_en, shr_in, dpn;
wire [3:0] sel, hexdig;
wire [1:0] seg_up;
wire [6:0] seg;

assign shr_in = sel[3];
prediv cnt_40000(.rst(rst), .clk(clk), .tc(shr_en));
shr shr4(.rst(rst), .clk(clk), .en(shr_en), .si(shr_in), .out(sel));
assign out100Hz = (shr_en & shr_in);
MPX6_4_1 mpx(.S(~sel), .num0(dig0), .num1(dig1), .num2(dig2), .num3(dig3), .err0(err[0]), .err1(err[1]), .err2(err[2]), .err3(err[3]),
.blank0(blank[0]), .blank1(blank[1]), .blank2(blank[2]), .blank3(blank[3]), .dp0(dp[0]), .dp1(dp[1]), .dp2(dp[2]), .dp3(dp[3]),
.outnum(hexdig), .dp(dpn), .inh(seg_up[0]), .err(seg_up[1]));
hex_to_7seg dec(.hex_dig(hexdig), .err(seg_up[1]), .inh(seg_up[0]), .seg(seg));

assign seg_n = {~dpn, seg};
assign dig_n = sel;

endmodule
