import System.IO
import System.Environment
import Control.Monad

main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode (\handle -> do
        content <- hGetContents handle
        let fizzBuzzResults = map getFB $ map getFBArgs $ lines content
        mapM_ putStrLn fizzBuzzResults
        )

getFBArgs :: String -> [Int]
getFBArgs line = map read $ words line

fizzBuzz :: Int -> Int -> Int -> String
fizzBuzz divisorX divisorY n
    | mod n divisorX == 0   = if mod n divisorY == 0 then "FB" else "F"
    | mod n divisorY == 0   = "B"
    | otherwise             = show n

getFBLine :: Int -> Int -> [Int] -> String
getFBLine divisorX divisorY [n] = fizzBuzz divisorX divisorY n
getFBLine divisorX divisorY (n:ns) = fizzBuzz divisorX divisorY n ++ " " ++ getFBLine divisorX divisorY ns

getFB :: [Int] -> String
getFB fbArgs = getFBLine argX argY [1..argN]
    where
    argX = fbArgs !! 0
    argY = fbArgs !! 1
    argN = fbArgs !! 2
