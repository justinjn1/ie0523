module testerP3 (
  output reg [63:0] balanceInicial,
  output reg [31:0] monto,
  output reg [15:0] pinTarjeta,
  output reg [3:0]  digito,
  output reg  clk,
              rst,
              tarjetaRecibida,
              digitoSTB,
              montoSTB,
              tipoTrans,

  input wire  balanceActualizado,
              entregarDinero,
              fondosInsuficientes,
              pinIncorrecto,
              advertencia,
              alarmaBloqueo
);

// Parámetros del CLOCK.
localparam semiCiclo = 1;
localparam ciclo = 2*semiCiclo;

// Creación del CLOCK.
always begin
  // Conmuntando el valor de clk.
  #semiCiclo clk = !clk;
end

// Estímulo de las entradas.
initial begin
  // Prueba03 --------------------------------------------------------
    clk = 0;
    rst = 0;
    tarjetaRecibida = 0;
    digitoSTB = 0;
    montoSTB = 0;
    balanceInicial = 0;
    monto = 0;
    tipoTrans = 0;
  #ciclo            // IDLE
    rst = 1;
    tarjetaRecibida = 1;
    pinTarjeta = 16'b1011011011101001;
    balanceInicial = 64'b1100001101010000;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1011;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b0110;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1110;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1000;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo // --------------------------------------------------
  #ciclo
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1011;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1111;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1110;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1001;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo // --------------------------------------------------
  #ciclo
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1011;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1111;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1110;
  #ciclo            // verification
    digitoSTB = 0;
  #ciclo            // captDig
    digitoSTB = 1;
    digito = 4'b1001;
  #ciclo            // verification
    digitoSTB = 0;
  #4
    rst = 0;
  #3
    $finish;
end
endmodule
