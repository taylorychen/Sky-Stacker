`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:42 06/05/2023 
// Design Name: 
// Module Name:    score 
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
module score(
    input clk,
    input rst,
    input collision,
    input [1:0] color,
    output [6:0] score
    );

	reg [6:0] curr_score;
    
    // determine what the color/position is --> based on collision module
    // switch statement for how many points to add based on what the color is
    
    always @(posedge collision or posedge rst) begin
        if(rst) begin
            curr_score = 7'b0;
        end
        else begin
            if(color == 2'b01) // GREEN
                curr_score = curr_score + 2;
            else if(color == 2'b10) // BLUE
                curr_score = curr_score + 5;
            else if(color == 2'b11) // RED
					 if(curr_score < 3)
						curr_score = 0;
                else
						curr_score = curr_score - 3;
        end
    end
    
    assign score = curr_score;

endmodule
