read_verilog -container r -libname WORK check_key_0.v
set_top r:/WORK/check

read_verilog -container i -libname WORK wrappers/0/check_golden_wrap.v
read_verilog -container i -libname WORK check_key_0.v
set_top i:/WORK/check

match

verify

exit

