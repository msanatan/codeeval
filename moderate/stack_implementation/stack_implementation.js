#!/usr/bin/env node
var fs = require('fs');

var Stack = function() {
    'use strict';
    var stack = [];
    
    this.isEmpty = function() {
        return stack.length === 0;
    };
    
    this.push = function(num) {
        stack[stack.length] = num;
    };
    
    this.pop = function() {
        return stack.pop();
    };
}

var alternatePop = function(list, step) {
    'use strict';
    var stack = new Stack();
    var arr = [];
    for (var i = 0; i < list.length; i++) {
        stack.push(list[i]);
    }
    
    var count = 0;
    while (!stack.isEmpty()) {
        if (count % step === 0) {
            arr[arr.length] = stack.pop();
        }
        else{
            stack.pop();
        }
        count++;
    }
    
    return arr.join(' ');
};


fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
    'use strict';
    console.log(alternatePop(line.split(' '), 2));
});