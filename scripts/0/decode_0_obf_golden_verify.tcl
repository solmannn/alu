read_verilog -container r -libname WORK decode.v
set_top r:/WORK/decode

read_verilog -container i -libname WORK wrappers/0/decode_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/decode_0_obf_key_0.v
set_top i:/WORK/decode

match

verify

exit

