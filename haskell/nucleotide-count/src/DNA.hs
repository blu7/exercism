module DNA (count, nucleotideCounts) where
import Data.Map (Map)
import qualified Data.Map as Map

count :: Char -> String -> Either String Int
count c s | isValidDNA c && all isValidDNA s = Right $ count' c s
          | otherwise                        = Left "No valid input."

count' :: Char -> String -> Int
count' c s = length $ filter (==c) s
    
nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts s | all isValidDNA s = Right $ makeMap                                       
                   | otherwise        = Left "No valid input."
    where
    makeMap = Map.fromList (map makePair "ATCG")        
    makePair x = (x, count' x s)     

isValidDNA :: Char -> Bool
isValidDNA c = c == 'A' || c == 'T' || c == 'C' || c == 'G'

exer
