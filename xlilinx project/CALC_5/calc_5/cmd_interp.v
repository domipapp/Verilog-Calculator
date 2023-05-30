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
	 	 
//�j adat eset�n dek�dolja milyen t�pus� adat j�tt �s 1 �rajel hossz� got_xy jelet gener�l
wire got_dig, got_op, got_eq, got_esc;//milyen t�pus� adat j�tt
cmd_interp_decoder decoder(.clk(clk), .rst(rst),.start(start), .data(data), .got_dig(got_dig), .got_op(got_op), .got_eq(got_eq), .got_esc(got_esc));

//vez�rl� modul, 1 �rajel hossz� vez�rl�jeleket gener�l
wire load_A1, load_A2, load_B1, load_B2, load_cmd, reset_registers;//vez�rl� jelek
wire internal_rdy;//bels� ready, majd k�sleltetni kell
cmd_interp_FSM FSM(.clk(clk), .rst(rst), .got_dig(got_dig), .got_op(got_op), .got_eq(got_eq), .got_esc(got_esc), .load_A1(load_A1),
						 .load_A2(load_A2), .load_B1(load_B1), .load_B2(load_B2), .load_cmd(load_cmd), .rdy(internal_rdy), .reset_registers(reset_registers));

//elmenti milyen m�veletet kell majd elv�gezni �s = vagy enter eset�n a k�vetkez� bej�v� sz�mjegyig a kimenet�n tartja
cmd_interp_cmd cmd_interp_cmd(.clk(clk), .rst(rst), .load_cmd(load_cmd), .rdy(rdy), .got_dig(got_dig), .data(data), .out(cmd));

//2 digitb�l egy sz�mot gener�l, ut�n �rv�nyes lesz az A operandus
//null�zni kell, ha �j m�veletsor j�n, mert 00-t kell ki�rnia am�g nincs bemenet
cmd_interp_out_reg A(.clk(clk), .rst(rst|reset_registers), .in({4'h0, data[3:0]}), .load1(load_A1), .load2(load_A2), .out(op_A));

//2 digitb�l egy sz�mot gener�l
//null�zni kell, ha �j m�veletsor j�n, mert 00-t kell ki�rnia am�g nincs bemenet
cmd_interp_out_reg B(.clk(clk), .rst(rst|reset_registers), .in({4'h0, data[3:0]}), .load1(load_B1), .load2(load_B2), .out(op_B));

//rdy k�sleltet�s div sz�m�ra, m�g nem l�tja az �rv�nyes operandusokat ha ez nincs itt
d_flip_flop #(.bits(1)) rdy_delay(.d(internal_rdy), .reset(rst), .clk(clk), .load(1), .q(rdy));

//debug
//assign debug =  cmd;

endmodule
