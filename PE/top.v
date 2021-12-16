`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/14 14:43:47
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// it is the PE basic module for the (1x16)*(16x16)
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk,rst,en,ai,Matrix,psum,finish);
    input clk;
    input rst;
    input en;
    input signed [255:0] ai;
    input signed [4095:0] Matrix;
    output signed [255:0] psum;
    output finish;
    
    wire signed [255:0] Matrix_sel;
    wire signed [15:0] psum_col_tmp;
    
    
    reg signed [15:0] psum_col_0;
    reg signed [15:0] psum_col_1;
    reg signed [15:0] psum_col_2;
    reg signed [15:0] psum_col_3;
    reg signed [15:0] psum_col_4;
    reg signed [15:0] psum_col_5;
    reg signed [15:0] psum_col_6;
    reg signed [15:0] psum_col_7;
    reg signed [15:0] psum_col_8;
    reg signed [15:0] psum_col_9;
    reg signed [15:0] psum_col_10;
    reg signed [15:0] psum_col_11;
    reg signed [15:0] psum_col_12;
    reg signed [15:0] psum_col_13;
    reg signed [15:0] psum_col_14;
    reg signed [15:0] psum_col_15;
    
    reg signed [255:0] psum_tmp;
    
    reg [3:0] cnt;
    
    wire finish_tmp_sel;
    wire finish_tmp_dot;
    
    reg finish_dot;
    reg finish_tmp;
//    reg ready_tmp;
    
    initial
    begin
//       ready_tmp=1'b0;
        finish_dot=1'b0;
    end


    matrix_vector_sel matrix_vector_sel_inst(
    .clk(clk),
    .rst(rst),
    .en(en),
    .ready(finish_dot),
    .Matrix(Matrix),
    .Matrix_sel(Matrix_sel),
    .finish(finish_tmp_sel)     
    );
    
    vec_dot vec_dot_inst(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_sel),
    .dot_out(psum_col_tmp),
    .finish(finish_tmp_dot)
    );
    
      

        
    initial
    begin
        cnt<=4'd0;
        psum_tmp<=256'd0;
        psum_col_0<=16'd0;
        psum_col_1<=16'd0;
        psum_col_2<=16'd0;
        psum_col_3<=16'd0;
        psum_col_4<=16'd0;
        psum_col_5<=16'd0;
        psum_col_6<=16'd0;
        psum_col_7<=16'd0;
        psum_col_8<=16'd0;
        psum_col_9<=16'd0;
        psum_col_10<=16'd0;
        psum_col_11<=16'd0;
        psum_col_12<=16'd0;
        psum_col_13<=16'd0;
        psum_col_14<=16'd0;
        psum_col_15<=16'd0;
        finish_tmp<=1'b0;
    end
    
    always @(posedge clk)
    begin
        finish_dot<=finish_tmp_dot;
    end
    
    //16*  (1x16)*(16x1)
    always @(posedge clk)
    begin
        if(rst)
        begin
            psum_tmp<=256'd0;
            cnt<=4'd0;        
        end else begin
            if(en)
            begin
                case (cnt)
                0:begin
                    psum_col_0<=psum_col_tmp;
                end
                1:begin
                    psum_col_1<=psum_col_tmp;
                end
                2:begin
                    psum_col_2<=psum_col_tmp;
                end
                3:begin
                    psum_col_3<=psum_col_tmp;
                end
                4:begin
                    psum_col_4<=psum_col_tmp;
                end
                5:begin
                    psum_col_5<=psum_col_tmp;
                end
                6:begin
                    psum_col_6<=psum_col_tmp;
                end
                7:begin
                    psum_col_7<=psum_col_tmp;
                end
                8:begin
                    psum_col_8<=psum_col_tmp;
                end
                9:begin
                    psum_col_9<=psum_col_tmp;
                end
                10:begin
                    psum_col_10<=psum_col_tmp;
                end
                11:begin
                    psum_col_11<=psum_col_tmp;
                end
                12:begin
                    psum_col_12<=psum_col_tmp;
                end
                13:begin
                    psum_col_13<=psum_col_tmp;
                end        
                14:begin
                    psum_col_14<=psum_col_tmp;
                end
                15:begin
                    psum_col_15<=psum_col_tmp;
                end
                endcase

                psum_tmp={psum_col_0,psum_col_1,psum_col_2,psum_col_3,psum_col_4,psum_col_5,psum_col_6,psum_col_7,psum_col_8,psum_col_9,psum_col_10,psum_col_11,psum_col_12,psum_col_13,psum_col_14,psum_col_15};                
                if (cnt==4'd15)  
                begin            
                cnt=4'd0;
                    if (finish_tmp_sel==1'b1)
                    begin
                    finish_tmp<=1'b1;  
                    end 
                end else         
                begin            
                 cnt=cnt+4'd1;   
                end
                
//                psum_tmp={psum_col_0,psum_col_1,psum_col_2,psum_col_3,psum_col_4,psum_col_5,psum_col_6,psum_col_7,psum_col_8,psum_col_9,psum_col_10,psum_col_11,psum_col_12,psum_col_13,psum_col_14,psum_col_15};
            end else begin
                cnt<=4'd0;
                psum_tmp<=256'd0;
            end
        end
    end

    assign psum=psum_tmp;
    assign finish=finish_tmp;



endmodule
