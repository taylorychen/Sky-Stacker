`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:48:02 05/22/2023
// Design Name:   clk_divider
// Module Name:   C:/Users/Student/Desktop/0152aaaaaa/lab4/src/tb/clk_divider_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_divider_tb;

	// Inputs
	reg master_clk;
	reg rst;

	// Outputs
	wire one_hz_clk;
	wire display_clk;
	wire fall_clk;
    wire pixel_clk;

	// Instantiate the Unit Under Test (UUT)
	clk_divider uut (
		.master_clk(master_clk), 
		.rst(rst), 
		.one_hz_clk(one_hz_clk), 
		.display_clk(display_clk), 
		.fall_clk(fall_clk),
        .pixel_clk(pixel_clk)
	);

	initial begin
		// Initialize Inputs
		master_clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
        
		// Add stimulus here

	end
    
    always
        #1 master_clk = ~master_clk;
      
endmodule

