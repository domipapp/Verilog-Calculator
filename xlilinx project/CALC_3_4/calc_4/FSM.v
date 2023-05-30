`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:05:27 03/01/2023 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
		input clk,
		input start,
		input a_lower_than_b,
		input is_b_zero,
		input reset,
		output first_cycle,
		output update,
		output error,
		output ready
    );

localparam IDLE = 1'b0, WORK = 1'b1;
reg curr_state, next_state;

//Állapotregiszter:
always@(posedge clk) begin
	if(reset) curr_state <= IDLE;
		else curr_state <= next_state;
end

//Következo állapot logika:
always@(*) begin
	case(curr_state)
		IDLE: if(start && !is_b_zero) next_state <= WORK;
					else next_state <= IDLE;
		WORK: if(!a_lower_than_b) next_state <= WORK;
					else next_state <= IDLE;
	endcase
end

//Kimeneti logika (vezérlo jelek):
assign first_cycle = (curr_state == IDLE)&start&(~is_b_zero);
assign update = (curr_state == WORK)&~a_lower_than_b;
//státus jelek:
assign ready = (((curr_state == WORK)&a_lower_than_b) | ((curr_state == IDLE)&start&is_b_zero));
assign error = (curr_state == IDLE)&start&is_b_zero;

endmodule
