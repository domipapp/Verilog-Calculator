`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:35 03/22/2023 
// Design Name: 
// Module Name:    usrt_rec 
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
module usrt_rec(
    input rst,
    input clk,
    input usrt_rx,
    input usrt_clk,
    output [7:0] USRT_data,
    output rdy
    );

//lefut� �let detekt�ja
wire negedge_out;
negedge_detect negedge_detect(.in(usrt_clk), .clk(clk), .rst(rst), .out(negedge_out));

//bej�v� bitekb�l egy 8 bites adatot gener�l
wire rdy_i;//k�sz a shift regiszter, lehet t�lteni
wire [9:0] shr_q;//shr reg1 �sszek�t�
assign rdy_i = (~shr_q[0]&shr_q[9]);//rdy_i logika, mikor v�gzett a shr a bet�lt�ssel
shr10 shr(.en(negedge_out), .si(usrt_rx), .clk(clk), .ld3ff(rdy_i|rst), .q(shr_q));


//kimen� adatot t�rolja
d_flip_flop #(.bits(8))reg1(.d(shr_q[8:1]), .reset(rst), .clk(clk), .load(rdy_i), .q(USRT_data));

//jelz�st ad, hogy �rv�nyes az adat
d_flip_flop #(.bits(1))DFF(.d(rdy_i), .clk(clk), .reset(rst), .load(1'b1), .q(rdy));

endmodule
