`timescale 1ns / 1ps

module matrix_sel_64_top (input clk,
                          input rst,
                          input en,
                          input signed [65535:0] Matrix,      //64x64 Matrix
                          output reg signed [4095:0] PE16_0,
                          output reg signed [4095:0] PE16_1,  //16x16 Matrix
                          output reg signed [4095:0] PE16_2,
                          output reg signed [4095:0] PE16_3,
                          output reg signed [4095:0] PE16_4,
                          output reg signed [4095:0] PE16_5,  //16x16 Matrix
                          output reg signed [4095:0] PE16_6,
                          output reg signed [4095:0] PE16_7,
                          output reg signed [4095:0] PE16_8,
                          output reg signed [4095:0] PE16_9,
                          output reg signed [4095:0] PE16_10,
                          output reg signed [4095:0] PE16_11, //16x16 Matrix
                          output reg signed [4095:0] PE16_12,
                          output reg signed [4095:0] PE16_13,
                          output reg signed [4095:0] PE16_14,
                          output reg signed [4095:0] PE16_15,
                          output reg finish);
    
    wire signed [16383:0] Matrix_c_0;
    wire signed [16383:0] Matrix_c_1;
    wire signed [16383:0] Matrix_c_2;
    wire signed [16383:0] Matrix_c_3;
    wire finish_sel_col_64;

    reg finish_sel_col_64_tmp;
    
    
    wire finish_sel_row_c0;
    wire finish_sel_row_c1;
    wire finish_sel_row_c2;
    wire finish_sel_row_c3;
    
    wire signed [4095:0] PE16_tmp_0;
    wire signed [4095:0] PE16_tmp_1;  //16x16 Matrix
    wire signed [4095:0] PE16_tmp_2;
    wire signed [4095:0] PE16_tmp_3;
    wire signed [4095:0] PE16_tmp_4;
    wire signed [4095:0] PE16_tmp_5;  //16x16 Matrix
    wire signed [4095:0] PE16_tmp_6;
    wire signed [4095:0] PE16_tmp_7;
    wire signed [4095:0] PE16_tmp_8;
    wire signed [4095:0] PE16_tmp_9;
    wire signed [4095:0] PE16_tmp_10;
    wire signed [4095:0] PE16_tmp_11; //16x16 Matrix
    wire signed [4095:0] PE16_tmp_12;
    wire signed [4095:0] PE16_tmp_13;
    wire signed [4095:0] PE16_tmp_14;
    wire signed [4095:0] PE16_tmp_15;
    
    
    matrix_sel_64_col matrix_sel_64_col(
    .clk(clk),
    .en(en),
    .rst(rst),
    .Matrix(Matrix),
    .Matrix_c_0(Matrix_c_0),
    .Matrix_c_1(Matrix_c_1),
    .Matrix_c_2(Matrix_c_2),
    .Matrix_c_3(Matrix_c_3),
    .finish(finish_sel_col_64)
    );
    
    matrix_sel_64_row col_0(
    .clk(clk),
    .en(finish_sel_col_64_tmp),
    .rst(rst),
    .Matrix(Matrix_c_0),
    .PE16_0(PE16_tmp_0),
    .PE16_1(PE16_tmp_1),
    .PE16_2(PE16_tmp_2),
    .PE16_3(PE16_tmp_3),
    .finish(finish_sel_row_c0)
    );
    
    matrix_sel_64_row col_1(
    .clk(clk),
    .en(finish_sel_col_64_tmp),
    .rst(rst),
    .Matrix(Matrix_c_1),
    .PE16_0(PE16_tmp_4),
    .PE16_1(PE16_tmp_5),
    .PE16_2(PE16_tmp_6),
    .PE16_3(PE16_tmp_7),
    .finish(finish_sel_row_c1)
    );
    
    matrix_sel_64_row col_2(
    .clk(clk),
    .en(finish_sel_col_64_tmp),
    .rst(rst),
    .Matrix(Matrix_c_2),
    .PE16_0(PE16_tmp_8),
    .PE16_1(PE16_tmp_9),
    .PE16_2(PE16_tmp_10),
    .PE16_3(PE16_tmp_11),
    .finish(finish_sel_row_c2)
    );
    
    matrix_sel_64_row col_3(
    .clk(clk),
    .en(finish_sel_col_64_tmp),
    .rst(rst),
    .Matrix(Matrix_c_3),
    .PE16_0(PE16_tmp_12),
    .PE16_1(PE16_tmp_13),
    .PE16_2(PE16_tmp_14),
    .PE16_3(PE16_tmp_15),
    .finish(finish_sel_row_c3)
    );
    
    initial begin
        PE16_0  <= 4096'd0;
        PE16_1  <= 4096'd0;
        PE16_2  <= 4096'd0;
        PE16_3  <= 4096'd0;
        PE16_4  <= 4096'd0;
        PE16_5  <= 4096'd0;
        PE16_6  <= 4096'd0;
        PE16_7  <= 4096'd0;
        PE16_8  <= 4096'd0;
        PE16_9  <= 4096'd0;
        PE16_10 <= 4096'd0;
        PE16_11 <= 4096'd0;
        PE16_12 <= 4096'd0;
        PE16_13 <= 4096'd0;
        PE16_14 <= 4096'd0;
        PE16_15 <= 4096'd0;
        finish  <= 1'b0;
        
    end
    
    always @(*)begin
        PE16_0  <= PE16_tmp_0;
        PE16_1  <= PE16_tmp_1;
        PE16_2  <= PE16_tmp_2;
        PE16_3  <= PE16_tmp_3;
        PE16_4  <= PE16_tmp_4;
        PE16_5  <= PE16_tmp_5;
        PE16_6  <= PE16_tmp_6;
        PE16_7  <= PE16_tmp_7;
        PE16_8  <= PE16_tmp_8;
        PE16_9  <= PE16_tmp_9;
        PE16_10 <= PE16_tmp_10;
        PE16_11 <= PE16_tmp_11;
        PE16_12 <= PE16_tmp_12;
        PE16_13 <= PE16_tmp_13;
        PE16_14 <= PE16_tmp_14;
        PE16_15 <= PE16_tmp_15;
        if(finish_sel_col_64) begin
        finish_sel_col_64_tmp<=1'b1;    
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            PE16_0  <= 4096'd0;
            PE16_1  <= 4096'd0;
            PE16_2  <= 4096'd0;
            PE16_3  <= 4096'd0;
            PE16_4  <= 4096'd0;
            PE16_5  <= 4096'd0;
            PE16_6  <= 4096'd0;
            PE16_7  <= 4096'd0;
            PE16_8  <= 4096'd0;
            PE16_9  <= 4096'd0;
            PE16_10 <= 4096'd0;
            PE16_11 <= 4096'd0;
            PE16_12 <= 4096'd0;
            PE16_13 <= 4096'd0;
            PE16_14 <= 4096'd0;
            PE16_15 <= 4096'd0;
            finish  <= 1'b0;
        end
        else if (en & finish_sel_col_64 & finish_sel_row_c0) begin
            finish <= 1'b1;
        end
            
            
            end
            
            endmodule //matrix_sel_64_top
