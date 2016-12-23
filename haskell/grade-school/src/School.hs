module School (School, add, empty, grade, sorted) where
import Data.List (sort, insert)

type Grade = Int
type Student = String
type Students = [Student]
type School = [(Grade, Students)]

empty :: School
empty = []

add :: Grade -> Student -> School -> School
add g s [] = [(g, [s])]
add g s ((grd,ss):xs) | g == grd  = (g, insert s ss) : xs
                      | otherwise = insert (grd,ss) (add g s xs)

grade :: Int -> School -> Students
grade _ []     = []
grade g (x:xs) | g == fst x = snd x
               | otherwise  = grade g xs 

sorted :: School -> [(Int, Students)]
sorted []     = []
sorted [x]    = [x]
sorted ((g,ss):xs) = (g, sort ss) : sorted xs



