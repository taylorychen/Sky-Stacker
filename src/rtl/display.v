`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:12 06/05/2023 
// Design Name: 
// Module Name:    display 
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
module display(
    input digit_clk,
    input [6:0] score,
    input [3:0] sec_ones,
    input [3:0] sec_tens,
    output reg [3:0] anode,
    output reg [6:0] cathode
    );

	reg [3:0] score_tens;
    reg [3:0] score_ones;
	//split score into tens and ones
    always @(*) begin
        score_tens = score / 10;
        score_ones = score - (score_tens * 10);
    end

    wire [6:0] cathode_sec_tens;
    wire [6:0] cathode_sec_ones;
    wire [6:0] cathode_score_tens;
    wire [6:0] cathode_score_ones;

	wire ca_score_tens;
    wire cb_score_tens;
    wire cc_score_tens;
    wire cd_score_tens;
    wire ce_score_tens;
    wire cf_score_tens;
    wire cg_score_tens;
	 
	wire ca_score_ones;
    wire cb_score_ones;
    wire cc_score_ones;
    wire cd_score_ones;
    wire ce_score_ones;
    wire cf_score_ones;
    wire cg_score_ones;
	 
	wire ca_sec_tens;
    wire cb_sec_tens;
    wire cc_sec_tens;
    wire cd_sec_tens;
    wire ce_sec_tens;
    wire cf_sec_tens;
    wire cg_sec_tens;
	 
	wire ca_sec_ones;
    wire cb_sec_ones;
    wire cc_sec_ones;
    wire cd_sec_ones;
    wire ce_sec_ones;
    wire cf_sec_ones;
    wire cg_sec_ones;
	 
	seven_seg_decoder sec_tens_dec (
		.digit(sec_tens), 
		.ca(ca_sec_tens), 
		.cb(cb_sec_tens), 
		.cc(cc_sec_tens), 
		.cd(cd_sec_tens), 
		.ce(ce_sec_tens), 
		.cf(cf_sec_tens), 
		.cg(cg_sec_tens)
	);
	
	seven_seg_decoder sec_ones_dec (
		.digit(sec_ones), 
		.ca(ca_sec_ones), 
		.cb(cb_sec_ones), 
		.cc(cc_sec_ones), 
		.cd(cd_sec_ones), 
		.ce(ce_sec_ones), 
		.cf(cf_sec_ones), 
		.cg(cg_sec_ones)
	);

	seven_seg_decoder score_tens_dec (
		.digit(score_tens), 
		.ca(ca_score_tens), 
		.cb(cb_score_tens), 
		.cc(cc_score_tens), 
		.cd(cd_score_tens), 
		.ce(ce_score_tens), 
		.cf(cf_score_tens), 
		.cg(cg_score_tens)
	);
	
	seven_seg_decoder score_ones_dec (
		.digit(score_ones), 
		.ca(ca_score_ones), 
		.cb(cb_score_ones), 
		.cc(cc_score_ones), 
		.cd(cd_score_ones), 
		.ce(ce_score_ones), 
		.cf(cf_score_ones), 
		.cg(cg_score_ones)
	);
	 
	assign cathode_sec_tens = {
		ca_sec_tens,
		cb_sec_tens,
		cc_sec_tens,
		cd_sec_tens,
		ce_sec_tens,
		cf_sec_tens,
		cg_sec_tens
	};

	assign cathode_sec_ones = {
		ca_sec_ones,
		cb_sec_ones,
		cc_sec_ones,
		cd_sec_ones,
		ce_sec_ones,
		cf_sec_ones,
		cg_sec_ones
	};
	
	assign cathode_score_tens = {
		ca_score_tens,
		cb_score_tens,
		cc_score_tens,
		cd_score_tens,
		ce_score_tens,
		cf_score_tens,
		cg_score_tens
	};
	
	assign cathode_score_ones = {
		ca_score_ones,
		cb_score_ones,
		cc_score_ones,
		cd_score_ones,
		ce_score_ones,
		cf_score_ones,
		cg_score_ones
	};
	
	// cycle through anode and cathode outputs
    reg [2:0] cnt = 3'b000;
    always @(posedge digit_clk) begin
        // score tens
        if (cnt == 0) begin
            cnt = cnt + 1'b1;
            anode <= 4'b0111;
            cathode <= cathode_score_tens;
        end
        // score ones
        else if (cnt == 1) begin
            cnt = cnt + 1'b1;
            anode <= 4'b1011;
            cathode <= cathode_score_ones;
        end
		  //sec tens
		  else if (cnt == 2) begin
            cnt = cnt + 1'b1;
            anode <= 4'b1101;
            cathode <= cathode_sec_tens;
        end
		  //sec ones
		  else if (cnt == 3) begin
            cnt = 3'b000;
            anode <= 4'b1110;
            cathode <= cathode_sec_ones;
        end      
    end

endmodule
