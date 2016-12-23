module PrimeFactors (primeFactors) where

primeFactors :: Integer -> [Integer]
primeFactors x = primeFactors' x 2

primeFactors' :: Integer -> Integer -> [Integer]
primeFactors' x n | x == 1       = []
                  | mod x n == 0 = n : primeFactors' (x `quot` n) n
                  | otherwise    = primeFactors' x (n+1)
