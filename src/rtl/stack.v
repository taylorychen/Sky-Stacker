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
	 input pause,
    input left,
    input right,
    input [9:0] fall_x,
    input [9:0] fall_y,
    input [1:0] fall_color,
    output [9:0] pos_x,
    output [9:0] pos_y,
    output [31:0] colors,
    output reg collision
    );

    // coordinate counts from top left of block
    reg [9:0] BASE_Y = 400;
    reg [9:0] HEIGHT_RATIO = 20;

    // MOVEMENT
    reg [9:0] x;
    reg [17:0] divider;
    reg [9:0] h;
    
	 reg [31:0] c;
	 
    // detect collision  
    //wire [9:0] pos_y;
    //assign top_y = BASE_Y  - (h * HEIGHT_RATIO) - 5;

    wire y_collide = (fall_y < (400 + 20 - (h * 20))) & (fall_y > (400 - 5 - (h * 20)));
	 //wire y_collide = (fall_y < (top_y + HEIGHT_RATIO)) & (fall_y > top_y);
    wire x_collide = (fall_x < (x + 15)) & (fall_x > (x - 15));  // 15 denotes pixels of leeway

    always @(posedge clk, posedge rst) begin
    
        // reset condition
        if (rst == 1) begin
            x <= 300;
            h = 0;
            c = 32'b0;
        end
        else begin
            if ((y_collide & x_collide)) begin
                // remove falling object
                collision = 1;
					
					 // add to color
                case (h) 
						0: c = fall_color;
						1: c = c | {fall_color, 2'b0};
						2: c = c | {fall_color, 4'b0};
						3: c = c | {fall_color, 6'b0};
						4: c = c | {fall_color, 8'b0};
						5: c = c | {fall_color, 10'b0};
						6: c = c | {fall_color, 12'b0};
						7: c = c | {fall_color, 14'b0};
						8: c = c | {fall_color, 16'b0};
						9: c = c | {fall_color, 18'b0};
						10: c = c | {fall_color, 20'b0};
						11: c = c | {fall_color, 22'b0};
						12: c = c | {fall_color, 24'b0};
						13: c = c | {fall_color, 26'b0};
						14: c = c | {fall_color, 28'b0};
						15: c = c | {fall_color, 30'b0};
					 
					 endcase
					 
					 h = h + 1;
            end
            else begin
                collision = 0;
            end
            
				// movement
            divider <= divider + 1;
            if (divider == 0) begin
					if(pause == 0) begin
						 if (left == 1) begin
							  if (x <= 640 - 150)
									x <= x + 1;
						 end
						 else if (right == 1) begin
							  if (x > 0)
									x <= x - 1;
						 end
					end
            end
            
        end
    end

    assign pos_x = x; 
    assign pos_y = BASE_Y;
    assign colors = c;
    
endmodule
