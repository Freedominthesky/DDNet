`timescale 1ns / 1ps

module top_1x16_16x10 (input clk,
                       input rst,
                       input en,
                       input signed [255:0] ai,        //1x16 vector
                       input signed [2559:0] Matrix,   //16x10 Matrix
                       output reg signed [159:0] psum, //1x10 vector
                       output reg finish);
    
    
    //matrix sel
    wire signed [255:0] PE16_0;
    wire signed [255:0] PE16_1; //1x16 vector
    wire signed [255:0] PE16_2;
    wire signed [255:0] PE16_3;
    wire signed [255:0] PE16_4;
    wire signed [255:0] PE16_5; //1x16 vector
    wire signed [255:0] PE16_6;
    wire signed [255:0] PE16_7;
    wire signed [255:0] PE16_8;
    wire signed [255:0] PE16_9;
    wire finish_matrix_sel;
    
    reg signed [255:0] PE16_tmp_0;
    reg signed [255:0] PE16_tmp_1; //1x16 vector
    reg signed [255:0] PE16_tmp_2;
    reg signed [255:0] PE16_tmp_3;
    reg signed [255:0] PE16_tmp_4;
    reg signed [255:0] PE16_tmp_5; //1x16 vector
    reg signed [255:0] PE16_tmp_6;
    reg signed [255:0] PE16_tmp_7;
    reg signed [255:0] PE16_tmp_8;
    reg signed [255:0] PE16_tmp_9;
    reg finish_matrix_sel_tmp;
    
    //vec_dot data
    
    
    wire signed [15:0] psum_0;
    wire signed [15:0] psum_1;
    wire signed [15:0] psum_2;
    wire signed [15:0] psum_3;
    wire signed [15:0] psum_4;
    wire signed [15:0] psum_5;
    wire signed [15:0] psum_6;
    wire signed [15:0] psum_7;
    wire signed [15:0] psum_8;
    wire signed [15:0] psum_9;
    
    
    reg signed [15:0] psum_tmp_0;
    reg signed [15:0] psum_tmp_1;
    reg signed [15:0] psum_tmp_2;
    reg signed [15:0] psum_tmp_3;
    reg signed [15:0] psum_tmp_4;
    reg signed [15:0] psum_tmp_5;
    reg signed [15:0] psum_tmp_6;
    reg signed [15:0] psum_tmp_7;
    reg signed [15:0] psum_tmp_8;
    reg signed [15:0] psum_tmp_9;
    
    //vec_dot finish
    
    wire finish_0;
    wire finish_1;
    wire finish_2;
    wire finish_3;
    wire finish_4;
    wire finish_5;
    wire finish_6;
    wire finish_7;
    wire finish_8;
    wire finish_9;
    
    
    
    
    matrix_sel_10_row matrix_sel(
    .clk(clk),
    .rst(rst),
    .en(en),
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
    .finish(finish_matrix_sel)
    );
    
    vec_dot p_0(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_0),
    .dot_out(psum_0),
    .finish(finish_0)
    );
    
    vec_dot p_1(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_1),
    .dot_out(psum_1),
    .finish(finish_1)
    );
    
    vec_dot p_2(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_2),
    .dot_out(psum_2),
    .finish(finish_2)
    );
    
    vec_dot p_3(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_3),
    .dot_out(psum_3),
    .finish(finish_3)
    );
    
    vec_dot p_4(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_4),
    .dot_out(psum_4),
    .finish(finish_4)
    );
    
    vec_dot p_5(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_5),
    .dot_out(psum_5),
    .finish(finish_5)
    );
    
    vec_dot p_6(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_6),
    .dot_out(psum_6),
    .finish(finish_6)
    );
    
    vec_dot p_7(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_7),
    .dot_out(psum_7),
    .finish(finish_7)
    );
    
    vec_dot p_8(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_8),
    .dot_out(psum_8),
    .finish(finish_8)
    );
    
    vec_dot p_9(
    .clk(clk),
    .rst(rst),
    .en(finish_matrix_sel_tmp),
    .vec_a(ai),
    .vec_b(PE16_tmp_9),
    .dot_out(psum_9),
    .finish(finish_9)
    );
    
    initial begin
        PE16_tmp_0            <= 256'd0;
        PE16_tmp_1            <= 256'd0; //1x16 vector
        PE16_tmp_2            <= 256'd0;
        PE16_tmp_3            <= 256'd0;
        PE16_tmp_4            <= 256'd0;
        PE16_tmp_5            <= 256'd0; //1x16 vector
        PE16_tmp_6            <= 256'd0;
        PE16_tmp_7            <= 256'd0;
        PE16_tmp_8            <= 256'd0;
        PE16_tmp_9            <= 256'd0;
        finish_matrix_sel_tmp <= 1'b0;
        
        psum_tmp_0 <= 16'd0;
        psum_tmp_1 <= 16'd0;
        psum_tmp_2 <= 16'd0;
        psum_tmp_3 <= 16'd0;
        psum_tmp_4 <= 16'd0;
        psum_tmp_5 <= 16'd0;
        psum_tmp_6 <= 16'd0;
        psum_tmp_7 <= 16'd0;
        psum_tmp_8 <= 16'd0;
        psum_tmp_9 <= 16'd0;
        
        psum   <= 160'd0;
        finish <= 1'b0;
        
        
    end
    
    always @(*) begin
        PE16_tmp_0 <= PE16_0;
        PE16_tmp_1 <= PE16_1;
        PE16_tmp_2 <= PE16_2;
        PE16_tmp_3 <= PE16_3;
        PE16_tmp_4 <= PE16_4;
        PE16_tmp_5 <= PE16_5;
        PE16_tmp_6 <= PE16_6;
        PE16_tmp_7 <= PE16_7;
        PE16_tmp_8 <= PE16_8;
        PE16_tmp_9 <= PE16_9;
        
        finish_matrix_sel_tmp <= finish_matrix_sel;
        
        psum_tmp_0 <= psum_0;
        psum_tmp_1 <= psum_1;
        psum_tmp_2 <= psum_2;
        psum_tmp_3 <= psum_3;
        psum_tmp_4 <= psum_4;
        psum_tmp_5 <= psum_5;
        psum_tmp_6 <= psum_6;
        psum_tmp_7 <= psum_7;
        psum_tmp_8 <= psum_8;
        psum_tmp_9 <= psum_9;
        
        psum   <= {psum_tmp_0,psum_tmp_1,psum_tmp_2,psum_tmp_3,psum_tmp_4,psum_tmp_5,psum_tmp_6,psum_tmp_7,psum_tmp_8,psum_tmp_9};
    end
    
    always @(posedge clk) begin
        if (rst) begin
            PE16_tmp_0            <= 256'd0;
            PE16_tmp_1            <= 256'd0; //1x16 vector
            PE16_tmp_2            <= 256'd0;
            PE16_tmp_3            <= 256'd0;
            PE16_tmp_4            <= 256'd0;
            PE16_tmp_5            <= 256'd0; //1x16 vector
            PE16_tmp_6            <= 256'd0;
            PE16_tmp_7            <= 256'd0;
            PE16_tmp_8            <= 256'd0;
            PE16_tmp_9            <= 256'd0;
            finish_matrix_sel_tmp <= 1'b0;
            
            psum_tmp_0 <= 16'd0;
            psum_tmp_1 <= 16'd0;
            psum_tmp_2 <= 16'd0;
            psum_tmp_3 <= 16'd0;
            psum_tmp_4 <= 16'd0;
            psum_tmp_5 <= 16'd0;
            psum_tmp_6 <= 16'd0;
            psum_tmp_7 <= 16'd0;
            psum_tmp_8 <= 16'd0;
            psum_tmp_9 <= 16'd0;
            
            psum   <= 160'd0;
            finish <= 1'b0;
        end
        else if (en) begin
            
            finish <= 1'b1;
        end
            end
            
            endmodule //top_1x16_16x10
