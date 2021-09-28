read_verilog -container r -libname WORK sum_array.v
set_top r:/WORK/sum_array

read_verilog -container i -libname WORK wrappers/0/sum_array_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/sum_array_0_obf_key_1.v
set_top i:/WORK/sum_array

match

verify

exit

