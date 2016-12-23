module Base () where

-- rebase :: Integral a => a -> a -> [a] -> Maybe [a]
-- rebase inputBase outputBase inputDigits
--     | inputBase < 1 || outputBase < 1 = Nothing
--     | inputBase == outputBase         = Just inputDigits
--     | inputBase >  outputBase         = toLowerBase
--     | otherwise                       = toHigherBase

toBase10 :: Integral a => a -> [a] -> a
toBase10 base digits = foldr (\x acc -> if x > 0 then x + acc * base else acc) 0 (reverse digits)

Base10toHigherBase :: Integral a => a -> a -> [a] -> [a]
toHigherBase base digits = undefined

Base10toLowerBase :: Integral a => a -> a -> [a] -> [a]
toLowerBase base digits = undefined--d `div` outputBase
