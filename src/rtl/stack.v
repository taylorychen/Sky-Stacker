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
    input [9:0] fall_x,
    input [9:0] fall_y,
    input [1:0] fall_color,
    output [9:0] pos_x,
    output [9:0] pos_y,
    output wire [9:0] height,
    output [31:0] colors,
    output reg collision
    );

    //assign pos_x = 305;
    //assign pos_y = 360;
    //assign height = 1;
    //assign colors = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;

    // coordinate counts from top left of block
    reg BASE_Y = 400;
    reg HEIGHT_RATIO = 20;

    // MOVEMENT
    reg [9:0] x;
    reg [17:0] divider;
    reg [9:0] h;
    
    // detect collision
    // height does not include the bottom block
    reg leeway_pixels = 50; // number of leeway pixels
       
    reg [31:0] c;
    wire [9:0] pos_y;
    assign pos_y = BASE_Y - (height * HEIGHT_RATIO);

    // 15 denotes pixels of leeway
    wire y_collide = (fall_y < pos_y + 15) & (fall_y > pos_y - 15);
    wire x_collide = (fall_x < (x + 15)) & (fall_x > (x - 15));
    //wire test = fall_y > 200;

    always @(posedge clk, posedge rst) begin
    
        // reset condition
        if (rst == 1) begin
            x <= 300;
            h = 0;
            c = 32'b0;
        end
        else begin
            if ((x_collide)) begin
                // remove falling object
                collision = 1;
            
                h = h + 1;
                c = c << 2;
                c = c + fall_color;
                //c = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;

                //c = c >> 2;
                //c = c + {fall_color, 30'b0};

                // TODO: send signal to make falling object dissapear and new one appear
                // TODO: send signal to change score
            end
            else begin
                collision = 0;
            end
            
            divider <= divider + 1;
            if (divider == 0) begin
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
   

/*
    always @(*) begin
        if (y_collide & x_collide) begin
            h = h + 1;
            c = c >> 2;
            c = c + {fall_color, 30'b0};

            // TODO: send signal to make falling object dissapear and new one appear
            // TODO: send signal to change score
        end

    end*/

    assign pos_x = x; 
    assign pos_y = BASE_Y;
    assign height = h;
    assign colors = c;
    
endmodule
