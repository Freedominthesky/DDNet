`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/14 14:43:47
// Design Name: 
// Module Name: matrix_vector_sel
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


module matrix_vector_sel(clk,rst,Matrix,Matrix_sel,
//Matrix_col_0,Matrix_col_1,Matrix_col_2,Matrix_col_3,Matrix_col_4,Matrix_col_5,
//Matrix_col_6,Matrix_col_7,Matrix_col_8,Matrix_col_9,Matrix_col_10,Matrix_col_11,Matrix_col_12,Matrix_col_13,Matrix_col_14,
//Matrix_col_15,
finish);
    input clk;
    input rst;
    input signed [4095:0] Matrix;//the data is column-wise stored when impementing matrix mux and row-wise stored when implementing dot
    
//    output signed [255:0] Matrix_col_0;
//    output signed [255:0] Matrix_col_1;
//    output signed [255:0] Matrix_col_2;
//    output signed [255:0] Matrix_col_3;
//    output signed [255:0] Matrix_col_4;
//    output signed [255:0] Matrix_col_5;
//    output signed [255:0] Matrix_col_6;
//    output signed [255:0] Matrix_col_7;
//    output signed [255:0] Matrix_col_8;
//    output signed [255:0] Matrix_col_9;
//    output signed [255:0] Matrix_col_10;
//    output signed [255:0] Matrix_col_11;
//    output signed [255:0] Matrix_col_12;
//    output signed [255:0] Matrix_col_13;
//    output signed [255:0] Matrix_col_14;
//    output signed [255:0] Matrix_col_15;
    
    output signed [255:0] Matrix_sel;
    output finish;
    
    reg signed [255:0] Matrix_col_tmp_0;
    reg signed [255:0] Matrix_col_tmp_1;
    reg signed [255:0] Matrix_col_tmp_2;
    reg signed [255:0] Matrix_col_tmp_3;
    reg signed [255:0] Matrix_col_tmp_4;
    reg signed [255:0] Matrix_col_tmp_5;
    reg signed [255:0] Matrix_col_tmp_6;
    reg signed [255:0] Matrix_col_tmp_7;
    reg signed [255:0] Matrix_col_tmp_8;
    reg signed [255:0] Matrix_col_tmp_9;
    reg signed [255:0] Matrix_col_tmp_10;
    reg signed [255:0] Matrix_col_tmp_11;
    reg signed [255:0] Matrix_col_tmp_12;
    reg signed [255:0] Matrix_col_tmp_13;
    reg signed [255:0] Matrix_col_tmp_14;
    reg signed [255:0] Matrix_col_tmp_15;
    
    reg signed [255:0] Matrix_sel_tmp;
    integer finish_tmp;
    reg [3:0] cnt;//ctrl the row select  
    
    initial 
    begin
        finish_tmp=1'b0;
        cnt=4'd0;
    end
    
    always@(posedge clk)
    begin
        if (rst)
        begin
            Matrix_col_tmp_0<=256'd0;
            Matrix_col_tmp_1<=256'd0;
            Matrix_col_tmp_2<=256'd0;
            Matrix_col_tmp_3<=256'd0;
            Matrix_col_tmp_4<=256'd0;
            Matrix_col_tmp_5<=256'd0;
            Matrix_col_tmp_6<=256'd0;
            Matrix_col_tmp_7<=256'd0;
            Matrix_col_tmp_8<=256'd0;
            Matrix_col_tmp_9<=256'd0;
            Matrix_col_tmp_10<=256'd0;
            Matrix_col_tmp_11<=256'd0;
            Matrix_col_tmp_12<=256'd0;
            Matrix_col_tmp_13<=256'd0;
            Matrix_col_tmp_14<=256'd0;
            Matrix_col_tmp_15<=256'd0;
            
            Matrix_sel_tmp<=256'd0;
            
            cnt<=4'd0;
        end else 
        begin
            {Matrix_col_tmp_0,Matrix_col_tmp_1,Matrix_col_tmp_2,Matrix_col_tmp_3,Matrix_col_tmp_4,Matrix_col_tmp_5,
            Matrix_col_tmp_6,Matrix_col_tmp_7,Matrix_col_tmp_8,Matrix_col_tmp_9,
            Matrix_col_tmp_10,Matrix_col_tmp_11,Matrix_col_tmp_12,Matrix_col_tmp_13,Matrix_col_tmp_14,Matrix_col_tmp_15} <= Matrix;
            
            
            case(cnt)
            0:begin
                Matrix_sel_tmp<=Matrix_col_tmp_0;
            end
            1:begin
                Matrix_sel_tmp<=Matrix_col_tmp_1;           
            end
            2:begin
                Matrix_sel_tmp<=Matrix_col_tmp_2;
            end
            3:begin
                Matrix_sel_tmp<=Matrix_col_tmp_3;
            end
            4:begin
                Matrix_sel_tmp<=Matrix_col_tmp_4;
            end
            5:begin
                Matrix_sel_tmp<=Matrix_col_tmp_5;           
            end
            6:begin
                Matrix_sel_tmp<=Matrix_col_tmp_6;
            end
            7:begin
                Matrix_sel_tmp<=Matrix_col_tmp_7;
            end
            8:begin
                Matrix_sel_tmp<=Matrix_col_tmp_8;
            end
            9:begin
                Matrix_sel_tmp<=Matrix_col_tmp_9;           
            end
            10:begin
                Matrix_sel_tmp<=Matrix_col_tmp_10;
            end
            11:begin
                Matrix_sel_tmp<=Matrix_col_tmp_11;           
            end
            12:begin
                Matrix_sel_tmp<=Matrix_col_tmp_12;
            end
            13:begin
                Matrix_sel_tmp<=Matrix_col_tmp_13;
            end
            14:begin
                Matrix_sel_tmp<=Matrix_col_tmp_14;
            end
            15:begin
                Matrix_sel_tmp<=Matrix_col_tmp_15;           
            end
            endcase  
            
            if (cnt==4'd15)  
            begin            
            cnt<=4'd0;
            finish_tmp<=1'b1;   
            end else         
            begin            
            cnt<=cnt+1;   
            end     
            
                           
        end
    end
    
    
//    always @ (clk)
//    begin
//        if (cnt==4'd15)  
//        begin            
//            cnt<=4'd0;   
//        end else         
//        begin            
//            cnt<=cnt+1;   
//        end             
    
//    end
    
//    assign Matrix_col_0=Matrix_col_tmp_0;
//    assign Matrix_col_1=Matrix_col_tmp_1;
//    assign Matrix_col_2=Matrix_col_tmp_2;
//    assign Matrix_col_3=Matrix_col_tmp_3;
//    assign Matrix_col_4=Matrix_col_tmp_4;
//    assign Matrix_col_5=Matrix_col_tmp_5;
//    assign Matrix_col_6=Matrix_col_tmp_6;
//    assign Matrix_col_7=Matrix_col_tmp_7;
//    assign Matrix_col_8=Matrix_col_tmp_8;
//    assign Matrix_col_9=Matrix_col_tmp_9;
//    assign Matrix_col_10=Matrix_col_tmp_10;
//    assign Matrix_col_11=Matrix_col_tmp_11;
//    assign Matrix_col_12=Matrix_col_tmp_12;
//    assign Matrix_col_13=Matrix_col_tmp_13;
//    assign Matrix_col_14=Matrix_col_tmp_14;
//    assign Matrix_col_15=Matrix_col_tmp_15;
    
    assign Matrix_sel=Matrix_sel_tmp;
    assign finish=finish_tmp;
endmodule

