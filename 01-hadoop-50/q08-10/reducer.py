import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    Current_clav = None
    Sum_list=[]

    for line in sys.stdin:

        clave, valor = line.split("\t")
        valor = float(valor)

        if clave == Current_clav:
            Sum_list.append(float(valor))
        else:
            if Current_clav is not None:
                suma=sum(Sum_list)
                elementos=len(Sum_list)
                
                sys.stdout.write(Current_clav.replace("\n","")+"       "+str(suma)+" "+str(suma/elementos)+"\n")
            Current_clav = clave    
            Sum_list=[]
            Sum_list.append(float(valor))
    suma=sum(Sum_list)
    elementos=len(Sum_list)
    sys.stdout.write(Current_clav.replace("\n","")+"       "+str(suma)+" "+str(round(suma/elementos,3))+"...\n")