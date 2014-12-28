import System.IO
import System.Environment
import Control.Monad


subsequentLists :: [Int] -> [[Int]]
subsequentLists [x] = [[x]]
subsequentLists (x:xs) = subsequentListsAux (x:xs) ++ subsequentLists xs

subsequentListsAux :: [Int] -> [[Int]]
subsequentListsAux [x] = [[x]]
subsequentListsAux xs = [xs] ++ (subsequentListsAux $ take (length xs - 1) xs)

getMaxFromSequence :: [Int] -> Int
getMaxFromSequence xs = maximum $ map sum $ subsequentLists xs

split :: Eq a => a -> [a] -> [[a]]
split d [] = []
split d s = x : split d (drop 1 y) where (x,y) = span (/= d) s

f :: [String] -> [Int]
f = map read

main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode (\handle -> do
        content <- hGetContents handle
        let sum_seq_results = map getMaxFromSequence (map f $ map (split ',') $ lines content)
        mapM_ print sum_seq_results
        )
