module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    , (!?)
    ) where
import qualified Data.Vector as V

data Matrix a = Matrix
        { rows    :: Int        -- Number of rows == length of cols
        , cols    :: Int        -- Number of columns == length of rows
        , content :: V.Vector a -- Contents of the Matrix
        }

instance (Show a) => Show (Matrix a) where
    show m@(Matrix r _ v) = concatMap ((++"\n") . show . (`row` m)) [0..(r-1)]

instance (Eq a) => Eq (Matrix a) where
    (==) Matrix {content=v} Matrix {content=v'} = v == v'

(!?) :: Matrix a -> (Int, Int) -> Maybe a
(!?) m (x, y) = row x m V.!? y

column :: Int -> Matrix a -> V.Vector a
column i (Matrix r c v) = V.ifilter (\j _ -> j `elem` [i, (i+c) .. (r*c)]) v

flatten :: Matrix a -> V.Vector a
flatten = content

fromList :: [[a]] -> Matrix a
fromList []      = mempty
fromList l@(r:_) = Matrix (length l) (length r) (V.fromList $ concat l)

-- This does not work with strings :(
fromString :: Read a => String -> Matrix a
fromString = fromList . map parseLine . lines

parseLine :: Read a => String -> [a]
parseLine str =
    let
        reader :: Read a => ReadS a
        reader = readsPrec 0
    in case reader str of
        (result, rest):_ -> result:parseLine rest
        _ -> []s

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (nr, nc) (Matrix r c v)
    | nr * nc == r * c = Matrix nr nc v
    | otherwise        = mempty

row :: Int -> Matrix a -> V.Vector a
row i Matrix {content=v, cols=lr} = V.slice (i * lr) lr v

shape :: Matrix a -> (Int, Int)
shape = (,) <$> rows <*> cols

transpose :: Matrix a -> Matrix a
transpose m@(Matrix r c _) = Matrix c r $ V.concatMap (`column` m) $ V.fromList [0..(c-1)]

instance Monoid (Matrix a) where
    mempty = Matrix 0 0 V.empty
    mappend (Matrix r c v) (Matrix r' c' v')
        | c == c' = Matrix (r+r') c (mappend v v')
        | otherwise = mempty

instance Functor Matrix where
    fmap f m@(Matrix {content=x}) = m {content = fmap f x}
