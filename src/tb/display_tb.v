`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:45 06/05/2023
// Design Name:   display
// Module Name:   C:/152aaaaa/lab4/src/tb/display_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module display_tb;

	// Inputs
	reg digit_clk;
	reg [6:0] score;
	reg [3:0] sec_ones;
	reg [3:0] sec_tens;

	// Outputs
	wire [3:0] anode;
	wire [6:0] cathode;

	// Instantiate the Unit Under Test (UUT)
	display uut (
		.digit_clk(digit_clk), 
		.score(score), 
		.sec_ones(sec_ones), 
		.sec_tens(sec_tens), 
		.anode(anode), 
		.cathode(cathode)
	);

	initial begin
		// Initialize Inputs
		digit_clk = 0;
		score = 0;
		sec_ones = 0;
		sec_tens = 0;

		// Wait 100 ns for global reset to finish
		#100;
		score = 20;
		sec_ones = 5;
		sec_tens = 2;
		
        
		// Add stimulus here

	end
	
	always begin
		#0.5 digit_clk = ~digit_clk;
	end
      
endmodule

