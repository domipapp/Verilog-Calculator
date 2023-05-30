`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:22 03/07/2023 
// Design Name: 
// Module Name:    MPX_6_4_1 
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
module MPX6_4_1(
	input [3:0] num0, num1, num2, num3, S,
	input err0, err1, err2, err3,
	input blank0, blank1, blank2, blank3,
	input dec_point0, dec_point1, dec_point2, dec_point3,
	output reg [3:0] selected_num,
	output reg selected_dec_point, selected_error, selected_blank
    );

always @ (*)
	case (S)
		4'b0001	:	begin selected_num <= num0; selected_error <= err0; selected_blank <= blank0; selected_dec_point <= dec_point0; end
		4'b0010	:	begin selected_num <= num1; selected_error <= err1; selected_blank <= blank1; selected_dec_point <= dec_point1; end
		4'b0100	:	begin selected_num <= num2; selected_error <= err2; selected_blank <= blank2; selected_dec_point <= dec_point2; end
		4'b1000	:	begin selected_num <= num3; selected_error <= err3; selected_blank <= blank3; selected_dec_point <= dec_point3; end
		default	: 	begin selected_num <= num0; selected_error <= err0; selected_blank <= blank0;	selected_dec_point <= dec_point0; end
	endcase

endmodule
