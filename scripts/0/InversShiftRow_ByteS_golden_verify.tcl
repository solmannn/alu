read_verilog -container r -libname WORK InversShiftRow_ByteS.v
set_top r:/WORK/InversShiftRow_ByteS

read_verilog -container i -libname WORK wrappers/0/InversShiftRow_ByteS_golden_wrap.v
read_verilog -container i -libname WORK hdl2/InversShiftRow_ByteS_key_0.v
set_top i:/WORK/InversShiftRow_ByteS

match

verify

exit

