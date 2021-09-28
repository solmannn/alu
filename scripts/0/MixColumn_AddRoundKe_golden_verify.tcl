read_verilog -container r -libname WORK MixColumn_AddRoundKe_key_0.v
set_top r:/WORK/MixColumn_AddRoundKe

read_verilog -container i -libname WORK wrappers/0/MixColumn_AddRoundKe_golden_wrap.v
read_verilog -container i -libname WORK MixColumn_AddRoundKe_key_0.v
set_top i:/WORK/MixColumn_AddRoundKe

match

verify

exit

