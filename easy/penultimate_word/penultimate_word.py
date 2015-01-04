#!/usr/bin/env python
import sys

def penultimate_word(line):
    words = line.split(' ')
    return words[len(words) - 2]


if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as f:
        for line in f:
            print penultimate_word(line)
