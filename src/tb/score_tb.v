`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:46 06/05/2023
// Design Name:   score
// Module Name:   C:/152aaaaa/lab4/src/tb/score_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: score
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module score_tb;

	// Inputs
	reg clk;
	reg rst;
	reg collision;
	reg [1:0] color;

	// Outputs
	wire [6:0] score;

	// Instantiate the Unit Under Test (UUT)
	score uut (
		.clk(clk), 
		.rst(rst), 
		.collision(collision), 
		.color(color), 
		.score(score)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		collision = 0;
		color = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;
		
		#5
		collision = 1;
		color = 2'b01;
		#3
		collision = 0;
		#5
		collision = 1;
		color = 2'b10;
		#3
		collision = 0;
		#5
		collision = 1;
		color = 2'b11;
		#3
		collision = 0;
		
	end
	
	always
		#0.5 clk = ~clk;
      
endmodule

