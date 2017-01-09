module Matrix (saddlePoints) where

import Data.Array (Array)

saddlePoints :: (Ix i, Integral a) => Array i a -> [i]  
saddlePoints xs = undefined