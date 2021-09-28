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


class AnalysisConfig:
    def __init__(self, options, args):
        self.verbose = options.verbose

        self.analyze_design = options.analyze_design
        self.obfuscate_region = True

        self.top = options.top
        self.ast = None
        self.modules = ()
        self.output_files = ()

        self.filelist = args
        self.includes = options.include
        self.defines = options.define
        for f in self.filelist:
            if not os.path.exists(f): raise IOError("file not found: " + f)
