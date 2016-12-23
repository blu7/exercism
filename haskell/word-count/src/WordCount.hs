module WordCount (wordCount) where
import qualified Data.Map as M
import Data.Char (toLower, isSpace, isAlphaNum)

wordCount :: String -> M.Map String Int 
wordCount s = let filteredWords = words $ filter (\x -> isAlphaNum x || isSpace x) (map toLower s) in
                let makePairs s = (s, length $ filter (==s) filteredWords) in
                  M.fromList (map makePairs filteredWords)

