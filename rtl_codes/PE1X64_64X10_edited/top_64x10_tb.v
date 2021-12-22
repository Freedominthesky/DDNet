`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/12/21 16:33:58
// Design Name:
// Module Name: top_64x64_tb
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

module top_64x10_tb();
    
    reg clk;
    reg rst;
    reg en;
    reg signed [1023:0] ai;
    reg signed [10239:0] Matrix;
    wire signed  [159:0] psum;
    wire finish;
    
    reg signed [15:0] a;
    /*
     reg signed [15:0] b;
     reg signed [4095:0] c;//16x16 Matrix
     */
    
    parameter cycle = 10;//100MHz
    
    top_1x64_64x10 inst(
    .clk(clk),
    .rst(rst),
    .en(en),
    .ai(ai),
    .Matrix(Matrix),
    .psum(psum),
    .finish(finish)
    );
    
    initial
    begin
        clk = 1'b0;
        forever
            #(cycle/2) clk = ~clk;
    end
    
    initial
    begin
        rst     = 1'b1;
        #20 rst = 1'b0;
    end
    
    initial
    begin
        en     = 1'b0;
        #40 en = 1'b1;
    end
    
    initial
    begin
        a      = 16'h0200;//a      = 0.03125
        //b    = 16'h1000;//b    = 2
        //   c = {a,b,{252{a}},b,a};
        ai     = {64{a}};
        Matrix = {640{a}};
    end
    
endmodule
    
