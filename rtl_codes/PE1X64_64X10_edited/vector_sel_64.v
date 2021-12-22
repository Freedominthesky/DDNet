`timescale 1ns / 1ps

module vector_sel_64_col(input clk,
                         input rst,
                         input en,
                         input signed [1023:0] vector,          //1x16 vector
                         output reg signed [255:0]vector_0,
                         output reg signed [255:0]vector_1, //64x16 vector
                         output reg signed [255:0]vector_2,
                         output reg signed [255:0]vector_3,
                         output reg finish);
    
    initial begin
       vector_0 <= 256'd0;
       vector_1 <= 256'd0;
       vector_2 <= 256'd0;
       vector_3 <= 256'd0;
        finish     <= 1'b0;
    end

    
    always @(posedge clk) begin
        if (rst) begin
           vector_0 <= 256'd0;
           vector_1 <= 256'd0;
           vector_2 <= 256'd0;
           vector_3 <= 256'd0;
            finish     <= 1'b0;
        end
        
        else if (en) begin
         {vector_0,vector_1,vector_2,vector_3} <= vector;
        finish                                        <= 1'b1;
        end
    end
    
endmodule
