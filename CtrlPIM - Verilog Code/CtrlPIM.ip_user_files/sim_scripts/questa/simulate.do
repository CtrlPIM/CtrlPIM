onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib tb_axis_v4_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tb_axis_v4.udo}

run -all

quit -force
