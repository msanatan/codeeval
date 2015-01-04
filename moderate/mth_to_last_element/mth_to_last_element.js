#!/usr/bin/env node
var fs = require('fs');

var mthElement = function(list, m) {
    return list[list.length - m];
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
    'use strict';
    var list = line.split(' ');
    var m = list.splice(list.length - 1, list.length)[0];
    if (m <= list.length) {
        console.log(mthElement(list, m));
    }
});