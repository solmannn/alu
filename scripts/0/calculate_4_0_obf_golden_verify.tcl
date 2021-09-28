read_verilog -container r -libname WORK verilog4.v
set_top r:/WORK/calculate_4

read_verilog -container i -libname WORK wrappers/0/calculate_4_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/calculate_4_0_obf.v
set_top i:/WORK/calculate_4

match

verify

exit

