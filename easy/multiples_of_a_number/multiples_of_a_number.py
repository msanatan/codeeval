#!/usr/bin/env python
import csv
import sys

def find_highest_multiple(limit, num):
    result = num
    while (result < limit):
        result += num
    return result


if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as csvfile:
        mult_reader = csv.reader(csvfile, delimiter=',')
        for row in mult_reader:
            print find_highest_multiple(int(row[0]), int(row[1]))
