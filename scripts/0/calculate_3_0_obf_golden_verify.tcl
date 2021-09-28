read_verilog -container r -libname WORK verilog3.v
set_top r:/WORK/calculate_3

read_verilog -container i -libname WORK wrappers/0/calculate_3_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/calculate_3_0_obf.v
set_top i:/WORK/calculate_3

match

verify

exit

