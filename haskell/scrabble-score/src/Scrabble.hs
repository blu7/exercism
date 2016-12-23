module Scrabble (scoreLetter, scoreWord) where
import Data.Map (Map, foldWithKey, fromList)
import qualified Data.Map as M
import Data.Char (toLower, isLetter)

scoreLetter :: Char -> Int
scoreLetter =  scoreLetter' . toLower
    where
        scoreLetter' c = M.foldWithKey (\k v acc -> if c `elem` v then k else acc) 0 scores

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter . filter isLetter

scores :: M.Map Int [Char]
scores = M.fromList [ (1,"aeioulnrst")
                    , (2,"dg")
                    , (3,"bcmp")
                    , (4,"fhvwy")
                    , (5,"k")
                    , (8,"jx")
                    , (10,"qz") ]
