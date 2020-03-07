import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Current_clave = None
    Acumulado = 0

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = int(valor)

        if clave == Current_clave:
        
            Acumulado += valor
        else:
         
            if Current_clave is not None:
           
                sys.stdout.write("{}\t{}\n".format(Current_clave, Acumulado))

            Current_clave = clave
            Acumulado = valor

    sys.stdout.write("{}\t{}\n".format(Current_clave, Acumulado))
