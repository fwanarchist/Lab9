transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib lab9_soc
vmap lab9_soc lab9_soc
vlog -vlog01compat -work lab9_soc +incdir+D:/Projects/Lab9_Part2/Lab9/lab9_soc/synthesis/submodules {D:/Projects/Lab9_Part2/Lab9/lab9_soc/synthesis/submodules/lab9_soc_jtag_uart_0.v}
vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/SubBytes.sv}
vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/InvShiftRows.sv}
vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/InvMixColumns.sv}
vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/KeyExpansion.sv}
vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/AES.sv}

vlog -sv -work work +incdir+D:/Projects/Lab9_Part2/Lab9 {D:/Projects/Lab9_Part2/Lab9/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L lab9_soc -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 3000 ns
