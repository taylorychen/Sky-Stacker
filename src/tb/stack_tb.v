`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:56:25 06/05/2023
// Design Name:   stack
// Module Name:   C:/Users/Student/Desktop/0152aaaaaa/lab4/src/tb/stack_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stack_tb;

	// Inputs
	reg clk;
	reg rst;
	reg left;
	reg right;
	reg [9:0] fall_x;
	reg [9:0] fall_y;
	reg [1:0] fall_color;

	// Outputs
	wire [9:0] pos_x;
	wire [9:0] pos_y;
	wire [9:0] height;
	wire [31:0] colors;

	// Instantiate the Unit Under Test (UUT)
	stack uut (
		.clk(clk), 
		.rst(rst), 
		.left(left), 
		.right(right), 
		.fall_x(fall_x), 
		.fall_y(fall_y), 
		.fall_color(fall_color), 
		.pos_x(pos_x), 
		.pos_y(pos_y), 
		.height(height), 
		.colors(colors)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		left = 0;
		right = 0;
		fall_x = 0;
		fall_y = 0;
		fall_color = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
        rst = 0;
	end
    
    always begin
        #1 clk = ~clk;
        #1 fall_y = fall_y + 1;
    end 
      
endmodule

