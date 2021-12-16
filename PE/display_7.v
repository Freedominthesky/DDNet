`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/16 21:16:57
// Design Name: 
// Module Name: display_7
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


module display_7(result, display);
    input [3:0] result;
    output [6:0] display;

    reg [6:0] decodeout;
    assign display = decodeout;
    always@(result)
    begin
        case(result)
        4'h0: decodeout = 7'b1000000;
        4'h1: decodeout = 7'b1111001;
        4'h2: decodeout = 7'b0100100;
        4'h3: decodeout = 7'b0110000;
        4'h4: decodeout = 7'b0011001;
        4'h5: decodeout = 7'b0010010;
        4'h6: decodeout = 7'b0000010;
        4'h7: decodeout = 7'b1111000;
        4'h8: decodeout = 7'b0000000;
        4'h9: decodeout = 7'b0011000;
        4'ha: decodeout = 7'b0001000;
        default: decodeout = 7'b1111111;
        endcase
    end
 
 endmodule
 

