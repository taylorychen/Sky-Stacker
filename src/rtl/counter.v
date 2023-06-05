`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:49 06/05/2023 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input one_hz_clk,
    input rst,
    input pause,
    output [3:0] sec_ones,
    output [3:0] sec_tens,
    output end_game
    );

	reg end_sig = 1'b0;
	reg [3:0] sec_ones_cnt = 4'b0000;
	reg [3:0] sec_tens_cnt = 4'b1001;

	always @(posedge one_hz_clk or posedge rst) begin
    
        if (rst == 1) begin
            sec_ones_cnt = 4'b0000;
				sec_tens_cnt = 4'b1001;
				end_sig = 0;
        end
		  else if(pause == 0 && end_sig == 0) begin
				if(sec_ones_cnt == 0 && sec_tens_cnt == 0) begin
					end_sig = 1;
				end
				else if (sec_ones_cnt == 0) begin
					sec_tens_cnt = sec_tens_cnt - 1'b1;
					sec_ones_cnt = 4'b1001;
				end
				else begin
					sec_ones_cnt = sec_ones_cnt - 1'b1;
				end
		  end
	end

	assign sec_ones = sec_ones_cnt;
	assign sec_tens = sec_tens_cnt;
	assign end_game = end_sig;


endmodule
