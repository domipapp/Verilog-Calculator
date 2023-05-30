`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:22:03 03/22/2023 
// Design Name: 
// Module Name:    cmd_interp_FSM 
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
module cmd_interp_FSM(
    input rst,
    input clk,
    input got_dig,
    input got_op,
    input got_eq,
    input got_esc,
    output load_A1,
    output load_A2,
    output load_B1,
    output load_B2,
    output load_cmd,
    output rdy,
	 output reset_registers
    );

localparam START = 3'b000, OPA1 = 3'b001, OPA2 = 3'b010, OPERATION = 3'b011, OPB1 = 3'b100, OPB2 = 3'b101, EQ = 3'b110;
reg [2:0] state = START;
reg [2:0] next_state;

//Állapotregiszter:
always@(posedge clk)begin
	if(rst) state <= START;
	else state <= next_state;
end
//Következo állapot logika:
always@(*)
	case(state)
		START: 	if(got_dig) next_state <= OPA1;
						else next_state <= START;
		OPA1: 	if(got_dig) next_state <= OPA2;
						else if(got_op) next_state <= OPERATION;
						else if(got_esc) next_state <= START;
						else next_state <= OPA1;
		OPA2: 	if(got_op) next_state <= OPERATION;
						else if(got_esc) next_state <= START;
						else next_state <= OPA2;
		OPERATION:	if(got_dig) next_state <= OPB1;
							else if(got_esc) next_state <= START;
							else next_state <= OPERATION;
		OPB1:		if(got_dig) next_state <= OPB2;
						else if(got_eq) next_state <= EQ;
						else if(got_esc) next_state <= START;
						else next_state <= OPB1;
		OPB2: 	if(got_eq) next_state <= EQ;
						else if(got_esc) next_state <= START;
						else next_state <= OPB2;
		EQ:		if(got_dig) next_state <= OPA1;
						else if(got_esc) next_state <= START;
						else next_state <= EQ;
	endcase

//minden jel felfutó élére 1 órajel hosszú impulzust generálunk
posedge_detect posedge_detect_OPA1(.in(state == OPA1), .clk(clk), .rst(rst), .out(load_A1));
posedge_detect posedge_detect_OPA2(.in(state == OPA2), .clk(clk), .rst(rst), .out(load_A2));
posedge_detect posedge_detect_OPERATION(.in(state == OPERATION), .clk(clk), .rst(rst), .out(load_cmd));
posedge_detect posedge_detect_OPB1(.in(state == OPB1), .clk(clk), .rst(rst), .out(load_B1));
posedge_detect posedge_detect_OPB2(.in(state == OPB2), .clk(clk), .rst(rst), .out(load_B2));
posedge_detect posedge_detect_EQ(.in(state == EQ), .clk(clk), .rst(rst), .out(rdy));

//ha a következõ állapot az A operandus betöltése lesz, akkor elõõt minden regisztert törlünk, mert új mûveletsor jön
//és ilyenkor 0000 registereket kell mutatni a kijelzõn
posedge_detect posedge_detect_next_state_OPA1(.in(next_state == OPA1), .clk(clk), .rst(rst), .out(reset_registers));
endmodule
