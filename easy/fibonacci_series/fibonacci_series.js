#!/usr/bin/env node
'use strict';
var fs = require('fs');

var fib = function(N) {
    switch (N) {
        case 0:
            return 0;
        case 1:
            return 1;
        default:
            return fib(N-1) + fib(N-2);
    }
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line !== "") {
        console.log(fib(parseInt(line)));
    }
});
