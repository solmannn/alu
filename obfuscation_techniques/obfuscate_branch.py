# -------------------------------------------------------------------------------
# Copyright 2018-2020, Christian Pilato <christian.pilato@polimi.it>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -------------------------------------------------------------------------------
import pyverilog.vparser.ast as vast


def apply(item, is_false, cfg, res,list_working_key,user_key):
    #print("in apply branch")
    if not cfg.obfuscate_branch or not cfg.obfuscate_region:
        #print("here1")
        return item, False
    if not cfg.unfold_key:
        #print("here2")
        if (len(cfg.working_key) + 1) > len(cfg.input_key):
            return item, False
    #print(len(cfg.working_key))
    #print(len(cfg.input_key))

    pos = (len(cfg.working_key)) % len(cfg.input_key)
    #print("pos")
    #print(pos)
    #print(cfg.input_key)
    #print(type(cfg.input_key[pos]))
    #x=0
    #print("cfg.input_key[pos]")

    #while x<len(cfg.input_key):
        #print(cfg.input_key[x])
        #x=x+1
    #print("cfg.input_key[pos]")
    #print(type(pos))
    #print(cfg.input_key[pos])
    key = cfg.input_key[pos]

    #print("key")
    #print(key)
    to_switch = False
    value = '1\'b1'
    if key == '1':
        #print("key ==1")
        to_switch = True
        if not is_false:
            value = '1\'b0'

    #print(res.top_output.initial_working_key)
    #print(res.top_output.key_bits)
    key_index = vast.IntConst(str(res.top_output.initial_working_key + res.top_output.key_bits))
    #print("key_index")
    #print(key_index)
    
    if user_key == 1:
        #print("in if")
    #key_signal = vast.Pointer(vast.Identifier('working_key'), key_index)
        enc=list_working_key[res.top_output.initial_working_key + res.top_output.key_bits]
        #print(res.top_output.initial_working_key + res.top_output.key_bits)
        enc=str(enc)
        key_signal = vast.IntConst(str(1) + "\'b" + enc)
    else:
        #print("in else")
        key_signal = vast.Pointer(vast.Identifier('working_key'), key_index)

    item = vast.Eq(vast.Xor(item, key_signal), vast.IntConst(value))
    cfg.working_key += key
    #print(cfg.working_key)
    res.top_output.module_key += key
    res.top_output.key_bits += 1
    res.num_branches += 1
    return item, to_switch
