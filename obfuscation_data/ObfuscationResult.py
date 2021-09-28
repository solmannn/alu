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


class ObfuscationBits():
    def __init__(self, name):
        self.module = name
        self.num_constants = 0
        self.num_branches = 0
        self.num_operations = 0
        self.bits_constants = 0
        self.bits_branches = 0
        self.bits_operations = 0


class ObfuscationResult:
    def __init__(self):
        self.top_output = None
        self.modules = {}
        self.num_consts = 0
        self.num_branches = 0
        self.num_ops = 0
        self.num_reset = 0
        self.num_transitions_bits=0
        self.num_transitions=0
        self.dummy_ops=0
        self.dummy_ops_bits=0
        self.list_files = []

    def write_analysis(self, cfg):
        print("------------------------------------------------------------------------------------")
        print("| Original module                    = \"" + self.top_output.module_name + "\"")
        print("| Output module                      = \"" + self.top_output.name + "\"")
        print("------------------------------------------------------------------------------------")
        spaces = 0
        spaces_bits = 0
        for n in self.modules:
            spaces = max(spaces, len(str(self.modules[n].num_constants)), len(str(self.modules[n].num_branches)), len(str(self.modules[n].num_operations)))
            spaces_bits = max(spaces_bits, len(str(self.modules[n].bits_constants)), len(str(self.modules[n].bits_branches)), len(str(self.modules[n].bits_operations)))
        for n in self.modules:
            print("- Module = " + n)
            print("|- Number of bits for constants     = " + ' ' * (spaces - len(str(self.modules[n].num_constants))) + str(self.modules[n].num_constants) + " CONSTANTS  / " + ' ' * (spaces_bits - len(str(self.modules[n].bits_constants))) + str(self.modules[n].bits_constants) + " BITS")
            print("|- Number of bits for branches      = " + ' ' * (spaces - len(str(self.modules[n].num_branches))) + str(self.modules[n].num_branches) + " BRANCHES   / " + ' ' * (spaces_bits - len(str(self.modules[n].bits_branches))) + str(self.modules[n].bits_branches) + " BITS")
            print("|- Number of bits for operations    = " + ' ' * (spaces - len(str(self.modules[n].num_operations))) + str(self.modules[n].num_operations) + " OPERATIONS / " + ' ' * (spaces_bits - len(str(self.modules[n].bits_operations))) + str(self.modules[n].bits_operations) + " BITS")
            print("|- Total number of bits (module)    = " + str(self.modules[n].bits_constants + self.modules[n].bits_branches + self.modules[n].bits_operations))
        print("------------------------------------------------------------------------------------")

    def write_report(self, cfg):
        const_bits = self.top_output.key_bits - self.num_ops - self.num_branches-self.num_transitions_bits-self.dummy_ops
        spaces = max(len(str(self.num_consts)), len(str(self.num_branches)), len(str(self.num_ops)))
        spaces_bits = max(len(str(const_bits)), len(str(self.num_branches)), len(str(self.num_ops)))
        '''
        print("------------------------------------------------------------------------------------")
        print("| Original module                    = \"" + self.top_output.module_name + "\"")
        print("| Obfuscated module                  = \"" + self.top_output.name + "\"")
        print("------------------------------------------------------------------------------------")
        print("| Number of obfuscated constants     = " + ' ' * (spaces - len(str(self.num_consts))) + str(self.num_consts) + " CONSTANTS  / " + ' ' * (spaces_bits - len(str(const_bits))) + str(const_bits) + " BITS")
        print("| Number of obfuscated branches      = " + ' ' * (spaces - len(str(self.num_branches))) + str(self.num_branches) + " BRANCHES   / " + ' ' * (spaces_bits - len(str(self.num_branches))) + str(self.num_branches) + " BITS")
        print("| Number of obfuscated operations    = " + ' ' * (spaces - len(str(self.num_ops))) + str(self.num_ops) + " OPERATIONS / " + ' ' * (spaces_bits - len(str(self.num_ops))) + str(self.num_ops) + " BITS")
        print("| Number of dummy transition     = " + ' ' * (spaces - len(str(self.num_transitions))) + str(self.num_transitions) + " TRANSITIONS / " + ' ' * (spaces_bits - len(str(self.num_transitions))) + str(self.num_transitions_bits) + " BITS")
        print("| Number of dummy operations     = " + ' ' * (spaces - len(str(self.dummy_ops))) + str(self.dummy_ops) + " OPERATIONS / " + ' ' * (spaces_bits - len(str(self.dummy_ops))) + str(self.dummy_ops) + " BITS")
        # print ("| Number of module key bits          = " + str(res.top_output.key_bits))
        # print ("| Number of internal key bits        = " + str(res.top_output.initial_working_key + res.top_output.key_bits))
        #print("------------------------------------------------------------------------------------")
        print("| Number of module logic key bits    = " + str(self.top_output.key_bits) + " BITS")

        print("| Current number of used key bits    = " + str(len(cfg.working_key)) + " BITS")
        print("------------------------------------------------------------------------------------")
        '''
        self.top_output.key_bits = self.top_output.initial_working_key + self.top_output.key_bits

