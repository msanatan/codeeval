import System.IO
import System.Environment
import Control.Monad
import Data.Char

main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode(\handle -> do
        content <- hGetContents handle
        let allLower = map allLowerCase (lines content)
        mapM_ putStrLn allLower
        )


allLowerCase :: String -> String
allLowerCase = map toLower
