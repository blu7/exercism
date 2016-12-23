module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard _ []   = []
discard f (x:xs) | f x       = discard f xs
                 | otherwise = x : discard f xs

keep :: (a -> Bool) -> [a] -> [a]
keep _ []   = []
keep f (x:xs) | f x       = x : keep f xs
              | otherwise = keep f xs

