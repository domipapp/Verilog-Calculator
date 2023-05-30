`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:50 03/24/2023 
// Design Name: 
// Module Name:    cmd_decoder 
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
module cmd_interp_decoder(
    input [7:0] data,
	 input clk,
    input rst,
	 input start,
    output got_dig,
    output got_op,
    output got_eq,
    output got_esc
    );
	 
reg r_got_dig, r_got_op, r_got_eq, r_got_esc;
always@(posedge clk)begin
	if(rst | ~start)begin
	r_got_dig	<= 1'b0;
	r_got_op		<= 1'b0;
	r_got_eq		<= 1'b0;
	r_got_esc	<= 1'b0;
	end
	else begin
	r_got_dig	<= (data >= 8'h30 & data <= 8'h39);// szám 0-9ig
	r_got_op		<= (data == 8'h2A | data == 8'h2B | data == 8'h2D | data == 8'h2F);// * + - /
	r_got_eq		<= (data == 8'h3D | data == 8'h0D);// = enter
	r_got_esc	<= (data == 8'h1B);// esc
	end
	
end

assign got_dig = r_got_dig;
assign got_op = r_got_op;
assign got_eq = r_got_eq;
assign got_esc = r_got_esc;

endmodule
