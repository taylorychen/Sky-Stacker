`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:35 05/31/2023 
// Design Name: 
// Module Name:    stack 
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
module stack(
    input clk,
    input rst,
    input left,
    input right,
    output [9:0] pos_x,
    output [9:0] pos_y,
    output [9:0] height,
   // output [31:0] colors
    );

    assign pos_x = 305;
    assign pos_y = 360;
    assign height = 1;
   // assign colors = 32'b00_00_00_00_00_00_00_00_00_10_10_11_11_10_11_01;

    // FOR NEXT TIME
    // MOVEMENT
    // TODO: add thing that slows it down
   // reg [9:0] x;
    //always @(posedge clk, posedge rst) begin





   // end

   // assigns pos_x = x; 


endmodule
