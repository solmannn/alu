read_verilog -container r -libname WORK top_function.v
set_top r:/WORK/top_function

read_verilog -container i -libname WORK wrappers/0/top_function_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/top_function_0_obf_key_1.v
set_top i:/WORK/top_function

match

verify

exit

