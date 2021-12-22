`timescale 1ns / 1ps

module matrix_sel_10_row (input clk,
                          input rst,
                          input en,
                          input signed [2559:0] Matrix,     //16x10 Matrix
                          output reg signed [255:0] PE16_0,
                          output reg signed [255:0] PE16_1, //1x16 vector
                          output reg signed [255:0] PE16_2,
                          output reg signed [255:0] PE16_3,
                          output reg signed [255:0] PE16_4,
                          output reg signed [255:0] PE16_5, //1x16 vector
                          output reg signed [255:0] PE16_6,
                          output reg signed [255:0] PE16_7,
                          output reg signed [255:0] PE16_8,
                          output reg signed [255:0] PE16_9,
                          output reg finish);
    
    reg signed [159:0] Matrix_r_0;
    reg signed [159:0] Matrix_r_1;
    reg signed [159:0] Matrix_r_2;
    reg signed [159:0] Matrix_r_3;
    reg signed [159:0] Matrix_r_4;
    reg signed [159:0] Matrix_r_5;
    reg signed [159:0] Matrix_r_6;
    reg signed [159:0] Matrix_r_7;
    reg signed [159:0] Matrix_r_8;
    reg signed [159:0] Matrix_r_9;
    reg signed [159:0] Matrix_r_10;
    reg signed [159:0] Matrix_r_11;
    reg signed [159:0] Matrix_r_12;
    reg signed [159:0] Matrix_r_13;
    reg signed [159:0] Matrix_r_14;
    reg signed [159:0] Matrix_r_15;
    
    initial begin
        PE16_0 <= 256'd0;
        PE16_1 <= 256'd0;
        PE16_2 <= 256'd0;
        PE16_3 <= 256'd0;
        PE16_4 <= 256'd0;
        PE16_5 <= 256'd0;
        PE16_6 <= 256'd0;
        PE16_7 <= 256'd0;
        PE16_8 <= 256'd0;
        PE16_9 <= 256'd0;
        
        
        Matrix_r_0  <= 160'd0;
        Matrix_r_1  <= 160'd0;
        Matrix_r_2  <= 160'd0;
        Matrix_r_3  <= 160'd0;
        Matrix_r_4  <= 160'd0;
        Matrix_r_5  <= 160'd0;
        Matrix_r_6  <= 160'd0;
        Matrix_r_7  <= 160'd0;
        Matrix_r_8  <= 160'd0;
        Matrix_r_9  <= 160'd0;
        Matrix_r_10 <= 160'd0;
        Matrix_r_11 <= 160'd0;
        Matrix_r_12 <= 160'd0;
        Matrix_r_13 <= 160'd0;
        Matrix_r_14 <= 160'd0;
        Matrix_r_15 <= 160'd0;
        finish      <= 1'b0;
    end
    
    always @(*) begin
        {PE16_0[255:240],PE16_1[255:240],PE16_2[255:240],PE16_3[255:240],PE16_4[255:240],PE16_5[255:240],PE16_6[255:240],PE16_7[255:240],PE16_8[255:240],PE16_9[255:240]} <= Matrix_r_0;
        {PE16_0[239:224],PE16_1[239:224],PE16_2[239:224],PE16_3[239:224],PE16_4[239:224],PE16_5[239:224],PE16_6[239:224],PE16_7[239:224],PE16_8[239:224],PE16_9[239:224]} <= Matrix_r_1;
        {PE16_0[223:208],PE16_1[223:208],PE16_2[223:208],PE16_3[223:208],PE16_4[223:208],PE16_5[223:208],PE16_6[223:208],PE16_7[223:208],PE16_8[223:208],PE16_9[223:208]} <= Matrix_r_2;
        {PE16_0[207:192],PE16_1[207:192],PE16_2[207:192],PE16_3[207:192],PE16_4[207:192],PE16_5[207:192],PE16_6[207:192],PE16_7[207:192],PE16_8[207:192],PE16_9[207:192]} <= Matrix_r_3;
        {PE16_0[191:176],PE16_1[191:176],PE16_2[191:176],PE16_3[191:176],PE16_4[191:176],PE16_5[191:176],PE16_6[191:176],PE16_7[191:176],PE16_8[191:176],PE16_9[191:176]} <= Matrix_r_4;
        {PE16_0[175:160],PE16_1[175:160],PE16_2[175:160],PE16_3[175:160],PE16_4[175:160],PE16_5[175:160],PE16_6[175:160],PE16_7[175:160],PE16_8[175:160],PE16_9[175:160]} <= Matrix_r_5;
        {PE16_0[159:144],PE16_1[159:144],PE16_2[159:144],PE16_3[159:144],PE16_4[159:144],PE16_5[159:144],PE16_6[159:144],PE16_7[159:144],PE16_8[159:144],PE16_9[159:144]} <= Matrix_r_6;
        {PE16_0[143:128],PE16_1[143:128],PE16_2[143:128],PE16_3[143:128],PE16_4[143:128],PE16_5[143:128],PE16_6[143:128],PE16_7[143:128],PE16_8[143:128],PE16_9[143:128]} <= Matrix_r_7;
        {PE16_0[127:112],PE16_1[127:112],PE16_2[127:112],PE16_3[127:112],PE16_4[127:112],PE16_5[127:112],PE16_6[127:112],PE16_7[127:112],PE16_8[127:112],PE16_9[127:112]}                     <= Matrix_r_8;
        {PE16_0[111:96],PE16_1[111:96],PE16_2[111:96],PE16_3[111:96],PE16_4[111:96],PE16_5[111:96],PE16_6[111:96],PE16_7[111:96],PE16_8[111:96],PE16_9[111:96]}                               <= Matrix_r_9;
        {PE16_0[95:80],PE16_1[95:80],PE16_2[95:80],PE16_3[95:80],PE16_4[95:80],PE16_5[95:80],PE16_6[95:80],PE16_7[95:80],PE16_8[95:80],PE16_9[95:80]}                                         <= Matrix_r_10;
        {PE16_0[79:64],PE16_1[79:64],PE16_2[79:64],PE16_3[79:64],PE16_4[79:64],PE16_5[79:64],PE16_6[79:64],PE16_7[79:64],PE16_8[79:64],PE16_9[79:64]}                                         <= Matrix_r_11;
        {PE16_0[63:48],PE16_1[63:48],PE16_2[63:48],PE16_3[63:48],PE16_4[63:48],PE16_5[63:48],PE16_6[63:48],PE16_7[63:48],PE16_8[63:48],PE16_9[63:48]}                                         <= Matrix_r_12;
        {PE16_0[47:32],PE16_1[47:32],PE16_2[47:32],PE16_3[47:32],PE16_4[47:32],PE16_5[47:32],PE16_6[47:32],PE16_7[47:32],PE16_8[47:32],PE16_9[47:32]}                                         <= Matrix_r_13;
        {PE16_0[31:16],PE16_1[31:16],PE16_2[31:16],PE16_3[31:16],PE16_4[31:16],PE16_5[31:16],PE16_6[31:16],PE16_7[31:16],PE16_8[31:16],PE16_9[31:16]}                                         <= Matrix_r_14;
        {PE16_0[15:0],PE16_1[15:0],PE16_2[15:0],PE16_3[15:0],PE16_4[15:0],PE16_5[15:0],PE16_6[15:0],PE16_7[15:0],PE16_8[15:0],PE16_9[15:0]}                                                   <= Matrix_r_15;
    end
    
    always @(posedge clk) begin
        if (rst)begin
            PE16_0 <= 256'd0;
            PE16_1 <= 256'd0;
            PE16_2 <= 256'd0;
            PE16_3 <= 256'd0;
            PE16_4 <= 256'd0;
            PE16_5 <= 256'd0;
            PE16_6 <= 256'd0;
            PE16_7 <= 256'd0;
            PE16_8 <= 256'd0;
            PE16_9 <= 256'd0;
            
            
            Matrix_r_0  <= 160'd0;
            Matrix_r_1  <= 160'd0;
            Matrix_r_2  <= 160'd0;
            Matrix_r_3  <= 160'd0;
            Matrix_r_4  <= 160'd0;
            Matrix_r_5  <= 160'd0;
            Matrix_r_6  <= 160'd0;
            Matrix_r_7  <= 160'd0;
            Matrix_r_8  <= 160'd0;
            Matrix_r_9  <= 160'd0;
            Matrix_r_10 <= 160'd0;
            Matrix_r_11 <= 160'd0;
            Matrix_r_12 <= 160'd0;
            Matrix_r_13 <= 160'd0;
            Matrix_r_14 <= 160'd0;
            Matrix_r_15 <= 160'd0;
            finish      <= 1'b0;
        end
        
        else if (en)begin
        
        {Matrix_r_0,Matrix_r_1,Matrix_r_2,Matrix_r_3,Matrix_r_4,Matrix_r_5,Matrix_r_6,Matrix_r_7,Matrix_r_8,Matrix_r_9,Matrix_r_10,Matrix_r_11,Matrix_r_12,Matrix_r_13,Matrix_r_14,Matrix_r_15} <= Matrix;
        finish                                                                                                                                                                                  <= 1'b1;
    end
    end
    
    
    
endmodule //matrix_sel_10_row
