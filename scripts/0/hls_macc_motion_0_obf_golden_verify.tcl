read_verilog -container r -libname WORK hls_macc_motion.v
set_top r:/WORK/hls_macc_motion

read_verilog -container i -libname WORK wrappers/0/hls_macc_motion_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/hls_macc_motion_0_obf_key_0.v
set_top i:/WORK/hls_macc_motion

match

verify

exit

