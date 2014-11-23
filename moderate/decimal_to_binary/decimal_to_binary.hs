import System.IO
import System.Environment
import Control.Monad
import Data.Char


main :: IO()
main = do
    args <- getArgs
    withFile (head args) ReadMode (\handle -> do
        content <- hGetContents handle
        let binary = map ((concat . map show) . getBinary . read) $ lines content
        mapM_ putStrLn binary
        )


getBinary :: Integer -> [Integer]
getBinary 0 = [0]
getBinary 1 = [1]
getBinary x | mod x 2 == 0  = getBinary (div x 2) ++ [0]
            | otherwise     = getBinary (div x 2) ++ [1]
