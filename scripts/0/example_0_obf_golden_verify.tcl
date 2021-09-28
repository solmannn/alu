read_verilog -container r -libname WORK example.v
set_top r:/WORK/example

read_verilog -container i -libname WORK wrappers/0/example_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/submodule_1_obf.v
read_verilog -container i -libname WORK hdl/submodule_2_obf.v
read_verilog -container i -libname WORK hdl/submodule_3_obf.v
read_verilog -container i -libname WORK hdl/example_0_obf.v
set_top i:/WORK/example

match

verify

exit

