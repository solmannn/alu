read_verilog -container r -libname WORK backprop.v
set_top r:/WORK/backprop

read_verilog -container i -libname WORK wrappers/0/backprop_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/backprop_0_obf_key_0.v
set_top i:/WORK/backprop

match

verify

exit

