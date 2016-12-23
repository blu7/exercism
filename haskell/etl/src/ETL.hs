module ETL (transform) where

import qualified Data.Map as M
import Data.Char (toLower)

transform :: M.Map a String -> M.Map Char a
transform m = M.fromList $ concat $ map f (M.toList m)    
    where
    f :: (a, String) -> [(Char, a)]
    f (k, v) = map (\x -> (toLower x, k)) v

