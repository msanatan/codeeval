#!/usr/bin/env node
var fs = require('fs');

// Used to determine the score of matches and mismatches
var substitutionMatrix = {
  'A' : {'A': 3, 'T': -3, 'C': -3, 'G': -3},
  'T' : {'A': -3, 'T': 3, 'C': -3, 'G': -3},
  'C' : {'A': -3, 'T': -3, 'C': 3, 'G': -3},
  'G' : {'A': -3, 'T': -3, 'C': -3, 'G': 3}
};

var getSequences = function(toBeAligned, delimiter) {
  'use strict';
  var sequences = toBeAligned.split(delimiter).map(function(s) {
    return s.trim();
  });
  return sequences;
};

var create2DArray = function(rows, columns) {
  'use strict';
  var arr = [];
  for (var i = 0; i < rows; i++) {
    arr[i] = new Array(columns);
  }
  return arr;
};

/*
* Gap penalty is determined by whether a gap penalty occurred previously, so
* we use an object that stores where gap penalties have occurred before.
* This helps to easily differentiate an 'Indel start' from an extension.
*/
var GapPenalty = function(rows, columns) {
  'use strict';
  var arr = create2DArray(rows, columns);
  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < columns; j++) {
      arr[i][j] = false;
    }
  }

  this.setTrue = function(r, c) {
    arr[r][c] = true;
  };

  this.getPenalty = function(lastR, lastC) {
    if (arr[lastR][lastC]) {
      return -1;
    }
    else {
      return -8;
    }
  };
};

var needlemanWunsch = function(seq1, seq2, subMatrix) {
  'use strict';
  var rows, columns, gapPenalty, alignMatrix, i, j, subScore, delScore,
      inScore, maxScore;
  rows = seq1.length + 1;
  columns = seq2.length + 1;
  gapPenalty = new GapPenalty(rows, columns);
  alignMatrix = create2DArray(rows, columns);

  // Initialise first row and column for Needleman-Wunsch algorithm
  alignMatrix[0][0] = 0;
  for (i = 1; i < rows; i++) {
    alignMatrix[i][0] = alignMatrix[i-1][0] + gapPenalty.getPenalty(i-1, 0);
    gapPenalty.setTrue(i, 0);
  }
  for (j = 1; j < columns; j++) {
    alignMatrix[0][j] = alignMatrix[0][j-1] + gapPenalty.getPenalty(0, j-1);
    gapPenalty.setTrue(0, j);
  }

  for (i = 1; i < rows; i++) {
    for (j = 1; j < columns; j++) {
      subScore = alignMatrix[i-1][j-1] + subMatrix[seq1[i-1]][seq2[j-1]];
      delScore = alignMatrix[i-1][j] + gapPenalty.getPenalty(i-1, j);
      inScore = alignMatrix[i][j-1] + gapPenalty.getPenalty(i, j-1);
      maxScore = Math.max(subScore, delScore, inScore);
      alignMatrix[i][j] = maxScore;

      // Set if a gap penalty was chosen
      if (subScore !== maxScore) {
        gapPenalty.setTrue(i, j);
      }
    }
  }
  return alignMatrix[rows-1][columns-1];
};

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
  'use strict';
  if (line !== "") {
    var sequences = getSequences(line, '|');
    console.log(needlemanWunsch(sequences[0], sequences[1], substitutionMatrix));
  }
});
