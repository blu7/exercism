module Clock2 (clockHour, clockMin, fromHourMin, toString) where

import Data.Char (intToDigit)

data Clock = Time {
        clockHour :: Int ,
        clockMin :: Int
        }
        deriving (Eq)

instance Num Clock where
 --{-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
    (Time h m) + (Time h' m') = fromHourMin (h + h') (m + m')
    --(Time h m) - (Time h' m') = fromHourMin (h - (h'+1)) (toMinutes)
    fromInteger = fromHourMin 0
    negate c = fromHourMin 0 (minutesPerDay - toMinutes c)
    
    
instance Show Clock where
    show = toString

fromHourMin :: Integral a => a -> a -> Clock
fromHourMin h m = fromHourMin'(fromIntegral h) (fromIntegral m)
    where
    fromHourMin' h m
     | h >= 24   = fromHourMin (h `mod` 24) m
     | m >= 60   = fromHourMin (h + (m `div` 60)) (m `mod` 60)
     | otherwise = Time h m 

toMinutes :: Clock -> Int
toMinutes (Time h m) = m + 60 * h
     
toString :: Clock -> String
toString c = toString' (clockHour c) 24 ++ ":" ++ toString' (clockMin c) 60

toString' :: Int -> Int -> String
toString' n m = let d = digits (n `mod` m)
                in case d of
                        []     -> "00"
                        (x:[]) -> "0" ++ map intToDigit d
                        _      -> map intToDigit d
    where
    digits 0 = []
    digits x = digits (x `div` 10) ++ [x `mod` 10]
    
minutesPerDay = 1440    
