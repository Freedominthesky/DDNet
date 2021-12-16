`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/15 17:33:05
// Design Name: 
// Module Name: num_sort_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module num_sort_sim();
    reg clk;
    reg rst_n;
    //reg signed [15:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9;
    reg signed [159:0] data;
    reg load;
	wire complete;
	wire [3:0] index;
	//wire signed [15:0] data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8,data_out9;
	wire signed [159:0] data_out;
	
	// clk frequency = 10M
	parameter clk_period = 100;
	
	num_sort inst(
	       .clk(clk),
	       .rst_n(rst_n),
	       /*
	       .data0(data0),
	       .data1(data1),
	       .data2(data2),
	       .data3(data3),
	       .data4(data4),
	       .data5(data5),
	       .data6(data6),
	       .data7(data7),
	       .data8(data8),
	       .data9(data9),
	       */
	       .data(data),
	       .load(load),
	       .complete(complete),
	       .index(index),
	       /*
	       .data_out0(data_out0),
	       .data_out1(data_out1),
	       .data_out2(data_out2),
	       .data_out3(data_out3),
	       .data_out4(data_out4),
	       .data_out5(data_out5),
	       .data_out6(data_out6),
	       .data_out7(data_out7),
	       .data_out8(data_out8),
	       .data_out9(data_out9)
	       */
	       .data_out(data_out)
	   );
	   
	initial
	begin
	   clk = 1'b0;
	   forever #(clk_period / 2) clk = ~clk;
	end
	
	initial
	begin
	   rst_n = 1'b0;
	   load = 1'b0;
	   /*
	   data0 = 16'd9;
       data1 = 16'd8;
       data2 = 16'd7;
       data3 = 16'd6;    
       data4 = 16'd5;
       data5 = 16'd4;    
       data6 = 16'd3;
       data7 = 16'd2;    
       data8 = 16'd1;
       data9 = 16'd0;
       */
       //data = 160'h0009_0008_0007_0006_0005_0004_0003_0002_0001_0000;
       //data = 160'h0006_0008_0007_0009_0005_0004_0003_0002_0001_0000;
       data = 160'h0006_0008_0007_0000_0005_0009_0003_0002_0001_0004;
	   #50 rst_n = 1'b1;
	   load = 1'b1;
	   #150 load = 1'b0;
	   
	   /*
	   #1500 data = 160'h0006_0008_0007_0009_0005_0004_0003_0002_0001_0000;
	   #50 load = 1'b1;
	   #150 load = 1'b0;
	   */
	end
	
endmodule
