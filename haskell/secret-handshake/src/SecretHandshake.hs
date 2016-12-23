{-# LANGUAGE FlexibleInstances #-}

module SecretHandshake (handshake) where

import Data.Char
import Numeric

class SecretHandshake a where
    handshake :: a -> [String]

instance SecretHandshake String where
    handshake = handshakeStr

instance SecretHandshake Int where
    handshake = handshakeInt

moves :: [String]
moves = ["wink", "double blink", "close your eyes", "jump"]

handshakeStr :: String -> [String]
handshakeStr s = let s'  = map (=='1') $ take 5 $ reverse s
                     rev = length s' >= 5 && head s'
                     hs  = filter (not . null) $ zipWith (\a b -> if a then b else "") s' moves
                 in if rev then reverse hs else hs

handshakeInt :: Int -> [String]
handshakeInt = handshakeStr . intToBase2

intToBase2 :: Int -> String
intToBase2 0 = ""
intToBase2 i = intToBase2 (i `div` 2) ++ [intToDigit (i `rem` 2)]

