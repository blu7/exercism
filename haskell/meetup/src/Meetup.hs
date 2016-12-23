module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day)
data Schedule = Teenth | First | Second | Third | Fourth | Last
data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday


meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = undefined
