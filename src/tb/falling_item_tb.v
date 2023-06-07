`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:35:24 06/02/2023
// Design Name:   falling_item
// Module Name:   C:/Users/Student/Desktop/0152aaaaaa/lab4/src/tb/falling_item_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: falling_item
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module falling_item_tb;

	// Inputs
    reg clk;
	reg fall_clk;
	reg rst;
	reg pause;

	// Outputs
	wire [9:0] pos_x;
	wire [9:0] pos_y;
	wire [1:0] color;

	// Instantiate the Unit Under Test (UUT)
	falling_item uut (
        .clk(clk),
		.fall_clk(fall_clk), 
		.rst(rst), 
		.pause(pause), 
		.pos_x(pos_x), 
		.pos_y(pos_y), 
		.color(color)
	);

	initial begin
		// Initialize Inputs
        clk = 0;
		fall_clk = 0;
		rst = 1;
		pause = 0;

		// Wait 100 ns for global reset to finish
		#150;
        rst = 0;
        
        
		// Add stimulus here

	end
      
    always begin
        #0.25 clk = ~clk;
    end
    always begin
        #1 fall_clk = ~fall_clk;
    end
    
endmodule

