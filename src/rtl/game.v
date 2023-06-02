`timescale 1ns / 1ps
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
    output [1:0] BLUE
    //output [6:0] CATHODE,
    //output [3:0] ANODE
    );
    
    wire [9:0] stack_x;
    wire [9:0] stack_y;
    wire [9:0] stack_height;
    wire [32:0] colors;
    
    wire [9:0] fall_x;
    wire [9:0] fall_y;
    wire [1:0] fall_clr;

    wire display_clk;
    // wire seg_clk;
    wire fall_clk;
    
    clk_divider dv (
          .clk(clk), 
          .rst(start), 
          .fall_clk(fall_clk),
          .seg_clk(seg_clk),
          .dclk(display_clk)
      );

    stack s(
    // inputs
        .clk (clk),
        .rst (start),
        .left (left),
        .right (right),
    // outputs
        .pos_x (stack_x),
        .pos_y (stack_y),
        .height (stack_height),
        .colors (colors)
    );

    falling_item f(
        .clk(clk),
        .fall_clk(fall_clk), 
        .rst(start), 
        .pause(pause), 
        .pos_x(fall_x), 
        .pos_y(fall_y), 
        .color(fall_clr)
    );

    draw d(
        //inputs
        .dclk (display_clk),
        //.rst (start),
        .pos_x (stack_x),
        //.[9:0] pos_y (),
        //.[9:0] height (),
        .fall_x(fall_x),
        .fall_y(fall_y),
        .fall_clr(fall_clr),
        .colors (colors),
        //outputs
        .HS (HS),
        .VS (VS),
        .RED (RED),
        .GREEN (GREEN),
        .BLUE (BLUE)
    );
    


endmodule
