import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        line.split(' ')
        sys.stdout.write(line[0] + ',1\n')
