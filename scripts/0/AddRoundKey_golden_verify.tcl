read_verilog -container r -libname WORK AddRoundKey.v
set_top r:/WORK/AddRoundKey

read_verilog -container i -libname WORK wrappers/0/AddRoundKey_golden_wrap.v
read_verilog -container i -libname WORK hdl2/AddRoundKey_key_0.v
set_top i:/WORK/AddRoundKey

match

verify

exit

