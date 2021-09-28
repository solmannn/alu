read_verilog -container r -libname WORK encode.v
set_top r:/WORK/encode

read_verilog -container i -libname WORK wrappers/0/encode_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/encode_0_obf_key_0.v
set_top i:/WORK/encode

match

verify

exit

