module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA [] = Nothing
toRNA s  | all isValidDNA s = Just $ map toRNA' s
         | otherwise        = Nothing

toRNA' :: Char -> Char
toRNA' 'A' = 'U'
toRNA' 'T' = 'A'
toRNA' 'G' = 'C'
toRNA' 'C' = 'G'
toRNA'  _  = c

isValidDNA :: Char -> Bool
isValidDNA = `elem` "ATCG"
