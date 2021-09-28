read_verilog -container r -libname WORK viterbi.v
set_top r:/WORK/viterbi

read_verilog -container i -libname WORK wrappers/0/viterbi_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/viterbi_0_obf_key_0.v
set_top i:/WORK/viterbi

match

verify

exit

