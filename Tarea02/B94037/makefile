all:
	yosys -s gatemanager.ys
	iverilog testbench.v -o salida.exe
	./salida.exe
	gtkwave ondas.gtkw
	rm salida.exe &
	rm ondas.vcd
