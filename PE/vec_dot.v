`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/12 14:55:49
// Design Name: 
// Module Name: dot_product_16bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vec_dot(clk, rst, vec_a, vec_b, dot_out, finish);
    input clk;
    input rst;
    input signed [255:0] vec_a;
    input signed [255:0] vec_b;
    output signed [15:0] dot_out;
    output finish;
    
    reg signed [15:0] vec_a_tmp [15:0];
    reg signed [15:0] vec_b_tmp [15:0];
    reg signed [15:0] dot_out;
    reg signed [31:0] dot_out_tmp;
    //reg signed [255:0] vec_a_reg;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    //reg signed [255:0] vec_b_reg;
    reg finish;    
    reg [4:0] i;
    reg [4:0] index;
    reg ready;
    
    //1,4,11定点小数
    reg signed [15:0]  n = 16'h0800;
    /*
    always@(*)
    begin
        vec_a_reg <= vec_a;
        vec_b_reg <= vec_b;
    end
    */
    always@(posedge clk)
    begin
        if (rst)
        begin
            i <= 5'b0_0000;
            dot_out <= 16'h0000;
            finish <= 1'b0;
            index <= 1'b0; 
            ready <= 1'b0;          
            for (index = 0; index < 5'h10; index = index + 1)
            begin
                vec_a_tmp[index] <= 16'h0000;
            end 
            for (index = 0; index < 5'h10; index = index + 1)
            begin
                vec_b_tmp[index] <= 16'h0000;
            end        
            /*
            for (index = 0; index < 5'h10; index = index + 1)
            begin
                vec_a_tmp[index] <= vec_a_reg[15:0];
                index <= index + 1'b1;
                vec_a_reg <= (vec_a_reg >> 16);
            end
            
            for (index = 0; index < 5'h10; index = index + 1)
            begin
                vec_b_tmp[index] <= vec_b_reg[15:0];
                index <= index + 1'b1;
                vec_b_reg <= (vec_b_reg >> 16);
            end
            */            
        end else
        begin
            vec_a_tmp[0] <= vec_a[15:0];
            vec_a_tmp[1] <= vec_a[31:16];
            vec_a_tmp[2] <= vec_a[47:32];
            vec_a_tmp[3] <= vec_a[63:48];
            vec_a_tmp[4] <= vec_a[79:64];
            vec_a_tmp[5] <= vec_a[95:80];
            vec_a_tmp[6] <= vec_a[111:96];
            vec_a_tmp[7] <= vec_a[127:112];
            vec_a_tmp[8] <= vec_a[143:128];
            vec_a_tmp[9] <= vec_a[159:144];
            vec_a_tmp[10] <= vec_a[175:160];
            vec_a_tmp[11] <= vec_a[191:176];
            vec_a_tmp[12] <= vec_a[207:192];
            vec_a_tmp[13] <= vec_a[223:208];
            vec_a_tmp[14] <= vec_a[239:224];
            vec_a_tmp[15] <= vec_a[255:240];
            
            vec_b_tmp[0] <= vec_b[15:0];
            vec_b_tmp[1] <= vec_b[31:16];
            vec_b_tmp[2] <= vec_b[47:32];
            vec_b_tmp[3] <= vec_b[63:48];
            vec_b_tmp[4] <= vec_b[79:64];
            vec_b_tmp[5] <= vec_b[95:80];
            vec_b_tmp[6] <= vec_b[111:96];
            vec_b_tmp[7] <= vec_b[127:112];
            vec_b_tmp[8] <= vec_b[143:128];
            vec_b_tmp[9] <= vec_b[159:144];
            vec_b_tmp[10] <= vec_b[175:160];
            vec_b_tmp[11] <= vec_b[191:176];
            vec_b_tmp[12] <= vec_b[207:192];
            vec_b_tmp[13] <= vec_b[223:208];
            vec_b_tmp[14] <= vec_b[239:224];
            vec_b_tmp[15] <= vec_b[255:240];
            ready <= 1'b1;
            
            if (ready)
            begin
                if (i > 4'b1111)
                begin
                    finish <= 1'b1;
                end else
                begin
                    dot_out_tmp = vec_a_tmp[i] * vec_b_tmp[i];
                    //dot_out <= dot_out + vec_a_tmp[i] * vec_b_tmp[i] / n;
                    dot_out = dot_out + dot_out_tmp / 16'h0800;
                    i <= i + 1'b1;
                end
            end
        end
    end
    
endmodule
