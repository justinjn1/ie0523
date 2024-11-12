module tester (
    input wire wrong_pin_alarm,
        gate,
        lock_alarm,
    output reg 
        clk,
        rst,
        s01,
        s02,
    output reg [15:0] pass
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
    // Prueba01 --------------------------------------------------------
        clk = 0;
        rst = 1;
    // IDLE
    #ciclo
        rst = 0;
        s01 = 1;
        s02 = 0;
    // verification
    #ciclo
        pass = 16'h4037;
    #ciclo // right
    #ciclo
        s01 = 0;
        s02 = 1;
    #5
    // IDLE
    // Prueba02 --------------------------------------------------------
    // IDLE
        clk = 0;
        rst = 1;
    #ciclo
        rst = 0;
        s01 = 1;
        s02 = 0;
    // verification
    #semiCiclo // Intento 1
        pass = 16'h4031;
    #semiCiclo
    #ciclo // Intento 2
    #ciclo // Intento 3
        // Dos ciclos después de verificar la primer clave:
        pass = 16'h4037;
    // right
    #ciclo
        s01 = 0;
        s02 = 1;
    // IDLE
    #4
    // Prueba03 --------------------------------------------------------
    // IDLE
        clk = 0;
        rst = 1;
    #ciclo
        rst = 0;
        s01 = 1;
        s02 = 0;
    // verification
    #semiCiclo // Intento 1
        pass = 16'h4027;
    #semiCiclo
    #ciclo // Intento 2
    #ciclo // Intento 3
    #ciclo // Intento 4
    #6
    // Prueba04 --------------------------------------------------------
        clk = 0;
        rst = 1;
        s01 = 0;
    #ciclo
        rst = 0;
        s02 = 1;
        s01 = 1;
    #5
        $finish;
end
endmodule
