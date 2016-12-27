module Series (largestProduct) where
import Data.Char

{--
largestProduct' n xs = do
    a <- splitConsecutiveSubstrings n xs
    b <- toIntList a
    c <- products b
    return $ fmap maximum c
    --}
largestProduct :: Int -> String -> Maybe Int
largestProduct = (fmap maximum . products . toIntList) ... splitConsecutiveSubstrings

products :: (Num a) => Maybe [[a]] -> Maybe [a]
products = fmap (map (foldr (*) 1))

toIntList :: Maybe [String] -> Maybe [[Int]]
toIntList = fmap ((map . map) digitToInt)

splitConsecutiveSubstrings :: Int -> String -> Maybe [String]
splitConsecutiveSubstrings n xs 
    | n > length xs           = Nothing
    | all isDigit xs && n > 0 = Just $ splitConsecutiveSubstrings' n xs
    | otherwise               = Nothing

splitConsecutiveSubstrings' :: Int -> String -> [String]
splitConsecutiveSubstrings' n xs
    | length xs < n = []
    | otherwise     = let head' = take n xs
                      in head' : splitConsecutiveSubstrings' n (tail xs)

(...) :: (b -> c) -> (a0 -> a1 -> b) -> a0 -> a1 -> c
(...) f g x y = f (g x y)
