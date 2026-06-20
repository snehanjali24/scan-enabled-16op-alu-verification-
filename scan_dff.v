`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 13:06:30
// Design Name: 
// Module Name: scan_dff
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


module scan_dff(
    input clk,
    input d,
    input scan_in,
    input scan_enable,
    output reg q
);

always @(posedge clk)
begin
    if(scan_enable)
        q <= scan_in;
    else
        q <= d;
end

endmodule
