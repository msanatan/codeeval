#!/usr/bin/env node
var fs = require('fs');

var subWord = function(word) {
    'use strict';
    switch (word) {
        case 'zero':
            return 0;
        case 'one':
            return 1;
        case 'two':
            return 2;
        case 'three':
            return 3;
        case 'four':
            return 4;
        case 'five':
            return 5;
        case 'six':
            return 6;
        case 'seven':
            return 7;
        case 'eight':
            return 8;
        case 'nine':
            return 9;
        default:
            return NaN;
    }
};

var wordToDigits = function(line) {
    'use strict';
    var words = line.split(';');
    var num = '';
    for (var i = 0; i < words.length; i++) {
        num += subWord(words[i]);
    }
    return num;
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
    console.log(wordToDigits(line));
});