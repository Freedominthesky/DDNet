`timescale 1ns / 1ps

module matrix_sel_784 (input clk,
                       input rst,
                       input en,
                       input signed [802815:0] Matrix,      //784x64 Matrix
                       output reg signed [65535:0] PE64_0,
                       output reg signed [65535:0] PE64_1,  //64x64 Matrix
                       output reg signed [65535:0] PE64_2,
                       output reg signed [65535:0] PE64_3,
                       output reg signed [65535:0] PE64_4,
                       output reg signed [65535:0] PE64_5,  //64x64 Matrix
                       output reg signed [65535:0] PE64_6,
                       output reg signed [65535:0] PE64_7,
                       output reg signed [65535:0] PE64_8,  //64x64 Matrix
                       output reg signed [65535:0] PE64_9,
                       output reg signed [65535:0] PE64_10,
                       output reg signed [65535:0] PE64_11, //64x64 Matrix
                       output reg signed [16383:0] PE64_12, //16x64 Matrix
                       output reg finish);
    
    
    
    
    initial begin
        PE64_0  <= 65536'd0;
        PE64_1  <= 65536'd0;
        PE64_2  <= 65536'd0;
        PE64_3  <= 65536'd0;
        PE64_4  <= 65536'd0;
        PE64_5  <= 65536'd0;
        PE64_6  <= 65536'd0;
        PE64_7  <= 65536'd0;
        PE64_8  <= 65536'd0;
        PE64_9  <= 65536'd0;
        PE64_10 <= 65536'd0;
        PE64_11 <= 65536'd0;
        PE64_12 <= 16384'd0;
        
        finish <= 1'b0;
        
        /*
         matrix_block_0 <= 185344'd0;
         matrix_block_1 <= 185344'd0;
         matrix_block_2 <= 185344'd0;
         matrix_block_3 <= 185344'd0;
         */
        
    end
    
    
    always @(posedge clk) begin
        if (rst) begin
            PE64_0  <= 65536'd0;
            PE64_1  <= 65536'd0;
            PE64_2  <= 65536'd0;
            PE64_3  <= 65536'd0;
            PE64_4  <= 65536'd0;
            PE64_5  <= 65536'd0;
            PE64_6  <= 65536'd0;
            PE64_7  <= 65536'd0;
            PE64_8  <= 65536'd0;
            PE64_9  <= 65536'd0;
            PE64_10 <= 65536'd0;
            PE64_11 <= 65536'd0;
            PE64_12 <= 16384'd0;
            
            finish <= 1'b0;
        end
        else if (en) begin
            /*
             {PE64_0[65535:49152],PE64_1[65535:49152],PE64_2[65535:49152],PE64_3[65535:49152],PE64_4[65535:49152],PE64_5[65535:49152],PE64_6[65535:49152],PE64_7[65535:49152],PE64_8[65535:49152],PE64_9[65535:49152],PE64_10[65535:49152],PE64_11[16383:12288],PE64_12_tmp[4095:3072]} <= matrix_block_0;
             {PE64_0[49151:32768],PE64_1[49151:32768],PE64_2[49151:32768],PE64_3[49151:32768],PE64_4[49151:32768],PE64_5[49151:32768],PE64_6[49151:32768],PE64_7[49151:32768],PE64_8[49151:32768],PE64_9[49151:32768],PE64_10[49151:32768],PE64_11[12287:8192],PE64_12_tmp[3071:2048]}  <= matrix_block_1;
             {PE64_0[32767:16384],PE64_1[32767:16384],PE64_2[32767:16384],PE64_3[32767:16384],PE64_4[32767:16384],PE64_5[32767:16384],PE64_6[32767:16384],PE64_7[32767:16384],PE64_8[32767:16384],PE64_9[32767:16384],PE64_10[32767:16384],PE64_11[8191:4096],PE64_12_tmp[2047:1024]}   <= matrix_block_2;
             {PE64_0[16383:0],PE64_1[16383:0],PE64_2[16383:0],PE64_3[16383:0],PE64_4[16383:0],PE64_5[16383:0],PE64_6[16383:0],PE64_7[16383:0],PE64_8[16383:0],PE64_9[16383:0],PE64_10[16383:0],PE64_11[4095:0],PE64_12_tmp[1023:0]}                                                     <= matrix_block_3;
             */
            {PE64_0,PE64_1,PE64_2,PE64_3,PE64_4,PE64_5,PE64_6,PE64_7,PE64_8,PE64_9,PE64_10,PE64_11,PE64_12} <= Matrix;
            finish                                                                                          <= 1'b1;
        end
            end
            
            
            endmodule //matrix_sel_724
