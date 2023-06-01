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
    
    
    stack s(
    // inputs
        .clk (),
        .rst (),
        .left (),
        .right (),
    // outputs
        .pos_x (),
        .pos_y (),
        .height ()
    );
    
    draw d(
        //inputs
        .clk (clk),
        //.rst (start),
        .[9:0] pos_x (),
        //.[9:0] pos_y (),
        //.[9:0] height (),
        //outputs
        .HS (),
        .VS (),
        .[2:0] RED (RED),
        .[2:0] GREEN (GREEN),
        .[1:0] BLUE (BLUE)
    );
    


endmodule
