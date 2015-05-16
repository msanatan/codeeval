import System.IO
import System.Environment
import Control.Monad
import Data.List.Split

main :: IO()
main = do
	args <- getArgs
	withFile (head args) ReadMode(\handle -> do
		content <- hGetContents handle
		let allMods = map (getModAux . getModArgs) (lines content)
		mapM_ (putStrLn . show) allMods
		)

getModArgs :: String -> [Int]
getModArgs args = map read $ splitOn "," args

getModAux :: [Int] -> Int
getModAux xs = getMod (xs !! 0) (xs !! 1)

getMod :: Int -> Int -> Int
getMod x y 	| x < y = x
			| otherwise = getMod (x - y) y
