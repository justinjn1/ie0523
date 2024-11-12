module atm (
  input wire [63:0] balanceInicial,
  input wire [31:0] monto,
  input wire [15:0] pinTarjeta,
  input wire [3:0] digito,
  input wire  clk,
              rst,
              tarjetaRecibida,
              digitoSTB,
              montoSTB,
              tipoTrans,

  output reg  balanceActualizado,
              entregarDinero,
              fondosInsuficientes,
              pinIncorrecto,
              advertencia,
              alarmaBloqueo
);

// Parametros de estado.
localparam IDLE         = 6'b1;
localparam captDig      = 6'b10;
localparam verification = 6'b100;
localparam bloqueo      = 6'b1000;
localparam deposito     = 6'b10000;
localparam retiro       = 6'b100000;

// Registro internos:
reg [5:0]  state, nextState;               // Estados.
reg [2:0]  cntDigito, nextDigito;          // Digitos ingresados.
reg [2:0]  cntPinIncorr, nextCntPinIncorr; // Claves incorrectas.
reg [63:0] balance;        // Balance en la cuenta.
reg [15:0] pinIngresado;   // Registro para guardar el PIN ingresado.
reg [15:0] nextPin;        // Registro para guardar el PIN ingresado.

always @(posedge clk) begin // Lógica secuencial.
  if (!rst) begin
    // rst de valores de FF.
    state         <= IDLE;
    cntDigito     <= 2'b0;
    cntPinIncorr  <= 3'b0;
    pinIngresado  <= 16'b0;
    balance       <= 64'b0;
  end else begin
    // Transición de estados de FF.
    state         <= nextState;
    cntDigito     <= nextDigito;
    pinIngresado  <= nextPin;
    cntPinIncorr  <= nextCntPinIncorr;
  end
end

always @(*) begin   // Lógica combinacional.
  // Sosteniendo valores de FF.
  nextState         = state;
  nextDigito        = cntDigito;
  nextPin           = pinIngresado;
  nextCntPinIncorr  = cntPinIncorr;

  // Valores de salida por defecto.
  alarmaBloqueo       = 0;
  pinIncorrecto       = 0;
  advertencia         = 0;
  balanceActualizado  = 0;
  fondosInsuficientes = 0;
  entregarDinero      = 0;

  // Casos para cada estado.
  case(state)
    IDLE: begin
      if (tarjetaRecibida) nextState = captDig;
      // Se recibe el pinTarjeta.
    end
    captDig: begin
      // Se ingresan los dígitos.
      if (digitoSTB) begin
        nextPin = nextPin << 4;
        nextPin = nextPin + digito;
        nextState = verification;
        nextDigito = cntDigito + 1;
      end
    end
    verification: begin
      if (cntDigito == 3'b100) begin
          nextDigito = 0;
        if (pinTarjeta == pinIngresado) begin
          if (tipoTrans) nextState = retiro;
          else nextState = deposito;
        end else begin
          pinIncorrecto = 1;
          nextPin = 16'b0;
          nextCntPinIncorr = cntPinIncorr + 1;
          if (cntPinIncorr == 3'b1) advertencia = 1;
          if (cntPinIncorr == 3'b10) nextState = bloqueo;
        end
      end else begin
        nextState = captDig;
      end
    end
    bloqueo: begin
      alarmaBloqueo = 1;
    end
    deposito: begin
     if (!tarjetaRecibida) nextPin = 16'b0;
      if (montoSTB) begin
        balance = balanceInicial + monto;
        balanceActualizado = 1;
      end
    end
    retiro: begin
     if (!tarjetaRecibida) nextPin = 16'b0;
      if (montoSTB && monto < balanceInicial) begin
        balance = balanceInicial - monto;
        balanceActualizado = 1;
        entregarDinero = 1;
        fondosInsuficientes = 0;
      end else fondosInsuficientes = 1;
    end
    default: nextState = IDLE;
  endcase
end
endmodule
