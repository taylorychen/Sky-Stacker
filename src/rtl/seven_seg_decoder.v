`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:26 06/05/2023 
// Design Name: 
// Module Name:    seven_seg_decoder 
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
module seven_seg_decoder(
    input [3:0] digit,
    output ca,
    output cb,
    output cc,
    output cd,
    output ce,
    output cf,
    output cg
    );

	always@(*) begin
        if (digit == 'b0000) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b0;
            cf = 1'b0;
            cg = 1'b1;
        end
        else if (digit == 4'b0001) begin
            ca = 1'b1;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b1;
            ce = 1'b1;
            cf = 1'b1;
            cg = 1'b1;
        end
        else if (digit == 4'b0010) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b1;
            cd = 1'b0;
            ce = 1'b0;
            cf = 1'b1;
            cg = 1'b0;
        end
        else if (digit == 4'b0011) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b1;
            cf = 1'b1;
            cg = 1'b0;
        end
        else if (digit == 4'b0100) begin
            ca = 1'b1;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b1;
            ce = 1'b1;
            cf = 1'b0;
            cg = 1'b0;
        end
        else if (digit == 4'b0101) begin
            ca = 1'b0;
            cb = 1'b1;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b1;
            cf = 1'b0;
            cg = 1'b0;
        end
        else if (digit == 4'b0110) begin
            ca = 1'b0;
            cb = 1'b1;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b0;
            cf = 1'b0;
            cg = 1'b0;
        end
        else if (digit == 4'b0111) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b1;
            ce = 1'b1;
            cf = 1'b1;
            cg = 1'b1; 
        end
        else if (digit == 4'b1000) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b0;
            cf = 1'b0;
            cg = 1'b0;
        end
        else if (digit == 4'b1001) begin
            ca = 1'b0;
            cb = 1'b0;
            cc = 1'b0;
            cd = 1'b0;
            ce = 1'b1;
            cf = 1'b0;
            cg = 1'b0;
        end  
    end

endmodule
