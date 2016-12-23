module SumOfMultiples (sumOfMultiples) where
import Data.List (union)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . union' $ map (multiples limit) factors
    where 
    multiples :: Integer -> Integer -> [Integer]
    multiples limit x = filter (isMultiple x) [1.. (limit - 1)] 

    isMultiple :: Integer -> Integer -> Bool
    isMultiple x y = 0 == mod y x    
    
    union' :: [[Integer]] -> [Integer]
    union' = foldr union []    
