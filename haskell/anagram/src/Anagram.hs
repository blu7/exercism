module Anagram (anagramsFor) where
import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor s = filter (isAnagram s)  
   
isAnagram :: String -> String -> Bool
isAnagram a b = x /= y && sort x == sort y
    where
    x = map toLower a
    y = map toLower b
    
