# Temporary simulation file for running the experiments
# Do not edit
# Really... there is no point in doing that

vlib work

# Include RTL files and compile them
vcom ../../Baseline_Packages/router_pack.vhd
vcom ../../Baseline_RTL/base_line/arbiter_in.vhd
vcom ../../Baseline_RTL/base_line/arbiter_out.vhd
vcom ../../Baseline_RTL/base_line/allocator.vhd
vcom ../../Baseline_RTL/base_line/LBDR.vhd
vcom ../../Baseline_RTL/base_line/xbar.vhd
vcom ../../Baseline_RTL/base_line/NI.vhd
vcom ../../Baseline_RTL/base_line/FIFO_one_hot_credit_based.vhd
vcom ../../Baseline_RTL/base_line/Router_32_bit_credit_based.vhd
vcom ../../Baseline_Packages/TB_Package_32_bit_credit_based_NI.vhd
vcom ../../Baseline_RTL/network_4x4_credit_based.vhd

# Testbench
vcom ../../experiments/TB_vhdl/network_4x4_Rand_credit_based_150_tb.vhd

# Start the simulation
vsim work.tb_network_4x4 -suppress 8780

# Fault injection
do ../../experiments/FI/FI_20ns/fault_inject_600k.do

run 100000 ns

quit -f
