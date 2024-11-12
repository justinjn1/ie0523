# Tarea principal
all: prueba12 prueba3 prueba4 prueba5

# Variables
YOSYS = yosys -s atm.ys
RM = rm -f

# Tareas PHONY
.PHONY: all prueba12 prueba3 prueba4 prueba5 clean

# Conductual prueba 1 y 2
prueba12: testbench_condP12.v
	iverilog testbench_condP12.v -o salida.exe && ./salida.exe
	gtkwave ondasP12.gtkw
	$(RM) salida.exe ondas.vcd

# Conductual prueba 3
prueba3: testbench_condP3.v
	iverilog testbench_condP3.v -o salida.exe && ./salida.exe
	gtkwave ondasP3.gtkw
	$(RM) salida.exe ondas.vcd

# Síntesis prueba 1 y 2
prueba4: $(TB_SYNTH)
	$(YOSYS) > yosys.txt
	iverilog testbench_synthP12.v -o salida.exe && ./salida.exe
	gtkwave ondasP12.gtkw
	$(RM) salida.exe ondas.vcd

# Síntesis prueba 3
prueba5: $(TB_SYNTH)
	$(YOSYS) > yosys.txt
	iverilog testbench_synthP3.v -o salida.exe && ./salida.exe
	gtkwave ondasP3.gtkw
	$(RM) salida.exe ondas.vcd
