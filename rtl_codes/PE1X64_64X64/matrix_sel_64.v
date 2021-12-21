`timescale 1ns / 1ps

module matrix_sel_64_col(input clk,
                         input rst,
                         input en,
                         input signed [65535:0] Matrix,          //64x64 Matrix
                         output reg signed [16383:0] Matrix_c_0,
                         output reg signed [16383:0] Matrix_c_1, //64x16 Matrix
                         output reg signed [16383:0] Matrix_c_2,
                         output reg signed [16383:0] Matrix_c_3,
                         output reg finish);
    
    initial begin
        Matrix_c_0 <= 16384'd0;
        Matrix_c_1 <= 16384'd0;
        Matrix_c_2 <= 16384'd0;
        Matrix_c_3 <= 16384'd0;
        finish     <= 1'b0;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            Matrix_c_0 <= 16384'd0;
            Matrix_c_1 <= 16384'd0;
            Matrix_c_2 <= 16384'd0;
            Matrix_c_3 <= 16384'd0;
            finish     <= 1'b0;
        end
        
        else if (en) begin
        {Matrix_c_0,Matrix_c_1,Matrix_c_2,Matrix_c_3} <= Matrix;
        finish                                        <= 1'b1;
        end
    end
    
endmodule
