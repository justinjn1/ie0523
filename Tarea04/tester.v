module tester (
    // Outputs
    output reg clk, rst, RNW, STARD_STB, SDA_IN,
    output reg [6:0]  I2C_ADDR,
    output reg [15:0] WR_DATA,

    // Inputs
    input [15:0] RD_DATA,
    input SDA_OUT, SDA_OE, SCL
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
        rst = 0;
    #ciclo
        rst = 1;
    #20 $finish;
end
endmodule
