read_verilog -container r -libname WORK hls_macc_nb.v
set_top r:/WORK/hls_macc_nb

read_verilog -container i -libname WORK wrappers/0/hls_macc_nb_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/hls_macc_nb_0_obf_key_0.v
set_top i:/WORK/hls_macc_nb

match

verify

exit

