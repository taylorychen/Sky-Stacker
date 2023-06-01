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
    input display_clk,
    //input rst,
    input [9:0] pos_x,
    //input [9:0] pos_y,
    //input [9:0] height,
    input [31:0] colors,
    output HS,
    output VS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE
    );

        // Inputs
        //reg master_clk;
        //reg rst;

        // Outputs
        /*
        wire display_clk;
        wire fall_clk;
        wire pixel_clk;

        clk_divider dv (
            .clk(clk), 
            .rst(rst), 
            .fall_clk(fall_clk),
            .segclk(segclk),
            .dclk(dclk)
        );
        */
        wire [9:0] x, y;
        
        reg [9:0] HEIGHT_RATIO = 20;
        reg [9:0] WIDTH = 150;
        
        // reg [9:0] p_x = 260;
        reg [9:0] p_y = 400;
        reg [9:0] h = 1;
        
        // reg [31:0] colors = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;
        
        
        vga v(.clk (display_clk), .HS (HS), .VS (VS), .x (x), .y (y));
        
        reg [15:0] g = 0;
        reg [15:0] r = 0;
        reg [15:0] b = 0;
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
        
            for (i = 1; i < 16; i = i + 1) begin
                if ({colors[2*i+1], colors[2*i]} == 2'b10)
                    r[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[2*i+1], colors[2*i]} == 2'b01)
                    g[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
                
                else if ({colors[2*i+1], colors[2*i]} == 2'b11)
                    b[i] = (x > pos_x) & (x < pos_x + WIDTH) & (y > p_y - i * HEIGHT_RATIO) & (y < p_y - (i-1) * HEIGHT_RATIO);
            end
        end
        
        assign RED = (|r)?7:0;
        assign GREEN = (|g)?7:0;
        assign BLUE = (|b)?3:0;
        
        //assign RED = ((x > 0) & (x < 300) & (y > 0) & (y < 300))?7:0;
        //assign GREEN = ((x > 200) & (x < 400) & (y > 150) & (y < 350))?7:0;
        //assign BLUE = ((x > 300) & (x < 600) & (y > 180) & (y < 480))?3:0;


endmodule
