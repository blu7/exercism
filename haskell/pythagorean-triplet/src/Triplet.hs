module Triplet (isPythagorean, mkTriplet, pythagoreanTriplets) where
import Data.List (sort)

type Triplet = (Integer, Integer, Integer)

mkTriplet :: Integer -> Integer -> Integer -> Triplet
mkTriplet = (,,)

isPythagorean :: Triplet -> Bool
isPythagorean (x, y, z) = let [a, b, c] = sort [x, y, z] in a^2 + b^2 == c^2

pythagoreanTriplets :: Integer -> Integer -> [Triplet]
pythagoreanTriplets i j = filter (\(x,_,_) -> x >= i) $ pythagoreanTriplets' j

pythagoreanTriplets' :: Integer -> [Triplet]
pythagoreanTriplets' n = [ mkTriplet a b c | a <- [1..n], b <- [a..n], c <- [b..n], isPythagorean (a,b,c) ]


