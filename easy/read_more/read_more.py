#!usr/bin/env python3
import sys

def read_more(sentence):
    sentence = sentence.rstrip()
    if len(sentence) <= 55:
        print(sentence)
    else:
        sentence = sentence[:40]
        if ' ' in sentence:
            sentence = sentence[:sentence.rfind(' ')]
        print(sentence + '... <Read More>')


if __name__ == '__main__':
    with open(sys.argv[1], 'r') as f:
        for line in f:
            read_more(line)

