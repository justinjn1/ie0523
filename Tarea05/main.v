module main (
    // Inputs
    input wire [7:0] data_main_CPU,   // Datos de entrada a enviar por MOSI
    input wire       clk,       // Reloj de entrada del sistema
                     rst,       // Señal de reinicio
                     start,        // Señal para iniciar la transmisión
                     MISO,      // Main entrada, subnode salida
                     CKP,       // Polaridad del SCK en IDLE
                     CPH,       // Flanco del SCK que realiza la transición
    // Ouputs
    output reg       MOSI,      // Main salida, subnode entrada
                     SCK,        // Señal de reloj para la comunicación SPI.
                     CS
);


// Parametros de Estado.
localparam IDLE     = 2'b1;
localparam TRANSFER = 2'b10;


// Registro Internos:
reg [1:0] state, next_State;
reg [1:0] cnt_clk, next_cnt_clk;
reg [7:0] cnt_bits, next_cnt_bits;
reg [7:0] data_main;   // Registro para guardar datos del CPU
reg [7:0] data_MISO;   // Registro para guardar datos que ingresan por MISO
reg SCK_d;


/*
    Se necesitan 2 transacciones de 8 bits para que los datos que el main 
    envíe lleguen al subnodo2, por lo que se define un registro para contar 
    las transacciones realizadas
*/

// Registro para controlar la cantidad de transacciones
reg [1:0] trasaccion, next_trasaccion;  // 8 bits = 1 transaccion

// Asignaciones:
assign posedge_SCK = !SCK_d && SCK;  // Flanco creciente.
assign negedge_SCK = SCK_d && !SCK;  // Flanco decreciente.

// Lógica Secuencial
always @(posedge clk) begin
    if (!rst) begin // rst de valores de FF.
        state       <= IDLE;
        SCK         <= CKP; // Estado inactivo inicial de SCK según CKP
        cnt_clk     <= 0;
        cnt_bits    <= 0;
        SCK_d       <= 0;
        MOSI        <= 0;
        data_main   <= 0;
        data_MISO   <= 0;
        trasaccion  <= 0;
    end else begin // Transición de estados de FF.
        state       <= next_State;
        cnt_clk     <= next_cnt_clk;
        cnt_bits    <= next_cnt_bits;
        trasaccion  <= next_trasaccion;
        SCK_d       <= SCK;
    end
end


// Lógica Combinacional
always @(*) begin
    // Sosteniendo valores de FF.
    next_cnt_clk  = cnt_clk + 1; // Para el reloj
    next_State    = state;
    next_cnt_bits = cnt_bits;

    // Valores de salida por defecto.
    CS = 1;
    case (state)
        IDLE: begin
            SCK = CKP; // Mantener SCK en el estado de CKP
            next_trasaccion = 0;
            if (start) begin
                // Cargar datos de entrada a enviar
                CS = 0;
                data_main  = data_main_CPU;
                next_State = TRANSFER;
            end
        end
        TRANSFER: begin
            CS = 0;
            // Generar SCK con frecuencia de 25% del clk (MSB de cnt_clk)
            SCK = cnt_clk[1];
            if (!CKP && !CPH && posedge_SCK) begin          // MODO 0
                // Envía el bit correspondiente por MOSI
                MOSI = data_main[7 - cnt_bits];
                // Captura el bit recibido en MISO
                data_MISO[7 - cnt_bits] = MISO;
                // Aumentar contador de bits
                next_cnt_bits = cnt_bits + 1;
            end
            if (!CKP && CPH && negedge_SCK) begin           // MODO 1
                // Envía el bit correspondiente por MOSI
                MOSI = data_main[7 - cnt_bits];
                // Captura el bit recibido en MISO
                data_MISO[7 - cnt_bits] = MISO;
                // Aumentar contador de bits
                next_cnt_bits = cnt_bits + 1;
            end
            if (CKP && !CPH && negedge_SCK) begin           // MODO 2
                // Envía el bit correspondiente por MOSI
                MOSI = data_main[7 - cnt_bits];
                // Captura el bit recibido en MISO
                data_MISO[7 - cnt_bits] = MISO;
                // Aumentar contador de bits
                next_cnt_bits = cnt_bits + 1;
            end
            if (CKP && CPH && posedge_SCK) begin            // MODO 3
                // Envía el bit correspondiente por MOSI
                MOSI = data_main[7 - cnt_bits];
                // Captura el bit recibido en MISO
                data_MISO[7 - cnt_bits] = MISO;
                // Aumentar contador de bits
                next_cnt_bits = cnt_bits + 1;
            end
            // Volver a IDLE después de enviar 8 bits
            if (cnt_bits == 8) begin
                MOSI = 0;
                next_trasaccion = trasaccion + 1;
                data_main       = data_MISO;
                next_cnt_bits   = 0;
                next_State      = state;
            end
            if (trasaccion == 2'b10) next_State = IDLE;
        end
        default: next_State = IDLE;
    endcase
end
endmodule
