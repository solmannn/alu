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
from __future__ import absolute_import
from __future__ import print_function

import shutil
import os
import copy

import sys
sys.path.append(os.path.join(os.path.abspath(os.path.dirname(__file__)), '.'))

from optparse import OptionParser

import analysis_data
import obfuscation_data
import obfuscation_techniques
import output_generation

import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import VerilogCodeParser


def analyze_item(item, cfg, res, sig_size, obf_bits):

    if isinstance(item, vast.Pragma):
        if item.entry.name == "obfuscation_off":
            cfg.obfuscate_region = False
        elif item.entry.name == "obfuscation_on":
            cfg.obfuscate_region = True
        return item

    if not cfg.obfuscate_region:
        return item

    if isinstance(item, vast.Identifier):
        return item
    elif isinstance(item, vast.IntConst):
        obf_bits.num_constants += 1
        obf_bits.bits_constants += sig_size
        return item
    elif isinstance(item, vast.FloatConst):
        return item
    elif isinstance(item, vast.StringConst):
        return item
    elif isinstance(item, vast.Concat):
        new_list = ()
        for inst in item.list:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits)
            new_list += (inst,)
        item.list = new_list
        return item
    elif isinstance(item, vast.Repeat):
        item.value = analyze_item(item.value, cfg, res, sig_size, obf_bits)
        return item
    elif isinstance(item, vast.Partselect):
        return item
    elif isinstance(item, vast.Pointer):
        return item
    elif isinstance(item, vast.Lvalue):
        return item
    elif isinstance(item, vast.Rvalue):
        item.var = analyze_item(item.var, cfg, res, sig_size, obf_bits)
    elif isinstance(item, vast.UnaryOperator):
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits)
    elif isinstance(item, vast.Cond):
        item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits)
        item.true_value = analyze_item(item.true_value, cfg, res, sig_size, obf_bits)
        item.false_value = analyze_item(item.false_value, cfg, res, sig_size, obf_bits)
        obf_bits.num_branches += 1
        obf_bits.bits_branches += 1
        return item
    elif isinstance(item, vast.Operator):
        item.left = analyze_item(item.left, cfg, res, sig_size, obf_bits)
        item.right = analyze_item(item.right, cfg, res, sig_size, obf_bits)
        obf_bits.num_operations += 1
        obf_bits.bits_operations += 1
        return item
    elif isinstance(item, vast.Assign):
        left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        item.right.var = analyze_item(item.right.var, cfg, res, left_size, obf_bits)
    elif isinstance(item, vast.Always):
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits)
        return item
    elif isinstance(item, vast.BlockingSubstitution) or isinstance(item, vast.NonblockingSubstitution):
        left_size = obfuscation_techniques.obfuscation_analysis.determine_signal_size(res.top_output, item.left)
        item.left = analyze_item(item.left, cfg, res, left_size, obf_bits)
        item.right = analyze_item(item.right, cfg, res, left_size, obf_bits)
    elif isinstance(item, vast.IfStatement):
        if not obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            item.cond = analyze_item(item.cond, cfg, res, sig_size, obf_bits)
        value = True
        to_switch = False
        if not item.false_statement or isinstance(item.false_statement, vast.IfStatement):
            value = False
        if obfuscation_techniques.obfuscation_analysis.is_reset(item.cond):
            cfg.obfuscate_region = False
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits)
            cfg.obfuscate_region = True
        else:
            item.true_statement = analyze_item(item.true_statement, cfg, res, sig_size, obf_bits)
            if item.false_statement:
                item.false_statement = analyze_item(item.false_statement, cfg, res, sig_size, obf_bits)
            obf_bits.num_branches += 1
            obf_bits.bits_branches += 1
        return item
    elif isinstance(item, vast.ForStatement):
        return item
    elif isinstance(item, vast.WhileStatement):
        return item
    elif isinstance(item, vast.CaseStatement):
        for case in item.caselist:
            case = analyze_item(case, cfg, res, sig_size, obf_bits)
    elif isinstance(item, vast.Case):
        item.statement = analyze_item(item.statement, cfg, res, sig_size, obf_bits)
    elif isinstance(item, vast.Block):
        for st in item.statements:
            st = analyze_item(st, cfg, res, sig_size, obf_bits)
        return item
    elif isinstance(item, vast.Initial):
        return item
    elif isinstance(item, vast.InstanceList):
        for inst in item.instances:
            for port in inst.portlist:
                port.argname = analyze_item(port.argname, cfg, res, sig_size, obf_bits)
        return item
    elif isinstance(item, vast.Function):
        return item
    elif isinstance(item, vast.FunctionCall):
        return item
    elif isinstance(item, vast.SystemCall):
        for inst in item.args:
            inst = analyze_item(inst, cfg, res, sig_size, obf_bits)
        return item
    elif isinstance(item, vast.GenerateStatement):
        return item
    else:
        raise Exception("Type: \"" + str(type(item)) + "\" is not supported yet")
    return item


