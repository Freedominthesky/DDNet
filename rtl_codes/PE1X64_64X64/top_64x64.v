`timescale 1ns / 1ps

module top_64x64 (input clk,
                  input rst,
                  input en,
                  input signed [1023:0] ai,        //1x64 vector
                  input signed [65535:0] Matrix,   //64x64 Matrix
                  output reg signed [1023:0] psum, //1x64 vector
                  output reg finish);
    
    
    reg signed [255:0]psum_0;
    reg signed [255:0]psum_1;
    reg signed [255:0]psum_2;
    reg signed [255:0]psum_3;
    
    wire signed [255:0] vector_0;
    wire signed [255:0] vector_1;
    wire signed [255:0] vector_2;
    wire signed [255:0] vector_3;
    wire finish_vector_sel;
    reg finish_vector_sel_tmp;
    
    wire signed [4095:0] PE16_0;
    wire signed [4095:0] PE16_1;  //16x16 Matrix
    wire signed [4095:0] PE16_2;
    wire signed [4095:0] PE16_3;
    wire signed [4095:0] PE16_4;
    wire signed [4095:0] PE16_5;  //16x16 Matrix
    wire signed [4095:0] PE16_6;
    wire signed [4095:0] PE16_7;
    wire signed [4095:0] PE16_8;
    wire signed [4095:0] PE16_9;
    wire signed [4095:0] PE16_10;
    wire signed [4095:0] PE16_11; //16x16 Matrix
    wire signed [4095:0] PE16_12;
    wire signed [4095:0] PE16_13;
    wire signed [4095:0] PE16_14;
    wire signed [4095:0] PE16_15;
    wire finish_matrix_sel;
    reg finish_matrix_sel_tmp;
    
    reg signed [4095:0] PE16_0_tmp;
    reg signed [4095:0] PE16_1_tmp;  //16x16 Matrix
    reg signed [4095:0] PE16_2_tmp;
    reg signed [4095:0] PE16_3_tmp;
    reg signed [4095:0] PE16_4_tmp;
    reg signed [4095:0] PE16_5_tmp;  //16x16 Matrix
    reg signed [4095:0] PE16_6_tmp;
    reg signed [4095:0] PE16_7_tmp;
    reg signed [4095:0] PE16_8_tmp;
    reg signed [4095:0] PE16_9_tmp;
    reg signed [4095:0] PE16_10_tmp;
    reg signed [4095:0] PE16_11_tmp; //16x16 Matrix
    reg signed [4095:0] PE16_12_tmp;
    reg signed [4095:0] PE16_13_tmp;
    reg signed [4095:0] PE16_14_tmp;
    reg signed [4095:0] PE16_15_tmp;
    
    wire signed [255:0]psum_0_0;
    wire signed [255:0]psum_0_1;
    wire signed [255:0]psum_0_2;
    wire signed [255:0]psum_0_3;
    
    wire signed [255:0]psum_1_0;
    wire signed [255:0]psum_1_1;
    wire signed [255:0]psum_1_2;
    wire signed [255:0]psum_1_3;
    
    wire signed [255:0]psum_2_0;
    wire signed [255:0]psum_2_1;
    wire signed [255:0]psum_2_2;
    wire signed [255:0]psum_2_3;
    
    wire signed [255:0]psum_3_0;
    wire signed [255:0]psum_3_1;
    wire signed [255:0]psum_3_2;
    wire signed [255:0]psum_3_3;
    
    wire finish_pe16_0;
    wire finish_pe16_1;
    wire finish_pe16_2;
    wire finish_pe16_3;
    wire finish_pe16_4;
    wire finish_pe16_5;
    wire finish_pe16_6;
    wire finish_pe16_7;
    wire finish_pe16_8;
    wire finish_pe16_9;
    wire finish_pe16_10;
    wire finish_pe16_11;
    wire finish_pe16_12;
    wire finish_pe16_13;
    wire finish_pe16_14;
    wire finish_pe16_15;
    
    vector_sel_64_col vector_sel(
    .clk(clk),
    .en(en),
    .rst(rst),
    .vector(ai),
    .vector_0(vector_0),
    .vector_1(vector_1),
    .vector_2(vector_2),
    .vector_3(vector_3),
    .finish(finish_vector_sel)
    );
    
    matrix_sel_64_top matrix_sel_64_top(
    .clk(clk),
    .en(finish_vector_sel_tmp),
    .rst(rst),
    .Matrix(Matrix),
    .PE16_0(PE16_0),
    .PE16_1(PE16_1),
    .PE16_2(PE16_2),
    .PE16_3(PE16_3),
    .PE16_4(PE16_4),
    .PE16_5(PE16_5),
    .PE16_6(PE16_6),
    .PE16_7(PE16_7),
    .PE16_8(PE16_8),
    .PE16_9(PE16_9),
    .PE16_10(PE16_10),
    .PE16_11(PE16_11),
    .PE16_12(PE16_12),
    .PE16_13(PE16_13),
    .PE16_14(PE16_14),
    .PE16_15(PE16_15),
    .finish(finish_matrix_sel)
    );
    
    top_16x16 top_16x16_PE0(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_0),
    .Matrix(PE16_0_tmp),
    .psum(psum_0_0),
    .finish(finish_pe16_0)
    );
    
    top_16x16 top_16x16_PE1(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_1),
    .Matrix(PE16_1_tmp),
    .psum(psum_0_1),
    .finish(finish_pe16_1)
    );
    
    top_16x16 top_16x16_PE2(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_2),
    .Matrix(PE16_2_tmp),
    .psum(psum_0_2),
    .finish(finish_pe16_2)
    );
    
    top_16x16 top_16x16_PE3(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_3),
    .Matrix(PE16_3_tmp),
    .psum(psum_0_3),
    .finish(finish_pe16_3)
    );
    
    top_16x16 top_16x16_PE4(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_0),
    .Matrix(PE16_4_tmp),
    .psum(psum_1_0),
    .finish(finish_pe16_4)
    );
    
    top_16x16 top_16x16_PE5(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_1),
    .Matrix(PE16_5_tmp),
    .psum(psum_1_1),
    .finish(finish_pe16_5)
    );
    
    top_16x16 top_16x16_PE6(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_2),
    .Matrix(PE16_6_tmp),
    .psum(psum_1_2),
    .finish(finish_pe16_6)
    );
    
    top_16x16 top_16x16_PE7(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_3),
    .Matrix(PE16_7_tmp),
    .psum(psum_1_3),
    .finish(finish_pe16_7)
    );
    
    top_16x16 top_16x16_PE8(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_0),
    .Matrix(PE16_8_tmp),
    .psum(psum_2_0),
    .finish(finish_pe16_8)
    );
    
    top_16x16 top_16x16_PE9(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_1),
    .Matrix(PE16_9_tmp),
    .psum(psum_2_1),
    .finish(finish_pe16_9)
    );
    
    top_16x16 top_16x16_PE10(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_2),
    .Matrix(PE16_10_tmp),
    .psum(psum_2_2),
    .finish(finish_pe16_10)
    );
    
    top_16x16 top_16x16_PE11(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_3),
    .Matrix(PE16_11_tmp),
    .psum(psum_2_3),
    .finish(finish_pe16_11)
    );
    
    top_16x16 top_16x16_PE12(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_0),
    .Matrix(PE16_12_tmp),
    .psum(psum_3_0),
    .finish(finish_pe16_12)
    );
    
    top_16x16 top_16x16_PE13(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_1),
    .Matrix(PE16_13_tmp),
    .psum(psum_3_1),
    .finish(finish_pe16_13)
    );
    
    top_16x16 top_16x16_PE14(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_2),
    .Matrix(PE16_14_tmp),
    .psum(psum_3_2),
    .finish(finish_pe16_14)
    );
    
    top_16x16 top_16x16_PE15(
    .clk(clk),
    .en(finish_matrix_sel_tmp),
    .rst(rst),
    .ai(vector_3),
    .Matrix(PE16_15_tmp),
    .psum(psum_3_3),
    .finish(finish_pe16_15)
    );
    
    
    initial begin
        psum                  <= 1024'd0;
        finish                <= 1'b0;
        psum_0                <= 256'd0;
        psum_1                <= 256'd0;
        psum_2                <= 256'd0;
        psum_3                <= 256'd0;
        PE16_0_tmp            <= 4096'd0;
        PE16_1_tmp            <= 4096'd0;
        PE16_2_tmp            <= 4096'd0;
        PE16_3_tmp            <= 4096'd0;
        PE16_4_tmp            <= 4096'd0;
        PE16_5_tmp            <= 4096'd0;
        PE16_6_tmp            <= 4096'd0;
        PE16_7_tmp            <= 4096'd0;
        PE16_8_tmp            <= 4096'd0;
        PE16_9_tmp            <= 4096'd0;
        PE16_10_tmp           <= 4096'd0;
        PE16_11_tmp           <= 4096'd0;
        PE16_12_tmp           <= 4096'd0;
        PE16_13_tmp           <= 4096'd0;
        PE16_14_tmp           <= 4096'd0;
        PE16_15_tmp           <= 4096'd0;
        finish_vector_sel_tmp <= 1'b0;
        finish_matrix_sel_tmp <= 1'b0;
    end
    
    always @(*) begin
        PE16_0_tmp            <= PE16_0;
        PE16_1_tmp            <= PE16_1;
        PE16_2_tmp            <= PE16_2;
        PE16_3_tmp            <= PE16_3;
        PE16_4_tmp            <= PE16_4;
        PE16_5_tmp            <= PE16_5;
        PE16_6_tmp            <= PE16_6;
        PE16_7_tmp            <= PE16_7;
        PE16_8_tmp            <= PE16_8;
        PE16_9_tmp            <= PE16_9;
        PE16_10_tmp           <= PE16_10;
        PE16_11_tmp           <= PE16_11;
        PE16_12_tmp           <= PE16_12;
        PE16_13_tmp           <= PE16_13;
        PE16_14_tmp           <= PE16_14;
        PE16_15_tmp           <= PE16_15;
        finish_vector_sel_tmp <= finish_vector_sel;
        finish_matrix_sel_tmp <= finish_matrix_sel;
    end
    
    always @ (*) begin
        psum_0 <= psum_0_0+psum_0_1+psum_0_2+psum_0_3;
        psum_1 <= psum_1_0+psum_1_1+psum_1_2+psum_1_3;
        psum_2 <= psum_2_0+psum_2_1+psum_2_2+psum_2_3;
        psum_3 <= psum_3_0+psum_3_1+psum_3_2+psum_3_3;
//        psum   <= {psum_0,psum_1,psum_2,psum_3};    
    end
    
    always @(posedge clk) begin
        if (rst) begin
            psum   <= 1024'd0;
            finish <= 1'b0;
        end
        else if (en & finish_vector_sel & finish_matrix_sel & finish_pe16_0) begin
//            psum_0 <= psum_0_0+psum_0_1+psum_0_2+psum_0_3;
//            psum_1 <= psum_1_0+psum_1_1+psum_1_2+psum_1_3;
//            psum_2 <= psum_2_0+psum_2_1+psum_2_2+psum_2_3;
//            psum_3 <= psum_3_0+psum_3_1+psum_3_2+psum_3_3;
            psum   <= {psum_0,psum_1,psum_2,psum_3};
            finish <= 1'b1;
        end
            
            
            end
            
            
            
            
            
            
            endmodule //top_64x64
