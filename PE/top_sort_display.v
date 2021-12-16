`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/16 21:23:40
// Design Name: 
// Module Name: top_sort_display
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


module top_sort_display(
    input clk,
	input rst_n,
	//input signed [15:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,
	input signed [159:0] data,
	input load,
	output complete,   // 完成信号
	output [3:0] index,  // 排序后最大数的索引
    //output signed [15:0] data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8,data_out9,
    output signed [159:0] data_out,
    output [6:0] display
    );
    
    num_sort num_sort_inst(
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
	   
    display_7 display_7_inst(
           .result(index),
           .display(display)       
       );
endmodule
