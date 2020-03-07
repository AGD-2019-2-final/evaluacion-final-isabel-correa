import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Current_clav = None
    Same_let = []

    for line in sys.stdin:
        
        Clave,date,valor = line.split(',')
        
        Same_let.append([int(valor.replace('\n','')),Clave,date])

    Same_let.sort()

    for i in range(6):
        sys.stdout.write(Same_let[i][1]+'   '+Same_let[i][2]+'   '+str(Same_let[i][0])+'\n')