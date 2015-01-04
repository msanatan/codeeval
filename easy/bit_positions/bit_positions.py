#!/usr/bin/env python
import sys
import csv

def equal_bit_positions(val, pos1, pos2):
    bin_val = bin(val)
    if bin_val[-pos1] == bin_val[-pos2]:
        return 'true'
    else:
        return 'false'


if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as csvfile:
        bit_pos = csv.reader(csvfile, delimiter=',')
        for row in bit_pos:
            print equal_bit_positions(int(row[0]), int(row[1]), int(row[2]))
