read_verilog -container r -libname WORK even_odd.v
set_top r:/WORK/calculate

read_verilog -container i -libname WORK wrappers/0/calculate_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/calculate_0_obf.v
set_top i:/WORK/calculate

match

verify

exit

