`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/12/18 13:28
// Design Name:
// Module Name: dot_product_16bit_basic
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

module vec_dot_basic (input clk,
                      input rst,
                      input en,
                      input signed [15:0] vec_a,
                      input signed [15:0] vec_b,
                      output reg signed [15:0] dot_out,
                      output reg finish);
    
    reg signed [31:0] dot_out_tmp;
    
    initial begin
        dot_out     <= 16'd0;
        finish      <= 1'b0;
        dot_out_tmp <= 32'd0;
    end
  
  /*  
    always @(posedge clk) begin
        dot_out_tmp <= vec_a*vec_b;
    end
 */   
 
    always @(*) begin
        dot_out_tmp <= vec_a*vec_b;
    end 
      
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dot_out     <= 16'd0;
            dot_out_tmp <= 32'd0;
            finish      <= 1'b0;
        end
        else if (en) begin
//            dot_out       <= (dot_out_tmp >> 4'hb);//1-4-11
            dot_out       <= (dot_out_tmp >> 4'he);//1-1-14          
            finish        <= 1'b1;
        
        end

    end
            
            
            
endmodule
