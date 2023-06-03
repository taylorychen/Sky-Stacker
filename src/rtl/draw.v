`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:37 05/31/2023 
// Design Name: 
// Module Name:    draw 
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
module draw(
    input dclk,
    //input rst,
    input [9:0] pos_x,
    //input [9:0] pos_y,
    //input [9:0] height,
    input [31:0] colors,
    input [9:0] fall_x,
    input [9:0] fall_y,
    input [1:0] fall_clr,
    output HS,
    output VS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE
    );

        wire [9:0] x, y;
        
        reg [9:0] HEIGHT_RATIO = 20;
        reg [9:0] WIDTH = 100;
        
        // reg [9:0] p_x = 260;
        reg [9:0] p_y = 400;
        reg [9:0] h = 1;
        
        // reg [31:0] colors = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;

        vga v(.clk (dclk), .HS (HS), .VS (VS), .x (x), .y (y));
        
        //wire burger = (x > p_x) & (x < p_x + WIDTH) & (y > p_y) & (y < p_y + h * HEIGHT_RATIO);
        
        reg [15:0] g = 0;
        reg [15:0] r = 0;
        reg [15:0] b = 0;
        reg fall_g = 0;
        reg fall_r = 0;
        reg fall_b = 0;
        
        always @(*) begin
            g[0] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y) & (y < p_y + h * HEIGHT_RATIO);
        //    r[0] = 0;
        //    b[0] = 0;
        end
                
        integer i;
        always @(*) begin
            
            // RED - 10
            // GREEN - 01
            // BLUE - 11
            
            // draw stack
            /*
            for (i = 1; i < 16; i = i + 1) begin
                if ({colors[2*i+1], colors[2*i]} == 2'b10)
                    r[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[2*i+1], colors[2*i]} == 2'b01)
                    g[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[2*i+1], colors[2*i]} == 2'b11)
                    b[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
            end
            */

            for (i = 1; i < 16; i = i + 1) begin
                if ({colors[32 - 2*i], colors[32 - 2*i-1]} == 2'b10)
                    r[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[32 - 2*i], colors[32 - 2*i-1]} == 2'b01)
                    g[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[32 - 2*i], colors[32 - 2*i-1]} == 2'b11)
                    b[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
            end
        end
            
            // draw falling block
            if (fall_clr == 2'b10)
                fall_r = (x > fall_x) & (x < fall_x + WIDTH) & (y > fall_y) & (y < fall_y + HEIGHT_RATIO);
            if (fall_clr == 2'b01)
                fall_g = (x > fall_x) & (x < fall_x + WIDTH) & (y > fall_y) & (y < fall_y + HEIGHT_RATIO);
            if (fall_clr == 2'b11)
                fall_b = (x > fall_x) & (x < fall_x + WIDTH) & (y > fall_y) & (y < fall_y + HEIGHT_RATIO);
                
        end
        
        assign RED = ((|r)| fall_r)?7:0;
        assign GREEN = ((|g)| fall_g)?7:0;
        assign BLUE = ((|b)| fall_b)?3:0;
        
        //assign RED = ((x > 0) & (x < 300) & (y > 0) & (y < 300))?7:0;
        //assign GREEN = ((x > 200) & (x < 400) & (y > 150) & (y < 350))?7:0;
        //assign BLUE = ((x > 300) & (x < 600) & (y > 180) & (y < 480))?3:0;


endmodule
