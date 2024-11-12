module mmd (
    output [1:0]  ST, OP,
    output [4:0]  PHYADDR, REGADDR,
    output [15:0] WR_DATA,
    output reg mdio_in, 

    input rst,
    input mdc,
    input [15:0] RD_DATA,
    input mdio_oe, mdio_out
);

localparam ENVIAR_DATOS = 3'b01;
localparam RECIBIR_DATOS = 3'b10;
localparam INICIO = 3'b100;

wire lectura, bit_16, fin_transaccion, posedge_MDC;
reg mdc_d; // mdc_delay
reg [2:0] state, next_state;
reg [4:0] cnt_bits, next_cnt_bits;
reg [31:0] transaccion_mdio;
wire PHY_ADDR_CORRECTO;
wire [1:0] TA;

assign {ST, OP, PHYADDR, REGADDR, TA, WR_DATA} = transaccion_mdio;
assign lectura = (OP == 2'b10);
assign bit_16 = (cnt_bits == 16);
assign fin_transaccion = (cnt_bits == 31);
assign WR_DATA = PHY_ADDR_CORRECTO ? transaccion_mdio[15:0] : 16'b0;


always @(posedge mdc) begin
  if (!rst) begin
    cnt_bits <= 0;
    state   <= INICIO;
  end else begin
    state   <= next_state;
    cnt_bits <= next_cnt_bits;
  end
end

always @(*) begin
  next_state = state;
  next_cnt_bits = cnt_bits;

  case (state)
    INICIO: begin
      next_cnt_bits = 0;
      if (mdio_oe) next_state = RECIBIR_DATOS;
    end
    ENVIAR_DATOS: begin
      next_cnt_bits = cnt_bits+1;
      if (fin_transaccion) next_state = INICIO;
      mdio_in = RD_DATA[31-cnt_bits]; // Paralelo-Serie
    end
    RECIBIR_DATOS: begin
      next_cnt_bits = cnt_bits+1;
      transaccion_mdio[31-cnt_bits] = mdio_out && mdio_oe;
      if (bit_16 && lectura && PHY_ADDR_CORRECTO) next_state = ENVIAR_DATOS;
      if (fin_transaccion) next_state = INICIO;
    end
    default: next_state = INICIO;
  endcase
end
endmodule
