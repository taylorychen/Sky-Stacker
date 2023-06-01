`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:14 05/24/2023 
// Design Name: 
// Module Name:    vga 
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
module vga(
    input clk,
    output [9:0] x,
    output reg [9:0] y,
    output HS,
    output VS,
    output blank
    );
    
    reg [9:0] xc;
    
    // Horizontal 640 + HFP 24 + HS 40 + HBP 128 = 832 pixel ticks
    // Vertical, 480 + VFP 9 lines + VS 3 lines + VBP 28 lines 

    assign blank = ((xc < 192) | (xc > 832) | (y > 479));
    assign HS = ~ ((xc > 23) & (xc < 65));
    assign VS = ~ ((y > 489) & (y < 493));
    assign x = ((xc < 192)?0:(xc - 192));

    always @(posedge clk) begin

        if (xc == 832) begin
             xc <= 0;
             y <= y + 1;
        end
        else begin
            xc <= xc + 1;
        end
        if (y == 520) begin
            y <= 0; 
        end
    end

endmodule


