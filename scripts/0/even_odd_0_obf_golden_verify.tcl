read_verilog -container r -libname WORK even_odd.v
set_top r:/WORK/even_odd

read_verilog -container i -libname WORK wrappers/0/even_odd_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/even_odd_0_obf.v
set_top i:/WORK/even_odd

match

verify

exit

