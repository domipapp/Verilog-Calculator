`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:31 03/07/2023 
// Design Name: 
// Module Name:    hox_to_7seg 
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
module hex_to_7seg(
		input [3:0] hex_dig,
		input error, blank,
		output [6:0] seg
    );

reg [7:0] seg_n;

// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3

always @(hex_dig, blank, error)begin
		if (blank)//üres esetén tiltja
			seg_n <= 7'h7f;
		else if (error)//error esetén E
			seg_n <= 7'h06;
		else
			case (hex_dig)
				 4'b0001 : seg_n <= 7'b1111001;   // 1
				 4'b0010 : seg_n <= 7'b0100100;   // 2
				 4'b0011 : seg_n <= 7'b0110000;   // 3
				 4'b0100 : seg_n <= 7'b0011001;   // 4
				 4'b0101 : seg_n <= 7'b0010010;   // 5
				 4'b0110 : seg_n <= 7'b0000010;   // 6
				 4'b0111 : seg_n <= 7'b1111000;   // 7
				 4'b1000 : seg_n <= 7'b0000000;   // 8
				 4'b1001 : seg_n <= 7'b0010000;   // 9
				 4'b1010 : seg_n <= 7'b0001000;   // A
				 4'b1011 : seg_n <= 7'b0000011;   // b
				 4'b1100 : seg_n <= 7'b1000110;   // C
				 4'b1101 : seg_n <= 7'b0100001;   // d
				 4'b1110 : seg_n <= 7'b0000110;   // E
				 4'b1111 : seg_n <= 7'b0001110;   // F
				 default : seg_n <= 7'b1000000;   // 0
			endcase
	end

assign seg = seg_n;

endmodule
