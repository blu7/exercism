module Phone (areaCode, number, prettyPrint) where
import Data.Char (isDigit)

areaCode :: String -> Maybe String
areaCode = fmap (take 3) . number 

number :: String -> Maybe String
number = number' . filter isDigit
            
number' :: String -> Maybe String  
number' n@(x:xs) | length n == 10             = Just n
                 | length n == 11 && x == '1' = Just xs
                 | otherwise                  = Nothing
        
prettyPrint :: String -> Maybe String
prettyPrint = fmap prettyPrint' . number

prettyPrint' :: String -> String
prettyPrint' n = let m = drop 3 n
                 in "(" ++ take 3 n ++ ")" ++ " " ++ take 3 m ++ "-" ++ drop 3 m
                        
