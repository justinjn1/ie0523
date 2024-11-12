`include "tester.v"
`include "I2C.v"

module testbench;
    initial begin
        $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
        $dumpvars;              // Por defecto agrega todas las instancias.
    end

    wire [15:0] RD_DATA;

    // Instancias de los módulos:
    I2C UUT1 (
        // Inputs
        .clk                (clk),
        .rst                (rst),
        .RNW                (RNW),
        .STARD_STB          (STARD_STB),
        .SDA_IN             (SDA_IN),
        // Outputs
        .RD_DATA            (RD_DATA),
        .SDA_OUT            (SDA_OUT), 
        .SDA_OE             (SDA_OE), 
        .SCL                (SCL)
    );
    tester TESTER (
        // Inputs
        .RD_DATA            (RD_DATA),
        .SDA_OUT            (SDA_OUT), 
        .SDA_OE             (SDA_OE), 
        .SCL                (SCL),
        // Outputs
        .clk                (clk),
        .rst                (rst),
        .RNW                (RNW),
        .STARD_STB          (STARD_STB),
        .SDA_IN             (SDA_IN)
    );
endmodule
