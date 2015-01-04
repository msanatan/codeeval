import System.IO
import System.Environment

main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode (\handle -> do
        content <- hGetContents handle
        let fizzBuzzResults =  map getEven (f $ lines content)
        mapM_ putStrLn fizzBuzzResults
        )

f :: [String] -> [Int]
f = map read

getEven :: Int -> String
getEven x   | even x    = "1"
            | otherwise = "0"