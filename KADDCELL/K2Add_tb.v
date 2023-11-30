`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2023 08:10:17
// Design Name: 
// Module Name: k_add_tb
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

module tb_TwoInputKAddCell;

  // Signals
  reg clk;
  reg [1:0] A, B;
  wire [1:0] Sum;

  // Instantiate the TwoInputKAddCell module
  TwoInputKAddCell dut (
    .clk(clk),
    .A(A),
    .B(B),
    .Sum(Sum)
  );

  // Clock generation
  always #2 clk = ~clk;

  // Initial block
  initial begin
    clk = 0;

    // Apply test vectors
    A = 2'b01;
    B = 2'b10;
    #20 A = 2'b10;
    B = 2'b11;
    #20 A = 2'b11;
    B = 2'b01;

    // Add more test vectors as needed

    #50 $finish;  // Stop the simulation after a sufficient duration
  end



endmodule
