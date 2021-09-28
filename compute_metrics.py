from optparse import OptionParser
import shlex

def main():
    INFO = "ASSURE: Algorithmic-Level Obfuscation Analyzer"
    VERSION = 1.0
    USAGE = "Usage: python analyzer.py -g golden.dat -i data"

    def showVersion():
        print(INFO)
        print(VERSION)
        print(USAGE)
        sys.exit()

    optparser = OptionParser()
    optparser.add_option("-V","--version",action="store_true",dest="showversion",
                         default=False,help="Show the version")
    optparser.add_option("-g","--golden-data",action="store",dest="golden_data",
                         default=False,help="Specify the golden data")

    (options, args) = optparser.parse_args()

    if options.showversion:
        showVersion()

    print("Golden data: ", options.golden_data)
    print("Input data : ", args)

    file = open(options.golden_data, "r")
    golden_data = file.readlines()

    errors = 0
    bits = 0
    collisions = 0
    tests = 0
    for f in args:
        file_in = open(f, "r")
        input_data = file_in.readlines()
        if len(input_data) != len(golden_data):
            Exception("Error")
        for g in golden_data:
            g = g[:-1]
            gd = shlex.split(g)
            for i in input_data:
                i = i[:-1]
                ind = shlex.split(i)
            local_errors = 0
            local_bits = 0
            for idx in range(0, len(gd)):
                for ll in range(0, len(gd[idx])):
                    local_bits += 1
                    if gd[idx][ll] != ind[idx][ll]:
                        local_errors += 1
            print(str(gd) + " <--> " + str(ind) + " = " + str(local_errors) + " / " + str(local_bits))
            tests += 1
            if local_errors == 0:
                print ("   --> COLLISION!!!")
                collisions += 1 
            bits += local_bits
            errors += local_errors
    print (str(errors) + " / " + str(bits))
    HD = 100.0 * float(errors) / float(bits)

    print ("Output Corruptability = " + str(HD) + "%")
    print ("Number of collisions  = " + str(collisions) + " / " + str(tests) )

if __name__ == '__main__':
    main()
