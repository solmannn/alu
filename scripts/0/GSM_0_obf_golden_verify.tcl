read_verilog -container r -libname WORK GSM.v
set_top r:/WORK/GSM

read_verilog -container i -libname WORK wrappers/0/GSM_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/GSM_0_obf_key_0.v
set_top i:/WORK/GSM

match

verify

exit

