`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:34:43 06/02/2023 
// Design Name: 
// Module Name:    random 
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
module random(
    input clk,
    input rst,
    output reg [9:0] rnd
    );
    
    reg [9:0] random;
    reg [9:0] random_next;
    reg [9:0] random_done;
    reg [3:0] cnt;
    reg [3:0] cnt_next; //to keep track of the shifts

    wire feedback = random[9] ^ random[6]; 

    always @ (posedge clk or posedge rst) begin
        
        if (rst) begin
          random = 10'b1111111111; //An LFSR cannot have an all 0 state, thus reset to max value
          random_done = 10'b1001011000;
          cnt = 0;
        end
         
        else begin
            rnd = random_done;
            /*random_next = random; //default state
            cnt_next = cnt;*/
          
            random_next = {random[8:0], feedback}; //shift left the xor'd every posedge clock
            cnt_next = cnt + 1;
            random = random_next;
            cnt = cnt_next;
          
          if (cnt == 10) begin
              cnt = 0;
              if(random > 10'd600) begin
                random_done = random / 5; //constant number to bring the range to 0-540
              end
              else begin
                random_done = random; //assign the random number to output after 13 shifts
              end
            end
        end
    end

    /*always @(*) begin
      random_next = random; //default state
      cnt_next = cnt;
      
      random_next = {random[8:0], feedback}; //shift left the xor'd every posedge clock
      cnt_next = cnt + 1;
     if (cnt == 10) begin
      cnt = 0;
      if(random > 10'b1001011000) begin
        random_done = random - 430; //constant number to bring the range to 0-640
      end
      else begin
        random_done = random; //assign the random number to output after 13 shifts
      end
     end
     
    end*/

    endmodule
