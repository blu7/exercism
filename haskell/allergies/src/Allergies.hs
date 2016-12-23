module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Maybe (catMaybes)

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Show, Eq)

allergies :: Int -> [Allergen]
allergies x = catMaybes $ zipWith (\x y -> if x == 1 then Just y else Nothing) (reverse $ intToBase2 x) allergenes

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo a i = a `elem` allergies i

intToBase2 :: Int -> [Int]
intToBase2 0 = []
intToBase2 i = intToBase2 (i `div` 2) ++ [i `rem` 2]

allergenes :: [Allergen]
allergenes = [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
