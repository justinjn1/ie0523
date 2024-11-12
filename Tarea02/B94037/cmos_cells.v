module BUF(A, Y);
  input A;
  output Y;
  assign #0.25 Y = A;
endmodule

module NOT(A, Y);
  input A;
  output Y;
  assign #0.25 Y = ~A;
endmodule

module NAND(A, B, Y);
  input A, B;
  output Y;
  assign #0.25 Y = ~(A & B);
endmodule

module NOR(A, B, Y);
  input A, B;
  output Y;
  assign #0.25 Y = ~(A | B);
endmodule

module DFF(C, D, Q);
  input C, D; 
  output reg Q;
  always @(posedge C) #0.25 Q <= D;
endmodule