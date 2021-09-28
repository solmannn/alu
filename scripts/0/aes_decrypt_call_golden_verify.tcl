read_verilog -container r -libname WORK aes_decrypt_call.v
set_top r:/WORK/aes_decrypt_call

read_verilog -container i -libname WORK wrappers/0/aes_decrypt_call_golden_wrap.v
read_verilog -container i -libname WORK hdl2/aes_decrypt_call_key_0.v
set_top i:/WORK/aes_decrypt_call

match

verify

exit

