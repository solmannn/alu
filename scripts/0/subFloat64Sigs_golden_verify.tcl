read_verilog -container r -libname WORK subFloat64Sigs_key_0.v
set_top r:/WORK/subFloat64Sigs

read_verilog -container i -libname WORK wrappers/0/subFloat64Sigs_golden_wrap.v
read_verilog -container i -libname WORK subFloat64Sigs_key_0.v
set_top i:/WORK/subFloat64Sigs

match

verify

exit

