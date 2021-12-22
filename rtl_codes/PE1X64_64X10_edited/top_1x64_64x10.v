`timescale 1ns / 1ps

module top_1x64_64x10 (input clk,
                       input rst,
                       input en,
                       input signed [1023:0] ai,       //1x64 vector
                       input signed [10239:0] Matrix,  //64x10 Matrix
                       output reg signed [159:0] psum, //1x10 vector
                       output reg finish);
    
    integer cnt;
    //vector sel
    wire signed [255:0]vector_0;
    wire signed [255:0]vector_1;
    wire signed [255:0]vector_2;
    wire signed [255:0]vector_3;
    
    reg signed [255:0]vector_tmp_0;
    reg signed [255:0]vector_tmp_1;
    reg signed [255:0]vector_tmp_2;
    reg signed [255:0]vector_tmp_3;
    
    wire finish_vector_sel;
    reg finish_vector_sel_tmp;
    
    //matrix sel
    wire signed [2559:0]Matrix_c_0;
    wire signed [2559:0]Matrix_c_1;
    wire signed [2559:0]Matrix_c_2;
    wire signed [2559:0]Matrix_c_3;
    
    reg signed [2559:0]Matrix_c_tmp_0;
    reg signed [2559:0]Matrix_c_tmp_1;
    reg signed [2559:0]Matrix_c_tmp_2;
    reg signed [2559:0]Matrix_c_tmp_3;
    
    wire finish_Matrix_sel;
    reg finish_Matrix_sel_tmp;
    
    // pe
    wire finish_0;
    wire finish_1;
    wire finish_2;
    wire finish_3;
    
    wire signed [159:0]psum_0;
    wire signed [159:0]psum_1;
    wire signed [159:0]psum_2;
    wire signed [159:0]psum_3;
    
    reg signed [159:0]psum_tmp_0;
    reg signed [159:0]psum_tmp_1;
    reg signed [159:0]psum_tmp_2;
    reg signed [159:0]psum_tmp_3;
    
    
    
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
    
    matrix_sel_64_col matrix_sel(
    .clk(clk),
    .en(finish_vector_sel_tmp),
    .rst(rst),
    .Matrix(Matrix),
    .Matrix_c_0(Matrix_c_0),
    .Matrix_c_1(Matrix_c_1),
    .Matrix_c_2(Matrix_c_2),
    .Matrix_c_3(Matrix_c_3),
    .finish(finish_Matrix_sel)
    );
    
    top_1x16_16x10 top_1x16_16x10_PE0(
    .clk(clk),
    .en(finish_Matrix_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_0),
    .Matrix(Matrix_c_tmp_0),
    .psum(psum_0),
    .finish(finish_0)
    );
    
    top_1x16_16x10 top_1x16_16x10_PE1(
    .clk(clk),
    .en(finish_Matrix_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_1),
    .Matrix(Matrix_c_tmp_1),
    .psum(psum_1),
    .finish(finish_1)
    );
    
    top_1x16_16x10 top_1x16_16x10_PE2(
    .clk(clk),
    .en(finish_Matrix_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_2),
    .Matrix(Matrix_c_tmp_2),
    .psum(psum_2),
    .finish(finish_2)
    );
    
    top_1x16_16x10 top_1x16_16x10_PE3(
    .clk(clk),
    .en(finish_Matrix_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_3),
    .Matrix(Matrix_c_tmp_3),
    .psum(psum_3),
    .finish(finish_3)
    );
    
    
    
    initial begin
        psum   <= 160'd0;
        finish <= 1'b0;
        
        vector_tmp_0 <= 256'd0;
        vector_tmp_1 <= 256'd0;
        vector_tmp_2 <= 256'd0;
        vector_tmp_3 <= 256'd0;
        
        finish_vector_sel_tmp <= 1'b0;
        
        Matrix_c_tmp_0 <= 2560'd0;
        Matrix_c_tmp_1 <= 2560'd0;
        Matrix_c_tmp_2 <= 2560'd0;
        Matrix_c_tmp_3 <= 2560'd0;
        
        finish_Matrix_sel_tmp <= 1'b0;
        
        psum_tmp_0 <= 160'd0;
        psum_tmp_1 <= 160'd0;
        psum_tmp_2 <= 160'd0;
        psum_tmp_3 <= 160'd0;
        
        cnt<=0;
        
    end
    
    always @(*) begin
        vector_tmp_0 <= vector_0;
        vector_tmp_1 <= vector_1;
        vector_tmp_2 <= vector_2;
        vector_tmp_3 <= vector_3;
        
        finish_vector_sel_tmp <= finish_vector_sel;
        
        Matrix_c_tmp_0 <= Matrix_c_0;
        Matrix_c_tmp_1 <= Matrix_c_1;
        Matrix_c_tmp_2 <= Matrix_c_2;
        Matrix_c_tmp_3 <= Matrix_c_3;
        
        finish_Matrix_sel_tmp <= finish_Matrix_sel;
        
        psum_tmp_0 <= psum_0;
        psum_tmp_1 <= psum_1;
        psum_tmp_2 <= psum_2;
        psum_tmp_3 <= psum_3;

        
    end

    always @ (*) begin
        psum   <= psum_tmp_0+psum_tmp_1+psum_tmp_2+psum_tmp_3;
    end
    
    
    
    always @(posedge clk) begin
        if (rst) begin
            psum   <= 160'd0;
            finish <= 1'b0;
            
            vector_tmp_0 <= 256'd0;
            vector_tmp_1 <= 256'd0;
            vector_tmp_2 <= 256'd0;
            vector_tmp_3 <= 256'd0;
            
            finish_vector_sel_tmp <= 1'b0;
            
            Matrix_c_tmp_0 <= 2560'd0;
            Matrix_c_tmp_1 <= 2560'd0;
            Matrix_c_tmp_2 <= 2560'd0;
            Matrix_c_tmp_3 <= 2560'd0;
            
            finish_Matrix_sel_tmp <= 1'b0;
            
            psum_tmp_0 <= 160'd0;
            psum_tmp_1 <= 160'd0;
            psum_tmp_2 <= 160'd0;
            psum_tmp_3 <= 160'd0;
        end
        else if (en & finish_vector_sel & finish_Matrix_sel & finish_0 & finish_1 & finish_2 & finish_3) begin
            if (cnt<2)begin    
            finish<=1'b0;
            cnt<=cnt+1;
            end
            else begin
            finish <= 1'b1;
            end
        end
            
            
            end
            
            
            
            
            
            
            endmodule
