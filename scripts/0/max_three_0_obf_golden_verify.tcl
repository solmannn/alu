read_verilog -container r -libname WORK max_three.v
set_top r:/WORK/max_three

read_verilog -container i -libname WORK wrappers/0/max_three_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/max_three_0_obf.v
set_top i:/WORK/max_three

match

verify

exit

