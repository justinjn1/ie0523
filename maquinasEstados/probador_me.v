// Declaración del módulo y parámetros
 module probador #(parameter SECUENCIA = 5'b10100,
                   parameter SEC_REINICIO = 5'b00000) (clk,rst,s_in,valido); 
  // Declaración de entradas y salidas
 output reg clk,rst,s_in;
 input  valido;

    initial begin
    clk = 0;
    rst = 1;
    s_in = 0;
    #25 rst = 0;
    #15 rst = 1;
//Código inválido
    #10 s_in = 1;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 1;
//Código válido
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 0;
//Ya sincronizado
    #10 s_in = 1;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 0;
    #10 s_in = 1;
//Pierde sincronía
    #10 s_in = 0;
    #10 s_in = 0;
    #10 s_in = 0;
    #10 s_in = 0;
    #10 s_in = 0;
    #30 $finish;
  end

  always begin
    #5 clk = !clk;
  end

endmodule
