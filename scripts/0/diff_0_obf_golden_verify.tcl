read_verilog -container r -libname WORK diierential.v
set_top r:/WORK/diff

read_verilog -container i -libname WORK wrappers/0/diff_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/diff_0_obf_key_0.v
set_top i:/WORK/diff

match

verify

exit

