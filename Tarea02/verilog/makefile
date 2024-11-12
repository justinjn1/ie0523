# Variables
YOSYS = yosys -s gatemanager.ys
IVERILOG = iverilog
SIM_EXEC = salida.exe
WAVE_FILE = ondas.vcd
GTK_WAVE = gtkwave ondas.gtkw
RM = rm -f

# Archivos de prueba
TB_COND = testbench_cond.v
TB_RTLIL = testbench_RTLIL.v
TB_SYNTH = testbench_synth.v
TB_DELAY = testbench_synth_delay.v

# Tareas PHONY
.PHONY: all prueba1 prueba2 prueba3 prueba4 clean

# Tarea principal
all: prueba1 prueba2 prueba3 prueba4

# Conductual
prueba1: $(TB_COND)
	$(YOSYS) && $(IVERILOG) $(TB_COND) -o $(SIM_EXEC) && ./$(SIM_EXEC) && $(GTK_WAVE)
	$(RM) $(SIM_EXEC) $(WAVE_FILE)

# RTLIL
prueba2: $(TB_RTLIL)
	$(YOSYS) && $(IVERILOG) $(TB_RTLIL) -o $(SIM_EXEC) && ./$(SIM_EXEC) && $(GTK_WAVE)
	$(RM) $(SIM_EXEC) $(WAVE_FILE)

# Síntesis completa
prueba3: $(TB_SYNTH)
	$(YOSYS) && $(IVERILOG) $(TB_SYNTH) -o $(SIM_EXEC) && ./$(SIM_EXEC) && $(GTK_WAVE)
	$(RM) $(SIM_EXEC) $(WAVE_FILE)

# Síntesis completa con retardo
prueba4: $(TB_DELAY)
	$(YOSYS) && $(IVERILOG) $(TB_DELAY) -o $(SIM_EXEC) && ./$(SIM_EXEC) && $(GTK_WAVE)
	$(RM) $(SIM_EXEC) $(WAVE_FILE)

# Limpieza
clean:
	$(RM) $(SIM_EXEC) $(WAVE_FILE)
