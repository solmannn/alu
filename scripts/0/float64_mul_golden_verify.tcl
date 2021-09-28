read_verilog -container r -libname WORK float64_mul_key_0.v
set_top r:/WORK/float64_mul

read_verilog -container i -libname WORK wrappers/0/float64_mul_golden_wrap.v
read_verilog -container i -libname WORK float64_mul_key_0.v
set_top i:/WORK/float64_mul

match

verify

exit

