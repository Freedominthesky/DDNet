`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/12/18 11:08
// Design Name:
// Module Name: dot_product_16bit
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

module top_16x16 (input clk,
                  input rst,
                  input en,
                  input signed [255:0] ai,
                  input signed [4095:0] Matrix,
                  output reg signed [255:0] psum,
                  output reg finish);
    
    wire signed [15:0] psum_col_0;
    wire signed [15:0] psum_col_1;
    wire signed [15:0] psum_col_2;
    wire signed [15:0] psum_col_3;
    wire signed [15:0] psum_col_4;
    wire signed [15:0] psum_col_5;
    wire signed [15:0] psum_col_6;
    wire signed [15:0] psum_col_7;
    wire signed [15:0] psum_col_8;
    wire signed [15:0] psum_col_9;
    wire signed [15:0] psum_col_10;
    wire signed [15:0] psum_col_11;
    wire signed [15:0] psum_col_12;
    wire signed [15:0] psum_col_13;
    wire signed [15:0] psum_col_14;
    wire signed [15:0] psum_col_15;
    
   
    
    wire signed [255:0] Matrix_0;
    wire signed [255:0] Matrix_1;
    wire signed [255:0] Matrix_2;
    wire signed [255:0] Matrix_3;
    wire signed [255:0] Matrix_4;
    wire signed [255:0] Matrix_5;
    wire signed [255:0] Matrix_6;
    wire signed [255:0] Matrix_7;
    wire signed [255:0] Matrix_8;
    wire signed [255:0] Matrix_9;
    wire signed [255:0] Matrix_10;
    wire signed [255:0] Matrix_11;
    wire signed [255:0] Matrix_12;
    wire signed [255:0] Matrix_13;
    wire signed [255:0] Matrix_14;
    wire signed [255:0] Matrix_15;

    wire finish_sel;
    wire finish_dot_0;
    wire finish_dot_1;
    wire finish_dot_2;
    wire finish_dot_3;
    wire finish_dot_4;
    wire finish_dot_5;
    wire finish_dot_6;
    wire finish_dot_7;
    wire finish_dot_8;
    wire finish_dot_9;
    wire finish_dot_10;
    wire finish_dot_11;
    wire finish_dot_12;
    wire finish_dot_13;
    wire finish_dot_14;
    wire finish_dot_15;
    
    initial
    begin
        finish<=1'b0;
        psum<=256'd0;
    end
    matrix_sel_new matrix_inst(
    .clk(clk),
    .rst(rst),
    .en(en),
    .Matrix(Matrix),
    .Matrix_0(Matrix_0),
    .Matrix_1(Matrix_1),
    .Matrix_2(Matrix_2),
    .Matrix_3(Matrix_3),
    .Matrix_4(Matrix_4),
    .Matrix_5(Matrix_5),
    .Matrix_6(Matrix_6),
    .Matrix_7(Matrix_7),
    .Matrix_8(Matrix_8),
    .Matrix_9(Matrix_9),
    .Matrix_10(Matrix_10),
    .Matrix_11(Matrix_11),
    .Matrix_12(Matrix_12),
    .Matrix_13(Matrix_13),
    .Matrix_14(Matrix_14),
    .Matrix_15(Matrix_15),
    .finish(finish_sel)
    );
    
    vec_dot vec_dot_r0(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_0),
    .dot_out(psum_col_0),
    .finish(finish_dot_0)
    );

    vec_dot vec_dot_r1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_1),
    .dot_out(psum_col_1),
    .finish(finish_dot_1)
    );

    vec_dot vec_dot_r2(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_2),
    .dot_out(psum_col_2),
    .finish(finish_dot_2)
    );

    vec_dot vec_dot_r3(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_3),
    .dot_out(psum_col_3),
    .finish(finish_dot_3)
    ); 

    vec_dot vec_dot_r4(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_4),
    .dot_out(psum_col_4),
    .finish(finish_dot_4)
    );

    vec_dot vec_dot_r5(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_5),
    .dot_out(psum_col_5),
    .finish(finish_dot_5)
    );    

    vec_dot vec_dot_r6(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_6),
    .dot_out(psum_col_6),
    .finish(finish_dot_6)
    );

    vec_dot vec_dot_r7(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_7),
    .dot_out(psum_col_7),
    .finish(finish_dot_7)
    ); 

    vec_dot vec_dot_r8(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_8),
    .dot_out(psum_col_8),
    .finish(finish_dot_8)
    );

    vec_dot vec_dot_r9(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_9),
    .dot_out(psum_col_9),
    .finish(finish_dot_9)
    );   

    vec_dot vec_dot_r10(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_10),
    .dot_out(psum_col_10),
    .finish(finish_dot_10)
    );

    vec_dot vec_dot_r11(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_11),
    .dot_out(psum_col_11),
    .finish(finish_dot_11)
    );

    vec_dot vec_dot_r12(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_12),
    .dot_out(psum_col_12),
    .finish(finish_dot_12)
    );

    vec_dot vec_dot_r13(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_13),
    .dot_out(psum_col_13),
    .finish(finish_dot_13)
    );  

    vec_dot vec_dot_r14(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_14),
    .dot_out(psum_col_14),
    .finish(finish_dot_14)
    );

    vec_dot vec_dot_r15(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vec_a(ai),
    .vec_b(Matrix_15),
    .dot_out(psum_col_15),
    .finish(finish_dot_15)
    ); 

    always @(*) begin
            psum<={psum_col_0,psum_col_1,psum_col_2,psum_col_3,psum_col_4,psum_col_5,psum_col_6,psum_col_7,psum_col_8,psum_col_9,psum_col_10,psum_col_11,psum_col_12,psum_col_13,psum_col_14,psum_col_15};
    end
    always @(posedge clk) begin
        if (rst) begin
        finish <=1'b0;
        psum<=256'd0;        
        end
        else if (en) begin
//        psum<={psum_col_0,psum_col_1,psum_col_2,psum_col_3,psum_col_4,psum_col_5,psum_col_6,psum_col_7,psum_col_8,psum_col_9,psum_col_10,psum_col_11,psum_col_12,psum_col_13,psum_col_14,psum_col_15};
            if (finish_dot_0) begin
            finish<=1'b1;
            end
        end
        else begin
        finish <=1'b0;
        psum<=256'd0;
        end
    end
endmodule //top_16x16
