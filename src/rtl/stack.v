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
    output [9:0] height,
    output [31:0] colors
    );

    assign pos_x = 305;
    assign pos_y = 360;
    assign height = 1;
    assign colors = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;

    // FOR NEXT TIME
    // MOVEMENT
    /*
    reg [9:0] x;
    reg [15:0] divider;

    always @(posedge clk, posedge rst) begin
        // reset condition
        if (rst == 1) begin
            x <= 300;
        end
        else begin
            divider <= divider + 1;
            if (divider == 0) begin
                if (left == 1) begin
                    if (x <= 640 - 150)
                        x <= x + 1;
                end
            end
        end
   end
    
   assign pos_x = x; 
    */

endmodule
