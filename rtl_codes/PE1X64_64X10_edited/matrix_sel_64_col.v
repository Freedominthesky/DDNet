`timescale 1ns / 1ps

module matrix_sel_64_col(input clk,
                         input rst,
                         input en,
                         input signed [10239:0] Matrix,          //64x10 Matrix
                         output reg signed [2559:0] Matrix_c_0,
                         output reg signed [2559:0] Matrix_c_1, //16x10 Matrix
                         output reg signed [2559:0] Matrix_c_2,
                         output reg signed [2559:0] Matrix_c_3,
                         output reg finish);
    
    initial begin
        Matrix_c_0 <= 2560'd0;
        Matrix_c_1 <= 2560'd0;
        Matrix_c_2 <= 2560'd0;
        Matrix_c_3 <= 2560'd0;
        finish     <= 1'b0;
    end

    always @(posedge clk) begin
        if (rst) begin
            Matrix_c_0 <= 2560'd0;
            Matrix_c_1 <= 2560'd0;
            Matrix_c_2 <= 2560'd0;
            Matrix_c_3 <= 2560'd0;
            finish     <= 1'b0;
        end
        
        else if (en) begin
         {Matrix_c_0,Matrix_c_1,Matrix_c_2,Matrix_c_3} <= Matrix;
        finish                                        <= 1'b1;
        end
    end
    
endmodule
