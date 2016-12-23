module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

class (Enum a, Bounded a, Eq a) => Circular a where
     next :: a -> a
     next a = if a == maxBound then minBound else succ a
     prev :: a -> a
     prev a = if a == minBound then maxBound else pred a

data Bearing = North | East | South | West deriving (Eq, Show, Enum, Bounded)

instance Circular Bearing

type Coord = (Integer, Integer)

data Robot = Robot { bearing :: Bearing, coordinates :: Coord }

simulate :: Robot -> String -> Robot
simulate = foldl simulate'

simulate' :: Robot -> Char -> Robot
simulate' r ch = let b = bearing r
                     c = coordinates r
                 in case ch of
                        'R' -> Robot (turnRight b) c
                        'L' -> Robot (turnLeft b) c
                        'A' -> Robot b (advance b c)
                        _   -> r

advance :: Bearing -> Coord -> Coord
advance North (x, y) = (x, y+1)
advance East (x, y)  = (x+1, y)
advance South (x, y) = (x, y-1)
advance West (x, y)  = (x-1, y)

turnRight :: Bearing -> Bearing
turnRight = next

turnLeft :: Bearing -> Bearing
turnLeft = prev

mkRobot :: Bearing -> Coord -> Robot
mkRobot = Robot
