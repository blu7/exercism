module RunLength (decode, encode) where
import Text.Trifecta

decode :: String -> String
decode = parse' decodeParser
                
encode :: String -> String
encode = parse' encodeParser

parse' :: Parser String -> String -> String
parse' p s = case fmap concat (parseString (some p) mempty s) of
                Success x -> x
                _         -> ""

decodeParser :: Parser String
decodeParser = do     
     n  <- option 1 decimal 
     x  <- letter
     ws <- many $ oneOf " \n\t"
     return $ replicate (fromIntegral n :: Int) x ++ ws

encodeParser :: Parser String
encodeParser = do    
    x  <- letter
    xs <- many $ char x
    ws <- many $ oneOf " \n\t"
    return $ encodeParser' x xs ++ ws

encodeParser' x [] = [x]
encodeParser' x xs = show (1 + length xs) ++ [x]
