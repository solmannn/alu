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


class AnalysisBits():
    def __init__(self, name):
        self.module = name
        self.num_constants = 0
        self.num_branches = 0
        self.num_operations = 0
        self.bits_constants = 0
        self.bits_branches = 0
        self.bits_operations = 0


class AnalysisResult:
    def __init__(self):
        self.top_output = None
        self.modules = {}
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

