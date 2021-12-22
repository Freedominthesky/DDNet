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
    
    reg signed [255:0] Matrix_r_0;
    reg signed [255:0] Matrix_r_1;
    reg signed [255:0] Matrix_r_2;
    reg signed [255:0] Matrix_r_3;
    reg signed [255:0] Matrix_r_4;
    reg signed [255:0] Matrix_r_5;
    reg signed [255:0] Matrix_r_6;
    reg signed [255:0] Matrix_r_7;
    reg signed [255:0] Matrix_r_8;
    reg signed [255:0] Matrix_r_9;
    reg signed [255:0] Matrix_r_10;
    reg signed [255:0] Matrix_r_11;
    reg signed [255:0] Matrix_r_12;
    reg signed [255:0] Matrix_r_13;
    reg signed [255:0] Matrix_r_14;
    reg signed [255:0] Matrix_r_15;
    
    
    
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
        
        Matrix_r_0  <= 256'd0;
        Matrix_r_1  <= 256'd0;
        Matrix_r_2  <= 256'd0;
        Matrix_r_3  <= 256'd0;
        Matrix_r_4  <= 256'd0;
        Matrix_r_5  <= 256'd0;
        Matrix_r_6  <= 256'd0;
        Matrix_r_7  <= 256'd0;
        Matrix_r_8  <= 256'd0;
        Matrix_r_9  <= 256'd0;
        Matrix_r_10 <= 256'd0;
        Matrix_r_11 <= 256'd0;
        Matrix_r_12 <= 256'd0;
        Matrix_r_13 <= 256'd0;
        Matrix_r_14 <= 256'd0;
        Matrix_r_15 <= 256'd0;
        finish      <= 1'b0;
    end
    
    always @(*)begin
        {Matrix_r_0,Matrix_r_1,Matrix_r_2,Matrix_r_3,Matrix_r_4,Matrix_r_5,Matrix_r_6,Matrix_r_7,Matrix_r_8,Matrix_r_9,Matrix_r_10,Matrix_r_11,Matrix_r_12,Matrix_r_13,Matrix_r_14,Matrix_r_15} <= Matrix;
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
            
            Matrix_r_0  <= 256'd0;
            Matrix_r_1  <= 256'd0;
            Matrix_r_2  <= 256'd0;
            Matrix_r_3  <= 256'd0;
            Matrix_r_4  <= 256'd0;
            Matrix_r_5  <= 256'd0;
            Matrix_r_6  <= 256'd0;
            Matrix_r_7  <= 256'd0;
            Matrix_r_8  <= 256'd0;
            Matrix_r_9  <= 256'd0;
            Matrix_r_10 <= 256'd0;
            Matrix_r_11 <= 256'd0;
            Matrix_r_12 <= 256'd0;
            Matrix_r_13 <= 256'd0;
            Matrix_r_14 <= 256'd0;
            Matrix_r_15 <= 256'd0;
            finish      <= 1'b0;
        end
        else if (en)begin
            {Matrix_0[255:240],Matrix_1[255:240],Matrix_2[255:240],Matrix_3[255:240],Matrix_4[255:240],Matrix_5[255:240],Matrix_6[255:240],Matrix_7[255:240],Matrix_8[255:240],Matrix_9[255:240],Matrix_10[255:240],Matrix_11[255:240],Matrix_12[255:240],Matrix_13[255:240],Matrix_14[255:240],Matrix_15[255:240]} <= Matrix_r_0;
            {Matrix_0[239:224],Matrix_1[239:224],Matrix_2[239:224],Matrix_3[239:224],Matrix_4[239:224],Matrix_5[239:224],Matrix_6[239:224],Matrix_7[239:224],Matrix_8[239:224],Matrix_9[239:224],Matrix_10[239:224],Matrix_11[239:224],Matrix_12[239:224],Matrix_13[239:224],Matrix_14[239:224],Matrix_15[239:224]} <= Matrix_r_1;
            {Matrix_0[223:208],Matrix_1[223:208],Matrix_2[223:208],Matrix_3[223:208],Matrix_4[223:208],Matrix_5[223:208],Matrix_6[223:208],Matrix_7[223:208],Matrix_8[223:208],Matrix_9[223:208],Matrix_10[223:208],Matrix_11[223:208],Matrix_12[223:208],Matrix_13[223:208],Matrix_14[223:208],Matrix_15[223:208]} <= Matrix_r_2;
            {Matrix_0[207:192],Matrix_1[207:192],Matrix_2[207:192],Matrix_3[207:192],Matrix_4[207:192],Matrix_5[207:192],Matrix_6[207:192],Matrix_7[207:192],Matrix_8[207:192],Matrix_9[207:192],Matrix_10[207:192],Matrix_11[207:192],Matrix_12[207:192],Matrix_13[207:192],Matrix_14[207:192],Matrix_15[207:192]} <= Matrix_r_3;
            {Matrix_0[191:176],Matrix_1[191:176],Matrix_2[191:176],Matrix_3[191:176],Matrix_4[191:176],Matrix_5[191:176],Matrix_6[191:176],Matrix_7[191:176],Matrix_8[191:176],Matrix_9[191:176],Matrix_10[191:176],Matrix_11[191:176],Matrix_12[191:176],Matrix_13[191:176],Matrix_14[191:176],Matrix_15[191:176]} <= Matrix_r_4;
            {Matrix_0[175:160],Matrix_1[175:160],Matrix_2[175:160],Matrix_3[175:160],Matrix_4[175:160],Matrix_5[175:160],Matrix_6[175:160],Matrix_7[175:160],Matrix_8[175:160],Matrix_9[175:160],Matrix_10[175:160],Matrix_11[175:160],Matrix_12[175:160],Matrix_13[175:160],Matrix_14[175:160],Matrix_15[175:160]} <= Matrix_r_5;
            {Matrix_0[159:144],Matrix_1[159:144],Matrix_2[159:144],Matrix_3[159:144],Matrix_4[159:144],Matrix_5[159:144],Matrix_6[159:144],Matrix_7[159:144],Matrix_8[159:144],Matrix_9[159:144],Matrix_10[159:144],Matrix_11[159:144],Matrix_12[159:144],Matrix_13[159:144],Matrix_14[159:144],Matrix_15[159:144]} <= Matrix_r_6;
            {Matrix_0[143:128],Matrix_1[143:128],Matrix_2[143:128],Matrix_3[143:128],Matrix_4[143:128],Matrix_5[143:128],Matrix_6[143:128],Matrix_7[143:128],Matrix_8[143:128],Matrix_9[143:128],Matrix_10[143:128],Matrix_11[143:128],Matrix_12[143:128],Matrix_13[143:128],Matrix_14[143:128],Matrix_15[143:128]} <= Matrix_r_7;
            {Matrix_0[127:112],Matrix_1[127:112],Matrix_2[127:112],Matrix_3[127:112],Matrix_4[127:112],Matrix_5[127:112],Matrix_6[127:112],Matrix_7[127:112],Matrix_8[127:112],Matrix_9[127:112],Matrix_10[127:112],Matrix_11[127:112],Matrix_12[127:112],Matrix_13[127:112],Matrix_14[127:112],Matrix_15[127:112]} <= Matrix_r_8;
            {Matrix_0[111:96],Matrix_1[111:96],Matrix_2[111:96],Matrix_3[111:96],Matrix_4[111:96],Matrix_5[111:96],Matrix_6[111:96],Matrix_7[111:96],Matrix_8[111:96],Matrix_9[111:96],Matrix_10[111:96],Matrix_11[111:96],Matrix_12[111:96],Matrix_13[111:96],Matrix_14[111:96],Matrix_15[111:96]}                 <= Matrix_r_9;
            {Matrix_0[95:80],Matrix_1[95:80],Matrix_2[95:80],Matrix_3[95:80],Matrix_4[95:80],Matrix_5[95:80],Matrix_6[95:80],Matrix_7[95:80],Matrix_8[95:80],Matrix_9[95:80],Matrix_10[95:80],Matrix_11[95:80],Matrix_12[95:80],Matrix_13[95:80],Matrix_14[95:80],Matrix_15[95:80]}                                 <= Matrix_r_10;
            {Matrix_0[79:64],Matrix_1[79:64],Matrix_2[79:64],Matrix_3[79:64],Matrix_4[79:64],Matrix_5[79:64],Matrix_6[79:64],Matrix_7[79:64],Matrix_8[79:64],Matrix_9[79:64],Matrix_10[79:64],Matrix_11[79:64],Matrix_12[79:64],Matrix_13[79:64],Matrix_14[79:64],Matrix_15[79:64]}                                 <= Matrix_r_11;
            {Matrix_0[63:48],Matrix_1[63:48],Matrix_2[63:48],Matrix_3[63:48],Matrix_4[63:48],Matrix_5[63:48],Matrix_6[63:48],Matrix_7[63:48],Matrix_8[63:48],Matrix_9[63:48],Matrix_10[63:48],Matrix_11[63:48],Matrix_12[63:48],Matrix_13[63:48],Matrix_14[63:48],Matrix_15[63:48]}                                 <= Matrix_r_12;
            {Matrix_0[47:32],Matrix_1[47:32],Matrix_2[47:32],Matrix_3[47:32],Matrix_4[47:32],Matrix_5[47:32],Matrix_6[47:32],Matrix_7[47:32],Matrix_8[47:32],Matrix_9[47:32],Matrix_10[47:32],Matrix_11[47:32],Matrix_12[47:32],Matrix_13[47:32],Matrix_14[47:32],Matrix_15[47:32]}                                 <= Matrix_r_13;
            {Matrix_0[31:16],Matrix_1[31:16],Matrix_2[31:16],Matrix_3[31:16],Matrix_4[31:16],Matrix_5[31:16],Matrix_6[31:16],Matrix_7[31:16],Matrix_8[31:16],Matrix_9[31:16],Matrix_10[31:16],Matrix_11[31:16],Matrix_12[31:16],Matrix_13[31:16],Matrix_14[31:16],Matrix_15[31:16]}                                 <= Matrix_r_14;
            {Matrix_0[15:0],Matrix_1[15:0],Matrix_2[15:0],Matrix_3[15:0],Matrix_4[15:0],Matrix_5[15:0],Matrix_6[15:0],Matrix_7[15:0],Matrix_8[15:0],Matrix_9[15:0],Matrix_10[15:0],Matrix_11[15:0],Matrix_12[15:0],Matrix_13[15:0],Matrix_14[15:0],Matrix_15[15:0]}                                                 <= Matrix_r_15;
            finish                                                                                                                                                                                                                                                                                                  <= 1'b1;
        end
            end
            endmodule
