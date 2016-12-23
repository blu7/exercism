module Raindrops (convert) where

convert :: Int -> String
convert x = case raindrops x of
                 [] -> show x
                 _  -> concatMap convert' (raindrops x)
    where
        convert' 3 = "Pling"
        convert' 5 = "Plang"
        convert' 7 = "Plong"
        convert' _ = ""

raindrops :: Int -> [Int]
raindrops x = filter (`isFactor` x) [3,5,7]

isFactor :: Int -> Int -> Bool
isFactor x = (0==) . (`mod` x)
