// `include "gatemanager.v"
`include "tester.v"
`include "cmos_cells.v"
`include "gate_synth.v"
// `include "gatemanager_techmap.v"

module testbench;

    initial begin
	    $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
	    $dumpvars;              // Por defecto agrega todas las instancias.
    end

    wire [15:0] pass;
    wire [15:0] rghtpss;

    // Instancias de los módulos:
    gatemanager UUT1 (
        .clk(clk),
        .rst(rst),
        .s01(s01),
        .s02(s02),
        .pass(pass),
        .rghtpss(rghtpss),
        .wrong_pin_alarm(wrong_pin_alarm),
        .gate(gate),
        .lock_alarm(lock_alarm)
    );
    // defparam UUT1.rghtpss = 16'h4037;

    tester TESTER (
        .clk(clk),
        .rst(rst),
        .s01(s01),
        .s02(s02),
        .pass(pass),
        .rghtpss(rghtpss),
        .wrong_pin_alarm(wrong_pin_alarm),
        .gate(gate),
        .lock_alarm(lock_alarm)
    );
endmodule
