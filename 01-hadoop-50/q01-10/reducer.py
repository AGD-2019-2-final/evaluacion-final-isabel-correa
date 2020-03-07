import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_0 = None
    total = 0

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = int(valor)

        if clave == Clave_0:
        
            total += valor
        else:
         
            if Clave_0 is not None:
           
                sys.stdout.write("{}\t{}\n".format(Clave_0, total))

            Clave_0 = clave
            total = valor

    sys.stdout.write("{}\t{}\n".format(Clave_act, total))