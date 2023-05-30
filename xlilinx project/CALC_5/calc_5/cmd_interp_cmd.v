`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:22 03/24/2023 
// Design Name: 
// Module Name:    cmd_interp_cmd 
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
module cmd_interp_cmd(
    input clk,
    input rst,
    input load_cmd,
	 input rdy,
	 input got_dig,
    input [7:0] data,
    output reg [3:0] out
    );
//readyre töltjük a kimeneti regisztert, addig egy belsõ regiszterben tároljuk azt, amit majd be kell tölteni
reg [3:0] temp = 4'b0000;
always@ (posedge clk)begin
	if(rst)
		out <= 4'h0;
	else if(load_cmd) begin
			case(data)
			8'h2A: 	temp <= 4'b0100;//Multiply 
			8'h2B: 	temp <= 4'b0001;//Add 
			8'h2D: 	temp <= 4'b0010;//Minus 
			8'h2F: 	temp <= 4'b1000;//Div
			default:	temp <= temp;
			endcase
		end
	else
		temp <= temp;
	if(rdy)
		out <= temp;
	else if(got_dig)//új szekvecnia kezdõdött
		out <= 4'h0;
end

endmodule
