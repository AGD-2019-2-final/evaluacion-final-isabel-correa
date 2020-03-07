import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    current_key = None
    total = 0

    for line in sys.stdin:

        key, value = line.split(",")
        value = int( value)

        if key == current_key:

            total += value
        else:
            if current_key is not None:
                sys.stdout.write("{},{}\n".format( current_key, total ) )

            current_key = key
            total = value

    sys.stdout.write("{},{}\n".format( current_key, total ) )
    
