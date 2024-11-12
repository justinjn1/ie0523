`include "probador_me.v"
// `include "me_op1.v"
`include "me_op2.v"
                                        
// Testbench Code Goes here
module me_tb;

  wire clk, rst, s_in,valido;

  initial begin
	$dumpfile("ondas.vcd");
	$dumpvars(-1, ME);
  end

  det_sec ME (
    .clk (clk),
    .rst (rst),
    .s_in (s_in),
    .valido (valido));

  probador PROB_MEOP1 (
    .clk (clk),
    .rst (rst),
    .s_in (s_in),
    .valido (valido));

endmodule
