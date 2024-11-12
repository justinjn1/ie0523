all: p1 p2

p1: 
	iverilog testbench_me.v -o salida1.exe
	./salida1.exe
	gtkwave ondas.gtkw
	rm salida1.exe &
	rm ondas.vcd


p2:
	iverilog testbench_me.v -o salida2.exe
	./salida2.exe
	gtkwave ondas.gtkw
	rm salida2.exe &
	rm ondas.vcd
