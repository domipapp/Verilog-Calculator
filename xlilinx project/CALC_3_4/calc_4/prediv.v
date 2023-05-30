`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:28 03/08/2023 
// Design Name: 
// Module Name:    prediv 
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
module prediv(
	input rst, clk,
	output full
    );
	
	reg [15:0] cnt;
	
always @ (posedge clk)begin
	if (rst | cnt == 39999)
		cnt <= 0;
	else
		cnt <= cnt +1;
end
	assign full = (cnt == 39999);

endmodule
