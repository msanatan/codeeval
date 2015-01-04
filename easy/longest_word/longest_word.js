#!/usr/bin/env node
var fs = require('fs');

var longestWord = function(line) {
    'use strict';
    var words = line.split(' ');
    return words.reduce(function(a, b) {
        var longer = a.length >= b.length ? a : b;
        return longer;
    });
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
    'use strict';
    console.log(longestWord(line));
});