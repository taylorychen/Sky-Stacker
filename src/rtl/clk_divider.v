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
    output wire dclk,
	 output reg digit_clk,
	 output reg one_hz_clk
    );

    reg [31:0] fall_cnt;
	 reg [31:0] digit_cnt;
	 reg [31:0] one_cnt;
    
    // fall clk - 12.5 Hz
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            fall_cnt <= 32'd0;
            fall_clk <= 1'b0;   
        end
        
        else if (fall_cnt == 32'd4000000 - 1'b1) begin
            fall_clk <= ~fall_clk;
            fall_cnt <= 32'd0;
        end
        else
            fall_cnt <= fall_cnt + 1'b1;
    end
	 
	 //digit clk - 500 Hz
	 always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            digit_cnt <= 32'd0;
            digit_clk <= 1'b0;   
        end
        
        else if (digit_cnt == 32'd200000 - 1'b1) begin
            digit_clk <= ~digit_clk;
            digit_cnt <= 32'd0;
        end
        else
            digit_cnt <= digit_cnt + 1'b1;
    end
	 
	 //1 Hz clk
	 always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            one_cnt <= 32'd0;
            one_hz_clk <= 1'b0;   
        end
        
        else if (one_cnt == 32'd50000000 - 1'b1) begin
            one_hz_clk <= ~one_hz_clk;
            one_cnt <= 32'd0;
        end
        else
            one_cnt <= one_cnt + 1'b1;
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
