`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/15 16:05:51
// Design Name: 
// Module Name: num_sort
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

module num_sort(
	input clk,
	input rst_n,
	//input signed [15:0] data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,
	input signed [159:0] data,
	input load,
	output complete,   // 完成信号
	output [3:0] index,  // 排序后最大数的索引
    //output signed [15:0] data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7,data_out8,data_out9,
    output signed [159:0] data_out
	);
	
	reg signed [15:0] data_tmp [0:9];
    //reg signed [15:0] data_out0, data_out1, data_out2, data_out3, data_out4, data_out5, data_out6, data_out7, data_out8, data_out9;	
    reg signed [15:0] data_out_tmp [0:9];
    assign data_out = {data_out_tmp[0],
                       data_out_tmp[1],
                       data_out_tmp[2],
                       data_out_tmp[3],
                       data_out_tmp[4],
                       data_out_tmp[5],
                       data_out_tmp[6],
                       data_out_tmp[7],
                       data_out_tmp[8],
                       data_out_tmp[9]       
                    };
    
    parameter idle=2'b00,
    		   loading=2'b01,
    		   sorting=2'b10,
    		   comp=2'b11;
    reg [1:0] state, nstate;
    reg [3:0] cnt;
    reg signal;
    reg [3:0] index;
    reg [3:0] i;
    
    // 状态转换
    always@(posedge clk or negedge rst_n)
    begin
    	if(!rst_n)
    		state<=idle;
    	else 
    		state<=nstate;
    end
    		
    // 计数cnt， 10个数据需要排序9个时钟周期；	
    always@(posedge clk or negedge rst_n)
    begin
    	if(!rst_n)
    		cnt<=0;
    	else case(state)
    	   sorting: cnt<=cnt+1;
    	   default: cnt<=0;
    	endcase
    end
    
    // 排序，若相邻数，前者大于后者，交换；	
    always@(posedge clk or negedge rst_n)
    begin
    	if(!rst_n)
    	begin
            data_out_tmp[0] <= 0;
            data_out_tmp[1] <= 0;
            data_out_tmp[2] <= 0;
            data_out_tmp[3] <= 0;    
            data_out_tmp[4] <= 0;
            data_out_tmp[5] <= 0;    
            data_out_tmp[6] <= 0;
            data_out_tmp[7] <= 0;    
            data_out_tmp[8] <= 0;
            data_out_tmp[9] <= 0;
            
            data_tmp[0] <= 0;
            data_tmp[1] <= 0;
            data_tmp[2] <= 0;
            data_tmp[3] <= 0;    
            data_tmp[4] <= 0;
            data_tmp[5] <= 0;    
            data_tmp[6] <= 0;
            data_tmp[7] <= 0;    
            data_tmp[8] <= 0;
            data_tmp[9] <= 0;
            
            signal <= 1'b0;
            index <= 4'b0000;
            i <= 4'b0000;
    	end
    	else if(load)
    	begin
    	    data_tmp[0] <= data[159:144];
            data_tmp[1] <= data[143:128];
            data_tmp[2] <= data[127:112];
            data_tmp[3] <= data[111:96];    
            data_tmp[4] <= data[95:80];
            data_tmp[5] <= data[79:64];    
            data_tmp[6] <= data[63:48];
            data_tmp[7] <= data[47:32];    
            data_tmp[8] <= data[31:16];
            data_tmp[9] <= data[15:0];
            signal      <= 1'b1;
            
            if (signal == 1'b1)
            begin
    		    data_out_tmp[0] <= data_tmp[0];
                data_out_tmp[1] <= data_tmp[1];
                data_out_tmp[2] <= data_tmp[2];
                data_out_tmp[3] <= data_tmp[3];    
                data_out_tmp[4] <= data_tmp[4];
                data_out_tmp[5] <= data_tmp[5];    
                data_out_tmp[6] <= data_tmp[6];
                data_out_tmp[7] <= data_tmp[7];    
                data_out_tmp[8] <= data_tmp[8];
                data_out_tmp[9] <= data_tmp[9];
                signal          <= 1'b0;
            end
        end	
    	else 
    	begin
    	   if(data_out_tmp[0]>data_out_tmp[1] && cnt[0]==0)		// 不能同时对data_out1赋值，需要条件将相邻两次分开
    	   begin
    	   	   data_out_tmp[1]<=data_out_tmp[0];
    	   	   data_out_tmp[0]<=data_out_tmp[1];
    	   end
    	   if(data_out_tmp[1]>data_out_tmp[2] && cnt[0]==1)
    	   begin
    	       data_out_tmp[1]<=data_out_tmp[2];
    	   	   data_out_tmp[2]<=data_out_tmp[1];
    	   end	  	   	
    	   if(data_out_tmp[2]>data_out_tmp[3] && cnt[0]==0)
    	   begin
    	   	   data_out_tmp[2]<=data_out_tmp[3];
    	   	   data_out_tmp[3]<=data_out_tmp[2];
    	   end	
    	   if(data_out_tmp[3]>data_out_tmp[4] && cnt[0]==1)
    	   begin
    	   	   data_out_tmp[3]<=data_out_tmp[4];
    	   	   data_out_tmp[4]<=data_out_tmp[3];
    	   end	
    	   if(data_out_tmp[4]>data_out_tmp[5] && cnt[0]==0)
    	   begin
    	   	   data_out_tmp[4]<=data_out_tmp[5];
    	   	   data_out_tmp[5]<=data_out_tmp[4];
    	   end
    	   if(data_out_tmp[5]>data_out_tmp[6] && cnt[0]==1)
    	   begin
    	       data_out_tmp[5]<=data_out_tmp[6];
    	   	   data_out_tmp[6]<=data_out_tmp[5];
    	   end
    	   if(data_out_tmp[6]>data_out_tmp[7] && cnt[0]==0)
    	   begin
    	   	   data_out_tmp[6]<=data_out_tmp[7];
    	   	   data_out_tmp[7]<=data_out_tmp[6];
    	   end
    	   if(data_out_tmp[7]>data_out_tmp[8] && cnt[0]==1)
    	   begin
    	       data_out_tmp[8]<=data_out_tmp[7];
    	   	   data_out_tmp[7]<=data_out_tmp[8];
    	   end
    	   if(data_out_tmp[8]>data_out_tmp[9] && cnt[0]==0)
    	   begin
    	   	   data_out_tmp[8]<=data_out_tmp[9];
    	   	   data_out_tmp[9]<=data_out_tmp[8];
    	   end
        end
    end
    
    always @(posedge clk)
    begin
        if (i <= 4'b1001)
        begin
            if (data_tmp[i] == data_out_tmp[9])
            begin
                index <= i;
            end 
            if (i == 4'b1001)
            begin
                i <= 1'b0;
            end else
            begin
                i <= i + 1'b1;
            end
        end 
    end
    	
    // nstate
    always@(*)
    begin
    	case(state)
    	   idle: if(load==1) nstate=loading; else nstate=idle;
    	   loading: nstate=sorting;
    	   sorting: if(cnt>9) nstate=comp; else nstate=sorting;
    	   comp: if(load==1) nstate=loading; else nstate=idle;
    	   default: nstate=idle;
    	endcase
    end
    
    assign complete = (state==comp);	
    
endmodule	