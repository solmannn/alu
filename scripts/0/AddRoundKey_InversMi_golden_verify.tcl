read_verilog -container r -libname WORK AddRoundKey_InversMi_key_0.v
set_top r:/WORK/AddRoundKey_InversMi

read_verilog -container i -libname WORK wrappers/0/AddRoundKey_InversMi_golden_wrap.v
read_verilog -container i -libname WORK AddRoundKey_InversMi_key_0.v
set_top i:/WORK/AddRoundKey_InversMi

match

verify

exit

