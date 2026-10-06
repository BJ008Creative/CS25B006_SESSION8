`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/06/2026 04:18:17 PM
// Design Name:
// Module Name: top_fpga
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


module top_fpga (
    input  wire [3:0] sw,    // Physical switches for select lines S[3:0]
    output wire       led0   // Physical LED for output Y
);
    // Fixed test pattern: D = 16'b1010_0101_1010_0101 (0xA5A5)
    wire [15:0] D_pattern = 16'hA5A5;

    mux16to1 u_mux (
        .D(D_pattern),
        .S(sw),
        .Y(led0)
    );
endmodule