module Clock (clockHour, clockMin, fromHourMin, toString) where

import Data.Char (intToDigit)

data Clock = Time {
        clockHour :: Int ,
        clockMin :: Int
        }

instance Show Clock where
    show = toString

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = undefined

toString :: Clock -> String
toString c = toString' (clockHour c) 12 ++ ":" ++ toString' (clockMin c) 60

toString' :: Int -> Int -> String
toString' n m = let d = digits (n `mod` m)
                in case d of
                        []     -> "00"
                        (x:[]) -> "0" ++ map intToDigit d
                        _      -> map intToDigit d
    where
    digits 0 = []
    digits x = digits (x `div` 10) ++ [x `mod` 10]
