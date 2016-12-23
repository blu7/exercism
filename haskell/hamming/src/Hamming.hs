module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance a b | length a /= length b = Nothing
             | otherwise            = Just (length . filter (==False) $ zipWith (==) a b)
