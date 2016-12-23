module Grains (square, total) where
import Data.Maybe(mapMaybe)
grains :: [Integer]
grains = [ 2^x | x <- [0..63] ]
 
square :: Int -> Maybe Integer
square i | i <= 0 || i > 64 = Nothing
         | otherwise        = Just (grains !! (i-1))

total :: Integer
total = sum $ mapMaybe square [1..64]
