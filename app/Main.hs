{-# LANGUAGE ScopedTypeVariables #-}

import qualified Data.ByteString.Lazy as BL
import Data.Csv
import Data.List
import qualified Data.Vector as V
import System.Environment

main :: IO ()
main = do
    (fileName:_) <- getArgs
    csvData <- BL.readFile (fileName)
    case decode NoHeader csvData of
        Left err -> putStrLn err
        Right vector -> V.forM_ vector $ \ xs ->
            putStrLn $ intercalate "|" xs
