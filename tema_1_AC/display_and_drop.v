`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:47 11/10/2021 
// Design Name: 
// Module Name:    display_and_drop 
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
module display_and_drop(
	output  reg [6 : 0]   seven_seg1, 
   output  reg [6 : 0]   seven_seg2,
   output  reg [6 : 0]   seven_seg3,
   output reg  [6 : 0]   seven_seg4,
   output reg  [0 : 0]   drop_activated,
   input       [15: 0]   t_act,
   input       [15: 0]   t_lim,
   input                 drop_en);
	 
	 always@(*) begin
	 
	 drop_activated= (t_act <= t_lim && !drop_en) ? 0 : ( (t_act <= t_lim && drop_en) ?  1 : (t_act > t_lim && drop_en) ? 0 : 0);
	 seven_seg1 = (t_act <= t_lim && !drop_en) ? 7'b011_1001 : ( (t_act <= t_lim && drop_en == 1) ?  7'b101_1110 : (t_act > t_lim && drop_en) ? 7'b000_0000 : 0);
	 seven_seg2 = (t_act <= t_lim && !drop_en) ? 7'b101_1100 : ( (t_act <= t_lim && drop_en == 1) ?  7'b101_0000 : (t_act > t_lim && drop_en) ? 7'b111_0110 : 0);
    seven_seg3 = (t_act <= t_lim && !drop_en) ? 7'b011_1000 : ( (t_act <= t_lim && drop_en == 1) ?  7'b101_1100 : (t_act > t_lim && drop_en) ? 7'b101_1100 : 0);			
	 seven_seg4 = (t_act <= t_lim && !drop_en) ? 7'b101_1110 : ( (t_act <= t_lim && drop_en == 1) ?  7'b111_0011 : (t_act > t_lim && drop_en) ? 7'b111_1000 : 0);				
    
	 end
	 
endmodule
