`include "testerP12.v"
`include "cmos_cells.v"
`include "atm_synth.v"

module testbench;
  initial begin
    $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
    $dumpvars;              // Por defecto agrega todas las instancias.
  end

  wire [63:0] balanceInicial;
  wire [31:0] monto;
  wire [15:0] pinTarjeta;
  wire [3:0] digito;

  // UUT: Unit Under Test
  // Instancias de los módulos:
  atm UUT1 (
    // Entradas
    .clk                  (clk),
    .rst                  (rst),
    .balanceInicial       (balanceInicial),
    .monto                (monto),
    .pinTarjeta           (pinTarjeta),
    .digito               (digito),
    .tarjetaRecibida      (tarjetaRecibida),
    .digitoSTB            (digitoSTB),
    .montoSTB             (montoSTB),
    .tipoTrans            (tipoTrans),
    // Salidas
    .balanceActualizado   (balanceActualizado),
    .entregarDinero       (entregarDinero),
    .fondosInsuficientes  (fondosInsuficientes),
    .pinIncorrecto        (pinIncorrecto),
    .advertencia          (advertencia),
    .alarmaBloqueo        (alarmaBloqueo)
  );
  testerP12 TESTER (
    // Entradas
    .balanceActualizado   (balanceActualizado),
    .entregarDinero       (entregarDinero),
    .fondosInsuficientes  (fondosInsuficientes),
    .pinIncorrecto        (pinIncorrecto),
    .advertencia          (advertencia),
    .alarmaBloqueo        (alarmaBloqueo),
    // Salidas
    .clk                  (clk),
    .rst                  (rst),
    .balanceInicial       (balanceInicial),
    .monto                (monto),
    .pinTarjeta           (pinTarjeta),
    .digito               (digito),
    .tarjetaRecibida      (tarjetaRecibida),
    .digitoSTB            (digitoSTB),
    .montoSTB             (montoSTB),
    .tipoTrans            (tipoTrans)
  );
endmodule
