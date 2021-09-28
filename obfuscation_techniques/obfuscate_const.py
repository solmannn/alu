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

def encrypt_value(value, start_kb, cfg):
    #print("encrypt")
    ikey = []
    #print(start_kb)
    #print(start_kb+len(value))
    #print(len(cfg.input_key))

    for k in range(start_kb,start_kb+len(value)):
        #print("value of k")
        #print(k)

        pos = k % len(cfg.input_key)
        #print(type(pos))
        #print("value of pos")
        #print(pos)
        #print("value of pos")
        #print(cfg.input_key)
        #print(cfg.input_key[1])
        #print(cfg.input_key[pos])


        ikey.append(int(cfg.input_key[pos]))


    #print("hello2")
    val = []
    rvalue = value[len(value)::-1]
    for k in range(0, len(value)):
        val.append(int(rvalue[k]))
    rresult = []
    for k in range(0,len(value)):
        rresult.append(ikey[k] ^ val[k])
    result = rresult[len(rresult)::-1]
    res = ""
    for k in range(0,len(result)):
        res += str(result[k])
    key_str = ""
    for k in range(0,len(ikey)):
        key_str += str(ikey[k])
    return [res, key_str]


def is_const(item):
    if item.value.find("'") == -1:
        try:
            val = int(item.value)
            return True
        except ValueError:
            raise Exception("Malformed constant")
    if item.value.find("x") != -1:
        return False
    if item.value.find("X") != -1:
        return False
    return True


def get_const_size(item):
    if item.value.find("'") == -1:
        return -1
    return int(item.value[:item.value.find("'")])

def binaryToDecimal(n):
    return int(n,2)

def apply(item, cfg, res, sig_size,list_working_key,user_key,total_constant,set):
    print("in const apply")
    print(item)
    #print(key_value)
    #print(type(key_value))
    #print("in apply")
    #print(item)
    #print(sig_size)

    if is_const(item) == False:
        #print("is_const")
        return item
    if sig_size > 0:
        size = sig_size
    else:
        size = get_const_size(item)
        if size == -1:
            return item
    if cfg.obfuscate_consts == -1 or size < cfg.obfuscate_consts or not cfg.obfuscate_region:
        #print("second")
        return item

    signed = False
    trimmed = None
    const_type = None
    #print(item.value)
    if item.value.find("'sb") != -1:
        trimmed = item.value[item.value.find("sb")+2:]
        const_type = "sb"
        signed = True
    elif item.value.find("'b") != -1:
        const_type = "b"
        trimmed = item.value[item.value.find("b")+1:]
    elif item.value.find("'d") != -1:
        #print("decimal")
        const_type = "d"
        #print(item.value[item.value.find("d")+1:])
        trimmed = item.value[item.value.find("d")+1:]
        #print(item.value[item.value.find("d")+1:])
    elif item.value.find("'h") != -1:
        const_type = "d"
        trimmed = item.value[item.value.find("h")+1:]
        trimmed = str(int(trimmed, 16))
    else:
        const_type = "d"
        trimmed = item.value;

    #print("length trimmed")
    #print(len(trimmed))
    #print("int trimmed")
    #print(int(trimmed))
    if (const_type == "b" or const_type == "sb") and len(trimmed) != size and int(trimmed) != 0:
        item.show()
        #raise Exception("Malformed constant")
    if (const_type == "b" or const_type == "sb") and len(trimmed) == 1 and int(trimmed) == 0:
        trimmed = "0" * size

    if const_type == "d":
        current = int(trimmed)
        trimmed = bin(current)[2:]
        #print(current)
        #print(trimmed)

        extra_bits = size - len(trimmed)
        #print(extra_bits)
        if extra_bits > 0:
            if current >= 0:
                trimmed = extra_bits * "0" + trimmed
                #print(trimmed)
            else:
                trimmed = extra_bits * "1" + trimmed

    #print("len working key")
    #print(len(cfg.working_key))
    #print((len(cfg.working_key)+size))
    #print(len(cfg.input_key))
    if cfg.unfold_key == False and ((len(cfg.working_key)+size) > len(cfg.input_key)):
        #print("end")
        return item
    '''
    name=input("enter the constant name")
    name = "Const_" + name #str(res.num_consts+total_constant)
    '''
    #print(name)
    name = "Const_" + str(res.num_consts)
    sig = vast.Identifier(name)
    #total_size=int(input("enter the size"))
    if size>1:
        #name=input("enter the constant name")
        #name = "Const_" + name #str(res.num_consts+total_constant)
        #sig = vast.Identifier(name)
        width = vast.Width( vast.IntConst(str(size-1)), vast.IntConst('0') )
        res.top_output.definitions += (vast.Wire(name, width, signed),)
    else:
        #name=input("enter the constant name")
        #name = "Const_" + name
        #sig = vast.Identifier(name)
        res.top_output.definitions += (vast.Wire(name),)

    #print(res.top_output.initial_working_key)
    #print(res.top_output.key_bits)
    current_bit_start = res.top_output.initial_working_key + res.top_output.key_bits
    #print("current_bit_start")
    #print(current_bit_start)
    enc, key_value = encrypt_value(trimmed, len(cfg.working_key), cfg)
    #enc=enc[::-1]
    result=binaryToDecimal(enc)
    enc=str(result)
    verilog = vast.IntConst(str(size) + "\'d" + enc)
    #print("we are here")

    if size==1:
        set[0]=set[0]+1
        #print("we are here 2")
        #print(type(1))
        if user_key == 1:
            #print("i m here in if size 1 key 1")
        #key_part = vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(current_bit_start)))
            result=list_working_key[current_bit_start]
            enc=str(result)
            key_part = vast.IntConst(str(size) + "\'d" + enc)
        else:
            #print("i m here in else size 1")
            key_part = vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(current_bit_start)))
    

    else:
        #print("we are here 3")
        set[0]=set[0]+1
        if user_key == 1:
            #print("i m here2")
            #print("i m here in if size >1")
            i=current_bit_start
            string1=""
            while i<=current_bit_start+size-1:
                string1=string1+str(list_working_key[i])
                i=i+1
            #print(string1)
            string1=string1[::-1]
            result=binaryToDecimal(string1)
            enc=str(result)
            key_part = vast.IntConst(str(size) + "\'d" + enc)
        else:
            print("i m here in else size >1")
            key_part = vast.Partselect(vast.Identifier('working_key'), vast.IntConst(str(current_bit_start+size-1)), vast.IntConst(str(current_bit_start)))

        #key_part = vast.Partselect(vast.Identifier('working_key'), vast.IntConst(str(current_bit_start+size-1)), vast.IntConst(str(current_bit_start)))
   
    
    res.top_output.items += (vast.Assign(sig, vast.Xor(verilog, key_part)),)
    res.top_output.key_bits += size
    cfg.working_key += key_value #enc[len(enc)::-1]
    #print(cfg.working_key)
    res.top_output.module_key += key_value #enc[len(enc)::-1]
    res.num_consts += 1
    #print("sig")
    #print(sig)
    return sig
