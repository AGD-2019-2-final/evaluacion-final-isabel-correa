import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Clave_0 = None
    Valor_actual = 0

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = int(valor)

        if clave == Clave_0:
            if Valor_actual > valor:
                Valor_actual = Valor_actual
            else:
                Valor_actual = valor
        else:
         
            if Clave_0 is not None:
           
                sys.stdout.write("{}\t{}\n".format(Clave_0, Valor_actual))

            Clave_0 = clave
            Valor_actual = valor

    sys.stdout.write("{}\t{}\n".format(Clave_0, Valor_actual))