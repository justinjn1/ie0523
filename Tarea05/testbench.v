`include "tester.v"
`include "main.v"
`include "subnode1.v"
`include "subnode2.v"

module testbench;
    initial begin
        $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
        $dumpvars;              // Por defecto agrega todas las instancias.
    end

    wire [7:0] data_main_CPU, data_node1_CPU, data_node2_CPU;
    wire MOSI, MISO;
    // wire [7:0] data_node2_CPU;

    // Instancias de los módulos:
    main UUT1 (
        // Inputs
        .data_main_CPU  (data_main_CPU),
        .clk            (clk),
        .rst            (rst),
        .start          (start),
        .MISO           (MISO_2),
        .CKP            (CKP),
        .CPH            (CPH),
        // Outputs
        .CS             (CS),
        .MOSI           (MOSI_master),
        .SCK            (SCK)
    );
    subnode1 UUT2 (
        // Inputs
        .data_node1_CPU (data_node1_CPU),
        .clk            (clk),
        .SCK            (SCK),
        .MOSI           (MOSI_master),
        .CS             (CS),
        .CKP            (CKP),
        .CPH            (CPH),
        // Ouputs
        .MISO           (MISO_1)
    );
    subnode2 UUT3 (
        // Inputs
        .data_node2_CPU (data_node2_CPU),
        .clk            (clk),
        .SCK            (SCK),
        .MOSI           (MISO_1),
        .CS             (CS),
        .CKP            (CKP),
        .CPH            (CPH),
        // Ouputs
        .MISO           (MISO_2)
    );
    tester TESTER (
        // Inputs
        .MOSI           (MOSI),
        .MISO           (MISO),
        .CS             (CS),
        .SCK            (SCK),
        // Outputs
        .data_main_CPU  (data_main_CPU),
        .data_node1_CPU (data_node1_CPU),
        .data_node2_CPU (data_node2_CPU),
        .clk            (clk),
        .rst            (rst),
        .start          (start),
        .CKP            (CKP),
        .CPH            (CPH)
    );
endmodule
