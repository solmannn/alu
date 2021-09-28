read_verilog -container r -libname WORK calculationofkeys.v
set_top r:/WORK/calculationofkeys

read_verilog -container i -libname WORK wrappers/0/calculationofkeys_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/calculationofkeys_0_obf_key_1.v
set_top i:/WORK/calculationofkeys

match

verify

exit

