# Temporary simulation file for running the experiments
# Do not edit
# Really... there is no point in doing that

vlib work

# Include RTL files and compile them
vcom ../../ReUSE_Packages/router_pack.vhd
vcom ../../ReUSE_RTL/arbiter_in.vhd
vcom ../../ReUSE_RTL/arbiter_out.vhd
vcom ../../ReUSE_RTL/allocator.vhd
vcom ../../ReUSE_RTL/LBDR.vhd
vcom ../../ReUSE_RTL/xbar.vhd
vcom ../../ReUSE_RTL/NI.vhd
vcom ../../ReUSE_RTL/FIFO_one_hot_credit_based.vhd
vcom ../../ReUSE_RTL/Router_32_bit_credit_based.vhd
vcom ../../ReUSE_Packages/TB_Package_32_bit_credit_based_NI.vhd
vcom ../../ReUSE_RTL/network_4x4_credit_based.vhd

# Testbench
vcom ../../experiments/TB_vhdl/network_4x4_Rand_credit_based_450_tb.vhd

# Start the simulation
vsim work.tb_network_4x4 -suppress 8780

# Fault injection
do ../../experiments/FI/FI_1ns_large/fault_inject_10M.do

run 100000 ns

quit -f
