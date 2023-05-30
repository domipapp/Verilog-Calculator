`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:17:28 03/22/2023 
// Design Name: 
// Module Name:    cmd_interp 
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
module cmd_interp(
    input start,
    input [7:0] data,
    input rst,
    input clk,
    output [7:0] debug,
    output rdy,
    output [7:0] op_A,
    output [7:0] op_B,
    output [3:0] cmd
    );
	 	 
//új adat esetén dekódolja milyen típusú adat jött és 1 órajel hosszú got_xy jelet generál
wire got_dig, got_op, got_eq, got_esc;//milyen típusú adat jött
cmd_interp_decoder decoder(.clk(clk), .rst(rst),.start(start), .data(data), .got_dig(got_dig), .got_op(got_op), .got_eq(got_eq), .got_esc(got_esc));

//vezérlõ modul, 1 órajel hosszú vezérlõjeleket generál
wire load_A1, load_A2, load_B1, load_B2, load_cmd, reset_registers;//vezérlõ jelek
wire internal_rdy;//belsõ ready, majd késleltetni kell
cmd_interp_FSM FSM(.clk(clk), .rst(rst), .got_dig(got_dig), .got_op(got_op), .got_eq(got_eq), .got_esc(got_esc), .load_A1(load_A1),
						 .load_A2(load_A2), .load_B1(load_B1), .load_B2(load_B2), .load_cmd(load_cmd), .rdy(internal_rdy), .reset_registers(reset_registers));

//elmenti milyen mûveletet kell majd elvégezni és = vagy enter esetén a következõ bejövõ számjegyig a kimenetén tartja
cmd_interp_cmd cmd_interp_cmd(.clk(clk), .rst(rst), .load_cmd(load_cmd), .rdy(rdy), .got_dig(got_dig), .data(data), .out(cmd));

//2 digitbõl egy számot generál, után érvényes lesz az A operandus
//nullázni kell, ha új mûveletsor jön, mert 00-t kell kiírnia amíg nincs bemenet
cmd_interp_out_reg A(.clk(clk), .rst(rst|reset_registers), .in({4'h0, data[3:0]}), .load1(load_A1), .load2(load_A2), .out(op_A));

//2 digitbõl egy számot generál
//nullázni kell, ha új mûveletsor jön, mert 00-t kell kiírnia amíg nincs bemenet
cmd_interp_out_reg B(.clk(clk), .rst(rst|reset_registers), .in({4'h0, data[3:0]}), .load1(load_B1), .load2(load_B2), .out(op_B));

//rdy késleltetés div számára, még nem látja az érvényes operandusokat ha ez nincs itt
d_flip_flop #(.bits(1)) rdy_delay(.d(internal_rdy), .reset(rst), .clk(clk), .load(1), .q(rdy));

//debug
//assign debug =  cmd;

endmodule
