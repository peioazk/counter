# -------------------------------------------------------------------------------------------------------------------
# File : sim_counter.tcl
# Projec : counter
# Description : IPFPGA Modelsim simulation example.
#               This script is called from ipfpga and receive the parameter "1". This parameter is a list of 3
#               variables:
#                 index 0: the testbench entity name: tb_counter
#                 index 1: fn, it's a general parameter to control simulations.
#                 index 2: gui, switch between command line or gui simulation.
# -------------------------------------------------------------------------------------------------------------------
puts "Simulation Counter"
set tb tb_counter
add wave -noupdate -divider {COUNTER:tb}
add wave -noupdate -format Logic /$tb/rst
add wave -noupdate -format Logic /$tb/clk
add wave -noupdate -format Logic /$tb/enable
add wave -noupdate -format Literal -radix hexadecimal /$tb/q
#
puts "Simulate for 5 us"
run 5 us
return 0
