module Series (largestProduct) where
import Data.Char

largestProduct :: (Integral a) => a -> String -> a
largestProduct n xs = undefined --maximum . products . toIntList $ splitConsecutiveSubstrings n xs

products :: (Integral a) => [[a]] -> [a]
products = map (foldr (*) 1)

toIntList :: (Integral a) => [String] -> [[Int]]
toIntList = map (map digitToInt)

splitConsecutiveSubstrings :: (Integral a) => a -> String -> [String]
splitConsecutiveSubstrings n xs
    | (fromIntegral $ length xs) < n = []
    | otherwise                      = let head' = take n xs
                                       in head' : splitConsecutiveSubstrings n (tail xs)

