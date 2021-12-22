`timescale 1ns / 1ps

module matrix_sel_64_row (input clk,
                          input rst,
                          input en,
                          input signed [16383:0] Matrix,     //16x64 Matrix
                          output reg signed [4095:0] PE16_0,
                          output reg signed [4095:0] PE16_1, //16x16 Matrix
                          output reg signed [4095:0] PE16_2,
                          output reg signed [4095:0] PE16_3,
                          output reg finish);
    reg signed [1023:0] Matrix_r_0;
    reg signed [1023:0] Matrix_r_1;
    reg signed [1023:0] Matrix_r_2;
    reg signed [1023:0] Matrix_r_3;
    reg signed [1023:0] Matrix_r_4;
    reg signed [1023:0] Matrix_r_5;
    reg signed [1023:0] Matrix_r_6;
    reg signed [1023:0] Matrix_r_7;
    reg signed [1023:0] Matrix_r_8;
    reg signed [1023:0] Matrix_r_9;
    reg signed [1023:0] Matrix_r_10;
    reg signed [1023:0] Matrix_r_11;
    reg signed [1023:0] Matrix_r_12;
    reg signed [1023:0] Matrix_r_13;
    reg signed [1023:0] Matrix_r_14;
    reg signed [1023:0] Matrix_r_15;
    
    initial begin
        PE16_0 <= 4096'd0;
        PE16_1 <= 4096'd0;
        PE16_2 <= 4096'd0;
        PE16_3 <= 4096'd0;
        
        Matrix_r_0  <= 4096'd0;
        Matrix_r_1  <= 4096'd0;
        Matrix_r_2  <= 4096'd0;
        Matrix_r_3  <= 4096'd0;
        Matrix_r_4  <= 4096'd0;
        Matrix_r_5  <= 4096'd0;
        Matrix_r_6  <= 4096'd0;
        Matrix_r_7  <= 4096'd0;
        Matrix_r_8  <= 4096'd0;
        Matrix_r_9  <= 4096'd0;
        Matrix_r_10 <= 4096'd0;
        Matrix_r_11 <= 4096'd0;
        Matrix_r_12 <= 4096'd0;
        Matrix_r_13 <= 4096'd0;
        Matrix_r_14 <= 4096'd0;
        Matrix_r_15 <= 4096'd0;
        finish      <= 1'b0;
    end
    
    always @(*) begin
        {PE16_0[4095:3840],PE16_1[4095:3840],PE16_2[4095:3840],PE16_3[4095:3840]}                                                                                                               <= Matrix_r_0;
        {PE16_0[3839:3584],PE16_1[3839:3584],PE16_2[3839:3584],PE16_3[3839:3584]}                                                                                                               <= Matrix_r_1;
        {PE16_0[3583:3328],PE16_1[3583:3328],PE16_2[3583:3328],PE16_3[3583:3328]}                                                                                                               <= Matrix_r_2;
        {PE16_0[3327:3072],PE16_1[3327:3072],PE16_2[3327:3072],PE16_3[3327:3072]}                                                                                                               <= Matrix_r_3;
        {PE16_0[3071:2816],PE16_1[3071:2816],PE16_2[3071:2816],PE16_3[3071:2816]}                                                                                                               <= Matrix_r_4;
        {PE16_0[2815:2560],PE16_1[2815:2560],PE16_2[2815:2560],PE16_3[2815:2560]}                                                                                                               <= Matrix_r_5;
        {PE16_0[2559:2304],PE16_1[2559:2304],PE16_2[2559:2304],PE16_3[2559:2304]}                                                                                                               <= Matrix_r_6;
        {PE16_0[2303:2048],PE16_1[2303:2048],PE16_2[2303:2048],PE16_3[2303:2048]}                                                                                                               <= Matrix_r_7;
        {PE16_0[2047:1792],PE16_1[2047:1792],PE16_2[2047:1792],PE16_3[2047:1792]}                                                                                                               <= Matrix_r_8;
        {PE16_0[1791:1536],PE16_1[1791:1536],PE16_2[1791:1536],PE16_3[1791:1536]}                                                                                                               <= Matrix_r_9;
        {PE16_0[1535:1280],PE16_1[1535:1280],PE16_2[1535:1280],PE16_3[1535:1280]}                                                                                                               <= Matrix_r_10;
        {PE16_0[1279:1024],PE16_1[1279:1024],PE16_2[1279:1024],PE16_3[1279:1024]}                                                                                                               <= Matrix_r_11;
        {PE16_0[1023:768],PE16_1[1023:768],PE16_2[1023:768],PE16_3[1023:768]}                                                                                                                   <= Matrix_r_12;
        {PE16_0[767:512],PE16_1[767:512],PE16_2[767:512],PE16_3[767:512]}                                                                                                                       <= Matrix_r_13;
        {PE16_0[511:256],PE16_1[511:256],PE16_2[511:256],PE16_3[511:256]}                                                                                                                       <= Matrix_r_14;
        {PE16_0[255:0],PE16_1[255:0],PE16_2[255:0],PE16_3[255:0]}                                                                                                                               <= Matrix_r_15;
    end
    
    always @(posedge clk) begin
        if (rst)begin
            PE16_0 <= 4096'd0;
            PE16_1 <= 4096'd0;
            PE16_2 <= 4096'd0;
            PE16_3 <= 4096'd0;
            finish <= 1'b0;
            
            Matrix_r_0  <= 4096'd0;
            Matrix_r_1  <= 4096'd0;
            Matrix_r_2  <= 4096'd0;
            Matrix_r_3  <= 4096'd0;
            Matrix_r_4  <= 4096'd0;
            Matrix_r_5  <= 4096'd0;
            Matrix_r_6  <= 4096'd0;
            Matrix_r_7  <= 4096'd0;
            Matrix_r_8  <= 4096'd0;
            Matrix_r_9  <= 4096'd0;
            Matrix_r_10 <= 4096'd0;
            Matrix_r_11 <= 4096'd0;
            Matrix_r_12 <= 4096'd0;
            Matrix_r_13 <= 4096'd0;
            Matrix_r_14 <= 4096'd0;
            Matrix_r_15 <= 4096'd0;
        end
        
        else if (en)begin
//        {PE16_0[4095:3840],PE16_1[4095:3840],PE16_2[4095:3840],PE16_3[4095:3840]}                                                                                                               <= Matrix_r_0;
//        {PE16_0[3839:3584],PE16_1[3839:3584],PE16_2[3839:3584],PE16_3[3839:3584]}                                                                                                               <= Matrix_r_1;
//        {PE16_0[3583:3328],PE16_1[3583:3328],PE16_2[3583:3328],PE16_3[3583:3328]}                                                                                                               <= Matrix_r_2;
//        {PE16_0[3327:3072],PE16_1[3327:3072],PE16_2[3327:3072],PE16_3[3327:3072]}                                                                                                               <= Matrix_r_3;
//        {PE16_0[3071:2816],PE16_1[3071:2816],PE16_2[3071:2816],PE16_3[3071:2816]}                                                                                                               <= Matrix_r_4;
//        {PE16_0[2815:2560],PE16_1[2815:2560],PE16_2[2815:2560],PE16_3[2815:2560]}                                                                                                               <= Matrix_r_5;
//        {PE16_0[2559:2304],PE16_1[2559:2304],PE16_2[2559:2304],PE16_3[2559:2304]}                                                                                                               <= Matrix_r_6;
//        {PE16_0[2303:2048],PE16_1[2303:2048],PE16_2[2303:2048],PE16_3[2303:2048]}                                                                                                               <= Matrix_r_7;
//        {PE16_0[2047:1792],PE16_1[2047:1792],PE16_2[2047:1792],PE16_3[2047:1792]}                                                                                                               <= Matrix_r_8;
//        {PE16_0[1791:1536],PE16_1[1791:1536],PE16_2[1791:1536],PE16_3[1791:1536]}                                                                                                               <= Matrix_r_9;
//        {PE16_0[1535:1280],PE16_1[1535:1280],PE16_2[1535:1280],PE16_3[1535:1280]}                                                                                                               <= Matrix_r_10;
//        {PE16_0[1279:1024],PE16_1[1279:1024],PE16_2[1279:1024],PE16_3[1279:1024]}                                                                                                               <= Matrix_r_11;
//        {PE16_0[1023:768],PE16_1[1023:768],PE16_2[1023:768],PE16_3[1023:768]}                                                                                                                   <= Matrix_r_12;
//        {PE16_0[767:512],PE16_1[767:512],PE16_2[767:512],PE16_3[767:512]}                                                                                                                       <= Matrix_r_13;
//        {PE16_0[511:256],PE16_1[511:256],PE16_2[511:256],PE16_3[511:256]}                                                                                                                       <= Matrix_r_14;
//        {PE16_0[255:0],PE16_1[255:0],PE16_2[255:0],PE16_3[255:0]}                                                                                                                               <= Matrix_r_15;
        {Matrix_r_0,Matrix_r_1,Matrix_r_2,Matrix_r_3,Matrix_r_4,Matrix_r_5,Matrix_r_6,Matrix_r_7,Matrix_r_8,Matrix_r_9,Matrix_r_10,Matrix_r_11,Matrix_r_12,Matrix_r_13,Matrix_r_14,Matrix_r_15} <= Matrix;
        finish                                                                                                                                                                                  <= 1'b1;
    end
    end
    
    
    
endmodule //matrix_sel_64_row
