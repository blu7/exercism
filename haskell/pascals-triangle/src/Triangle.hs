module Triangle (rows) where

rows :: Integral a => a -> [[a]]
rows i = map row [0 .. i-1]

row :: Integral a => a -> [a]
row i = map (binom i) [0 .. i]

binom :: Integral a => a -> a -> a
binom _ 0 = 1
binom 0 _ = 0
binom n k = binom (n-1) (k-1) * n `div` k
