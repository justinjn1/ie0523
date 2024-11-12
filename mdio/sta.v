module sta (
  input [1:0]  ST, OP,
  input [4:0]  PHYADDR, REGADDR,
  input [15:0] WR_DATA,
  input clk, rst, mdio_in, start_stb, 
              // TD no se agrega porque es un tiempo 
              // que se espera a que responda el otro lado
  output mdc,
  output reg [15:0] RD_DATA,
  output reg mdio_oe, mdio_out
);

localparam ENVIAR_DATOS = 3'b01;
localparam RECIBIR_DATOS = 3'b10;
localparam INICIO = 3'b100;

wire lectura, bit_16, fin_transaccion, posedge_MDC;
reg mdc_d, fin_transaccion_d; // mdc_delay
reg [1:0] cnt_clk, next_cnt_clk;
reg [2:0] state, next_state;
reg [4:0] cnt_bits, next_cnt_bits;
wire [31:0] transaccion_mdio;

assign transaccion_mdio = {ST, OP, PHYADDR, REGADDR, 2'b00, WR_DATA};
assign lectura = (OP == 2'b10);
assign bit_16 = (cnt_bits == 16);
assign fin_transaccion = (cnt_bits == 31);
assign posedge_MDC = !mdc_d && mdc; // Así se detecta un flanco positivo

always @(posedge clk) begin
  if (!rst) begin
    state   <= INICIO;
    cnt_clk <= 0;
    cnt_bits <= 0;
    mdc_d <= 0;
    // fin_transaccion_d <= 0;
  end else begin
    state   <= next_state;
    cnt_clk <= next_cnt_clk;
    cnt_bits <= next_cnt_bits;
    mdc_d <= mdc;
    // fin_transaccion_d <= fin_transaccion;
  end
end

always @(posedge mdc) fin_transaccion_d <= fin_transaccion;

always @(*) begin
  next_cnt_clk = cnt_clk+1; // Para el reloj
  next_state = state;
  next_cnt_bits = cnt_bits;

  case (state)
    INICIO: begin
      next_cnt_bits = 0;
      mdio_oe = 0;
      if (start_stb) next_state = ENVIAR_DATOS;
    end
    ENVIAR_DATOS: begin
      mdio_oe = 1;
      if (posedge_MDC) next_cnt_bits = cnt_bits + 1; //FIXME: Caso de no contar
      if (lectura && bit_16) next_state = RECIBIR_DATOS;
      if (fin_transaccion_d) next_state = INICIO;
      mdio_out = transaccion_mdio[31-cnt_bits]; // Paralelo-Serie
    end
    RECIBIR_DATOS: begin
      mdio_oe = 0;
      if (posedge_MDC) next_cnt_bits = cnt_bits + 1;
      if (fin_transaccion_d) next_cnt_bits = INICIO;
      RD_DATA[31-cnt_bits] = mdio_in; // Serie-Paralelo
      // $display("Valor de RD_DATA[%0d]: %b", 31 - cnt_bits, RD_DATA[31 - cnt_bits]);
    end
    default: next_state = INICIO;
  endcase
end

// El relog de salida será el MSB del contador, 
// para una frecuencia del 25%.
assign mdc = cnt_clk[1];
// assign mdc = start_stb ? cnt_clk[1] : 1'b1;

endmodule
