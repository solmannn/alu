read_verilog -container r -libname WORK verilog2.v
set_top r:/WORK/calculate_2

read_verilog -container i -libname WORK wrappers/0/calculate_2_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/calculate_2_0_obf.v
set_top i:/WORK/calculate_2

match

verify

exit

