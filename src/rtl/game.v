`timescale 1ns / 1ps
module game(
    input clk,
    input start,
    input pause,
    input right,
    input left,
    output VS,
    output HS,
    output [2:0] RED,
    output [2:0] GREEN,
    output [1:0] BLUE,
    output [6:0] CATHODE,
    output [3:0] ANODE
    );
    
    wire [9:0] stack_x;
    wire [9:0] stack_y;
    wire [9:0] stack_height;
    wire [31:0] colors;
    
    wire [9:0] fall_x;
    wire [9:0] fall_y;
    wire [1:0] fall_clr;

    wire display_clk;
    wire digit_clk;
    wire fall_clk;
	 wire one_hz_clk;
    
    wire collision;
	 wire [6:0] curr_score;
	 wire [3:0] sec_ones;
	 wire [3:0] sec_tens;
	 wire end_game;
	 
	 wire rst_debounced;
	 wire left_debounced;
	 wire right_debounced;
	 wire pause_debounced;
	 
	 wire stop;
	 assign stop = end_game | pause_debounced;
    
    clk_divider dv (
          .clk(clk), 
          .rst(rst_debounced), 
          .fall_clk(fall_clk),
          .seg_clk(seg_clk),
          .dclk(display_clk),
			 .digit_clk(digit_clk),
			 .one_hz_clk(one_hz_clk)
      );

    falling_item f(
        .clk(clk),
        .fall_clk(fall_clk), 
        .rst(rst_debounced), 
        .pause(stop), 
        .collision(collision),
        .pos_x(fall_x), 
        .pos_y(fall_y), 
        .color(fall_clr)
    );
    
    stack s(
    // inputs
        .clk (clk),
        .rst (rst_debounced),
		  .pause(stop),
        .left (left_debounced),
        .right (right_debounced),
        .fall_x (fall_x),
        .fall_y (fall_y),
        .fall_color (fall_clr),
    // outputs
        .pos_x (stack_x),
        .pos_y (stack_y),
        .height (stack_height),
        .colors (colors),
        .collision (collision)
    );

    draw d(
        //inputs
        .dclk (display_clk),
        .pos_x (stack_x),
        .pos_y (stack_y),
        .colors (colors),
        .fall_x(fall_x),
        .fall_y(fall_y),
        .fall_clr(fall_clr),
        //outputs
        .HS (HS),
        .VS (VS),
        .RED (RED),
        .GREEN (GREEN),
        .BLUE (BLUE)
    );
    
	 display digits (
		.digit_clk(digit_clk), 
		.score(curr_score), 
		.sec_ones(sec_ones), 
		.sec_tens(sec_tens), 
		.anode(ANODE), 
		.cathode(CATHODE)
	);
	
	score score(
		.clk(clk),
		.rst(rst_debounced),
		.collision(collision),
		.color(fall_clr),
		.score(curr_score)
	);

	counter c(
		.one_hz_clk(one_hz_clk),
		.rst(rst_debounced),
		.pause(pause_debounced),
		.sec_ones(sec_ones),
		.sec_tens(sec_tens),
		.end_game(end_game)
	);
	
	debouncer pause_debounce(
		 .clk(clk),
		 .signal(pause),
		 .debounced(pause_debounced)
    );
	 
	 debouncer rst_debounce(
		 .clk(clk),
		 .signal(start),
		 .debounced(rst_debounced)
    );
	 
	 debouncer left_debounce(
		 .clk(clk),
		 .signal(left),
		 .debounced(left_debounced)
    );
	 
	 debouncer right_debounce(
		 .clk(clk),
		 .signal(right),
		 .debounced(right_debounced)
    );

endmodule
