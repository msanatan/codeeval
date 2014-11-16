#!/usr/bin/env python
import sys

def reverse_words(sentence):
    reverse_words = sentence.split(' ')[::-1]
    return ' '.join(reverse_words)


def get_sentences(input_file):
    with open(input_file, 'r') as f:
        data = f.read()
        sentences = data.split('\n')
        return filter(lambda x: x != '', sentences)


def reverse_sentences(input_file):
    sentences = [reverse_words(x) for x in get_sentences(input_file)]
    return '\n'.join(sentences)
    

if __name__ == '__main__':
    print reverse_sentences(sys.argv[1])
