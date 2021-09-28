read_verilog -container r -libname WORK alu.v
set_top r:/WORK/alu

read_verilog -container i -libname WORK wrappers/0/alu_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl/alu_0_obf.v
set_top i:/WORK/alu

match

verify

exit

