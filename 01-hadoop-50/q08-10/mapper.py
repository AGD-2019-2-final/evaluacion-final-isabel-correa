import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':
    for line in sys.stdin:
        line = line.replace('\n','')
        sys.stdout.write(line.split('   ')[0].replace('\t','').replace('\n','')+'\t'+line.split('   ')[2].replace('\t','')+'\n')