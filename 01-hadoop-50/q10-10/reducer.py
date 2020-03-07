import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':
    Current_clav= None
    list=[]
    for line in sys.stdin:
        clave, valor=line.split("\t")
        valor=int(valor.replace("\n",""))
        if clave==Current_clav:
            list.append(valor)
        else:
            if Current_clav is not None:
                list.sort()
                sys.stdout.write(Current_clav+"\t")
                for i in range(len(list)):
                    if i<len(list)-1:
                        sys.stdout.write(str(list[i])+",")
                    else:
                        sys.stdout.write(str(list[i])+"\n")
                list=[]
            Current_clav=clave
            list.append(valor)
    
    list.sort()
    sys.stdout.write(Current_clav+"\t")
    for i in range(len(list)):
        if i<len(list)-1:
            sys.stdout.write(str(list[i])+",")
        else:
            sys.stdout.write(str(list[i])+"\n")            

	
