`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 13:31:05
// Design Name: 
// Module Name: alu_scan_tb
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




module alu_scan_tb;

reg clk;
reg scan_enable;
reg scan_in;

reg [3:0] A;
reg [3:0] B;
reg [3:0] opcode;

wire scan_out;
wire [3:0] result;

// DUT Instantiation
alu_scan DUT(
    .clk(clk),
    .scan_enable(scan_enable),
    .scan_in(scan_in),
    .A(A),
    .B(B),
    .opcode(opcode),
    .scan_out(scan_out),
    .result(result)
);

// Clock Generation
always #5 clk = ~clk;


// ==========================
// Automatic Checking Task
// ==========================
task check;
input [3:0] expected;

begin
    #10;

    if(result == expected)
        $display("PASS opcode=%b result=%d",
                 opcode, result);
    else
        $display("FAIL opcode=%b expected=%d got=%d",
                 opcode, expected, result);
end

endtask;


// ==========================
// Test Sequence
// ==========================
initial
begin

    clk = 0;
    scan_enable = 0;
    scan_in = 0;

    // 0000 ADD
    A = 5; B = 3;
    opcode = 4'b0000;
    check(8);

    // 0001 SUB
    A = 9; B = 2;
    opcode = 4'b0001;
    check(7);

    // 0010 AND
    A = 5; B = 3;
    opcode = 4'b0010;
    check(1);

    // 0011 OR
    A = 5; B = 3;
    opcode = 4'b0011;
    check(7);

    // 0100 XOR
    A = 5; B = 3;
    opcode = 4'b0100;
    check(6);

    // 0101 XNOR
    A = 5; B = 3;
    opcode = 4'b0101;
    check(9);

    // 0110 NAND
    A = 5; B = 3;
    opcode = 4'b0110;
    check(14);

    // 0111 NOR
    A = 5; B = 3;
    opcode = 4'b0111;
    check(8);

    // 1000 LEFT SHIFT
    A = 5; B = 0;
    opcode = 4'b1000;
    check(10);

    // 1001 RIGHT SHIFT
    A = 8; B = 0;
    opcode = 4'b1001;
    check(4);

    // 1010 INCREMENT
    A = 5; B = 0;
    opcode = 4'b1010;
    check(6);

    // 1011 DECREMENT
    A = 5; B = 0;
    opcode = 4'b1011;
    check(4);

    // 1100 ADD WITH CARRY
    A = 5; B = 3;
    opcode = 4'b1100;
    check(9);

    // 1101 A > B
    A = 5; B = 3;
    opcode = 4'b1101;
    check(1);

    // 1110 A == B
    A = 5; B = 5;
    opcode = 4'b1110;
    check(1);

    // 1111 NOT A
    A = 5; B = 0;
    opcode = 4'b1111;
    check(10);

    // ==========================
    // Scan Chain Verification
    // ==========================

    scan_enable = 1;

    scan_in = 1; #10;
    scan_in = 0; #10;
    scan_in = 1; #10;
    scan_in = 1; #10;

    // Flush pattern
    scan_in = 0; #10;
    scan_in = 0; #10;
    scan_in = 0; #10;
    scan_in = 0; #10;

    #20;

    $finish;

end


// ==========================
// Monitor
// ==========================
initial
begin
    $monitor("TIME=%0t SE=%b OPCODE=%b A=%d B=%d RESULT=%d SCAN_OUT=%b",
             $time,
             scan_enable,
             opcode,
             A,
             B,
             result,
             scan_out);
end

endmodule
