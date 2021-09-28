read_verilog -container r -libname WORK add.v
set_top r:/WORK/add

read_verilog -container i -libname WORK wrappers/0/add_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/add_0_obf_key_0.v
set_top i:/WORK/add

match

verify

exit

