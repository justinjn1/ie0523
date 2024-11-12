module mod (
    // Inputs
    // Ouputs
);

// Parametros de Estado:
parameter IDLE = 4'b1; 
parameter otroestado = 4'b10; 
parameter otroestadomas = 4'b100; 

// Registros Internos:
reg [3:0] state, nextState;

always @(posedge clk) begin         // Lógica secuencial.
    if (!rst) begin // rst de valores de FF.
        state <= IDLE;
    end else begin // Transición de estados de FF.
        state <= nextState;       
    end
end

always @(*) begin                   // Lógica combinacional.
    // Sosteniendo valores de FF.
    nextState = state;
    
    // Valores de salida por defecto.

    // Casos para cada estado.
    case(state)
        IDLE: begin
            // Hola
        end
        otroestado: begin
            // Hola
        end
        otroestadomas: begin
            // Hola
        end
        default: next_state = IDLE;
    endcase
end

endmodule
