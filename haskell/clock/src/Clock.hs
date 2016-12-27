module Clock (clockHour, clockMin, fromHourMin, toString) where
import Text.Printf (printf)

data Clock = Sec Integer

secsPerDay = 86400
secsPerHour = 3600
secsPerMinute = 60
hoursPerDay = 24
minsPerHour = 60

instance Eq Clock where
    (==) (Sec s) (Sec s') = (s `mod` secsPerDay) == (s' `mod` secsPerDay)

instance Show Clock where
    show = toString
        
toString :: Clock -> String
toString c = printf "%02d:%02d" (clockHour c) (clockMin c)

clockHour :: Clock -> Integer
clockHour (Sec s) = s `div` secsPerHour `mod` hoursPerDay

clockMin ::  Clock -> Integer
clockMin (Sec s) = s `div` secsPerMinute `mod` minsPerHour

        
instance Num Clock where
    fromInteger = Sec . (secsPerMinute *)
    (Sec x) + (Sec y) = Sec (x + y)
    negate (Sec x) = Sec (secsPerDay - x)    
    
fromHourMin :: Integer -> Integer -> Clock
fromHourMin h m = fromMin m + fromHour h

fromHour :: Integer -> Clock
fromHour = fromSec . (secsPerHour *) 

fromMin :: Integer -> Clock
fromMin = fromSec . (secsPerMinute *) 

fromSec :: Integer -> Clock
fromSec = Sec . (`mod` secsPerDay)


instance Monoid Clock where
    mempty = Sec 0
    mappend = (+)
        





