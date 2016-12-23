module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where
import Data.Maybe (fromMaybe)
import Data.List (sort)
import Data.List.Split (chunksOf)
import Data.Map (Map)
import qualified Data.Map as M

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden defaultChildren

garden :: [String] -> String -> Map String [Plant]
garden s p = let students = sort s
             in M.fromList $ zipWith (,) students $ plantsPerStudent p

plantsPerStudent :: String -> [[Plant]]
plantsPerStudent plants = let chunkLines = map (chunksOf 2) $ lines plants
                              first  = head chunkLines
                              second = last chunkLines
                          in (map . map) toPlant $ zipWith (++) first second

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants k m = fromMaybe [] $ M.lookup k m

defaultChildren :: [String]
defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

toPlant :: Char -> Plant
toPlant 'C' = Clover
toPlant 'G' = Grass
toPlant 'R' = Radishes
toPlant 'V' = Violets
