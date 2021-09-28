read_verilog -container r -libname WORK findMajority.v
set_top r:/WORK/findMajority

read_verilog -container i -libname WORK wrappers/0/findMajority_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/findMajority_0_obf_key_1.v
set_top i:/WORK/findMajority

match

verify

exit

