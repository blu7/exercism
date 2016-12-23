module SpaceAge (Planet(..), ageOn) where

data Planet = Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: (Num a, Fractional a) => Planet -> a -> a
ageOn p t = (toEarthYears p t) / 31557600 
    where 
    toEarthYears :: (Num a, Fractional a) => Planet -> a -> a 
    toEarthYears p t = case p of
                         Earth   -> t
                         Mercury -> t / 0.2408467
                         Venus   -> t / 0.61519726
                         Mars    -> t / 1.8808158
                         Jupiter -> t / 11.862615
                         Saturn  -> t / 29.447498
                         Uranus  -> t / 84.016846
                         Neptune -> t / 164.79132

