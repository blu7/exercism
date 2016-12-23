module Sublist (Sublist(..), sublist) where

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Show, Eq)

sublist :: (Eq a, Show a) => [a] -> [a] -> Sublist
sublist xs ys | xs == ys = Equal
              | isSublist xs ys = Sublist
              | isSublist ys xs = Superlist
              | otherwise = Unequal

isSublist :: [a] -> [a] -> Bool
isSublist _ []  = False
isSublist [] _  = True
isSublist xs ys | xs == ys = True
                | otherwise = isSublist xs (tail ys) || isSublist xs (init ys)
