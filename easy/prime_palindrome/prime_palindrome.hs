import System.IO
import Control.Monad

-- Prime algorithm taken from Wikipedia:
-- http://en.wikipedia.org/wiki/Primality_test

main :: IO()
main = do
    let palindromes = getPrimePalindromes 1000
    print $ palindromes !! (length palindromes - 1)

isPrime :: Int -> Bool
isPrime n
    | n <= 3                                            = n >= 2
    | mod n 2 == 0 || mod n 3 == 0  || primeFormTest n  = False
    | otherwise                                         = True

primeFormTest :: Int -> Bool
primeFormTest n = primeFormTestAux n sixKRange
    where
    sixKRange = [5, 11..rootN]
    rootN = floor $ sqrt $ fromIntegral n

primeFormTestAux :: Int -> [Int] -> Bool
primeFormTestAux _ [] = False
primeFormTestAux n (i:is)
    | mod n i == 0 || mod n (i + 2) == 0    = True
    | otherwise                             = primeFormTestAux n is

isPalindrome :: String -> Bool
isPalindrome palin = palinFirstHalf == reverse palinSecondHalf
    where
    palinFirstHalf = take firstHalf palin
    palinSecondHalf = drop secondHalf palin
    firstHalf = length palin `div` 2
    secondHalf = if length palin `mod` 2 == 0 then firstHalf else firstHalf + 1

getPrimePalindromes :: Int -> [Int]
getPrimePalindromes n = map read $ filter isPalindrome $ map show $ filter isPrime [1..n]