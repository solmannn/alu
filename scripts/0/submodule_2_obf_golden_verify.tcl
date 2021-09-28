read_verilog -container r -libname WORK example.v
set_top r:/WORK/submodule

read_verilog -container i -libname WORK wrappers/0/submodule_2_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/submodule_2_obf.v
set_top i:/WORK/submodule

match

verify

exit

