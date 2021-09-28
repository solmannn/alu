read_verilog -container r -libname WORK shiftingcidi.v
set_top r:/WORK/shiftingcidi

read_verilog -container i -libname WORK wrappers/0/shiftingcidi_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/shiftingcidi_0_obf_key_1.v
set_top i:/WORK/shiftingcidi

match

verify

exit

