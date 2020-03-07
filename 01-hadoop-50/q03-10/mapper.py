import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        l = ""
        v = 0
                
        line = line.strip()
        splits = line.split(',')
        l= splits[0]
        v = splits[1]
        
        sys.stdout.write("{}\t{}\n".format(valor,letra))