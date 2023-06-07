`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:25:26 05/31/2023
// Design Name:   random
// Module Name:   C:/Users/Student/Desktopt/rnd_test/random_tb.v
// Project Name:  rnd_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module random_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [9:0] rnd;

	// Instantiate the Unit Under Test (UUT)
	random uut (
		.clk(clk), 
		.rst(rst), 
		.rnd(rnd)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#110;
		rst = 0;

	end
  
  always begin
		#1 clk = ~clk;
	end

endmodule