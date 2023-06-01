`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:21 05/31/2023 
// Design Name: 
// Module Name:    game 
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
module game(
    input clk,
    input start,
    input pause,
    input right,
    input left,
    output VS,
    output HS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE,
    output [6:0] CATHODE,
    output [3:0] ANODE
    );
    
    wire [9:0] stack_x;
    wire [9:0] stack_y;
    wire [9:0] stack_height;
    wire [32:0] colors;

    
    wire display_clk;
    wire seg_clk;
    wire fall_clk;

    clk_divider dv (
            .clk(clk), 
            .rst(rst), 
            .fall_clk(fall_clk),
            .segclk(segclk),
            .dclk(dclk)
        );

    stack s(
        // inputs
        .clk (clk),
        .rst (rst),
        .left (left),
        .right (right),
        // outputs
        .pos_x (stack_x),
        .pos_y (stack_y),
        .height (stack_height),
        .colors (colors)
    );
    
    draw d(
        //inputs
        .display_clk (display_clk),
        //.rst (start),
        .[9:0] pos_x (stack_x),
        //.[9:0] pos_y (),
        //.[9:0] height (),
        //outputs
        .HS (HS),
        .VS (VS),
        .[2:0] RED (RED),
        .[2:0] GREEN (GREEN),
        .[1:0] BLUE (BLUE)
    );
    


endmodule
