module tester (
    // Inputs (generados por el tester y enviados a los módulos bajo prueba)
    output reg [7:0] data_main_CPU,   // Datos de entrada a enviar por MOSI
                     data_node1_CPU,  // Datos de entrada a enviar por MISO
                     data_node2_CPU,  // Datos de entrada a enviar por MISO
    output reg       clk,       // Reloj de entrada del sistema
                     rst,       // Señal de reinicio
                     start,      // Señal para iniciar la transmisión
                     CKP,       // Polaridad del SCK en IDLE
                     CPH,       // Flanco del SCK que realiza la transición.
    
    // Ouputs (capturados por el tester desde los módulos bajo prueba)
    input wire       SCK,       // Señal de reloj de SPI
                     CS,        // Señal para iniciar la transmisión
                     MOSI,      // Main salida, subnode entrada
                     MISO       // Main entrada, subnode salida
);

// Parámetros del CLOCK.
localparam semiCiclo = 1;
localparam ciclo = 2;

// Creación del CLOCK.
always begin
    #semiCiclo clk = !clk;  // Conmuntando el valor de clk.
end

// Estímulo de las entradas.
initial begin
        clk = 0;
        rst = 0;    // IDLE
        start = 0;
    #2  
        // MODO 0 ************************************************************
        CKP = 0;
        CPH = 0;
    #2
        rst = 1;
    #4
        start = 1;
        data_main_CPU  = 8'b01000000;  // B94037, se envía el 4 y 0
        data_node1_CPU = 8'b00110111;
        data_node2_CPU = 8'b10101010;
    #2
        start = 0;
        data_main_CPU = 0;
    #126
        // MODO 1 ************************************************************
        CKP = 0;
        CPH = 1;
    #2
        rst = 1;
    #4
        start = 1;
        data_main_CPU  = 8'b01000000;  // B94037, se envía el 4 y 0
        data_node1_CPU = 8'b00110111;
        data_node2_CPU = 8'b10101010;
    #2
        start = 0;
        data_main_CPU = 0;
    #130
        // MODO 2 ************************************************************
        CKP = 1;
        CPH = 0;
    #2
        rst = 1;
    #4
        start = 1;
        data_main_CPU  = 8'b01000000;  // B94037, se envía el 4 y 0
        data_node1_CPU = 8'b00110111;
        data_node2_CPU = 8'b10101010;
    #2
        start = 0;
        data_main_CPU = 0;
    #130
        // MODO 3 ************************************************************
        CKP = 1;
        CPH = 1;
    #2
        rst = 1;
    #4
        start = 1;
        data_main_CPU  = 8'b01000000;  // B94037, se envía el 4 y 0
        data_node1_CPU = 8'b00110111;
        data_node2_CPU = 8'b10101010;
    #2
        start = 0;
        data_main_CPU = 0;
    #130
    #8 $finish;
end
endmodule
