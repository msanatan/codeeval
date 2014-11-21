var fs  = require("fs");

var nonRepeatedCharacters = function(randomString) {
    'use strict';
    var currentChar, laterChar;
    var repeat = [];
    
    for (var i = 0; i < randomString.length; i++) {
        currentChar = randomString.charAt(i);
        //console.log(currentChar);
        for (var j = i + 1; j < randomString.length; j++) {
            laterChar = randomString.charAt(j);
            if (randomString.charAt(j) === currentChar) {
                repeat.push(laterChar);
                break;
            }
        }
        if (repeat.indexOf(currentChar) === -1) {
            return currentChar;
        }
    }
    return '';
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        console.log(nonRepeatedCharacters(line));
    }
});