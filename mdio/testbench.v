`include "sta.v"
`include "mmd.v"

module testbench ();

  initial begin
    $dumpfile("ondas.vcd"); // Nombre del vcd del archivo de salida.
    $dumpvars;              // Por defecto agrega todas las instancias.
  end

  wire mdc, mdio_in;
  reg clk, rst, start_stb;

  reg [1:0]  ST, OP;
  reg [4:0]  PHYADDR, REGADDR;
  reg [15:0] WR_DATA;
  reg [15:0] RD_DATA;


  // UUT: Unit Under Test
  // Instancias de los módulos:
  sta UUT1 (
    .clk(clk),
    .rst(rst),
    .mdc(mdc),
    .mdio_in(mdio_in),
    .mdio_out(mdio_out),
    .mdio_oe(mdio_oe),
    .start_stb(start_stb),
    .ST(ST),
    .OP(OP),
    .PHYADDR(PHYADDR),
    .REGADDR(REGADDR),
    .WR_DATA(WR_DATA),
    .RD_DATA()
  );

  mmd UUT2 (
    .rst(rst),
    .mdc(mdc),
    .mdio_in(mdio_in),
    .mdio_out(mdio_out),
    .mdio_oe(mdio_oe),
    .ST(),
    .OP(),
    .PHYADDR(),
    .REGADDR(),
    .WR_DATA(),
    .RD_DATA(RD_DATA)
  );


  initial begin
    clk = 0;
    rst = 0;
    ST = 2'b01;
    OP = 2'b01;   // Escritura
    PHYADDR = 5'b01110;
    REGADDR = 5'b01101;
    WR_DATA = 16'h3f7f;
    RD_DATA = 16'h4534;
    #100 rst = 1;
        start_stb = 1;
    #10 start_stb = 0;
    #1280
          OP = 2'b10;   // Lectura
          start_stb = 1;
    #10   start_stb = 0;
    #640
    #2000 $finish;
  end

  always begin
    #5 clk =  !clk;
  end

endmodule
