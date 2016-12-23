module Phone (areaCode, number, prettyPrint) where
import Data.Char (isDigit, digitToInt)

areaCode :: String -> Maybe String
areaCode s = let n = number s in
                case n of
                Nothing -> Nothing
                Just n  -> Just $ take 3 n

number :: String -> Maybe String
number s = let n = filter isDigit s in
             if length n == 10 then Just n
              else if length n == 11 && digitToInt (head n) == 1 then Just $ tail n
              else Nothing
        
prettyPrint :: String -> Maybe String
prettyPrint s = let n = number s in 
                    case n of
                    Nothing -> Nothing
                    Just n  -> Just $ 
                        let m = splitAt 3 $ snd $ splitAt 3 n in 
                        "(" ++ take 3 n ++ ")" ++ " " ++ fst m ++ "-" ++ snd m
