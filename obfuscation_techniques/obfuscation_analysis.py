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


def is_reset(item):
    if type(item) is vast.Identifier:
        if item.name.find("reset") != -1 or item.name.find("rst") != -1:
            return True
    elif type(item) is vast.LessThan or type(item) is vast.Eq or type(item) is vast.Xor or type(
            item) is vast.And or type(item) is vast.Or:
        if is_reset(item.left) or is_reset(item.right):
            return True
    elif type(item) is vast.Pointer:
        if is_reset(item.var):
            return True
    elif type(item) is vast.IntConst:
        return False
    elif type(item) is vast.Cond:
        return False
    else:
        raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet")
    return False


def determine_signal_size(top_output, item):
    print("determine_signal_size")
    #print(print(top_output.definitions))
    item_name = ""
    if type(item) is vast.Identifier:
        item_name = item.name
    elif type(item) is vast.Lvalue:
        item.show()
        print(str(type(item.var)))
        if type(item.var) is vast.Pointer:
            item_name = item.var.var.name
        else:
            item_name = item.var.name
    elif type(item) is vast.Pointer:
        return 1
    elif type(item) is vast.Partselect:
        if type(item.var) is vast.Pointer:
            item_name = item.var.var.name
        else:
            item_name = item.var.name
    else:
        raise Exception("Name: \"" + str(type(item)) + "\" is not supported yet")

    size = -1
    print(item_name)
    #print("top_outdef")
    #print(top_output.definitions)
    for decl in top_output.definitions:
        if type(decl) is vast.Parameter:
            size = 32
        elif type(decl) is vast.Decl:
            #print("determine_signal_size decl")
            for it in decl.list:
                #print("determine_signal_size list")
                if it.name == item_name:
                    #print(item_name)
                    if it.width is None:
                        size = 1
                    else:
                        if type(it.width.msb) == vast.IntConst and type(it.width.msb) == vast.IntConst:
                            #print(int(it.width.msb.value))
                            #print(int(it.width.lsb.value))
                            size = int(it.width.msb.value) + 1 - int(it.width.lsb.value)
                        else:
                            size = -1
        elif type(decl) is vast.Reg:
            #print("determine_signal_size reg")
            if decl.name == item_name:
                if decl.width is None:
                    size = 1
                else:
                    if type(decl.width.msb) == vast.IntConst and type(decl.width.msb) == vast.IntConst:
                        size = int(decl.width.msb.value) + 1 - int(decl.width.lsb.value)
                    else:
                        size = -1
        elif type(decl) is vast.Wire:
            #print("determine_signal_size wire")
            if decl.name == item_name:
                if decl.width is None:
                    size = 1
                else:
                    if type(decl.width.msb) == vast.IntConst and type(decl.width.msb) == vast.IntConst:
                        size = int(decl.width.msb.value) + 1 - int(decl.width.lsb.value)
                    else:
                        size = -1
        elif type(decl) is vast.Integer:
            if decl.name == item_name:
                size == 32
        elif type(decl) is vast.Pointer:
            if decl.var.name == item_name:
                size = 1
        elif type(decl) is vast.RegArray:
            if decl.name == item_name:
                if type(decl.width.msb) == vast.IntConst and type(decl.width.msb) == vast.IntConst and type(
                        decl.length.msb) == vast.IntConst and type(decl.length.msb) == vast.IntConst:
                    size = (int(decl.width.msb.value) + 1 - int(decl.width.lsb.value)) * (
                                int(decl.length.msb.value) + 1 - int(decl.length.lsb.value))
                else:
                    size = -1
        elif type(decl) is vast.WireArray:
            if decl.name == item_name:
                if type(decl.width.msb) == vast.IntConst and type(decl.width.msb) == vast.IntConst and type(
                        decl.length.msb) == vast.IntConst and type(decl.length.msb) == vast.IntConst:
                    size = (int(decl.width.msb.value) + 1 - int(decl.width.lsb.value)) * (
                                int(decl.length.msb.value) + 1 - int(decl.length.lsb.value))
                else:
                    size = -1
        elif type(decl) is vast.Partselect:
            if decl.name == item_name:
                if type(decl.msb) == vast.IntConst and type(decl.lsb) == vast.IntConst:
                    size = (int(decl.msb.value) + 1 - int(decl.lsb.value))
                else:
                    size = -1
        elif type(decl) is vast.Assign:
            print("analysis assign")
            return -1
        else:
            decl.show()
            raise Exception("Type: \"" + str(type(decl)) + "\" is not supported yet")
    return size
