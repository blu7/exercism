module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate = flip foldr ([]) . ((:) .)
