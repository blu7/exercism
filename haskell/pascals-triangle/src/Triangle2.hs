module Triangle (rows) where

rows :: Int -> [[Integer]]
rows = flip take pasc

pasc :: [[Integer]]
pasc = map ([1,1]^) [0..]

-- Num instance for lists from https://wiki.haskell.org/Blow_your_mind
instance Num a => Num [a] where
    xs + []         = xs
    [] + ys         = ys
    (x:xs) + (y:ys) = x + y : xs + ys

    (x:xs) * (y:ys) = x * y : [x] * ys + xs * (y : ys)
    _ * _           = []

    abs           = undefined
    signum        = map signum
    fromInteger n = [fromInteger n]
    negate        = map (\x -> -x)
