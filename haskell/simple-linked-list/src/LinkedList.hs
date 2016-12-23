module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Nil | Node a (LinkedList a)

datum :: LinkedList a -> a
datum (Node y _) = y

fromList :: [a] -> LinkedList a
fromList []     = Nil
fromList [x]    = Node x Nil
fromList (x:xs) = Node x (fromList xs)

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _   = False

new :: a -> LinkedList a -> LinkedList a
new x Nil        = Node x Nil
new x (Node y z) = Node x (Node y z)

next :: LinkedList a -> LinkedList a
next (Node _ z) = z
next _          = Nil

nil :: LinkedList a
nil = Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList 

toList :: LinkedList a -> [a]
toList Nil        = []
toList (Node y z) = y : toList z
