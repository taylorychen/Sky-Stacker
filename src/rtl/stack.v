`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:35 05/31/2023 
// Design Name: 
// Module Name:    stack 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stack(
    input clk,
    input rst,
    input left,
    input right,
    output [9:0] pos_x,
    output [9:0] pos_y,
    output [9:0] height
    );
    
    assign pos_x = 305;
    assign pos_y = 360;
    assign height = 1;


endmodule
