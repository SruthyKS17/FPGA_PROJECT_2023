`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2023 07:42:06
// Design Name: 
// Module Name: k_add
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

module TwoInputKAddCell (
  input wire clk, rst_n,
  input wire [1:0] A, B,
  output wire [1:0] Sum
);

  // Internal signals
  reg [1:0] S;
  reg [1:0] Cout_reg;

  // 2:3 adder logic
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      Cout_reg <= 2'b0;
    end else begin
      S[0] = A[0] ^ B[0] ^ Cout_reg[0];
      S[1] = (A[1] ^ B[1]) ^ (A[0] & B[0]) ^ Cout_reg[1];
      Cout_reg <= (A[1] & B[1]) | (A[0] & B[0]) | (A[1] & (B[0] ^ Cout_reg[0]) | (A[0] & B[0] & Cout_reg[0]));
    end
  end

  // Output assignment
  assign Sum = S;

endmodule
