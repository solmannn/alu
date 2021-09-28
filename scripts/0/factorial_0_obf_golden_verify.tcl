read_verilog -container r -libname WORK factorial.v
set_top r:/WORK/factorial

read_verilog -container i -libname WORK wrappers/0/factorial_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/factorial_0_obf_key_0.v
set_top i:/WORK/factorial

match

verify

exit

