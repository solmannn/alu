read_verilog -container r -libname WORK grades.v
set_top r:/WORK/grade

read_verilog -container i -libname WORK wrappers/0/grade_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/grade_0_obf.v
set_top i:/WORK/grade

match

verify

exit

