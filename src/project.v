


/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
  ADDER8bit a(
    .A (ui_in),
    .B (uio_in),
    .Cin (1'b0),
    .C (uo_out),
    .Cout ()
  );
  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule


module ADDER2bit (
  input wire A, B, Cin,
  output wire S, Cout
);
  wire x1,x2,x3;
  
  assign x1 = A^B;
  assign S = x1^Cin;
  assign x2 = x1 & Cin;
  assign x3 = A & B;
  assign Cout = x2 | x3;
  
endmodule

module ADDER8bit(
  input wire [7:0] A,B,
  input wire Cin,
  output wire [7:0] S,
  output wire Cout
);
  wire [8:0] C;
  
  assign C[0]=Cin;
  assign Cout=C[8];
  
  ADDER2bit a0(
    .A (A[0]),
    .B (B[0]),
    .Cin (C[0]),
    .S (S[0]),
    .Cout (C[1])
  );
  ADDER2bit a1(
    .A (A[1]),
    .B (B[1]),
    .Cin (C[1]),
    .S (S[1]),
    .Cout (C[2])
  );
  ADDER2bit a2(
    .A (A[2]),
    .B (B[2]),
    .Cin (C[2]),
    .S (S[2]),
    .Cout (C[3])
  );
  ADDER2bit a3(
    .A (A[3]),
    .B (B[3]),
    .Cin (C[3]),
    .S (S[3]),
    .Cout (C[4])
  );
  ADDER2bit a4(
    .A (A[4]),
    .B (B[4]),
    .Cin (C[4]),
    .S (S[4]),
    .Cout (C[5])
  );
  ADDER2bit a5(
    .A (A[5]),
    .B (B[5]),
    .Cin (C[5]),
    .S (S[5]),
    .Cout (C[6])
  );
  ADDER2bit a6(
    .A (A[6]),
    .B (B[6]),
    .Cin (C[6]),
    .S (S[6]),
    .Cout (C[7])
  );
  ADDER2bit a7(
    .A (A[7]),
    .B (B[7]),
    .Cin (C[7]),
    .S (S[7]),
    .Cout (C[8])
  );
endmodule
