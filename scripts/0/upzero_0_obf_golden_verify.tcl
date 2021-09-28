read_verilog -container r -libname WORK upzero.v
set_top r:/WORK/upzero

read_verilog -container i -libname WORK wrappers/0/upzero_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/upzero_0_obf_key_0.v
set_top i:/WORK/upzero

match

verify

exit

