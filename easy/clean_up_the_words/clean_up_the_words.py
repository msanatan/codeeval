#!/usr/bin/env python3
import sys

def clean_up(line):
    output = ''
    word_begin = False
    for c in line:
        c_alpha = c.isalpha()
        if c_alpha:
            output += c.lower()
            word_begin = True
        elif word_begin and not c_alpha:
            output += ' '
            word_begin = False
    return output


if __name__ == '__main__':
    with open(sys.argv[1], 'r') as f:
        for line in f:
            print(clean_up(line))
