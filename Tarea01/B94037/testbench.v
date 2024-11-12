`include "gatemanager.v"
`include "tester.v"

module testbench;

    initial begin
	    $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
	    $dumpvars;              // Por defecto agrega todas las instancias.
    end

    wire [15:0] pass;

    // UUT: Unit Under Test
    // Instancias de los módulos:
    gatemanager #(.rghtpss(16'h4037)) UUT1 (
        .clk(clk),
        .rst(rst),
        .s01(s01),
        .s02(s02),
        .pass(pass),
        .wrong_pin_alarm(wrong_pin_alarm),
        .gate(gate),
        .lock_alarm(lock_alarm)
    );
    tester TESTER (
        .clk(clk),
        .rst(rst),
        .s01(s01),
        .s02(s02),
        .pass(pass),
        .wrong_pin_alarm(wrong_pin_alarm),
        .gate(gate),
        .lock_alarm(lock_alarm)
    );
endmodule
