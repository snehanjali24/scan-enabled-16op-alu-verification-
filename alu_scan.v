`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 13:29:33
// Design Name: 
// Module Name: alu_scan
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


module alu_scan(
    input clk,
    input scan_enable,
    input scan_in,

    input [3:0] A,
    input [3:0] B,
    input [3:0] opcode,

    output scan_out,
    output [3:0] result
);

reg [3:0] alu_result;

// ALU Logic
always @(*)
begin
    case(opcode)

    4'b0000: alu_result = A + B;        // ADD
    4'b0001: alu_result = A - B;        // SUB
    4'b0010: alu_result = A & B;        // AND
    4'b0011: alu_result = A | B;        // OR

    4'b0100: alu_result = A ^ B;        // XOR
    4'b0101: alu_result = ~(A ^ B);     // XNOR
    4'b0110: alu_result = ~(A & B);     // NAND
    4'b0111: alu_result = ~(A | B);     // NOR

    4'b1000: alu_result = A << 1;       // Left Shift
    4'b1001: alu_result = A >> 1;       // Right Shift

    4'b1010: alu_result = A + 1;        // Increment
    4'b1011: alu_result = A - 1;        // Decrement

    4'b1100: alu_result = A + B + 1;    // Add with Carry

    4'b1101:
        alu_result = (A > B) ? 4'b0001 : 4'b0000;

    4'b1110:
        alu_result = (A == B) ? 4'b0001 : 4'b0000;

    4'b1111:
        alu_result = ~A;                // NOT

    default:
        alu_result = 4'b0000;

    endcase
end

// Scan Chain

scan_dff FF0(
    .clk(clk),
    .d(alu_result[0]),
    .scan_in(scan_in),
    .scan_enable(scan_enable),
    .q(result[0])
);

scan_dff FF1(
    .clk(clk),
    .d(alu_result[1]),
    .scan_in(result[0]),
    .scan_enable(scan_enable),
    .q(result[1])
);

scan_dff FF2(
    .clk(clk),
    .d(alu_result[2]),
    .scan_in(result[1]),
    .scan_enable(scan_enable),
    .q(result[2])
);

scan_dff FF3(
    .clk(clk),
    .d(alu_result[3]),
    .scan_in(result[2]),
    .scan_enable(scan_enable),
    .q(result[3])
);

assign scan_out = result[3];

endmodule