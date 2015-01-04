#!/usr/bin/env python
import sys

def trailing_word(word1, word2):
    if word2 in word1:
        if word1[-len(word2):] == word2:
            return 1
        else:
            return 0
    else:
        return 0


if __name__ == '__main__':
    with open(sys.argv[1], 'rb') as f:
        for line in f:
            words = [x.strip() for x in line.split(',')]
            print trailing_word(words[0], words[1])
