# -------------------------------------------------------------------------------------------------------------------
# File : sim_counter_p.tcl
# Project : counter
# Description : IPFPGA Modelsim simulation example (with parameters).
#               This script is called from ipfpga and receive the parameter "1". This parameter is a list of 3
#               variables:
#                 index 0: the testbench entity name: tb_counter
#                 index 1: fn, it's a general parameter to control simulations.
#                 index 2: gui, switch between command line or gui simulation.
# -------------------------------------------------------------------------------------------------------------------
quietly set tb ""
quietly set fn ""
quietly set gui ""
if {[info exists 1]} {
    quietly set param_lst $1
}
set tb [lindex $param_lst 0]
set fn [lindex $param_lst 1]
set gui [lindex $param_lst 2]
puts "Counter Simulation: tb=$tb fn=$fn gui=$gui"
if {$gui == 1} {
    if {$fn == "s0"} {
        puts "Simulation s0"
        add wave -noupdate -divider {COUNTER}
        add wave -noupdate -format Logic /$tb/rst
        add wave -noupdate -format Logic /$tb/clk
        add wave -noupdate -format Logic /$tb/enable
        add wave -noupdate -format Literal -radix hexadecimal /$tb/q
    }
    if {$fn == "s1"} {
        puts "Simulation s1"
        add wave -noupdate -divider {COUNTER}
        add wave -noupdate -format Logic /$tb/u0/arst_i
        add wave -noupdate -format Logic /$tb/u0/clk_i
        add wave -noupdate -format Logic /$tb/u0/en_i
        add wave -noupdate -format Literal -radix hexadecimal /$tb/u0/q_o
    }
}
puts "Simulate for 5 us"
run 5 us
return 0
