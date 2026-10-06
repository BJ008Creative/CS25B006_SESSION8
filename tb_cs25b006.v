`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 02:40:53 PM
// Design Name: 
// Module Name: tb_cs25b006
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


module tb_cs25b006;
        reg [15:0] data;
        reg [3:0] sel;
        wire out;

    // Instantiate the DUT (Device Under Test)
           cs25b006 uut (
            .D0(data[0]),
            .D1(data[1]),
            .D2(data[2]),
            .D3(data[3]),
            .D4(data[4]),
            .D5(data[5]),
            .D6(data[6]),
            .D7(data[7]),
            .D8(data[8]),
            .D9(data[9]),
            .D10(data[10]),
            .D11(data[11]),
            .D12(data[12]),
            .D13(data[13]),
            .D14(data[14]),
            .D15(data[15]),
            .S0(sel[0]),
            .S1(sel[1]),
            .S2(sel[2]),
            .S3(sel[3]),
            .Y(out)
            
            
            
            
        );

        initial begin
            // Initialize Inputs
            data = 16'b0000000000000000;
            sel = 4'b0000;
            #10;
            data = 16'b1001_0000_0000_0000;
            sel = 4'b1011;
            #10;
            $stop;
            end            
            
            
    
endmodule
