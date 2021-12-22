`timescale 1ns / 1ps

module vector_sel_784 (input clk,
                       input rst,
                       input en,
                       input signed [12543:0] vector,       //1x784 vector
                       output reg signed [1023:0]vector_0,  //1x64 vector
                       output reg signed [1023:0]vector_1,
                       output reg signed [1023:0]vector_2,
                       output reg signed [1023:0]vector_3,
                       output reg signed [1023:0]vector_4,
                       output reg signed [1023:0]vector_5,
                       output reg signed [1023:0]vector_6,
                       output reg signed [1023:0]vector_7,
                       output reg signed [1023:0]vector_8,
                       output reg signed [1023:0]vector_9,
                       output reg signed [1023:0]vector_10,
                       output reg signed [1023:0]vector_11,
                       output reg signed [255:0]vector_12,
                       output reg finish);

    
    initial begin
        vector_0  <= 1024'd0;
        vector_1  <= 1024'd0;
        vector_2  <= 1024'd0;
        vector_3  <= 1024'd0;
        vector_4  <= 1024'd0;
        vector_5  <= 1024'd0;
        vector_6  <= 1024'd0;
        vector_7  <= 1024'd0;
        vector_8  <= 1024'd0;
        vector_9  <= 1024'd0;
        vector_10 <= 1024'd0;
        vector_11 <= 1024'd0;
        vector_12 <= 256'd0;
        finish    <= 1'b0;

    end
    
    always @(posedge clk) begin
        if (rst) begin
            vector_0  <= 1024'd0;
            vector_1  <= 1024'd0;
            vector_2  <= 1024'd0;
            vector_3  <= 1024'd0;
            vector_4  <= 1024'd0;
            vector_5  <= 1024'd0;
            vector_6  <= 1024'd0;
            vector_7  <= 1024'd0;
            vector_8  <= 1024'd0;
            vector_9  <= 1024'd0;
            vector_10 <= 1024'd0;
            vector_11 <= 1024'd0;
            vector_12 <= 256'd0;
            finish    <= 1'b0;
        end
        
        else if (en) begin
        {vector_0,vector_1,vector_2,vector_3,vector_4,vector_5,vector_6,vector_7,vector_8,vector_9,vector_10,vector_11,vector_12} <= vector;
        finish                                                                                                                    <= 1'b1;
        end
    end
    
endmodule //vector_sel_784
