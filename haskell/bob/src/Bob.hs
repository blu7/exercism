module Bob (responseFor) where
import Data.Char (toUpper, isDigit, isAlpha, isSpace)

responseFor :: String -> String
responseFor s = responseFor' (filter (not . isSpace) s)
    where 
    responseFor' s | isSilence s   = "Fine. Be that way!"
                   | hasNoWords s  = "Whatever."              
                   | isYelling s   = "Whoa, chill out!"
                   | isAsking s    = "Sure."              
                   | otherwise     = "Whatever."
        where
        isSilence s  = s == []
        isYelling s  = filter isAlpha s /= [] && s == map toUpper s 
        isAsking s   = last s == '?' && not (isYelling s)
        hasNoWords s = filter isAlpha s == [] && not (isAsking s)
    
