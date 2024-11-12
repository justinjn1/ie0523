#  Opciones para la ejecución de todas las pruebas.

Se presentan dos opciones, en la primera se hicieron modificaciones para que se puedan ejecutar todas las pruebas sin complicaciones. La segunda opción contiene todos los archivos originales, sin embargo, debe realizar las modificaciones que se indican para ejecutar todas las pruebas.

## Opción 1:
En la carpeta __B94037_instrucciones__ se crearon varios archivos __testbench.v__ para cada prueba, también se creó otro archivo __cmos_cells_delay.v__ para agregar el retardo a las compuertas. Y por último, se creó otro archivo __tester_delay.v__ para modificar el tiempo del relog.

### Comandos para ejecutar las pruebas:

| **Prueba**                             | **Comando**           |
|----------------------------------------|-----------------------|
| Conductual                             | `make prueba1`        |
| RTLIL                                  | `make prueba2`        |
| Síntesis completa                      | `make prueba3`        |
| Síntesis completa con retardo          | `make prueba4`        |


## Opción 2:
Para ejecutar todas las pruebas se deben modificar los códigos de los archivos de la carpeta __B94037__.

### Realice las siguientes modificaciones en el siguiente orden:

- __Prueba síntesis completa con retardo__: ejecutar make en la terminal.

- __Prueba síntesis completa sin retardo__: eliminar el retardo del archivo __cmos_cells.v__. Luego, en el archivo __tester.v__ eliminar la primera línea de código (`timescale 1ns / 1ps`), además, en los parámetros del CLOCK (`localparam semiCiclo = 10`) cambie el semiCiclo por 1 unidad de tiempo -> (`localparam semiCiclo = 1`) y finalmente ejecute make en la terminal.

- __Prueba RTLIL__: en el __testbench.v__ descomente el include __gatemanager_techmap.v__ y comente los demás include __excepto__ el __tester.v__.

- __Prueba conductual__: descomente el include __gatemanager.v__ y comente los demás include excepto el __tester.v__.
