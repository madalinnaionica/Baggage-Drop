`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:21 11/10/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(
   output   [7 : 0]   height,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4);
  
	reg [15:0] calculated_height;
	reg [15:0] calculated_height_1;
	reg [15:0] calculated_height_2;
	reg [15:0] sensors_sum;
	reg [15:0] sensors_sum_1;
	reg [15:0] sensors_sum_2;
	
	always @(*) begin
		sensors_sum = 0;
		
		if (sensor1 == 0 && sensor2 != 0 && sensor3 != 0 && sensor4 != 0) begin
			sensors_sum = sensor2 + sensor4;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
		
		if (sensor1 == 0 && sensor2 != 0 && sensor3 == 0 && sensor4 != 0) begin
			sensors_sum = sensor2 + sensor4;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
		
		
		if (sensor1 != 0 && sensor2 == 0 && sensor3 != 0 && sensor4 != 0) begin
			sensors_sum = sensor1 + sensor3;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
		
		if (sensor1 != 0 && sensor2 == 0 && sensor3 != 0 && sensor4 == 0) begin
			sensors_sum = sensor1 + sensor3;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
		
		
	   if (sensor1 != 0 && sensor2 != 0 && sensor3 == 0 && sensor4 != 0) begin
			sensors_sum = sensor2 + sensor4;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
	
		
		if (sensor1 != 0 && sensor2 != 0 && sensor3 != 0 && sensor4 == 0) begin
			sensors_sum = sensor1 + sensor3;
			calculated_height= (sensors_sum[0]==0) ? (sensors_sum>>1) : ((sensors_sum>>1)+1);
		end 
		
		
		if (sensor1 != 0 && sensor2 != 0 && sensor3 != 0 && sensor4 != 0) begin
			sensors_sum_1 = sensor1 + sensor3;
			sensors_sum_2 = sensor2 + sensor4;
			
			calculated_height_1 = (sensors_sum_1[0]==0) ? (sensors_sum_1>>1): ((sensors_sum_1>>1)+1);
			calculated_height_2 = (sensors_sum_2[0]==0) ? (sensors_sum_2>>1): ((sensors_sum_2>>1)+1);
			calculated_height =(calculated_height_1 + calculated_height_2)>>1;
			 
		end
		
	end
	  
	assign height = calculated_height;

endmodule
