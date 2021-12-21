`timescale 1ns / 1ps

module matrix_sel_new (input clk,
                       input rst,
                       input en,
                       input signed [4095:0] Matrix,
                       output reg signed [255:0] Matrix_0,
                       output reg signed [255:0] Matrix_1,
                       output reg signed [255:0] Matrix_2,
                       output reg signed [255:0] Matrix_3,
                       output reg signed [255:0] Matrix_4,
                       output reg signed [255:0] Matrix_5,
                       output reg signed [255:0] Matrix_6,
                       output reg signed [255:0] Matrix_7,
                       output reg signed [255:0] Matrix_8,
                       output reg signed [255:0] Matrix_9,
                       output reg signed [255:0] Matrix_10,
                       output reg signed [255:0] Matrix_11,
                       output reg signed [255:0] Matrix_12,
                       output reg signed [255:0] Matrix_13,
                       output reg signed [255:0] Matrix_14,
                       output reg signed [255:0] Matrix_15,
                       output reg finish);
    
    initial begin
        Matrix_0  <= 256'd0;
        Matrix_1  <= 256'd0;
        Matrix_2  <= 256'd0;
        Matrix_3  <= 256'd0;
        Matrix_4  <= 256'd0;
        Matrix_5  <= 256'd0;
        Matrix_6  <= 256'd0;
        Matrix_7  <= 256'd0;
        Matrix_8  <= 256'd0;
        Matrix_9  <= 256'd0;
        Matrix_10 <= 256'd0;
        Matrix_11 <= 256'd0;
        Matrix_12 <= 256'd0;
        Matrix_13 <= 256'd0;
        Matrix_14 <= 256'd0;
        Matrix_15 <= 256'd0;
        finish    <= 1'b0;
    end
    
    always @(posedge clk) begin
        if (rst)begin
            Matrix_0  <= 256'd0;
            Matrix_1  <= 256'd0;
            Matrix_2  <= 256'd0;
            Matrix_3  <= 256'd0;
            Matrix_4  <= 256'd0;
            Matrix_5  <= 256'd0;
            Matrix_6  <= 256'd0;
            Matrix_7  <= 256'd0;
            Matrix_8  <= 256'd0;
            Matrix_9  <= 256'd0;
            Matrix_10 <= 256'd0;
            Matrix_11 <= 256'd0;
            Matrix_12 <= 256'd0;
            Matrix_13 <= 256'd0;
            Matrix_14 <= 256'd0;
            Matrix_15 <= 256'd0;
        end
        else if (en)begin
            {Matrix_0,Matrix_1,Matrix_2,Matrix_3,Matrix_4,Matrix_5,Matrix_6,Matrix_7,Matrix_8,Matrix_9,Matrix_10,Matrix_11,Matrix_12,Matrix_13,Matrix_14,Matrix_15} <= Matrix;
            finish                                                                                                                                                  <= 1'b1;
        end
            end
            endmodule
