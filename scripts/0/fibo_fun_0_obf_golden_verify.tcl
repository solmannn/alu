read_verilog -container r -libname WORK fibo.v
set_top r:/WORK/fibo_fun

read_verilog -container i -libname WORK wrappers/0/fibo_fun_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/fibo_fun_0_obf_key_0.v
set_top i:/WORK/fibo_fun

match

verify

exit

