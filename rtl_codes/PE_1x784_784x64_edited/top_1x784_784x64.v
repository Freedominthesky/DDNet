`timescale 1ns / 1ps

module top_1x784_784x64 (input clk,
                         input rst,
                         input en,
                         input signed [12543:0] ai,       //1x784 vector
                         input signed [802815:0] Matrix,  //784x64 Matrix
                         output reg signed [1023:0] psum, //1x64 vector
                         output reg finish);
    //vector sel
    wire signed [1023:0] vector_0;
    wire signed [1023:0] vector_1;
    wire signed [1023:0] vector_2;
    wire signed [1023:0] vector_3;
    wire signed [1023:0] vector_4;
    wire signed [1023:0] vector_5;
    wire signed [1023:0] vector_6;
    wire signed [1023:0] vector_7;
    wire signed [1023:0] vector_8;
    wire signed [1023:0] vector_9;
    wire signed [1023:0] vector_10;
    wire signed [1023:0] vector_11;
    wire signed [255:0] vector_12;
    wire finish_vector_sel;
    
    reg signed [1023:0] vector_tmp_0;
    reg signed [1023:0] vector_tmp_1;
    reg signed [1023:0] vector_tmp_2;
    reg signed [1023:0] vector_tmp_3;
    reg signed [1023:0] vector_tmp_4;
    reg signed [1023:0] vector_tmp_5;
    reg signed [1023:0] vector_tmp_6;
    reg signed [1023:0] vector_tmp_7;
    reg signed [1023:0] vector_tmp_8;
    reg signed [1023:0] vector_tmp_9;
    reg signed [1023:0] vector_tmp_10;
    reg signed [1023:0] vector_tmp_11;
    reg signed [255:0] vector_tmp_12;
    reg finish_vector_sel_tmp;
    
    //matrix sel
    
    wire signed [65535:0] PE64_0;
    wire signed [65535:0] PE64_1;
    wire signed [65535:0] PE64_2;
    wire signed [65535:0] PE64_3;
    wire signed [65535:0] PE64_4;
    wire signed [65535:0] PE64_5;
    wire signed [65535:0] PE64_6;
    wire signed [65535:0] PE64_7;
    wire signed [65535:0] PE64_8;
    wire signed [65535:0] PE64_9;
    wire signed [65535:0] PE64_10;
    wire signed [65535:0] PE64_11;
    wire signed [16383:0] PE64_12;
    wire finish_PE64_sel;
    
    reg signed [65535:0] PE64_tmp_0;
    reg signed [65535:0] PE64_tmp_1;
    reg signed [65535:0] PE64_tmp_2;
    reg signed [65535:0] PE64_tmp_3;
    reg signed [65535:0] PE64_tmp_4;
    reg signed [65535:0] PE64_tmp_5;
    reg signed [65535:0] PE64_tmp_6;
    reg signed [65535:0] PE64_tmp_7;
    reg signed [65535:0] PE64_tmp_8;
    reg signed [65535:0] PE64_tmp_9;
    reg signed [65535:0] PE64_tmp_10;
    reg signed [65535:0] PE64_tmp_11;
    reg signed [16383:0] PE64_tmp_12;
    reg finish_PE64_sel_tmp;
    
    // 12 x 64x64 and 16x64
    wire signed [1023:0] psum_0;
    wire signed [1023:0] psum_1;
    wire signed [1023:0] psum_2;
    wire signed [1023:0] psum_3;
    wire signed [1023:0] psum_4;
    wire signed [1023:0] psum_5;
    wire signed [1023:0] psum_6;
    wire signed [1023:0] psum_7;
    wire signed [1023:0] psum_8;
    wire signed [1023:0] psum_9;
    wire signed [1023:0] psum_10;
    wire signed [1023:0] psum_11;
    
    reg signed [1023:0] psum_f_0;
    reg signed [1023:0] psum_f_1;
    reg signed [1023:0] psum_f_2;
    reg signed [1023:0] psum_f_3;
    reg signed [1023:0] psum_f_4;
    reg signed [1023:0] psum_f_5;
    reg signed [1023:0] psum_f_6;
    reg signed [1023:0] psum_f_7;
    reg signed [1023:0] psum_f_8;
    reg signed [1023:0] psum_f_9;
    reg signed [1023:0] psum_f_10;
    reg signed [1023:0] psum_f_11;
    
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
    wire finish_10;
    wire finish_11;
    
    wire signed [4095:0] p_12_set0;
    wire signed [4095:0] p_12_set1;
    wire signed [4095:0] p_12_set2;
    wire signed [4095:0] p_12_set3;
    wire finish_p12_divide;
    
    reg signed [4095:0] p_12_tmp_set0;
    reg signed [4095:0] p_12_tmp_set1;
    reg signed [4095:0] p_12_tmp_set2;
    reg signed [4095:0] p_12_tmp_set3;
    reg finish_p12_tmp_divide;
    
    wire signed [255:0] p_12_s0;
    wire signed [255:0] p_12_s1;
    wire signed [255:0] p_12_s2;
    wire signed [255:0] p_12_s3;
    wire finish_p12_s0;
    wire finish_p12_s1;
    wire finish_p12_s2;
    wire finish_p12_s3;
    
    reg signed [1023:0] psum_12;
    
    vector_sel_784 vector_sel_784(
    .clk(clk),
    .rst(rst),
    .en(en),
    .vector(ai),
    .vector_0(vector_0),
    .vector_1(vector_1),
    .vector_2(vector_2),
    .vector_3(vector_3),
    .vector_4(vector_4),
    .vector_5(vector_5),
    .vector_6(vector_6),
    .vector_7(vector_7),
    .vector_8(vector_8),
    .vector_9(vector_9),
    .vector_10(vector_10),
    .vector_11(vector_11),
    .vector_12(vector_12),
    .finish(finish_vector_sel)
    );
    
    matrix_sel_784 matrix_sel_784(
    .clk(clk),
    .rst(rst),
    .en(finish_vector_sel_tmp),
    .Matrix(Matrix),
    .PE64_0(PE64_0),
    .PE64_1(PE64_1),
    .PE64_2(PE64_2),
    .PE64_3(PE64_3),
    .PE64_4(PE64_4),
    .PE64_5(PE64_5),
    .PE64_6(PE64_6),
    .PE64_7(PE64_7),
    .PE64_8(PE64_8),
    .PE64_9(PE64_9),
    .PE64_10(PE64_10),
    .PE64_11(PE64_11),
    .PE64_12(PE64_12),
    .finish(finish_PE64_sel)
    );
    
    top_64x64 p_0(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_0),
    .Matrix(PE64_tmp_0),
    .psum(psum_0),
    .finish(finish_0)
    );
    
    top_64x64 p_1(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_1),
    .Matrix(PE64_tmp_1),
    .psum(psum_1),
    .finish(finish_1)
    );
    
    top_64x64 p_2(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_2),
    .Matrix(PE64_tmp_2),
    .psum(psum_2),
    .finish(finish_2)
    );
    
    top_64x64 p_3(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_3),
    .Matrix(PE64_tmp_3),
    .psum(psum_3),
    .finish(finish_3)
    );
    
    top_64x64 p_4(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_4),
    .Matrix(PE64_tmp_4),
    .psum(psum_4),
    .finish(finish_4)
    );
    
    top_64x64 p_5(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_5),
    .Matrix(PE64_tmp_5),
    .psum(psum_5),
    .finish(finish_5)
    );
    
    top_64x64 p_6(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_6),
    .Matrix(PE64_tmp_6),
    .psum(psum_6),
    .finish(finish_6)
    );
    
    top_64x64 p_7(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_7),
    .Matrix(PE64_tmp_7),
    .psum(psum_7),
    .finish(finish_7)
    );
    
    top_64x64 p_8(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_8),
    .Matrix(PE64_tmp_8),
    .psum(psum_8),
    .finish(finish_8)
    );
    
    top_64x64 p_9(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_9),
    .Matrix(PE64_tmp_9),
    .psum(psum_9),
    .finish(finish_9)
    );
    
    top_64x64 p_10(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_10),
    .Matrix(PE64_tmp_10),
    .psum(psum_10),
    .finish(finish_10)
    );
    
    top_64x64 p_11(
    .clk(clk),
    .en(finish_PE64_sel_tmp),
    .rst(rst),
    .ai(vector_tmp_11),
    .Matrix(PE64_tmp_11),
    .psum(psum_11),
    .finish(finish_11)
    );
    
    matrix_sel_64_row p_12_divide(
    .clk(clk),
    .rst(rst),
    .en(finish_PE64_sel_tmp),
    .Matrix(PE64_tmp_12),
    .PE16_0(p_12_set0),
    .PE16_1(p_12_set1),
    .PE16_2(p_12_set2),
    .PE16_3(p_12_set3),
    .finish(finish_p12_divide)
    );
    
    top_16x16 p_12_0(
    .clk(clk),
    .rst(rst),
    .en(finish_p12_tmp_divide),
    .ai(vector_tmp_12),
    .Matrix(p_12_set0),
    .psum(p_12_s0),
    .finish(finish_p12_s0)
    );
    
    top_16x16 p_12_1(
    .clk(clk),
    .rst(rst),
    .en(finish_p12_tmp_divide),
    .ai(vector_tmp_12),
    .Matrix(p_12_set1),
    .psum(p_12_s1),
    .finish(finish_p12_s1)
    );
    
    top_16x16 p_12_2(
    .clk(clk),
    .rst(rst),
    .en(finish_p12_tmp_divide),
    .ai(vector_tmp_12),
    .Matrix(p_12_set2),
    .psum(p_12_s2),
    .finish(finish_p12_s2)
    );
    
    top_16x16 p_12_3(
    .clk(clk),
    .rst(rst),
    .en(finish_p12_tmp_divide),
    .ai(vector_tmp_12),
    .Matrix(p_12_set3),
    .psum(p_12_s3),
    .finish(finish_p12_s3)
    );
    
    initial begin
        vector_tmp_0          <= 1024'd0;
        vector_tmp_1          <= 1024'd0;
        vector_tmp_2          <= 1024'd0;
        vector_tmp_3          <= 1024'd0;
        vector_tmp_4          <= 1024'd0;
        vector_tmp_5          <= 1024'd0;
        vector_tmp_6          <= 1024'd0;
        vector_tmp_7          <= 1024'd0;
        vector_tmp_8          <= 1024'd0;
        vector_tmp_9          <= 1024'd0;
        vector_tmp_10         <= 1024'd0;
        vector_tmp_11         <= 1024'd0;
        vector_tmp_12         <= 256'd0;
        finish_vector_sel_tmp <= 1'b0;
        
        PE64_tmp_0          <= 65536'd0;
        PE64_tmp_1          <= 65536'd0;
        PE64_tmp_2          <= 65536'd0;
        PE64_tmp_3          <= 65536'd0;
        PE64_tmp_4          <= 65536'd0;
        PE64_tmp_5          <= 65536'd0;
        PE64_tmp_6          <= 65536'd0;
        PE64_tmp_7          <= 65536'd0;
        PE64_tmp_8          <= 65536'd0;
        PE64_tmp_9          <= 65536'd0;
        PE64_tmp_10         <= 65536'd0;
        PE64_tmp_11         <= 65536'd0;
        PE64_tmp_12         <= 16384'd0;
        finish_PE64_sel_tmp <= 1'b0;
        
        p_12_tmp_set0         <= 4096'd0;
        p_12_tmp_set1         <= 4096'd0;
        p_12_tmp_set2         <= 4096'd0;
        p_12_tmp_set3         <= 4096'd0;
        finish_p12_tmp_divide <= 1'b0;
        
        psum_f_0  <= 1024'd0;
        psum_f_1  <= 1024'd0;
        psum_f_2  <= 1024'd0;
        psum_f_3  <= 1024'd0;
        psum_f_4  <= 1024'd0;
        psum_f_5  <= 1024'd0;
        psum_f_6  <= 1024'd0;
        psum_f_7  <= 1024'd0;
        psum_f_8  <= 1024'd0;
        psum_f_9  <= 1024'd0;
        psum_f_10 <= 1024'd0;
        psum_f_11 <= 1024'd0;
        
        psum_12 <= 1024'd0;
        
        finish <= 1'b0;
        
        psum <= 1024'd0;
    end
    
    always @(*) begin
        vector_tmp_0          <= vector_0;
        vector_tmp_1          <= vector_1;
        vector_tmp_2          <= vector_2;
        vector_tmp_3          <= vector_3;
        vector_tmp_4          <= vector_4;
        vector_tmp_5          <= vector_5;
        vector_tmp_6          <= vector_6;
        vector_tmp_7          <= vector_7;
        vector_tmp_8          <= vector_8;
        vector_tmp_9          <= vector_9;
        vector_tmp_10         <= vector_10;
        vector_tmp_11         <= vector_11;
        vector_tmp_12         <= vector_12;
        finish_vector_sel_tmp <= finish_vector_sel;
        
        PE64_tmp_0          <= PE64_0;
        PE64_tmp_1          <= PE64_1;
        PE64_tmp_2          <= PE64_2;
        PE64_tmp_3          <= PE64_3;
        PE64_tmp_4          <= PE64_4;
        PE64_tmp_5          <= PE64_5;
        PE64_tmp_6          <= PE64_6;
        PE64_tmp_7          <= PE64_7;
        PE64_tmp_8          <= PE64_8;
        PE64_tmp_9          <= PE64_9;
        PE64_tmp_10         <= PE64_10;
        PE64_tmp_11         <= PE64_11;
        PE64_tmp_12         <= PE64_12;
        finish_PE64_sel_tmp <= finish_PE64_sel;
        
        p_12_tmp_set0 <= p_12_set0;
        p_12_tmp_set1 <= p_12_set1;
        p_12_tmp_set2 <= p_12_set2;
        p_12_tmp_set3 <= p_12_set3;
        
        finish_p12_tmp_divide <= finish_p12_divide;
        
        psum_f_0  <= psum_0;
        psum_f_1  <= psum_1;
        psum_f_2  <= psum_2;
        psum_f_3  <= psum_3;
        psum_f_4  <= psum_4;
        psum_f_5  <= psum_5;
        psum_f_6  <= psum_6;
        psum_f_7  <= psum_7;
        psum_f_8  <= psum_8;
        psum_f_9  <= psum_9;
        psum_f_10 <= psum_10;
        psum_f_11 <= psum_11;
        
        psum_12 <= {p_12_s0,p_12_s1,p_12_s2,p_12_s3};
    end
    
    always @(posedge clk) begin
        if (rst) begin
            vector_tmp_0          <= 1024'd0;
            vector_tmp_1          <= 1024'd0;
            vector_tmp_2          <= 1024'd0;
            vector_tmp_3          <= 1024'd0;
            vector_tmp_4          <= 1024'd0;
            vector_tmp_5          <= 1024'd0;
            vector_tmp_6          <= 1024'd0;
            vector_tmp_7          <= 1024'd0;
            vector_tmp_8          <= 1024'd0;
            vector_tmp_9          <= 1024'd0;
            vector_tmp_10         <= 1024'd0;
            vector_tmp_11         <= 1024'd0;
            vector_tmp_12         <= 256'd0;
            finish_vector_sel_tmp <= 1'b0;
            
            PE64_tmp_0          <= 65536'd0;
            PE64_tmp_1          <= 65536'd0;
            PE64_tmp_2          <= 65536'd0;
            PE64_tmp_3          <= 65536'd0;
            PE64_tmp_4          <= 65536'd0;
            PE64_tmp_5          <= 65536'd0;
            PE64_tmp_6          <= 65536'd0;
            PE64_tmp_7          <= 65536'd0;
            PE64_tmp_8          <= 65536'd0;
            PE64_tmp_9          <= 65536'd0;
            PE64_tmp_10         <= 65536'd0;
            PE64_tmp_11         <= 65536'd0;
            PE64_tmp_12         <= 16384'd0;
            finish_PE64_sel_tmp <= 1'b0;
            
            p_12_tmp_set0         <= 4096'd0;
            p_12_tmp_set1         <= 4096'd0;
            p_12_tmp_set2         <= 4096'd0;
            p_12_tmp_set3         <= 4096'd0;
            finish_p12_tmp_divide <= 1'b0;
            
            psum_f_0  <= 1024'd0;
            psum_f_1  <= 1024'd0;
            psum_f_2  <= 1024'd0;
            psum_f_3  <= 1024'd0;
            psum_f_4  <= 1024'd0;
            psum_f_5  <= 1024'd0;
            psum_f_6  <= 1024'd0;
            psum_f_7  <= 1024'd0;
            psum_f_8  <= 1024'd0;
            psum_f_9  <= 1024'd0;
            psum_f_10 <= 1024'd0;
            psum_f_11 <= 1024'd0;
            
            psum_12 <= 1024'd0;
            
            finish <= 1'b0;
            
            psum <= 1024'd0;
        end
        else if (en & finish_vector_sel & finish_PE64_sel & finish_0 & finish_p12_divide & finish_p12_s0) begin
            psum   <= psum_f_0+psum_f_1+psum_f_2+psum_f_3+psum_f_4+psum_f_5+psum_f_6+psum_f_7+psum_f_8+psum_f_9+psum_f_10+psum_f_11+psum_12;
            finish <= 1'b1;
        end
            
            end
            
            endmodule //top_1x784_784x64
