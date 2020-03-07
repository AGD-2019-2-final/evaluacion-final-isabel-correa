import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:
        sys.stdout.write(line.split("   ")[0].replace("\n","").replace("\t","")+","+line.split("   ")[1]+","+line.split("   ")[2].replace("\t","").replace("\n","")+"\n")
