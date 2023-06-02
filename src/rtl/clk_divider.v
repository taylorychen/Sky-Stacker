`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:38 05/22/2023 
// Design Name: 
// Module Name:    clk_divider 
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
module clk_divider(
    input clk,
    input rst,
    output reg fall_clk,
    output wire seg_clk,
    output wire dclk
    );

    reg [31:0] fall_cnt;


/*
    
    // display clock
    always @(posedge master_clk or posedge rst) begin
        if (rst == 1) begin
            display_cnt <= 32'd0;
            display_clk <= 1'b0;   
        end
        
        else if (display_cnt == 32'd200000 - 1'b1) begin
            display_clk <= ~display_clk;
            display_cnt <= 32'd0;
        end
        else
            display_cnt <= display_cnt + 1'b1;
    end
    */
    // pixel clock
    /*
    always @(posedge master_clk or posedge rst) begin
        if (rst == 1) begin
            pixel_cnt <= 32'd0;
            pixel_clk <= 1'b0;   
        end
        
        else if (pixel_cnt == 32'd3 - 1'b1) begin
            pixel_clk <= ~pixel_clk;
            pixel_cnt <= 32'd0;
        end
        else
            pixel_cnt <= pixel_cnt + 1'b1;
    end
    */
    
    // fall clk - TODO: change the frequency of this clock
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            fall_cnt <= 32'd0;
            fall_clk <= 1'b0;   
        end
        
        else if (fall_cnt == 32'd12500000 - 1'b1) begin
            fall_clk <= ~fall_clk;
            fall_cnt <= 32'd0;
        end
        else
            fall_cnt <= fall_cnt + 1'b1;
    end
    
    
    // 17-bit counter variable
    reg [16:0] q;

    // Clock divider --
    // Each bit in q is a clock signal that is
    // only a fraction of the master clock.
    always @(posedge clk or posedge rst)
    begin
        // reset condition
        if (rst == 1)
            q <= 0;
        // increment counter by one
        else
            q <= q + 1;
    end

    // 50Mhz ÷ 2^17 = 381.47Hz
    assign seg_clk = q[16];

    // 50Mhz ÷ 2^1 = 25MHz
    assign dclk = q[1];
    
endmodule
