import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Current_clave = None
    Same_let = []

    for line in sys.stdin:
        
        Clave,fecha,valor = line.split(',')
        
        if Clave == Current_clave:
            Same_let.append([int(valor.replace('\n','')),Clave,fecha])

        else:
            if Current_clave is not None:
                Same_let.sort()
                for i in Same_let:
                    sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')
                Same_let = []
            
            Current_clave = Clave
            Same_let.append([int(valor.replace('\n','')),Clave,fecha])
    Same_let.sort()
    for i in Same_let:
        sys.stdout.write(i[1]+'   '+i[2]+'   '+str(i[0])+'\n')