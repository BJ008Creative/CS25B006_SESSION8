`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 04:22:29 PM
// Design Name: 
// Module Name: tb_2
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


module tb_2;
reg D;
reg S1;
reg S0;
wire Y0;
wire Y1;
wire Y2;
wire Y3;
cs25b006_q2 DUT(
    D,S1,S0,
    Y0,Y1,Y2,Y3
);
initial begin
    D=0; S1=0; S0=0; #10;
    if(Y0!=0 || Y1!=0 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=0; S1=0; S0=1; #10;
    if(Y0!=0 || Y1!=0 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=0; S1=1; S0=0; #10;
    if(Y0!=0 || Y1!=0 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=0; S1=1; S0=1; #10;
    if(Y0!=0 || Y1!=0 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=1; S1=0; S0=0; #10;
    if(Y0!=1 || Y1!=0 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=1; S1=0; S0=1; #10;
    if(Y0!=0 || Y1!=1 || Y2!=0 || Y3!=0)
        $display("ERROR");
    D=1; S1=1; S0=0; #10;
    if(Y0!=0 || Y1!=0 || Y2!=1 || Y3!=0)
        $display("ERROR");
    D=1; S1=1; S0=1; #10;
    if(Y0!=0 || Y1!=0 || Y2!=0 || Y3!=1)
        $display("ERROR");
    $display("1:4 DEMUX TEST COMPLETED");
    $finish;
end
endmodule
