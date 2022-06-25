#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
import sys
biggest_amount = {}
smaller_amount = {}

def set_bigger_smaller_amount(biggest_amount, smaller_amount, actual_element):
    element_array = actual_element.split("*")
    biggest_amount[element_array[0]] = max(
        float(biggest_amount.get(element_array[0]) or 0), float(element_array[1]))
    smaller_amount[element_array[0]] = min(
        float(smaller_amount.get(element_array[0]) or 10000), float(element_array[1]))
    return biggest_amount, smaller_amount

for line in sys.stdin:
    set_bigger_smaller_amount(biggest_amount, smaller_amount, line)

for max, min in zip(biggest_amount.items(), smaller_amount.items()):
    print( max[0] + "	" + str(max[1]) + "	" + str(min[1]) )