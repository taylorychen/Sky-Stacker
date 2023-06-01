`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:03 05/24/2023 
// Design Name: 
// Module Name:    vga_test 
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
module vga_test(
    input clk
    /*
    output HS,
    output VS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE
    */
    );
    /*
        // Inputs
        //reg master_clk;
        reg rst;

        // Outputs
        wire one_hz_clk;
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
    
    
        wire [9:0] x, y;

        vga v(.clk (dclk), .HS (HS), .VS (VS), .x (x), .y (y));

        assign RED = ((x > 0) & (x < 300) & (y > 0) & (y < 300))?7:0;
        assign GREEN = ((x > 200) & (x < 400) & (y > 150) & (y < 350))?7:0;
        assign BLUE = ((x > 300) & (x < 600) & (y > 180) & (y < 480))?3:0;
*/
endmodule

