read_verilog -container r -libname WORK verilog1.v
set_top r:/WORK/calculate_1

read_verilog -container i -libname WORK wrappers/0/calculate_1_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/calculate_1_0_obf.v
set_top i:/WORK/calculate_1

match

verify

exit

