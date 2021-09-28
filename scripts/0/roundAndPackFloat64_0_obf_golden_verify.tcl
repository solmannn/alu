read_verilog -container r -libname WORK roundAndPackFloat64.v
set_top r:/WORK/roundAndPackFloat64

read_verilog -container i -libname WORK wrappers/0/roundAndPackFloat64_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/roundAndPackFloat64_0_obf_key_0.v
set_top i:/WORK/roundAndPackFloat64

match

verify

exit

