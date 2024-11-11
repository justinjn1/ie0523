module subnode2 (
    // Inputs
    input wire [7:0] data_node2_CPU,  // Datos de entrada a enviar por MISO
    input wire       clk,             // Reloj de entrada del sistema
                     SCK,             // Señal de reloj para la comunicación SPI.
                     MOSI,            // Main salida, subnode entrada
                     CS,
                     CKP,             // Polaridad del SCK en IDLE
                     CPH,             // Flanco del SCK que realiza la transición
    // Outputs
    output reg       MISO             // Main entrada, subnode salida
);

// Parámetros de Estado.
localparam IDLE     = 2'b1;
localparam TRANSFER = 2'b10;

// Registro Internos:
reg [1:0] state, next_State;
reg [7:0] cnt_bits1, next_cnt_bits1;
reg [7:0] data_node2;   // Registro para guardar datos del CPU
reg [7:0] data_MOSI;    // Registro para guardar datos que ingresan por MOSI
reg SCK_d;

// Asignaciones:
assign posedge_SCK = !SCK_d && SCK;  // Flanco creciente.
assign negedge_SCK = SCK_d && !SCK;  // Flanco decreciente.


// Lógica Secuencial
always @(posedge clk) begin
    if (!CS) begin // reset de valores de FF.
        state       <= TRANSFER;
        cnt_bits1   <= next_cnt_bits1;
        SCK_d       <= SCK;
    end else begin // Transición de estados de FF.
        state       <= next_State;
        SCK_d       <= 0;
        cnt_bits1   <= 0;
        MISO        <= 0;
        data_MOSI   <= 0;
        data_node2  <= 0;
    end
end

// Lógica Combinacional
always @(*) begin
    // Sosteniendo valores de FF.
    next_State     = state;
    next_cnt_bits1 = cnt_bits1;

    case (state)
        IDLE: begin
            next_cnt_bits1 = 0;
            if (!CS) begin
                data_node2 = data_node2_CPU;
                next_State = TRANSFER;
            end
        end
        TRANSFER: begin
            if (!CKP && !CPH && posedge_SCK) begin          // MODO 0
                // Envía el bit correspondiente por MISO
                MISO = data_node2[7 - cnt_bits1];
                // Captura el bit recibido en MOSI
                data_MOSI[7 - cnt_bits1] = MOSI;
                // Aumentar contador de bits
                next_cnt_bits1 = cnt_bits1 + 1;
            end
            if (!CKP && CPH && negedge_SCK) begin           // MODO 1
                // Envía el bit correspondiente por MISO
                MISO = data_node2[7 - cnt_bits1];
                // Captura el bit recibido en MOSI
                data_MOSI[7 - cnt_bits1] = MOSI;
                // Aumentar contador de bits
                next_cnt_bits1 = cnt_bits1 + 1;
            end
            if (CKP && !CPH && negedge_SCK) begin           // MODO 2
                // Envía el bit correspondiente por MISO
                MISO = data_node2[7 - cnt_bits1];
                // Captura el bit recibido en MOSI
                data_MOSI[7 - cnt_bits1] = MOSI;
                // Aumentar contador de bits
                next_cnt_bits1 = cnt_bits1 + 1;
            end
            if (CKP && CPH && posedge_SCK) begin            // MODO 3
                // Envía el bit correspondiente por MISO
                MISO = data_node2[7 - cnt_bits1];
                // Captura el bit recibido en MOSI
                data_MOSI[7 - cnt_bits1] = MOSI;
                // Aumentar contador de bits
                next_cnt_bits1 = cnt_bits1 + 1;
            end
            if (cnt_bits1 == 8) begin
                MISO = 0;
                data_node2     = data_MOSI;
                next_cnt_bits1 = 0;
                next_State     = state;
            end
            if (CS) next_State = IDLE; // Si CS se eleva, volver a IDLE
        end
        default: next_State = IDLE;
    endcase
end
endmodule
