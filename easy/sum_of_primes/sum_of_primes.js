var isPrime = function(n) {
    'use strict';
    if (n <= 3) {
        return n >=2;
    }
    else if (n % 2 === 0 || n % 3 === 0) {
        return false;
    }
    for (var i = 5; i * i <= n; i += 6) {
        if (n % i === 0 || n % (i + 2) === 0) {
            return false;
        }
    }
    return true;
};

var sumOfPrimes = function(limit) {
    'use strict';
    var num = 0;
    var primeCount = 0;
    var primeSum = 0;
    
    while (primeCount < limit) {
        if (isPrime(num)) {
            primeSum += num;
            primeCount++;
        }
        num++;
    }
    return primeSum;
};

console.log(sumOfPrimes(1000));
