`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:22 03/26/2023 
// Design Name: 
// Module Name:    cmd_interp_out_reg2 
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
module cmd_interp_out_reg2(
    input [7:0] in,
    input clk,
    input rst,
	 input load1,
    input load2,
    output [7:0] out
    );
reg [7:0] reg_in = 0;
always@(posedge clk)begin
	if(rst)
		reg_in <= 0;
	else if(load1)
		reg_in <= in;
	else if(load2)
		reg_in <= (out * 10) + in;
	else 
		reg_in <= reg_in;
end
wire delayed_load1;
d_flip_flop #(.bits(1)) delay_load1(.d(load1), .reset(rst), .clk(clk), .load(1), .q(delayed_load1));
wire delayed_load2;
d_flip_flop #(.bits(1)) delay_load2(.d(load2), .reset(rst), .clk(clk), .load(1), .q(delayed_load2));
d_flip_flop #(.bits(8)) reg_out(.d(reg_in), .reset(rst), .clk(clk), .load(delayed_load1 | delayed_load2), .q(out));


endmodule