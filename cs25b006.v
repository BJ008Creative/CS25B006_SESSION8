`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 02:23:34 PM
// Design Name: 
// Module Name: cs25b006
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
module mux2to1(
    input D0,D1,S,output Y
 );
assign Y =(~S)&(D0) | (S)&(D1);
endmodule

module mux4to1(
    input D0,D1,D2,D3, S0 , S1 ,output Y
    );
wire A;
wire B;
mux2to1 m1(D0 , D1 ,S0 , A);
mux2to1 m2(D2,D3,S0,B);
mux2to1 m3(A,B,S1,Y);
endmodule;


module cs25b006(
    input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,S0,S1,S2,S3,output Y

    );
 wire A;
 wire B;
 wire C;
 wire D;
 mux4to1 m1(D0,D1,D2,D3,S0,S1,A);
 mux4to1 m2(D4,D5,D6,D7,S0,S1,B);
 mux4to1 m3(D8,D9,D10,D11,S0,S1,C);
 mux4to1 m4(D12,D13,D14,D15,S0,S1,D);
 mux4to1 m5(A,B,C,D,S2,S3,Y);
 
    

endmodule
