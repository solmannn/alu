read_verilog -container r -libname WORK sobel.v
set_top r:/WORK/sobel

read_verilog -container i -libname WORK wrappers/0/sobel_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/sobel_0_obf_key_0.v
set_top i:/WORK/sobel

match

verify

exit

