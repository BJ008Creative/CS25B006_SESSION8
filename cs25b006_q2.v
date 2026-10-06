`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 03:21:01 PM
// Design Name: 
// Module Name: cs25b006_q2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cs25b006_q2(
    input D,
    input S1,
    input S0,
    output Y0,Y1,Y2,Y3

    );
assign Y0 = D&(~S1)&(~S0);
assign Y1 = D&(~S1)&(S0);
assign Y2 = D&(S1)&(~S0);
assign Y3 =D&(S1)&(S0);
endmodule
