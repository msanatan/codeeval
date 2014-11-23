import System.IO
import System.Environment
import Control.Monad
import Data.Char


main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode (\handle -> do
        content <- hGetContents handle
        let digits = map sumDigits (lines content)
        mapM_ putStrLn $ map show digits
        )


sumDigits :: String -> Int
sumDigits [] = 0
sumDigits (x:xs) = digitToInt x + sumDigits xs
