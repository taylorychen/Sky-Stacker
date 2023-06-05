`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:20 06/02/2023 
// Design Name: 
// Module Name:    falling_item 
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
module falling_item(
    input clk,
    input fall_clk,
    input rst,
    input pause,
    input collision,
    output wire [9:0] pos_x,
    output wire [9:0] pos_y,
    output wire [1:0] color
    );

//need default values?
    wire [9:0] rnd;
    reg [9:0] x;
    reg [9:0] y;
    reg [1:0] clr;
    reg [1:0] cnt = 2'b01; //used as the "random" for color if 00 is produced
    
    random rnd_num(
        .clk(clk),
        .rst(rst),
        .rnd(rnd)
    );
    
    always @ (posedge fall_clk or posedge rst or posedge collision) begin   
        if(rst | collision) begin
            x = rnd;
            y = 0;
            clr = rnd[1:0];
            if(clr == 2'b00) begin
                clr = cnt;
                if(cnt == 2'b11)
                    cnt = 2'b01;
                else begin
                    cnt = cnt + 1;
                end
            end //extract the last 2 bits --> either 0,1,2,3, use cnt if we yield 00 
            
        end
        else if (pause == 0) begin
            if(y >= 400) begin //460-480 but can change value to smaller for testing
                x = rnd;
                y = 0;
                clr = rnd[1:0];
                if(clr == 2'b00) begin
                    clr = cnt;
                    if(cnt == 2'b11)
                        cnt = 2'b01;
                    else begin
                        cnt = cnt + 1;
                    end
                end //extract the last 2 bits --> either 0,1,2,3, use cnt if we yield 00 
                
            end
            else begin
                y = y + 15; //5 represents the velocity at which the item falls (# of pixels that change vertically)
            end
        end
    end
    
    assign pos_x = x;
    assign pos_y = y;
    assign color = clr;

endmodule
