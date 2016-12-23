module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference x =  squareOfSums x - sumOfSquares x

squareOfSums :: Integral a => a -> a
squareOfSums x = let x' = (x + 1) * x `div` 2 in x' * x'

sumOfSquares :: Integral a => a -> a
sumOfSquares x = x * (x+1) * (2*x + 1) `div` 6
