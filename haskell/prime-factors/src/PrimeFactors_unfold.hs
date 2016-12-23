module PrimeFactors (primeFactors) where
import Data.List (unfoldr)

primeFactors :: Integer -> [Integer]
primeFactors x = unfoldr primeFactors' (x, 2)

primeFactors' :: (Integer, Integer) -> Maybe (Integer, (Integer,Integer))
primeFactors' (x, n) | x == 1       = Nothing
                     | mod x n == 0 = Just (n, (x `div` n, n))
                     | otherwise    = primeFactors' (x, n+1)


