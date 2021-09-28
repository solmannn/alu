read_verilog -container r -libname WORK multiply.v
set_top r:/WORK/mul

read_verilog -container i -libname WORK wrappers/0/mul_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/mul_0_obf.v
set_top i:/WORK/mul

match

verify

exit

