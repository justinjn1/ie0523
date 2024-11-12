module I2C (
    // Inputs
    input clk, rst, RNW, STARD_STB, SDA_IN,
    input [6:0]  I2C_ADDR,
    input [15:0] WR_DATA,

    // Outputs
    output reg [15:0] RD_DATA,
    output reg SDA_OUT, SDA_OE, SCL
);

// Parametros de estado.
localparam IDLE     = 6'b1;
localparam ADDRES   = 6'b10;
localparam WAIT     = 6'b100;
localparam WRITE    = 6'b1000;
localparam READ     = 6'b10000;
localparam STOP     = 6'b100000;

// Registro internos:
reg [5:0] state, next_State;
reg [1:0] cnt_clk, next_cnt_clk;

always @(posedge clk) begin         // Lógica secuencial.
    if (!rst) begin // rst de valores de FF.
        state       <= IDLE;
        cnt_clk     <= 0;
    end else begin // Transición de estados de FF.
        state       <= next_State;
        cnt_clk     <= next_cnt_clk;
    end
end

always @(*) begin                   // Lógica combinacional.
    // Sosteniendo valores de FF.
    next_cnt_clk = cnt_clk + 1; // Para el reloj
    next_State = state;

    // Valores de salida por defecto.
    case (state)
        IDLE: begin
            // Hola
        end   
        ADDRES: begin
            // Hola
        end
        WAIT: begin
            // Hola
        end
        WRITE: begin
            // Hola
        end
        READ: begin
            // Hola
        end
        STOP: begin
            // Hola
        end
        default: next_State = IDLE;
    endcase
end
endmodule
