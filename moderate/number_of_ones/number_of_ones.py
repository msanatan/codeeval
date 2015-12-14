#!usr/bin/env python3

import sys

if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as f:
        for line in f:
            line = line.strip()
            if line:
                print(len(list(filter(lambda x: x == '1', str(bin(int(line)))[2:]))))

