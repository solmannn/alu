read_verilog -container r -libname WORK Gsm_LPC_Analysis.v
set_top r:/WORK/Gsm_LPC_Analysis

read_verilog -container i -libname WORK wrappers/0/Gsm_LPC_Analysis_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/Gsm_LPC_Analysis_0_obf_key_0.v
set_top i:/WORK/Gsm_LPC_Analysis

match

verify

exit

