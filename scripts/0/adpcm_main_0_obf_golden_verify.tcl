read_verilog -container r -libname WORK adpcm_main.v
set_top r:/WORK/adpcm_main

read_verilog -container i -libname WORK wrappers/0/adpcm_main_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/adpcm_main_0_obf_key_0.v
set_top i:/WORK/adpcm_main

match

verify

exit

