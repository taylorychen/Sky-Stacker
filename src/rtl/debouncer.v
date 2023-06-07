`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:58 06/05/2023 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
    input clk,
    input signal,
    output reg debounced
    );

	reg [16:0] counter = 17'd0;

    always @(posedge clk) begin
        if (signal == 1) begin
            debounced <= 1;
            counter <= 17'd1;
        end
        else if (counter == 17'd75000) begin
            debounced <= 0;
            counter <= 17'd0;
        end
        else if (counter != 17'd0) begin
            counter <= counter + 1'b1;  
        end
        else
            debounced <= 0;
    end  

endmodule