def perform_module_obfuscation(initial_module, cfg):
    input_module = copy.deepcopy(initial_module)
    module_instance = input_module.name + "_" + str(len(cfg.modules))

    res = analysis_data.AnalysisResult()
    res.top_output = obfuscation_data.ObfuscatedModule(module_instance, input_module.name)
    cfg.modules += (res.top_output,)

    res.top_output.params = input_module.paramlist
    ports = vast.Portlist(res.top_output.ports)

    if cfg.verbose:
        print("=Interface")
    for p in input_module.portlist.ports:
        res.top_output.ports += (p,)

    if cfg.verbose:
        print("=Parameter definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

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

    if cfg.verbose:
        print("=Signal definition")
    for it in input_module.items:
        if type(it) is vast.Decl:
            for p in it.list:
                if not type(p) is vast.Input and not type(p) is vast.Output and not type(p) is vast.Parameter:
                    res.top_output.definitions += (p,)

    if cfg.verbose:
        print("=Items")
    starting_key = 0
    for it in input_module.items:
        if type(it) is vast.Decl:
            continue
        elif type(it) is vast.InstanceList:
            for inst in it.instances:
                int_module = False
                for module in cfg.ast.description.definitions:
                    if type(module) is vast.Pragma:
                        continue
                    if module.name == inst.module:
                        int_module = module
                if int_module:
                    mod_res = perform_module_obfuscation(int_module, cfg)
                    for m in mod_res.modules:
                        res.modules[m] = mod_res.modules[m]
                    res.list_files.extend(mod_res.list_files)
                    it.module = mod_res.top_output.name
    obf_bits = analysis_data.AnalysisBits(res.top_output.name)
    for it in input_module.items:
        if type(it) is vast.Decl:
            continue
        it = analyze_item(it, cfg, res, -1, obf_bits)
        if not type(it) is vast.Pragma:
            res.top_output.items += (it,)
    res.modules[res.top_output.name] = obf_bits
    
    if input_module.name == cfg.top:
        res.write_analysis(cfg)
    for n in res.modules:
        if n != res.top_output.name:
            res.modules[res.top_output.name].num_constants += res.modules[n].num_constants
            res.modules[res.top_output.name].num_branches += res.modules[n].num_branches
            res.modules[res.top_output.name].num_operations += res.modules[n].num_operations
            res.modules[res.top_output.name].bits_constants += res.modules[n].bits_constants
            res.modules[res.top_output.name].bits_branches += res.modules[n].bits_branches
            res.modules[res.top_output.name].bits_operations += res.modules[n].bits_operations
    if input_module.name == cfg.top:
        top_obf_bits = res.modules[res.top_output.name]
        tot_bits = top_obf_bits.bits_constants + top_obf_bits.bits_branches + top_obf_bits.bits_operations
        print("")
        print("------------------------------------------------------------------------------------")
        print("|- Total number of bits             = " + str(tot_bits))
        print("------------------------------------------------------------------------------------")

    ports = vast.Portlist(res.top_output.ports)
    ast = vast.ModuleDef(res.top_output.name, res.top_output.params, ports,
                         res.top_output.definitions + res.top_output.items)

    # generation of verilog files
    v_filename = "hdl/" + res.top_output.name + ".v"
    output_generation.generate_ast(ast, v_filename)
    res.list_files.append([res.top_output.name, v_filename])

    print("")
    return res


def main():
    INFO = "ASSURE: Algorithmic-Level Obfuscation"
    VERSION = 1.0
    USAGE = "Usage: python analyze_design.py -t top_name ..."

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
    # options related to design analysis
    optparser.add_option("-z", "--analyze", action="store_true", dest="analyze_design",
                         default=False, help="Analyze the design to determine how many key bits are needed")

    ### execution setup
    (options, args) = optparser.parse_args()
    if options.showversion or len(args) == 0:
        showVersion()
    cfg = analysis_data.AnalysisConfig(options, args)
    ### setup is completed

    ### parsing of input files
    codeparser = VerilogCodeParser(cfg.filelist, preprocess_include=cfg.includes, preprocess_define=cfg.defines, debug=False)
    cfg.ast = codeparser.parse()
    if cfg.verbose:
        cfg.ast.show()
    ### input files correctly parsed

    print("")
    ### performing hierarchial analysis
    top_module = None
    for module in cfg.ast.description.definitions:
        if isinstance(module, vast.ModuleDef):
            if module.name == options.top:
                top_module = module
    if not top_module:
        raise Exception("Top module \"" + options.top + "\" is missing")
    res = perform_module_obfuscation(top_module, cfg)
    ### analysis is completed

    print("------------------------------------------------------------------------------------")
    for f in res.list_files:
        spaces = 30 - len(f[0])
        print("| " + f[0] + ' '*spaces + " | File = \"" + f[1] + "\"")
    print("------------------------------------------------------------------------------------")

    ### clean output
    if os.path.isdir("__pycache__"):
        shutil.rmtree("__pycache__")
    if os.path.isfile("parsetab.py"):
        os.remove("parsetab.py")
    ### everything is completed

if __name__ == '__main__':
    main()
