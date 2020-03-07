import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    Current_clave= None
    Acumulado = 0

    for line in sys.stdin:

        clave, valor = line.split(",")
        valor = int(valor)

        if clave == Clave_act:
        
            Acumulado += valor
        else:
         
            if Current_clave is not None:
           
                sys.stdout.write("{},{}\n".format(Clave_act, Acumulado))

            Current_clave= clave
            Acumulado = valor

    sys.stdout.write("{},{}\n".format(Clave_act, Acumulado))
