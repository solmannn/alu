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
import random

def relational_alternative(item,left,right):
    alter_item=item
    while type(item) == type(alter_item):
        type_alter=random.randint(0,4)
        if type_alter==0:
            alter_item=vast.GreaterThan(left,right)
        elif type_alter==1:
            alter_item=vast.LessThan(left,right)
        elif type_alter==2:
            alter_item=vast.Eq(left,right)
        elif type_alter==3:
            alter_item=vast.Eql(left,right)
        elif type_alter==4:
            alter_item=vast.NotEq(left,right)
    return alter_item


def bitwise_alter(item,left,right):
    alter_item=item
    while type(item) == type(alter_item):
        type_alter=random.randint(0,4)
        if type_alter==0:
            alter_item=vast.Or(left,right)
        elif type_alter==1:
            alter_item=vast.And(left,right)
        elif type_alter==2:
            alter_item=vast.Xor(left,right)
        elif type_alter==3:
            alter_item=vast.Sll(left,right)
        elif type_alter==4:
            alter_item=vast.Srl(left,right)
    return alter_item


def arithmetic_alter(item,left,right):
    #type_alter=random.randint(0,4)
    alter_item=item
    while type(item) == type(alter_item):
        type_alter=random.randint(0,4)
        if type_alter==0:
            alter_item=vast.Plus(left,right)
        elif type_alter==1:
            alter_item=vast.Minus(left,right)
        elif type_alter==2:
            alter_item=vast.Times(left,right)
        elif type_alter==3:
            alter_item=vast.Sll(left,right)
        elif type_alter==4:
            alter_item=vast.Srl(left,right)
    return alter_item

        




def apply(item, cfg, res,apply_operation_obf,list_working_key,user_key):
    print("apply op")

    if apply_operation_obf==0:
        if not cfg.obfuscate_ops or not cfg.obfuscate_region:
            return item
        if not cfg.unfold_key and ((len(cfg.working_key)+1) > len(cfg.input_key)):
            return item
        pos = (len(cfg.working_key)) % len(cfg.input_key)
        key = cfg.input_key[pos]
        if type(item) is vast.Plus or type(item) is vast.Minus or type(item) is vast.Times:
            #alternative = vast.Minus(item.left, item.right)
            alternative= arithmetic_alter(item,item.left,item.right)
        #elif type(item) is vast.Minus:
            #alternative = vast.Plus(item.left, item.right)
        elif type(item) is vast.Or or type(item) is vast.And or type(item) is vast.Xor:
            #alternative=vast.And(item.left,item.right)
            alternative = bitwise_alter(item,item.left, item.right)
        #elif type(item) is vast.And:
            #alternative = vast.Or(item.left, item.right)
        #elif type(item) is vast.Times:
            #alternative = vast.Plus(item.left, item.right)
        elif type(item) is vast.Sll:
            alternative = vast.Srl(item.left, item.right)
        #elif type(item) is vast.Xor:
            #alternative = vast.Or(item.left, item.right)
        elif type(item) is vast.GreaterThan or type(item) is vast.Eq or type(item) is vast.NotEq or type(item) is vast.LessThan or type(item) is vast.Eql:
            alternative = relational_alternative(item,item.left , item.right)
            #alternative=vast.LessThan(item.left,item.right)
        #elif type(item) is vast.Eq:
            #alternative = vast.GreaterThan(item.left , item.right)
        #elif type(item) is vast.LessThan:
            #alternative = vast.GreaterThan(item.left , item.right)
        #elif type(item) is vast.Eql:
            #alternative = vast.GreaterThan(item.left,item.right)
        elif type(item) is vast.Srl:
            alternative = vast.Sll(item.left,item.right)
        #elif type(item) is vast.NotEq:
            #alternative = vast.Eq(item.left,item.right)





        else:
            raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet for op obfuscation")
        if key == '1':
            if user_key == 1:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                value=list_working_key[index]
                string_temp2="1'b"+str(value)
                item3=vast.IntConst(string_temp2)
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, item, alternative)
            else:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                item3=vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(res.top_output.initial_working_key + res.top_output.key_bits)))
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, item, alternative)
        else:
            if user_key == 1:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                value=list_working_key[index]
                string_temp2="1'b"+str(value)
                item3=vast.IntConst(string_temp2)
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, alternative, item)
            else:
                #print("here key value")
                str_temp="1'b1"
                item1=vast.IntConst(str_temp)
                item3=vast.Pointer(vast.Identifier('working_key'), vast.IntConst(str(res.top_output.initial_working_key + res.top_output.key_bits)))
                item2=(vast.Eq(item3,item1))
                item = vast.Cond(item2, alternative, item)
        cfg.working_key += key
        res.top_output.module_key += key
        res.top_output.key_bits += 1
        res.num_ops += 1
    print("item end")
    return item
