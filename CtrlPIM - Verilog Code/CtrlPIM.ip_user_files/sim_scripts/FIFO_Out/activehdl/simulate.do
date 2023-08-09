onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+FIFO_Out -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FIFO_Out xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {FIFO_Out.udo}

run -all

endsim

quit -force
