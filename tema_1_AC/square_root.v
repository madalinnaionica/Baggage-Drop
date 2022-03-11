`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:42 11/09/2021 
// Design Name: 
// Module Name:    square_root 
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
module square_root( 
	 output [15:0] out,
    input  [7:0] in );
	 
	 reg [15:0] i;
	 reg [15:0] calculated_out;
	 reg [15:0] base_number;
	 reg [31:0] out_prod;
	 reg [31:0] calculated_input;
	 
	 always @(*) begin
       base_number[15] = 1;
		 base_number[14:0] = 0;
       calculated_out = 0 ;
		 calculated_input=in<<16;
       for (i = 1; i <= 16; i = i+1) begin
       calculated_out  =  base_number + calculated_out;
		 out_prod = calculated_out * calculated_out;
        if  (out_prod > calculated_input ) begin
        calculated_out = calculated_out - base_number ;  // base should not have been added, so we substract again
        end
		  // calculated_out = (out_prod > calculated_input ) ? (calculated_out - base_number) : 0;
         base_number= base_number >> 1 ;      // shift 1 digit to the right = divide by 
         end
	 end

assign out=calculated_out;

endmodule
