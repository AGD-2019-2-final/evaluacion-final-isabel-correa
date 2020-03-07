import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    ultiProp = None
    v = None
    ultVal = None

    for line in sys.stdin:

        valor, l = line.split()
                           
        sys.stdout.write("{},{}\n".format(l,v)