`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/12/18 
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


module vec_dot(input clk,
               input rst,
               input en,
               input signed [255:0] vec_a,
               input signed [255:0] vec_b,
               output reg signed [15:0] dot_out,
               output reg finish);

    reg signed [15:0] vec_a_0;
    reg signed [15:0] vec_a_1;
    reg signed [15:0] vec_a_2;
    reg signed [15:0] vec_a_3;
    reg signed [15:0] vec_a_4;
    reg signed [15:0] vec_a_5;
    reg signed [15:0] vec_a_6;
    reg signed [15:0] vec_a_7;
    reg signed [15:0] vec_a_8;
    reg signed [15:0] vec_a_9;
    reg signed [15:0] vec_a_10;
    reg signed [15:0] vec_a_11;
    reg signed [15:0] vec_a_12;
    reg signed [15:0] vec_a_13;
    reg signed [15:0] vec_a_14;
    reg signed [15:0] vec_a_15;

    reg signed [15:0] vec_b_0;
    reg signed [15:0] vec_b_1;
    reg signed [15:0] vec_b_2;
    reg signed [15:0] vec_b_3;
    reg signed [15:0] vec_b_4;
    reg signed [15:0] vec_b_5;
    reg signed [15:0] vec_b_6;
    reg signed [15:0] vec_b_7;
    reg signed [15:0] vec_b_8;
    reg signed [15:0] vec_b_9;
    reg signed [15:0] vec_b_10;
    reg signed [15:0] vec_b_11;
    reg signed [15:0] vec_b_12;
    reg signed [15:0] vec_b_13;
    reg signed [15:0] vec_b_14;
    reg signed [15:0] vec_b_15;

    reg finish_import_data;

    wire [15:0] dot_out_0;
    wire [15:0] dot_out_1;
    wire [15:0] dot_out_2;
    wire [15:0] dot_out_3;
    wire [15:0] dot_out_4;
    wire [15:0] dot_out_5;
    wire [15:0] dot_out_6;
    wire [15:0] dot_out_7;
    wire [15:0] dot_out_8;
    wire [15:0] dot_out_9;
    wire [15:0] dot_out_10;
    wire [15:0] dot_out_11;
    wire [15:0] dot_out_12;
    wire [15:0] dot_out_13;
    wire [15:0] dot_out_14;
    wire [15:0] dot_out_15;

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
    wire finish_12;
    wire finish_13;
    wire finish_14;
    wire finish_15;


    vec_dot_basic dot_0(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_0),
        .vec_b(vec_b_0),
        .dot_out(dot_out_0),
        .finish(finish_0)
    );

    vec_dot_basic dot_1(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_1),
        .vec_b(vec_b_1),
        .dot_out(dot_out_1),
        .finish(finish_1)
    );

    vec_dot_basic dot_2(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_2),
        .vec_b(vec_b_2),
        .dot_out(dot_out_2),
        .finish(finish_2)
    );

    vec_dot_basic dot_3(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_3),
        .vec_b(vec_b_3),
        .dot_out(dot_out_3),
        .finish(finish_3)
    );

    vec_dot_basic dot_4(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_4),
        .vec_b(vec_b_4),
        .dot_out(dot_out_4),
        .finish(finish_4)
    );

    vec_dot_basic dot_5(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_5),
        .vec_b(vec_b_5),
        .dot_out(dot_out_5),
        .finish(finish_5)
    );

    vec_dot_basic dot_6(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_6),
        .vec_b(vec_b_6),
        .dot_out(dot_out_6),
        .finish(finish_6)
    );

    vec_dot_basic dot_7(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_7),
        .vec_b(vec_b_7),
        .dot_out(dot_out_7),
        .finish(finish_7)
    );

    vec_dot_basic dot_8(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_8),
        .vec_b(vec_b_8),
        .dot_out(dot_out_8),
        .finish(finish_8)
    );

    vec_dot_basic dot_9(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_9),
        .vec_b(vec_b_9),
        .dot_out(dot_out_9),
        .finish(finish_9)
    );
        vec_dot_basic dot_10(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_10),
        .vec_b(vec_b_10),
        .dot_out(dot_out_10),
        .finish(finish_10)
    );

    vec_dot_basic dot_11(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_11),
        .vec_b(vec_b_11),
        .dot_out(dot_out_11),
        .finish(finish_11)
    );

    vec_dot_basic dot_12(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_12),
        .vec_b(vec_b_12),
        .dot_out(dot_out_12),
        .finish(finish_12)
    );

    vec_dot_basic dot_13(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_13),
        .vec_b(vec_b_13),
        .dot_out(dot_out_13),
        .finish(finish_13)
    );

    

    vec_dot_basic dot_14(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_14),
        .vec_b(vec_b_14),
        .dot_out(dot_out_14),
        .finish(finish_14)
    );

    vec_dot_basic dot_15(
        .clk(clk),
        .en(finish_import_data),
        .rst(rst),
        .vec_a(vec_a_15),
        .vec_b(vec_b_15),
        .dot_out(dot_out_15),
        .finish(finish_15)
    );

    //the data format is 1-4-11 16-bit fixed point
    initial begin
        dot_out <= 16'd0;
        finish  <= 1'b0;
        finish_import_data <=1'b0;
        
        vec_a_0 <= 16'd0;
        vec_a_1 <= 16'd0;
        vec_a_2 <= 16'd0;
        vec_a_3 <= 16'd0;
        vec_a_4 <= 16'd0;
        vec_a_5 <= 16'd0;
        vec_a_6 <= 16'd0;
        vec_a_7 <= 16'd0;
        vec_a_8 <= 16'd0;
        vec_a_9 <= 16'd0;
        vec_a_10 <= 16'd0;
        vec_a_11 <= 16'd0;
        vec_a_12 <= 16'd0;
        vec_a_13 <= 16'd0;
        vec_a_14 <= 16'd0;
        vec_a_15 <= 16'd0;
        
        vec_b_0 <= 16'd0;
        vec_b_1 <= 16'd0;
        vec_b_2 <= 16'd0;
        vec_b_3 <= 16'd0;
        vec_b_4 <= 16'd0;
        vec_b_5 <= 16'd0;
        vec_b_6 <= 16'd0;
        vec_b_7 <= 16'd0;
        vec_b_8 <= 16'd0;
        vec_b_9 <= 16'd0;
        vec_b_10 <= 16'd0;
        vec_b_11 <= 16'd0;
        vec_b_12 <= 16'd0;
        vec_b_13 <= 16'd0;
        vec_b_14 <= 16'd0;
        vec_b_15 <= 16'd0;
    end
    
    always @ (posedge clk)
    begin
        if (rst) begin
            dot_out <= 16'd0;
            finish  <= 1'b0;
        end
        else if (en & !finish_0) begin
            {vec_a_0,vec_a_1,vec_a_2,vec_a_3,vec_a_4,vec_a_5,vec_a_6,vec_a_7,vec_a_8,vec_a_9,vec_a_10,vec_a_11,vec_a_12,vec_a_13,vec_a_14,vec_a_15} <= vec_a;
            {vec_b_0,vec_b_1,vec_b_2,vec_b_3,vec_b_4,vec_b_5,vec_b_6,vec_b_7,vec_b_8,vec_b_9,vec_b_10,vec_b_11,vec_b_12,vec_b_13,vec_b_14,vec_b_15} <= vec_b;
            finish_import_data<=1'b1;
        end  
        else if (en & finish_0) begin
            dot_out<=dot_out_0+dot_out_1+dot_out_2+dot_out_3+dot_out_4+dot_out_5+dot_out_6+dot_out_7+dot_out_8+dot_out_9+dot_out_10+dot_out_11+dot_out_12+dot_out_13+dot_out_14+dot_out_15;
            finish<=1'b1;
        end
        
    end

    



endmodule