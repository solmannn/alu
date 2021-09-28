from __future__ import absolute_import
from __future__ import print_function

import shutil
import os
import copy
import time
from time import clock
import random

import sys
sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), '.'))

from optparse import OptionParser

import obfuscation_data
import obfuscation_techniques
import output_generation

import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import VerilogCodeParser
#part select one temp_one[0:0]
count=0
total_constant=0
total_operations=0
total_branch=0
total_working_key=0
total_dummy_states=0
total_spurious_operations=0
total_dummy_tansitions=0
index_global=100
total_mulchain=0
def resolve(input_string):
	string1=""
	for i in input_string:
		if i!="'":
			string1=string1+i
		else:
			break
	print(string1)
	return int(string1)

def analyze_item(item, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key):
    #print(item)
    #print("analyze_item")
    if isinstance(item, vast.Pragma):
        if item.entry.name == "obfuscation_off":
            cfg.obfuscate_region = False
        elif item.entry.name == "obfuscation_on":
            cfg.obfuscate_region = True
        return item

    if not cfg.obfuscate_region:
        return item

    if isinstance(item, vast.Identifier):
        #print("vi")
        return item
    elif isinstance(item, vast.IntConst):
        #print("ic")
        #print("analyze int consta")
        return obfuscation_techniques.obfuscate_const.apply(item, cfg, res, sig_size,list_working_key,user_key,total_constant)
    elif isinstance(item, vast.FloatConst):
        #print("fc")
        return item
    elif isinstance(item, vast.StringConst):
        #print("sc")
        return item
    elif isinstance(item, vast.Concat):
        #print("cc")
        new_list = ()
        for inst in item.list:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            new_list += (inst,)
        item.list = new_list
        return item
    elif isinstance(item, vast.Repeat):

        ##print("repeat")
        item.value = analyze_item(item.value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Partselect):
        #print("ps")

        return item
    elif isinstance(item, vast.Pointer):
        #print("po")
        return item
    elif isinstance(item, vast.Lvalue):

        #print("lv")
        return item
    elif isinstance(item, vast.Rvalue):
        #print("rv")
        item.var = analyze_item(item.var, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.UnaryOperator):
        #print("uo")
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Cond):
        #apply_operation_obf=1
        #print("in condition")
        #print(item.cond)
        item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.cond)
        #print("true value")
        #print(item.true_value)
        if type(item.true_value) is vast.IntConst:
        	sig_size=resolve(item.true_value.value)
        item.true_value = analyze_item(item.true_value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.true_value)
        #print("false value")
        #print(item.false_value)
        if type(item.false_value) is vast.IntConst:
        	sig_size=resolve(item.false_value.value)
        item.false_value = analyze_item(item.false_value, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.false_value)
        #print(item.cond)
        item.cond, to_switch = obfuscation_techniques.obfuscate_branch.apply(item.cond, True, cfg, res,list_working_key,user_key)
        #print(item.cond)
        #print(to_switch)

        if to_switch:
            tmp = item.false_value
            item.false_value = item.true_value
            item.true_value = tmp
    elif isinstance(item, vast.Operator):
        #print("operator")
        #print(type(item))
        item.left = analyze_item(item.left, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print("left item")
        #print(item.left)
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print("item right")
        #print(item.right)
        #print("in operator again")
        #print(item)
        return obfuscation_techniques.obfuscate_ops.apply(item, cfg, res,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Assign):
        #print("here in assign")

        #print(item.left)
        #print(type(item.right.var.cond.left.args[0]))
        #print(type(item.right.var))
        #nprint(item.right.var)
        if type(item.right.var) is vast.Cond:
        	#print("in assign condition")
        	#print(type(item.right.var.cond))
        	if type(item.right.var.cond) is vast.GreaterThan:
        		#print("in greater than")
        		if type(item.right.var.cond.left) is vast.Identifier:
                                     #print(type(item.right.var.cond.right))
                                     left_size=resolve(item.right.var.cond.right.value)

        		elif type(item.right.var.cond.left.args[0]) is vast.IntConst:
	       			#print(item.right.var.cond.left.args[0])
        			left_size=resolve(item.right.var.cond.left.args[0].value)

        		elif type(item.right.var.cond.right.args[0]) is vast.IntConst:
        			#print(type(item.right.var.cond.right.args[0]))
        			#print("integer constant")
        			#print(item.right.var.cond.right.args[0].value)
        			#print(item.right.var.cond.right.args[0])
        			left_size=resolve(item.right.var.cond.right.args[0].value)
        			#print(left_size)

        		else:
        			left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)


        	elif type(item.right.var.cond) is vast.LessThan:
        		left_size=0

	        elif type(item.right.var.cond) is vast.Eql:
	            #print("in eql")
	            if type(item.right.var.cond.left) is vast.Partselect:
	                #print("here we are")
	                left_size=resolve(item.right.var.cond.right.value)

	        elif type(item.right.var.cond) is vast.Eq:
	            if type(item.right.var.cond.right) is vast.IntConst:
	                left_size=resolve(item.right.var.cond.right.value)
	            elif type(item.right.var.cond.left) is vast.IntConst:
	            	left_size=resolve(item.right.var.cond.right.value)
	            else:
	            	left_size=obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)


        	else:
        		left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        
        elif type(item.right.var) is vast.Concat:
            return item
            
        else:
        #if item.right.var.cond=(item.right.var.cond.right.args[0].value))
        	left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        #print("left_size")
        #print(left_size)
        #print("item.right.var")
        #print(item.right.var)
        item.right.var = analyze_item(item.right.var, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        #print(item.right.var)

    elif isinstance(item, vast.Always):
        #print("alays")
        apply_operation_obf=1
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.BlockingSubstitution) or isinstance(item, vast.NonblockingSubstitution):
        if type(item.left.var) is vast.Partselect:
        	return item
        elif type(item.left.var) is vast.Pointer:
            return item
        #print("non block part")
        left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        item.left = analyze_item(item.left, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        item.right = analyze_item(item.right, cfg, res, left_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.IfStatement):
        if not obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        value = True
        to_switch = False
        if not item.false_statement or isinstance(item.false_statement, vast.IfStatement):
            value = False
        if obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            cfg.obfuscate_region = False
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            cfg.obfuscate_region = True
        else:
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            if item.false_statement:
                item.false_statement = analyze_item(item.false_statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
                item.cond, to_switch = obfuscation_techniques.obfuscate_branch.apply(item.cond, value, cfg, res,list_working_key,user_key)
            if to_switch and value and item.false_statement:
                tmp = item.false_statement
                item.false_statement = item.true_statement
                item.true_statement = tmp
        return item
    elif isinstance(item, vast.ForStatement):
        return item
    elif isinstance(item, vast.WhileStatement):
        return item
    elif isinstance(item, vast.CaseStatement):
        for case in item.caselist:
            case = analyze_item(case, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Case):
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
    elif isinstance(item, vast.Block):
        for st in item.statements:
            st = analyze_item(st, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Initial):
        return item
    elif isinstance(item, vast.InstanceList):
        for inst in item.instances:
            for port in inst.portlist:
                port.argname = analyze_item(port.argname, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
        return item
    elif isinstance(item, vast.Function):
        return item
    elif isinstance(item, vast.FunctionCall):
        return item
    elif isinstance(item, vast.SystemCall):
        #print("system call")
        for inst in item.args:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits,apply_operation_obf,list_working_key,user_key)
            #print("inst")
            return(inst)
        #return item
    elif isinstance(item, vast.GenerateStatement):
        return item
    else:
        #raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet")
        pass
    #print("last")
    return item

def create_block(item):
    l1=[]
    l1.append(item)
    block=vast.Block(l1)
    return block

def extract_register_variable(it,all_reg,always_block):
    #print(len(it.statement.statements[0].true_statement.statements))
    number_of_statement=len(it.statement.statements[0].true_statement.statements)
    i=0
    while i<number_of_statement:
        #print("inside extract register variable")
        #left=it.statement.statements[0].true_statement.statements[i].left.var.name
        #print(type(it.statement.statements[0].true_statement.statements[0]))
        #right_var=it.statement.statements[0].true_statement.statements[i].right
        print(it.statement.statements[0].true_statement.statements[i])
        print(type(it.statement.statements[0].true_statement.statements[i]))
        
        left_var=it.statement.statements[0].true_statement.statements[i].left
        print(type(left_var.var))
        if type(left_var.var) is vast.Partselect:
            all_reg.append(left_var)   
            print(type(left_var.var.var.name))
            lhs=it.statement.statements[0].true_statement.statements[i].left.var.var.name
            always_block[lhs]=it
        elif type(it.statement.statements[0].true_statement.statements[i].right.var) is  vast.Identifier:
            right=it.statement.statements[0].true_statement.statements[i].right.var.name
            left=it.statement.statements[0].true_statement.statements[i].right.var.name
            if left!="ap_start" and left!="ap_done" and left!="ap_CS_fsm":
                if right!="1'b1" and right!="1'b0" and right!="ap_ST_fsm_state1":
                    all_reg.append(it.statement.statements[0].true_statement.statements[i].left.var.name)
                    #all_reg.append(it.statement.statements[0].true_statement.statements[i].right.var.name)
                    lhs=it.statement.statements[0].true_statement.statements[i].left.var.name
                    always_block[lhs]=it
        i=i+1

def add_dummy_state_inside_controller(current_actual_state,number_of_actual_states,dummy_state_value,it,list_working_key,user_key,res,cfg,total_states,iter,dummy_states_list,dummy_states_trans_dict):
    #print("current_actual_state")
    
    global total_dummy_tansitions
    #print(current_actual_state+1)
    #print("number_of_actual_states")
    #print(number_of_actual_states)
    if number_of_actual_states-current_actual_state==1:
        total_dummy_tansitions=total_dummy_tansitions+1
        res.num_transitions=res.num_transitions+1
        #print("only one state left")
        #print(total_states)
        item1=vast.Identifier("ap_NS_fsm")
        item1=vast.Lvalue(item1)
        total_states=total_states
        temp="ap_ST_fsm_state"+str(number_of_actual_states)
        item2=vast.Identifier(temp)
        item2=vast.Rvalue(item2)
        item3=vast.BlockingSubstitution(item1,item2)
        item_block=create_block(item3)
        total_states="ap_ST_fsm_state"+str(total_states)
        case_cond=vast.Identifier(total_states) 
        l_cond=[]
        l_cond.append(case_cond)
        case_cond=tuple(l_cond)
        final_case=vast.Case(case_cond,item_block)
        case_list=list(it.statement.statements[0].caselist)
        case_list.append(final_case)
        it.statement.statements[0].caselist=tuple(case_list)
        return 
        

    #print("number of actual state")
    res.num_transitions_bits=res.num_transitions_bits+1
    total_dummy_tansitions=total_dummy_tansitions+2
    res.num_transitions=res.num_transitions+2
    #print(number_of_actual_states)
    index=res.top_output.initial_working_key + res.top_output.key_bits
    #key=cfg.input_key[index]
    const=random.randint(0,1)
    res.top_output.key_bits=res.top_output.key_bits+1
    pointer_index=vast.IntConst(str(index))
    item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
    #key_signal = vast.IntConst(str(1) + "\'b" + str(key))
    value="1\'b1"
    item3=vast.Eq(item1, vast.IntConst(value))
    choose_next_dummy_state=[]
    i=current_actual_state+1
    #print(dummy_state_value)
    while i<=dummy_state_value-iter:
        choose_next_dummy_state.append(i)
        i=i+1
    i=dummy_state_value+1
    while i<=total_states:
        choose_next_dummy_state.append(i)
        i=i+1
    
    index1=random.randint(0,len(choose_next_dummy_state)-1)
    index2=random.randint(0,len(choose_next_dummy_state)-1)
    #print(choose_next_dummy_state)
    
    while index1==index2:
        index1=random.randint(0,len(choose_next_dummy_state)-1)
        index2=random.randint(0,len(choose_next_dummy_state)-1)
    value1=choose_next_dummy_state[index1]
    value2=choose_next_dummy_state[index2]

    dummy_states_trans_list=[]
    dummy_states_trans_list.append(value1)
    dummy_states_trans_list.append(value2)
    key="ap_ST_fsm_state"+str(dummy_state_value)
    dummy_states_trans_dict[key]=dummy_states_trans_list

    value1=str(value1)
    first="ap_ST_fsm_state"+value1
    first=vast.Identifier(first)
    right_first=vast.Rvalue(first)

    item_left1=vast.Identifier("ap_NS_fsm")
    item_left1=vast.Lvalue(item_left1)

    item_left2=vast.Identifier("ap_NS_fsm")
    item_left2=vast.Lvalue(item_left2)

    value2=str(value2)
    second="ap_ST_fsm_state"+value2
    second=vast.Identifier(second)
    right_second=vast.Rvalue(second)

    item_nbs1=vast.BlockingSubstitution(item_left1,right_first)
    item_b1=create_block(item_nbs1)

    item_nbs2=vast.BlockingSubstitution(item_left2,right_second)
    item_b2=create_block(item_nbs2)
    if_cond=vast.IfStatement(item3,item_b1,item_b2)
    item_bs=create_block(if_cond)
    value_dummy="ap_ST_fsm_state"+str(dummy_state_value)
    
    case_cond=vast.Identifier(value_dummy) 
    l_cond=[]
    l_cond.append(case_cond)
    case_cond=tuple(l_cond)
    final_case=vast.Case(case_cond,item_bs)
    case_list=list(it.statement.statements[0].caselist)
    case_list.append(final_case)
    it.statement.statements[0].caselist=tuple(case_list)
    cfg.working_key=cfg.working_key+str(0)


def add_dummy_inside_controller(it,dummy_state_on,list_working_key,user_key,res,cfg,number_of_actual_states,overall_states,iter,dummy_states_list,dummy_states_trans_dict): 
    i=0
    total_states=overall_states-1
    global total_dummy_tansitions
    while i<len(it.statement.statements[0].caselist):
        if i==dummy_state_on-1:          
            if type(it.statement.statements[0].caselist[i].statement.statements[0]) is vast.IfStatement:      
                total_dummy_tansitions=total_dummy_tansitions+1
                res.num_transitions=res.num_transitions+1
                res.num_transitions_bits=res.num_transitions_bits+1
                #print("here if conditionis present") 
                #print(it.statement.statements[0].caselist[i].cond)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                #key=cfg.input_key[index]
                const=random.randint(0,1)
                res.top_output.key_bits=res.top_output.key_bits+1
                pointer_index=vast.IntConst(str(index))
                item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
                #key_signal = vast.IntConst(str(1) + "\'b" + str(key))
                value="1\'b1"
                item3=vast.Eq(item1, vast.IntConst(value))
                dummy_state_value=number_of_actual_states+iter
                dummy_states_list.append(dummy_state_value)
                dummy_state_right="ap_ST_fsm_state"+str(dummy_state_value)
                dummy_state_right=vast.Identifier(dummy_state_right)
                dummy_state_right=vast.Rvalue(dummy_state_right)
                total_states=total_states+1
                actual_statement=it.statement.statements[0].caselist[i].statement.statements[0].true_statement.statements[0]
                dummy_statement=vast.BlockingSubstitution(actual_statement.left.var,dummy_state_right)
                block1=create_block(actual_statement)
                block2=create_block(dummy_statement)
                wkey=const
                if wkey:
                    item6=vast.IfStatement(item3,block1,block2)
                else:
                    item6=vast.IfStatement(item3,block2,block1) 
                cfg.working_key=cfg.working_key+str(wkey)        
                new_block=create_block(item6)
                it.statement.statements[0].caselist[i].statement.statements[0].true_statement=new_block
                #l1=list(it.statement.statements[0].caselist[i].statement.statements)
                #l1[0]=item6
                #it.statement.statements[0].caselist[i].statement.statements=tuple(l1)
                add_dummy_state_inside_controller(i+1,number_of_actual_states,dummy_state_value,it,list_working_key,user_key,res,cfg,total_states,iter,dummy_states_list,dummy_states_trans_dict)  
                return            
            else:
                res.num_transitions_bits=res.num_transitions_bits+1
                res.num_transitions=res.num_transitions+1
                total_dummy_tansitions=total_dummy_tansitions+1
                #print(it.statement.statements[0].caselist[i].cond)
                index=res.top_output.initial_working_key + res.top_output.key_bits
                #key=cfg.input_key[index]
                const=random.randint(0,1)
                res.top_output.key_bits=res.top_output.key_bits+1
                pointer_index=vast.IntConst(str(index))
                item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
                #key_signal = vast.IntConst(str(1) + "\'b" + str(key))
                value="1\'b1"
                item3=vast.Eq(item1, vast.IntConst(value))
                dummy_state_value=number_of_actual_states+iter
                dummy_states_list.append(dummy_state_value)
                dummy_state_right="ap_ST_fsm_state"+str(dummy_state_value)
                dummy_state_right=vast.Identifier(dummy_state_right)
                dummy_state_right=vast.Rvalue(dummy_state_right)
                total_states=total_states+1
                actual_statement=it.statement.statements[0].caselist[i].statement.statements[0]
                dummy_statement=vast.BlockingSubstitution(actual_statement.left.var,dummy_state_right)
                block1=create_block(actual_statement)
                block2=create_block(dummy_statement)
                wkey=const
                if wkey:
                    item6=vast.IfStatement(item3,block1,block2)
                else:
                    item6=vast.IfStatement(item3,block2,block1) 
                cfg.working_key=cfg.working_key+str(wkey)
                l1=list(it.statement.statements[0].caselist[i].statement.statements)
                l1[0]=item6
                it.statement.statements[0].caselist[i].statement.statements=tuple(l1)
                add_dummy_state_inside_controller(i+1,number_of_actual_states,dummy_state_value,it,list_working_key,user_key,res,cfg,total_states,iter,dummy_states_list,dummy_states_trans_dict)
        i=i+1

def find_input_reg(input_list,input_list_length):
    no_index=random.randint(0,input_list_length-1)
    input_identifier=vast.Identifier(input_list[no_index])
    return input_identifier


def create_mul_chain_operation(left,level,res,input_list,all_reg,input_list_length):
    global index_global
    print("create multichain operation")
    width1=vast.IntConst(str(31))
    width2=vast.IntConst(str(0))
    width=vast.Width(width1,width2)
    res.top_output.definitions += (vast.Wire(left, width,),)
    left=vast.Identifier(left)
    lside=vast.Lvalue(left)

   
    index_global=index_global+1
    right1="temp"+str(index_global)
    res.top_output.definitions += (vast.Wire(right1, width,),)      
    right1_left_str=right1
    right1_left=vast.Identifier(right1)
    right1=vast.Lvalue(right1_left)

    index_global=index_global+1
    right2="temp"+str(index_global)#find_input_reg(input_list,input_list_length)
    res.top_output.definitions += (vast.Wire(right2, width,),)
    right2=vast.Identifier(right2)
    right_left=vast.Lvalue(right2)
    right2=vast.Rvalue(right2)
    operation=vast.Times(right1,right2)
    operation=vast.Rvalue(operation)
    item11=(vast.Assign(lside,operation),)
    res.top_output.items+=item11

    input_item1=find_input_reg(input_list,input_list_length)
    input_item2=find_input_reg(input_list,input_list_length)
    while input_item1.name==input_item2.name:
        input_item1=find_input_reg(input_list,input_list_length)
        input_item2=find_input_reg(input_list,input_list_length)

    operation1=vast.Plus(input_item1,input_item2)
    input_item1=find_input_reg(input_list,input_list_length)
    input_item2=find_input_reg(input_list,input_list_length)
    while input_item1.name==input_item2.name:
        input_item1=find_input_reg(input_list,input_list_length)
        input_item2=find_input_reg(input_list,input_list_length)

    operation2=vast.Plus(input_item1,input_item2)
    random_no=random.randint(0,1)
    index=res.top_output.initial_working_key + res.top_output.key_bits
    res.top_output.key_bits=res.top_output.key_bits+1
    if random_no==0:
        wk=vast.Identifier("working_key")
        index=vast.IntConst(str(index))
        point=vast.Pointer(wk,index)
        eq=vast.Eq(point,vast.IntConst("1'b1"))
        operation1_final=vast.Lvalue(operation1)
        operation2_final=vast.Rvalue(operation2)
        condition=vast.Cond(eq,operation1_final,operation2_final)
        condition=vast.Rvalue(condition)
        item13=(vast.Assign(right_left,condition),) 
        res.top_output.items+=item13

    else:
        wk=vast.Identifier("working_key")
        index=vast.IntConst(str(index))
        point=vast.Pointer(wk,index)
        eq=vast.Eq(point,vast.IntConst("1'b1"))
        operation1_final=vast.Lvalue(operation1)
        operation2_final=vast.Rvalue(operation2)
        condition=vast.Cond(eq,operation2_final,operation1_final)
        condition=vast.Rvalue(condition)
        item13=(vast.Assign(right_left,condition),) 
        res.top_output.items+=item13

    input_item1=find_input_reg(input_list,input_list_length)
    input_item2=find_input_reg(input_list,input_list_length)
    while input_item1.name==input_item2.name:
        input_item1=find_input_reg(input_list,input_list_length)
        input_item2=find_input_reg(input_list,input_list_length)

    operation1=vast.Plus(input_item1,input_item2)
    input_item1=find_input_reg(input_list,input_list_length)
    input_item2=find_input_reg(input_list,input_list_length)
    while input_item1.name==input_item2.name:
        input_item1=find_input_reg(input_list,input_list_length)
        input_item2=find_input_reg(input_list,input_list_length)

    operation2=vast.Plus(input_item1,input_item2)
    random_no=random.randint(0,1)
    index=res.top_output.initial_working_key + res.top_output.key_bits
    res.top_output.key_bits=res.top_output.key_bits+1
    if random_no==0:
        wk=vast.Identifier("working_key")
        index=vast.IntConst(str(index))
        point=vast.Pointer(wk,index)
        eq=vast.Eq(point,vast.IntConst("1'b1"))
        operation1_final=vast.Lvalue(operation1)
        operation2_final=vast.Rvalue(operation2)
        condition=vast.Cond(eq,operation1_final,operation2_final)
        condition=vast.Rvalue(condition)
        item14=(vast.Assign(right1,condition),) 
        res.top_output.items+=item14

    else:
        wk=vast.Identifier("working_key")
        index=vast.IntConst(str(index))
        point=vast.Pointer(wk,index)
        eq=vast.Eq(point,vast.IntConst("1'b1"))
        operation1_final=vast.Lvalue(operation1)
        operation2_final=vast.Rvalue(operation2)
        condition=vast.Cond(eq,operation1_final,operation2_final)
        condition=vast.Rvalue(condition)
        item14=(vast.Assign(right1,condition),) 
        res.top_output.items+=item14

    index_global=index_global+1



    

   

def spurious_operation_else_if(item,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations):
    
    if type(item) is vast.Block or item is None:
        return
    global index_global
    
    total_statments=len(item.true_statement.statements)
        #print(total_statments)
    i=0
    all_non_block=[]
    global total_mulchain
    total_regs=len(all_reg)-1
    while i<total_statments:
        res.dummy_ops=res.dummy_ops+1
        multi_chain=random.randint(0,1)
        if multi_chain==1 and total_mulchain<6:
            total_mulchain=total_mulchain+1
            index=random.randint(0,total_regs)
            reg2="temp"+str(index_global)
            left=reg2
            index_global=index_global+1
            reg1=item.true_statement.statements[i].left.var.name#all_reg[index]
            temp1=vast.Identifier(reg1)
            item1=vast.Lvalue(temp1)
            temp2=vast.Identifier(reg2)
            item2=vast.Rvalue(temp2)
            ops=vast.NonblockingSubstitution(item1,item2)
            create_mul_chain_operation(left,3,res,input_list,all_reg,input_list_length)
        else:             
            #number=random.randint(0,len(all_operations)-1)
            random_no1=random.randint(0,len(all_operations)-1)
            #random_no2=random.randint(0,len(all_reg)-1)
            ops_right=all_operations[random_no1]
            ops_left=item.true_statement.statements[i].left.var.name
            ops_left=vast.Identifier(ops_left)
            ops_left=vast.Lvalue(ops_left)
            ops=vast.NonblockingSubstitution(ops_left,ops_right)
            #ops=all_operations[number]
        non_block1=ops #vast.NonblockingSubstitution(item1,item2)
        all_non_block.append(non_block1) 
        i=i+1

    res.dummy_ops_bits=res.dummy_ops_bits+1
    inner_else_block=vast.Block(all_non_block)
    inner_if_block=item.true_statement
    index=res.top_output.initial_working_key + res.top_output.key_bits
    key=cfg.input_key[index]
    res.top_output.key_bits=res.top_output.key_bits+1
    pointer_index=vast.IntConst(str(index))
    item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
    item2=vast.IntConst("1'b1")
    item3=vast.Eq(item1,item2)
    item4=""
    if int(key)==1:
        item4=vast.IfStatement(item3,inner_if_block,inner_else_block)
    else:
        item4=vast.IfStatement(item3,inner_else_block,inner_if_block)
    l1=[]
    l1.append(item4)
    final_block=vast.Block(l1)
    item.true_statement=final_block
    cfg.working_key=cfg.working_key+str(key)
    #spurious_operation_else_if(item.false_statement,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations)
        


def spurious_operation_else(it,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations):
    #print("inside spurious transtion")
    global index_global
    #print(it.statement.statements[0])
    #print(len(it.statement.statements))
    if type(it.statement.statements[0]) is vast.IfStatement and type(it.statement.statements[0].false_statement) is not vast.Block:
        total_statments=len(it.statement.statements[0].true_statement.statements)
        #print(total_statments)
        i=0
        all_non_block=[]
        global total_mulchain
        total_regs=len(all_reg)-1
        while i<total_statments:
            res.dummy_ops=res.dummy_ops+1
            multi_chain=1#random.randint(0,1)
            if multi_chain==1 and total_mulchain<10:
                total_mulchain=total_mulchain+1
                index=random.randint(0,total_regs)
                reg2="temp"+str(index_global)
                left=reg2
                index_global=index_global+1
                if type(it.statement.statements[0].true_statement.statements[i].left.var) is vast.Partselect:
                    item1=it.statement.statements[0].true_statement.statements[i].left
                else:
                    reg1=it.statement.statements[0].true_statement.statements[i].left.var.name#all_reg[index]
                    temp1=vast.Identifier(reg1)
                    item1=vast.Lvalue(temp1)

                temp2=vast.Identifier(reg2)
                item2=vast.Rvalue(temp2)
                ops=vast.NonblockingSubstitution(item1,item2)
                create_mul_chain_operation(left,3,res,input_list,all_reg,input_list_length)

            else:             
                #number=random.randint(0,len(all_operations)-1)
                random_no1=random.randint(0,len(all_operations)-1)
                ops_right=all_operations[random_no1]
                print(it.statement.statements[0].true_statement.statements[i].left.var)
                print(type(it.statement.statements[0].true_statement.statements[i].left.var))
                if type(it.statement.statements[0].true_statement.statements[i].left.var) is vast.Partselect:
                    ops_left=it.statement.statements[0].true_statement.statements[i].left
                else:
                    ops_left=it.statement.statements[0].true_statement.statements[i].left.var.name
                    ops_left=vast.Identifier(ops_left)
                    ops_left=vast.Lvalue(ops_left)
                ops=vast.NonblockingSubstitution(ops_left,ops_right)
                #ops=all_operations[number]
            non_block1=ops #vast.NonblockingSubstitution(item1,item2)
            all_non_block.append(non_block1)
            i=i+1
        
        inner_else_block=vast.Block(all_non_block)
        inner_if_block=it.statement.statements[0].true_statement
        #const=random.randint(0,1)
        #item1=vast.Identifier("Working_key[0]")
        index=res.top_output.initial_working_key + res.top_output.key_bits
        key=cfg.input_key[index]
        res.dummy_ops_bits=res.dummy_ops_bits+1
        res.top_output.key_bits=res.top_output.key_bits+1
        pointer_index=vast.IntConst(str(index))
        item1=vast.Pointer(vast.Identifier('working_key'),pointer_index)
        item2=vast.IntConst("1'b1")
        item3=vast.Eq(item1,item2)
        item4=""
        if int(key)==1:
            item4=vast.IfStatement(item3,inner_if_block,inner_else_block)
        else:
            item4=vast.IfStatement(item3,inner_else_block,inner_if_block)
        l1=[]
        l1.append(item4)
        final_block=vast.Block(l1)
        it.statement.statements[0].true_statement=final_block
        #final_block=vast.Block(all_non_block)
        #it.statement.statements[0].false_statement=final_block
        cfg.working_key=cfg.working_key+str(key)
        if it.statement.statements[0].false_statement is not None:
            if type(it.statement.statements[0].false_statement) is vast.IfStatement:
                item=it.statement.statements[0].false_statement
                #spurious_operation_else_if(item,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations)

def create_eq(item1,item2):
    item=vast.Eq(item1,item2)
    return item

def create_dummy_state_with_mulchain(dummy_state_no,input_module,res,all_reg,input_list,input_list_length,item_eq,flag,item_if):
    #print("inside multichain")
    if flag==0:
        global index_global
        #print(type(input_list))
        range=len(all_reg)
        index1=random.randint(0,range-1)
        index3=random.randint(0,range-1)
        reg1=all_reg[index1]
        reg1=vast.Identifier(reg1)
        reg1=vast.Lvalue(reg1)
        reg2="temp"+str(index_global)
        index_global=index_global+1
        reg2_identifier=vast.Identifier(reg2)
        level=3
        create_mul_chain_operation(reg2,level,res,input_list,all_reg,input_list_length)
        reg2=vast.Rvalue(reg2_identifier)
        reg3=all_reg[index3]
        reg3=vast.Identifier(reg3)
        reg3=vast.Lvalue(reg3)
        reg4="temp"+str(index_global)
        #print("reg4")
        #print(reg4)
        index_global=index_global+1
        reg4=vast.Identifier(reg4)
        reg4=vast.Rvalue
        non_block1=vast.NonblockingSubstitution(reg1,reg2)
        non_block2=vast.NonblockingSubstitution(reg3,reg4)
        all_non_block1=[]
        all_non_block1.append(non_block1)
        all_non_block2=[]
        all_non_block2.append(non_block2)
        block1=vast.Block(all_non_block1)
        block2=vast.Block(all_non_block2)
        item_if=vast.IfStatement(item_eq,block1,None)  
        l1=[]
        l1.append(item_if)
        item_block2=vast.Block(l1)
        item_sig=vast.Identifier("ap_clk")
        item_sens=vast.Sens(item_sig)
        l2=[]
        l2.append(item_sens)
        item_sens_list=vast.SensList(l2)
        final_item=vast.Always(item_sens_list,item_block2)
        final_item_list=[]
        final_item_list.append(final_item)
        #res.top_output.items+=tuple(final_item_list)
        l_input_module=list(input_module.items)
        l_input_module.append(final_item)
        input_module.items=tuple(l_input_module)
    else:
        range=len(all_reg)
        index1=random.randint(0,range-1)
        reg1=all_reg[index1]
        reg1=vast.Identifier(reg1)
        reg1=vast.Lvalue(reg1)
        reg2="temp"+str(index_global)
        index_global=index_global+1
        reg2_identifier=vast.Identifier(reg2)
        level=3
        create_mul_chain_operation(reg2,level,res,input_list,all_reg,input_list_length)
        reg2=vast.Rvalue(reg2_identifier)
        non_block1=vast.NonblockingSubstitution(reg1,reg2)
        item_if.true_statement.statements.append(non_block1)

def add_final_item(input_module,final_item):
    final_item_list=[]
    final_item_list.append(final_item)
    l_input_module=list(input_module.items)
    l_input_module.append(final_item)
    input_module.items=tuple(l_input_module)

def create_left_right_reg(all_reg):
    global index_global
    range=len(all_reg)
    index1=random.randint(0,range-1)
    reg1=all_reg[index1]
    reg1=vast.Identifier(reg1)
    reg1=vast.Lvalue(reg1)
    reg2="temp"+str(index_global)
    reg2_identifier=vast.Identifier(reg2)
    return reg1,reg2,reg2_identifier


def add_in_always_block2(item,item_if):
    if type(item) is vast.Block:
        return 
    elif item.false_statement is not None:
        add_in_always_block2(item.false_statement,item_if)
    else:
        item.false_statement=item_if

def add_in_always_block(item_if,always_block,ops_left):
    print("add if inside always block")
    #print(ops_left)
    #print(type(ops_left))
    
    block=always_block[ops_left.name]
    print(block)
    print(len(block.statement.statements))
    print(len(block.statement.statements[0].true_statement.statements))
    print(block.statement.statements[0].true_statement.statements[0].left.var.name)
    print(type(block.statement.statements[0]))
    print(type(ops_left.name))
    print(ops_left.name)
    if block.statement.statements[0].false_statement is not None:
        add_in_always_block2(block.statement.statements[0],item_if)
    else:
        block.statement.statements[0].false_statement=item_if

    

def create_dummy_state(dummy_state_no,input_module,res,all_reg,input_list,input_list_length,all_operations,always_block):
    no_of_operations=1
    print("create dummy states")
    print("no_of_operations")
    print(no_of_operations)
    i=0
    temp_str="ap_CS_fsm_state"+str(dummy_state_no)
    item1=vast.Identifier(temp_str)
    item2=vast.IntConst("1'd1")
    item_eq=create_eq(item2,item1)
    flag=0
    item_if=0
    global total_mulchain
    while i<no_of_operations:
        #print("inside loop of number of operations")
        mul_chain=0#random.randint(0,1)
        if mul_chain == 1 and total_mulchain<6:
            #print(type(input_list))
            total_mulchain=total_mulchain+1
            if flag==0:
                reg1,reg2,reg2_identifier=create_left_right_reg(all_reg)
                level=3
                create_mul_chain_operation(reg2,level,res,input_list,all_reg,input_list_length)
                reg2=vast.Rvalue(reg2_identifier)
                non_block1=vast.NonblockingSubstitution(reg1,reg2)
                block1=create_block(non_block1)
                item_if=vast.IfStatement(item_eq,block1,None) 
                item_if2=vast.IfStatement(item_eq,block1,None)
                add_in_always_block(item_if2,always_block,reg1.var)
                '''
                item_block2=create_block(item_if)
                item_sig=vast.Identifier("ap_clk")
                item_sens=vast.Sens(item_sig)
                l2=[]
                l2.append(item_sens)
                item_sens_list=vast.SensList(l2)
                final_item=vast.Always(item_sens_list,item_block2)
                add_final_item(input_module,final_item)
                '''
                flag=1
            else:
                reg1,reg2,reg2_identifier=create_left_right_reg(all_reg)
                level=3
                create_mul_chain_operation(reg2,level,res,input_list,all_reg,input_list_length)
                reg2=vast.Rvalue(reg2_identifier)
                non_block1=vast.NonblockingSubstitution(reg1,reg2)
                #item_if.true_statement.statements.append(non_block1)
                block1=create_block(non_block1)
                item_if2=vast.IfStatement(item_eq,block1,None)
                add_in_always_block(item_if2,always_block,reg1.var)  
                     
        else:
            if flag==0:
                random_no1=random.randint(0,len(all_operations)-1)
                random_no2=random.randint(0,len(all_reg)-1)
                ops_right=all_operations[random_no1]
                ops_left=all_reg[random_no2]
                ops_left=vast.Identifier(ops_left)
                ops_left=vast.Lvalue(ops_left)
                ops=vast.NonblockingSubstitution(ops_left,ops_right)
                block1=create_block(ops)
                item_if=vast.IfStatement(item_eq,block1,None)
                item_if2=vast.IfStatement(item_eq,block1,None)
                add_in_always_block(item_if2,always_block,ops_left.var)
                '''
                item_block2=create_block(item_if)
                item_sig=vast.Identifier("ap_clk")
                item_sens=vast.Sens(item_sig)
                l2=[]
                l2.append(item_sens)
                item_sens_list=vast.SensList(l2)
                final_item=vast.Always(item_sens_list,item_block2)
                add_final_item(input_module,final_item)   
                '''          
                flag=1
            else:
                random_no1=random.randint(0,len(all_operations)-1)
                random_no2=random.randint(0,len(all_reg)-1)
                ops_right=all_operations[random_no1]
                ops_left=all_reg[random_no2]
                ops_left=vast.Identifier(ops_left)
                ops_left=vast.Lvalue(ops_left)
                ops=vast.NonblockingSubstitution(ops_left,ops_right)
                #item_if.true_statement.statements.append(ops)
                block1=create_block(ops)
                item_if2=vast.IfStatement(item_eq,block1,None)
                add_in_always_block(item_if2,always_block,ops_left.var)  
        i=i+1


def find_controller(it,input_module):
    controller_pointer=0
    no_of_states=0
    for it in input_module.items:
        if type(it) is vast.Always:
            if type(it.statement.statements[0]) is vast.CaseStatement:
                no_of_states=len(it.statement.statements[0].caselist)
                controller_pointer=it
    return controller_pointer,no_of_states

def find_ops(it,all_operations):
    i=0
    #print(all_operations)
    #print(type(it))
    if type(it) is vast.Block:
        return 
    else:    
        total_statements=len(it.true_statement.statements)
        while i<total_statements:
            left_var=it.true_statement.statements[i].left
            right_var=it.true_statement.statements[i].right
            if type(left_var) is vast.Partselect:
                all_operations.append(it.true_statement.statements[i])
            elif type(left_var.var) is vast.Identifier and type(right_var.var) is vast.Identifier:
                if left_var.var.name!="ap_CS_fsm" and left_var.var.name!="ap_return":
                    #print(left_var.var.name)
                    all_operations.append(it.true_statement.statements[i].right)
            i=i+1
        if it.false_statement is not None:
            find_ops(it.false_statement,all_operations)
        else:
            return 

def find_all_operations(input_module,all_operations):
    for it in input_module.items:
        if type(it) is vast.Always:
            if type(it.statement.statements[0]) is vast.IfStatement:
                find_ops(it.statement.statements[0],all_operations)
    #print("all operations")
    #print(all_operations)


def add_spurious_operations(input_module,it,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations,no_of_ops):
    for it in input_module.items:
        if type(it) is vast.Always:
            if type(it.statement.statements[0]) is vast.IfStatement:
                if res.dummy_ops<no_of_ops:               
                    spurious_operation_else(it,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations)

def dummy_state_function(input_module,res,all_reg,no_of_states,input_list,input_list_length,all_operations,always_block):
    #print(type(input_list))
    add_dummy_no=int(input("number of dummy states want to add:"))
    global total_dummy_states
    total_dummy_states=total_dummy_states+add_dummy_no
    dummy_state_no=no_of_states
    i=0
    while i<add_dummy_no:
        #iter=i+1
        create_dummy_state(dummy_state_no,input_module,res,all_reg,input_list,input_list_length,all_operations,always_block)
        dummy_state_no=dummy_state_no+1
        i=i+1
    return add_dummy_no

def dummy_inside_controller(add_dummy_no,controller_pointer,list_working_key,user_key,res,cfg,no_of_states,dummy_states_list,dummy_states_trans_dict):
    i=0
    while i<add_dummy_no:
        connect_state=int(input("no through which connect"))
        #print(no_of_states)
        iter=i+1
        overall_states=no_of_states+add_dummy_no-1
        add_dummy_inside_controller(controller_pointer,connect_state,list_working_key,user_key,res,cfg,no_of_states-1,overall_states,iter,dummy_states_list,dummy_states_trans_dict)
        i=i+1

def all_inputs(input_module,input_list):
    for it in input_module.items:
        if type(it) is vast.Decl:
            if type(it.list[0]) is vast.Input:
                if it.list[0].name!="ap_clk" and it.list[0].name!="ap_rst" and it.list[0].name !="ap_done" and it.list[0].name!="ap_start":
                    input_list.append(it.list[0].name)

    if len(input_list)!=0 and len(input_list)!=1:
        return input_list
    else:
        for it in input_module.items:
            if type(it) is vast.Decl:
                if type(it.list[0]) is vast.Wire:
                    input_list.append(it.list[0].name)
        return input_list





def add_spurious_inside_controller(choose_state,state_no,cp,point,res,cfg):
    global total_dummy_tansitions
    res.num_transitions_bits=res.num_transitions_bits+1
    res.num_transitions=res.num_transitions+1
    total_dummy_tansitions=total_dummy_tansitions+1
    #print(it.statement.statements[0].caselist[i].cond)
    index=res.top_output.initial_working_key + res.top_output.key_bits
    index2=res.top_output.initial_working_key + res.top_output.key_bits+1
    #key=cfg.input_key[index]
    const=random.randint(0,1)
    res.top_output.key_bits=res.top_output.key_bits+2
    pointer_index1=vast.IntConst(str(index))
    pointer_index2=vast.IntConst(str(index2))
    item1=vast.Pointer(vast.Identifier('working_key'),pointer_index1)
    #key_signal = vast.IntConst(str(1) + "\'b" + str(key))
    item2=vast.Pointer(vast.Identifier('working_key'),pointer_index2)

    value="1\'b1"
    item_temp1=vast.Eq(item1, vast.IntConst(value))
    item_temp2=vast.Eq(item2, vast.IntConst(value))
    item3=vast.And(item_temp1,item_temp2)
    dummy_state_value=choose_state
    dummy_state_right=str(dummy_state_value)
    dummy_state_right=vast.Identifier(dummy_state_right)
    dummy_state_right=vast.Rvalue(dummy_state_right)
    if type(cp[state_no-1].statement.statements[0]) is vast.IfStatement:
        actual_statement=cp[state_no-1].statement.statements[0].true_statement.statements[0]
    else:
        actual_statement=cp[state_no-1].statement.statements[0]

    dummy_statement=vast.BlockingSubstitution(actual_statement.left.var,dummy_state_right)
    block2=create_block(dummy_statement)
    item6=vast.IfStatement(item3,block2,None)
    
    if type(cp[state_no-1].statement.statements[0]) is vast.IfStatement:
        if cp[state_no-1].statement.statements[0].false_statement:
            it=cp[state_no-1].statement.statements[0].false_statement
            cp[state_no-1].statement.statements[0].false_statement=item6
            item6.false_statement=it
        
    else:
        actual_statement=cp[state_no-1].statement.statements[0]
        block2=create_block(dummy_statement)
        wkey=const
        if wkey:
            item6=vast.IfStatement(item3,block1,block2)
        else:
            item6=vast.IfStatement(item3,block2,block1) 
        cfg.working_key=cfg.working_key+str(wkey)
        item6=vast.Block(item6)
        list_block=[]
        list_block.append(item6)
        item6=vast.Block(list_block)
        if type(cp[state_no-1].statement.statements[0]) is vast.IfStatement:
            cp[state_no-1].statement.statements[0].true_statement=item6
        else:
            l1=list(cp[state_no-1].statement.statements)
            l1[0]=item6
            cp[state_no-1].statement.statements=tuple(l1)
    
    
    
   


def add_spurious_transition(controller_pointer,list_working_key,user_key,res,cfg,dummy_states_list,dummy_states_trans_dict):
    total_states=len(controller_pointer.statement.statements[0].caselist)
    cp=controller_pointer.statement.statements[0].caselist
    print(dummy_states_list)
    for key in dummy_states_trans_dict:
        print(key)
        print(dummy_states_trans_dict[key])
    no_of_transition=int(input("number of dummy transition want to enter"))
    i=0
    state_no=0
    next_list=[]
    while i<no_of_transition:
        state_no=int(input("enter state number"))
        state_left=[]
        j=state_no
        while j<total_states:
            if cp[j].cond is not None:
                variable=0
                if type(cp[state_no-1].statement.statements[0]) is vast.IfStatement:
                    variable=cp[state_no-1].statement.statements[0].true_statement.statements[0]
                if type(cp[state_no-1].statement.statements[0]) is vast.BlockingSubstitution:
                    variable=cp[state_no-1].statement.statements[0]
                #print(type(cp[0].statement.statements[0]))
                #print(type(cp[state_no-1].statement.statements[0]))
                if variable.right.var.name!=cp[j].cond[0].name:
                    state_name=cp[j].cond[0].name
                    print(type(state_name))
                    next_list.append(state_name)
            j=j+1
        print(next_list)
        if len(next_list)==0:
            print("not possible to add dummy transition")
        else:
            add_flag=0
            while len(next_list)!=0:
                choose_state=random.randint(0,len(next_list)-1)
                choose_state=next_list[choose_state]
                print(choose_state)
                flag=0
                if choose_state in dummy_states_trans_dict:
                    print("here")
                    for t in dummy_states_trans_dict[choose_state]:
                        print(t)
                        if t<=state_no:
                            del dummy_states_trans_dict[choose_state]
                            next_list.remove(choose_state)
                            flag=1
                            break
                    if flag==0:
                        add_flag=1
                        point=cp[state_no-1].statement.statements
                        add_spurious_inside_controller(choose_state,state_no,cp,point,res,cfg)
                        break
                else:
                    add_flag=1
                    point=cp[state_no-1].statement.statements
                    add_spurious_inside_controller(choose_state,state_no,cp,point,res,cfg)
                    break
            if len(next_list)==0:
                print("not able to add dummy transition")
        i=i+1


    
    print(flag)

    print(next_list)
    print(total_states)

def write_parameters(res,input_module):
    name="working_key"
    global total_working_key
    index=res.top_output.initial_working_key + res.top_output.key_bits
    width1=vast.IntConst(str(index-1))
    width2=vast.IntConst(str(total_working_key))
    width=vast.Width(width1,width2)
    res.top_output.definitions += (vast.Input(name, width,),)




def perform_module_obfuscation(original_module, cfg,list_working_key,user_key,show_output):
    #print(cfg)
    #print("hello")
    #print("perform module obfuscation")
    global total_mulchain
    total_mulchain=0
    global total_working_key
    input_module = copy.deepcopy(original_module)
    #print(type(input_module))
    #print(type(input_module.items))
    module_instance = input_module.name #+ "_" + str(len(cfg.modules))
    #print(module_instance)

    res = obfuscation_data.ObfuscationResult()
    suffix = ""
    res.top_output = obfuscation_data.ObfuscatedModule(module_instance + suffix, input_module.name)
    #print("res.top_output")
    #print(res.top_output.name)
    cfg.modules += (res.top_output,)
    #print(cfg.modules)


    res.top_output.params = input_module.paramlist
    #print("res.top_output.params")
    #print(res.top_output.params)
    ports = vast.Portlist(res.top_output.ports)
    #print(ports)
    
    if cfg.verbose:
        print("=Interface")
    for p in input_module.portlist.ports:
        res.top_output.ports += (p,)
    #print(res.top_output.ports)
    

    if cfg.verbose:
        print("=Parameter definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

    #print("res.top_output.definitions")
    #print(res.top_output.definitions)

    if cfg.verbose:
        print("=Port definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Input:
                    port = vast.Input(p.name, p.width, p.signed)
                    res.top_output.definitions += (vast.Decl((port,)),)
                elif type(p) is vast.Output:
                    port = vast.Output(p.name, p.width, p.signed)
                    res.top_output.definitions += (vast.Decl((port,)),)

    #print(res.top_output.definitions)

    if cfg.verbose:
        print("=Signal definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if not type(p) is vast.Input and not type(p) is vast.Output and not type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

    if cfg.verbose:
        print("=Items")
    starting_key = total_working_key
    for it in input_module.items:
        if type(it) is vast.Decl:
            continue
        elif type(it) is vast.InstanceList:
            print("instance list")
            for inst in it.instances:
                int_module = False
                for module in cfg.ast.description.definitions:
                    if type(module) is vast.Pragma:
                        continue
                    if module.name == inst.module:
                        int_module = module
                if int_module:
                    mod_res = perform_module_obfuscation(int_module, cfg,list_working_key,res = perform_module_obfuscation(top_module, cfg,list_working_key,key_value,show_output))
                    for m in mod_res.modules:
                        res.modules[m] = mod_res.modules[m]
                    res.list_files.extend(mod_res.list_files)
                    it.module = mod_res.top_output.name
                    if mod_res.top_output.key_bits == 1:
                        key_port = vast.Pointer(vast.Identifier('working_key'), vast.IntConst(starting_key))
                    else:
                        key_msb = vast.IntConst(starting_key + mod_res.top_output.key_bits - 1)
                        key_lsb = vast.IntConst(starting_key)
                        key_port = vast.Partselect(vast.Identifier('working_key'), key_msb, key_lsb)
                    starting_key += mod_res.top_output.key_bits
                    positional_binding = False
                    for p in inst.portlist:
                        if p.portname is None:
                            positional_binding = True
                    if positional_binding:
                        inst.portlist += (vast.PortArg(None, key_port),)
                    else:
                        inst.portlist += (vast.PortArg('working_key', key_port),)
                    res.top_output.module_key += mod_res.top_output.module_key

    #print("starting_key")
    #print(starting_key)
    
    count=0
    list_notvalid=[]
    res.top_output.initial_working_key = starting_key
    obf_bits = obfuscation_data.ObfuscationBits(res.top_output.name)
    

    print("--------------------extract register variable------------")
    
    all_reg=[]
    always_block={}
    for it in input_module.items:
        if type(it) is vast.Always:
            if type(it.statement.statements[0]) is vast.IfStatement:
                print("normal always")
                extract_register_variable(it,all_reg,always_block)
    
    print(all_reg)  
    print(always_block)
    print("--------------------Find controller pointer------------")
    if cfg.dummy_states or cfg.spurious_trans:
        controller_pointer,no_of_states=find_controller(it,input_module)

    input_list=[]
    all_inputs(input_module,input_list)
    input_list_length=len(input_list)
    all_operations=[]
    print("--------------------Find All Operations------------")
    find_all_operations(input_module,all_operations)
    print("\n")
    print("\n")
    print(all_operations)

    print("--------------------Add Dummy states------------")
    if cfg.dummy_states:
        add_dummy_no=dummy_state_function(input_module,res,all_reg,no_of_states,input_list,input_list_length,all_operations,always_block)


    print("--------------------Perform Constant, control,operation obf------------")
    
    for it in input_module.items:
        if type(it) is vast.Decl:
                continue
        #if type(it) is vast.Assign:
                #it = analyze_item1(it,res,list_notvalid)
        if it not in list_notvalid:
            apply_operation_obf=0
            if type(it) is vast.Assign:
                print(it.right.var)
                if type(it.right.var) is vast.Sll:
                    print("hii")
                    #analyze_item(it, cfg, res, -1, obf_bits,apply_operation_obf,list_working_key,user_key)
                
            #it = analyze_item(it, cfg, res, -1, obf_bits,apply_operation_obf,list_working_key,user_key)
            #it=  post_modification(it,res,input_module,it)
            #it = part_select_module(it,res,input_module,it)
            #it = concate_module(it,res,input_module,it)
          
        #if type(it) is vast.Always:
	        #it=analyze_done(it,it)

        if not type(it) is vast.Pragma:
            res.top_output.items += (it,)
    
    print("--------------------Add dummy inside controller------------")
    dummy_states_list=[]
    dummy_states_trans_dict={}
    if cfg.dummy_states:
        dummy_inside_controller(add_dummy_no,controller_pointer,list_working_key,user_key,res,cfg,no_of_states,dummy_states_list,dummy_states_trans_dict)
    print("--------------------Add spurious operations------------------")
    
    
    if cfg.spurious_ops:
        no_of_operations=0
        for it in input_module.items:
            if type(it) is vast.Always:
                no_of_operations=no_of_operations+1
        
        no_of_operations=no_of_operations
        no_of_ops=2#int((no_of_operations*35)/100)
        add_spurious_operations(input_module,it,all_reg,list_working_key,user_key,res,cfg,input_list,input_list_length,all_operations,no_of_ops)

    print("--------------------Add spurious transitions-----------------")
    if cfg.spurious_trans:
        add_spurious_transition(controller_pointer,list_working_key,user_key,res,cfg,dummy_states_list,dummy_states_trans_dict)

    
    print("-------------------Write Parameter----------------------------")
    write_parameters(res,input_module)

    res.modules[res.top_output.name] = obf_bits

    global total_branch
    global total_constant
    global total_operations
    global total_spurious_operations
    
    total_branch=total_branch+res.num_branches
    total_operations=total_operations+res.num_ops
    total_constant=total_constant+res.num_consts
    total_working_key_prev=total_working_key
    total_working_key=total_working_key+(res.top_output.key_bits)
    total_spurious_operations=total_spurious_operations+res.dummy_ops
    res.write_report(cfg)

    show_output_temp=[]
    const_bits = res.top_output.key_bits - res.num_ops - res.num_branches-res.num_transitions_bits-total_working_key_prev-res.dummy_ops_bits
    spaces = max(len(str(res.num_consts)), len(str(res.num_branches)), len(str(res.num_ops)))
    spaces_bits = max(len(str(const_bits)), len(str(res.num_branches)), len(str(res.num_ops)))
  
    data_original_module="| Original module                    = \"" + res.top_output.module_name + "\""
    data_obfuscated_module="| Obfuscated module                  = \"" + res.top_output.name + "\""
    data_temp="------------------------------------------------------------------------------------"
    data_obfuscated_constant="| Number of obfuscated constants     = " + ' ' * (spaces - len(str(res.num_consts))) + str(res.num_consts) + " CONSTANTS  / " + ' ' * (spaces_bits - len(str(const_bits))) + str(const_bits) + " BITS"
    data_obfuscated_branches="| Number of obfuscated branches      = " + ' ' * (spaces - len(str(res.num_branches))) + str(res.num_branches) + " BRANCHES   / " + ' ' * (spaces_bits - len(str(res.num_branches))) + str(res.num_branches) + " BITS"
    data_obfuscated_ops= "| Number of obfuscated operations    = " + ' ' * (spaces - len(str(res.num_ops))) + str(res.num_ops) + " OPERATIONS / " + ' ' * (spaces_bits - len(str(res.num_ops))) + str(res.num_ops) + " BITS"
    data_dumm_transitions="| Number of dummy transition     = " + ' ' * (spaces - len(str(res.num_transitions))) + str(res.num_transitions) + " TRANSITIONS / " + ' ' * (spaces_bits - len(str(res.num_transitions))) + str(res.num_transitions_bits) + " BITS"
    data_no_dummy_ops="| Number of dummy operations     = " + ' ' * (spaces - len(str(res.dummy_ops))) + str(res.dummy_ops) + " OPERATIONS / " + ' ' * (spaces_bits - len(str(res.dummy_ops_bits))) + str(res.dummy_ops_bits) + " BITS"

    show_output_temp.append(data_original_module)
    show_output_temp.append(data_obfuscated_module)
    show_output_temp.append(data_temp)
    show_output_temp.append(data_obfuscated_constant)
    show_output_temp.append(data_obfuscated_branches)
    show_output_temp.append(data_obfuscated_ops)
    show_output_temp.append(data_dumm_transitions)
    show_output_temp.append(data_no_dummy_ops)
    show_output.append(show_output_temp)


    # generation of obfuscated module
    if cfg.obfuscate:
        if input_module.name == cfg.top:
            width = vast.Width(vast.IntConst(str(len(cfg.input_key) - 1)), vast.IntConst('0'))
            key_port = vast.Port('locking_key', width, None, None)
            res.top_output.ports += (key_port,)
            if len(cfg.input_key) > 1:
                width = vast.Width(vast.IntConst(str(len(cfg.input_key) - 1)), vast.IntConst('0'))
                key_port = vast.Input('locking_key', width)  # add True for signed signal
            if len(cfg.input_key) == 1:
                key_port = vast.Input('locking_key')
            res.top_output.definitions += (vast.Decl((key_port,)),)
            if res.top_output.initial_working_key + res.top_output.key_bits > 0:
                sig = vast.Identifier("working_key")
                if len(cfg.working_key) > 0:
                    width = vast.Width(vast.IntConst(str(len(cfg.working_key) - 1)), vast.IntConst('0'))
                    res.top_output.definitions += (vast.Wire("working_key", width),)
                if res.top_output.key_bits > 1:
                    replica = int(len(cfg.working_key) / len(cfg.input_key))
                    additional_bits = int(len(cfg.working_key) % len(cfg.input_key))
                    list_sig = ()
                    if additional_bits > 1:
                        key_msb = vast.IntConst(str(additional_bits - 1))
                        key_lsb = vast.IntConst('0')
                        key_part = vast.Partselect(vast.Identifier('locking_key'), key_msb, key_lsb)
                    for i in range(0, replica):
                        key_part = vast.Identifier('locking_key')
                    list_sig += (key_part,)
                    assign = vast.Concat(list_sig)
                    res.top_output.items += (vast.Assign(sig, assign),)
                else:
                    sig1 = vast.Pointer(vast.Identifier("locking_key"), vast.IntConst('0'))
                    res.top_output.items += (vast.Assign(sig, sig1),)
        else:
            if res.top_output.key_bits > 0:
                width = vast.Width(vast.IntConst(str(res.top_output.key_bits - 1)), vast.IntConst('0'))
                key_port = vast.Port('working_key', width, None, None)
                res.top_output.ports += (key_port,)
                if res.top_output.key_bits > 0:
                    width = vast.Width(vast.IntConst(str(res.top_output.key_bits - 1)), vast.IntConst('0'))
                    key_port = vast.Input('working_key', width)  # add True for signed signal
                res.top_output.definitions += (vast.Decl((key_port,)),)
    ports = vast.Portlist(res.top_output.ports)
    ast = vast.ModuleDef(res.top_output.name, res.top_output.params, ports,
                         res.top_output.definitions + res.top_output.items)

    # generation of verilog files
    if user_key == 1:
        v_filename = "hdl2/" + res.top_output.name+"_key_1" + ".v"
    else:
        v_filename = "hdl2/" + res.top_output.name+"_key_0" + ".v"
    output_generation.generate_ast(ast, v_filename)
    res.list_files.append([res.top_output.name, v_filename])

    # generation of wrappers
    if cfg.obfuscate:
        output_generation.generate_wrappers(input_module, res, cfg)
        output_generation.generate_formality_tcl(input_module, res, cfg)

    print("")
    print("working key")
    #print(cfg.working_key)
    c_name= "hdl2/"+res.top_output.name+"working_key"+".txt"
    f= open(c_name,"w+")
    for val in cfg.working_key:
    	f.write(val)
    	f.write("\n")
    #print(cfg.working_key[0])
    #print(cfg.working_key[1])
    #print(cfg.working_key[2])
    #print(cfg.working_key[3])
    return res


def main():
    INFO = "ASSURE: Algorithmic-Level Obfuscation"
    VERSION = 1.0
    USAGE = "Usage: python assure.py -t top_name -k locking_key file ..."

    def showVersion():
        print(INFO)
        print(VERSION)
        print(USAGE)
        sys.exit()

    optparser = OptionParser()

    optparser.add_option("-V", "--version", action="store_true", dest="showversion",
                         default=False, help="Show the version")
    # options related to Verilog parsing
    optparser.add_option("-v", "--verbose", action="store_true", dest="verbose",
                         default=False, help="Verbose execution")
    optparser.add_option("-I", "--include", dest="include", action="append",
                         default=[], help="Include path")
    optparser.add_option("-D", dest="define", action="append",
                         default=[], help="Macro Definition")
    # options related to top specification
    optparser.add_option("-t", "--top", action="store", dest="top",
                        default=False, help="Specify the name of the module to obfuscate")
    # options related to locking key
    optparser.add_option("-k", "--locking-key", action="store", dest="input_key",
                         default=False, help="Specify the input locking_key")
    # options related to obfuscation techniques
    optparser.add_option("-a", "--obfuscate", action="store_true", dest="obfuscate_all",
                         default=False, help="Obfuscate entire design")
    optparser.add_option("-c", "--obfuscate-const", action="store", dest="obfuscate_const",
                         default=False, help="Specify the minimum number of bits for the constants to obfuscate")
    optparser.add_option("-b", "--obfuscate-branch", action="store_true", dest="obfuscate_branch",
                         default=False, help="Obfuscate conditional branches")
    optparser.add_option("-o", "--obfuscate-ops", action="store_true", dest="obfuscate_ops",
                         default=False, help="Obfuscate operators")
    optparser.add_option("-s", "--spurious-ops", action="store_true", dest="spurious_ops",
                         default=False, help="add sporious operation")
    optparser.add_option("-d", "--dummy-states", action="store_true", dest="dummy_states",
                         default=False, help="add dummy states")
    optparser.add_option("-r", "--spurious-trans",action="store_true", dest="spurious_trans",
                         default=False, help="add spurious transition")
    optparser.add_option("-u", "--obfuscate-entire-design", action="store_true", dest="unfold_key",
                         default=False, help="Manage the key if needed to obfuscate the entire design")
    # options related to security analysis
    optparser.add_option("-w", "--generate-wrong-keys", action="store", dest="wrong_keys",
                         default=0, help="Generate wrappers to test wrong keys")

    ### execution setup
    
    total_files=1#int(input("Enter the number of files:"))
    if total_files<=0:
        raise Exception("atleast single required:")
    i=0
    main_dic={}
    all_files=[]
    show_output=[]
    while i<total_files:
        file_name="top.v"#input("Enter the name of file:")
        top_name="top"#input("Enter the name of top module:")
        all_files.append(file_name)
        (options, args) = optparser.parse_args()
        #print(args)
        options.top=top_name
        cfg = obfuscation_data.ObfuscationConfig(options,args,file_name,top_name)	
        main_dic[file_name]=cfg
        print(file_name)
        print(main_dic[file_name])	
        i=i+1
    
    for keys in main_dic.keys():
        print(keys)
    key_available="No"#input("Working key available Yes/No:")
    #(options, args) = optparser.parse_args()
    #print(args)
    #print(options)
    print(len(args))
    if options.showversion or len(args) == 0:
        showVersion()
        #print("here")

    #cfg = obfuscation_data.ObfuscationConfig(options, args)
    #print(cfg)
    if not os.path.isdir("hdl"):
        os.mkdir("hdl")
    for keys in main_dic.keys():
        if main_dic[keys].obfuscate:
            if not os.path.isdir("wrappers"):
                os.mkdir("wrappers")
            if not os.path.isdir("scripts"):
                os.mkdir("scripts")
    ### setup is completed
    start = time.time()
    start_clk = clock()
    ### parsing of input files
    for keys in main_dic.keys():
        print("File Name: "+keys)
        cfg=main_dic[keys]
        print("Top Name: "+cfg.top)
        print("here")
        codeparser = VerilogCodeParser(cfg.filelist, preprocess_include=cfg.includes, preprocess_define=cfg.defines, debug=False)
        cfg.ast = codeparser.parse()
        #print(cfg.ast)
        cfg.ast.show()
        #print(cfg)
    	#if cfg.verbose:
        #print("hello verbose")
        #cfg.ast.show()
    	### input files correctly parsed

        print("")
    	### performing hierarchial obfuscation/analysis
        top_module = None
        for module in cfg.ast.description.definitions:
            print(module)
            if isinstance(module, vast.ModuleDef):
                print(module.name)
                if module.name == cfg.top:
                    top_module = module
                    print(top_module)
    
        list_working_key=[]
        res=0
        if key_available =="Yes" or key_available=="yes":
            print("here yes")
            user_key=1
            file_name="hdl2/"+top_module.name+"_0_obfworking_key.txt"
            list_working_key=[]
            for line in open(file_name):
                if line.strip():           # line contains eol character(s)
            	    n = int(line)
            	    list_working_key.append(n)
            #list_working_key.reverse()
            #print(list_working_key)
            #print(list_working_key[64:96])
            if not top_module:
                raise Exception("Top module \"" + options.top + "\" is missing")
            else:
                res = perform_module_obfuscation(top_module, cfg,list_working_key,user_key,show_output)
        elif key_available=="No" or key_available=="no":
            user_key=0
            print("here no")
            print("key not available")
            if not top_module:
                raise Exception("Top module \"" + options.top + "\" is missing")
            else:
                res = perform_module_obfuscation(top_module, cfg,list_working_key,user_key,show_output)
                
        else:
            raise Exception("Invalid key input either yes or no")

        
        print("------------------------------------------------------------------------------------")
        for f in res.list_files:
            spaces = 30 - len(f[0])
            print("| " + f[0] + ' '*spaces + " | File = \"" + f[1] + "\"")
        print("------------------------------------------------------------------------------------")
    

    
    #print("key value")
    #print(key_value)
    #res = perform_module_obfuscation(top_module, cfg,list_working_key,key_value)
    ### obfuscation/analysis is completed
    '''
    print("------------------------------------------------------------------------------------")
    for f in res.list_files:
        spaces = 30 - len(f[0])
        print("| " + f[0] + ' '*spaces + " | File = \"" + f[1] + "\"")

    print("------------------------------------------------------------------------------------")
    '''
    ### clean output
    if os.path.isdir("__pycache__"):
        shutil.rmtree("__pycache__")
    if os.path.isfile("parsetab.py"):
        os.remove("parsetab.py")
    ### everything is completed

    

    i=0
    while i<len(show_output):
        j=0
        print("\n")
        print("----------------------------FILE "+str(i+1)+"------------------------------------------")
        while j<len(show_output[i]):
            print(show_output[i][j])
            j=j+1
        i=i+1
    print("\n")
    print("\n")

    print("-------------------------------overall results--------------------------------------------")
    global total_dummy_states
    global total_dummy_tansitions
    global total_spurious_operations
    print("Total Constant:   "+str(total_constant))
    print("Total Condition:  "+str(total_branch))
    print("Total Operation:  "+str(total_operations))
    print("Total Dummy States "+str(total_dummy_states))
    print("Total Dummy Transitions "+str(total_dummy_tansitions))
    print("Total Spurious operations "+str(total_spurious_operations))
    print("Total Working Key "+str(total_working_key))

    print("\n")
    end = time.time()
    end_clk=clock()
    print(f"Total Execution Time:  {end-start}")
    print(f"Total Execution2 Time:  {end_clk-start_clk}")

if __name__ == '__main__':
    main()
