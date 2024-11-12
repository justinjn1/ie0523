module gatemanager (
    clk,
    rst,
    s01,
    s02,
    pass,
    wrong_pin_alarm,
    rghtpss,
    gate,
    lock_alarm
);

input wire clk, rst, s01, s02;
input wire [15:0] pass;
input wire [15:0] rghtpss;

output reg wrong_pin_alarm, gate, lock_alarm;

// Parámetros de estado.
localparam IDLE = 4'b1;
localparam verification = 4'b10;
localparam bloked = 4'b100;
localparam right = 4'b1000;

// Registro interno para el manejo de estados.
reg [3:0] state, nextState;
// Registro interno para manejar el contador de contraseñas erróneas.
reg [1:0] cnt, nextCnt;

always @(posedge clk) begin // Lógica secuencial.
    if (rst) begin
        // rst de valores de FF.
        state <= IDLE;
        cnt <= 2'b0;
    end else begin
        // Transición de estados de FF.
        state <= nextState;
        cnt <= nextCnt;
    end
end

always @(*) begin // Lógica combinacional.
    // Sosteniendo valores de FF.
    nextState = state;
    nextCnt = cnt;
    
    // Valores de outputs por defecto.
    wrong_pin_alarm = 0;
    lock_alarm = 0;
    gate = 0;

    // Casos para cada estado.
    case(state)
        IDLE: begin 
            if (s01 && !s02) nextState = verification; 
            else if (s01 && s02) nextState = bloked;
        end
        bloked: begin
            lock_alarm = 1;
        end
        verification: begin
            if (rghtpss==pass) begin
                nextState = right;
                nextCnt = 0;
            end
            else if (cnt > 2'b10) begin
                wrong_pin_alarm = 1;
                nextState = bloked;
            end
            else if (!(rghtpss == pass)) begin
                nextCnt = cnt + 1;
                if (cnt > 0) wrong_pin_alarm = 1;
            end
        end
        right: begin
            gate = 1;
            if (s02 == 1) nextState = IDLE;
        end
        default: nextState = IDLE;
    endcase
end
endmodule
