module Roman (numerals) where
import Data.Char (digitToInt)

numerals :: Integer -> Maybe String
numerals i = let order = length $ intToDigits i

digitToRoman :: Int -> String
digitToRoman =

intToDigits :: Integer -> [Int]
intToDigits = map digitToInt . show

[(1, 'I'), (5, 'V'), (10, 'X'), (50, 'L'), (100, 'C'), (500, 'D'), (1000, 'M')]
