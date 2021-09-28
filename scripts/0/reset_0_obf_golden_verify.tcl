read_verilog -container r -libname WORK reset.v
set_top r:/WORK/reset

read_verilog -container i -libname WORK wrappers/0/reset_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/reset_0_obf_key_0.v
set_top i:/WORK/reset

match

verify

exit

