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
import os

import obfuscation_data

from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
import pyverilog.vparser.ast as vast


def generate_ast(ast, filename):
    outfile = open(filename, 'w')
    codegen = ASTCodeGenerator()
    print(codegen.visit(ast), file=outfile)


def generate_formality_tcl(input_module, res, cfg):
    if not os.path.isdir("scripts/0"):
        os.mkdir("scripts/0")

    wrapper_name = res.top_output.name + "_golden"
    coutfile = open("scripts/0/" + wrapper_name + '_verify.tcl', 'w')
    for f in cfg.filelist:
        print("read_verilog -container r -libname WORK " + f, file=coutfile)
    print("set_top r:/WORK/" + input_module.name + "\n", file=coutfile)
    print("read_verilog -container i -libname WORK " + "wrappers/0/" + wrapper_name + '_wrap.v',
          file=coutfile)
    for f in res.list_files:
        print("read_verilog -container i -libname WORK " + f[1], file=coutfile)
    print("set_top i:/WORK/" + input_module.name + "\n", file=coutfile)
    print("match\n", file=coutfile)
    print("verify\n", file=coutfile)
    print("exit\n", file=coutfile)


def generate_wrappers(input_module, res, cfg):
    if not os.path.isdir("wrappers/0"):
        os.mkdir("wrappers/0")

    wrapper_name = res.top_output.name + "_golden"
    wrapper = obfuscation_data.ObfuscatedModule(input_module.name, input_module.name)
    wrapper.params = input_module.paramlist
    wmodule = res.top_output.name
    wname = "i0"
    wportlist = ()
    wparameterlist = ()
    for p in input_module.portlist.ports:
        if type(p) is vast.Ioport:
            wrapper.ports += (p.first,)
            if p.second:
                wrapper.definitions += (vast.Decl((p.second,)),)
            wportlist += (vast.PortArg(p.first.name, vast.Identifier(p.first.name)),)
        else:
            wrapper.ports += (p,)
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Input:
                    port = vast.Input(p.name, p.width, p.signed)
                    wportlist += (vast.PortArg(p.name, vast.Identifier(p.name)),)
                    wrapper.definitions += (vast.Decl((port,)),)
                elif type(p) is vast.Output:
                    port = vast.Output(p.name, p.width, p.signed)
                    wportlist += (vast.PortArg(p.name, vast.Identifier(p.name)),)
                    wrapper.definitions += (vast.Decl((port,)),)
    if input_module.name == cfg.top:
        run_key = cfg.input_key
    elif len(res.top_output.module_key) > 0:
        run_key = res.top_output.module_key
    key_value = run_key[len(run_key)::-1]
    key_const = vast.IntConst(str(len(key_value)) + "\'b" + key_value)
    #wportlist += (vast.PortArg('working_key', key_const),)
    '''
    counter = 0
    coutfile = open("scripts/" + str(x) + "/" + wrapper_name + '_const.tcl', 'w')
    if input_module.name == cfg.top:
        for i in cfg.input_key:
            print("set_constant i:/WORK/" + res.top_output.name + "_obf/locking_key[" + str(counter) + "] " + str(i) , file=coutfile)
            counter += 1
    else:
        for i in res.top_output.module_key:
            print("set_constant i:/WORK/" + res.top_output.name + "_obf/working_key[" + str(counter) + "] " + str(i) , file=coutfile)
            counter += 1
    '''
    instance = vast.Instance(wmodule, wname, wportlist, wparameterlist)
    instance_list = (instance,)
    parameter_list = ()
    for param in input_module.paramlist.params:
        for decl in param.list:
            parameter_list += (vast.ParamArg(decl.name, vast.Identifier(decl.name)),)
    instances = vast.InstanceList(wmodule, parameter_list, instance_list)
    wrapper.items += (instances,)
    ports = vast.Portlist(wrapper.ports)
    ast = vast.ModuleDef(wrapper.name, wrapper.params, ports, wrapper.definitions + wrapper.items)
    filename = "wrappers/0/" + wrapper_name + '_wrap.v'
    generate_ast(ast, filename)
    print("| 0.CORRECT KEY = " + filename)
    print("------------------------------------------------------------------------------------")
