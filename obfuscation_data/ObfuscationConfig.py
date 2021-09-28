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


class ObfuscationConfig:
    def __init__(self, options, args,file_name,top_name):
        self.verbose = True#options.verbose
        self.file_name=file_name
        self.obfuscate_consts = -1
        if options.obfuscate_const:
            self.obfuscate_consts = int(options.obfuscate_const)
        self.obfuscate_branch = options.obfuscate_branch
        self.obfuscate_ops = options.obfuscate_ops
        self.spurious_ops=options.spurious_ops
        self.dummy_states=options.dummy_states
        self.spurious_trans=options.spurious_trans
        if options.obfuscate_all:
            self.obfuscate_consts = 0
            self.obfuscate_branch = True
            self.obfuscate_ops = True
        self.obfuscate_region = True
        self.obfuscate = (self.obfuscate_consts >= 0) or self.obfuscate_branch or self.obfuscate_ops
        self.top = top_name
        self.ast = None
        self.modules = ()
        self.output_files = ()
        file_list=[]
        file_list.append(file_name)
        self.filelist = file_list#args
        self.includes = options.include
        self.defines = options.define
        for f in self.filelist:
            if not os.path.exists(f): raise IOError("file not found: " + f)

        self.input_key = ""
        self.working_key = ""
        if not options.top:
            raise Exception("Missing --top option")

        if not options.input_key:
            raise Exception("Missing --locking_key option")
        elif not os.path.exists(options.input_key):
            raise IOError("locking file not found: " + options.input_key)

        #print("options.input_key")
        #print(options.input_key)
        #file = open(options.input_key, "r")
        for line in open(options.input_key):
            if line.strip():           # line contains eol character(s)
                n = int(line) 
                self.input_key=self.input_key+str(n)

        #self.input_key = file.read()
        #file.close()
        #print(self.input_key[0])
        self.input_key = self.input_key[::-1]
        self.wrong_keys = int(options.wrong_keys)
        self.unfold_key = options.unfold_key
        if len(self.input_key) == 0:
            raise Exception("Empty locking key")
        print("")
        print("------------------------------------------------------------------------------------")
        print("| Number of input key bits         = " + str(len(self.input_key)))
        if options.wrong_keys > 0:
            print("| Number of wrong keys to generate = " + str(self.wrong_keys))
        print("------------------------------------------------------------------------------------")
