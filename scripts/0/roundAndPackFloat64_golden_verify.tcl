read_verilog -container r -libname WORK roundAndPackFloat64_key_0.v
set_top r:/WORK/roundAndPackFloat64

read_verilog -container i -libname WORK wrappers/0/roundAndPackFloat64_golden_wrap.v
read_verilog -container i -libname WORK roundAndPackFloat64_key_0.v
set_top i:/WORK/roundAndPackFloat64

match

verify

exit

