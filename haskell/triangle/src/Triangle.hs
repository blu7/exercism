module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c   | or  [ a+b <= c, a+c <= b, b+c <= a ] = Illegal
                     | and [ a == b, b == c ]               = Equilateral
                     | or  [ a == b, a == c, b == c ]       = Isosceles
                     | otherwise                            = Scalene
