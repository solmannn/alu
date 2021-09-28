read_verilog -container r -libname WORK top.v
set_top r:/WORK/top

read_verilog -container i -libname WORK wrappers/0/top_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/top_0_obf_key_0.v
set_top i:/WORK/top

match

verify

exit

