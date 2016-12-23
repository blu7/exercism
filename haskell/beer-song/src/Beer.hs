module Beer (song) where

song :: String
song = concatMap verse [99, 98..0]

verse :: Int -> String
verse i = line1 i ++ line2 i

line1 :: Int -> String
line1 0 = "No more bottles of beer on the wall, no more bottles of beer.\n"
line1 i = show i ++ " " ++ bottles i ++ " of beer on the wall, " ++ show i ++ " " ++ bottles i ++ " of beer.\n"

line2 :: Int -> String
line2 0 = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
line2 1 = "Take it down and pass it around, no more bottles of beer on the wall.\n\n"
line2 i = "Take one down and pass it around, " ++ show (i-1) ++ " " ++ bottles (i-1) ++ " of beer on the wall.\n\n"

bottles :: Int -> String
bottles 1 = "bottle"
bottles _ = "bottles"
