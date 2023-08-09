onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib FIFO_Out_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {FIFO_Out.udo}

run -all

quit -force
