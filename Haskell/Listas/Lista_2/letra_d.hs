main = do
       s <- getLine
       let result = isBST (read s::Tree Int)
       print result

data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

isBST :: Ord t => Tree t -> Bool
isBST tr = estaOrdenado (inorder tr)

estaOrdenado :: Ord t => [t] -> Bool
estaOrdenado [] = True
estaOrdenado (a:[]) = True
estaOrdenado (a:b:c) | a <= b = estaOrdenado (b:c)
                     | otherwise = False

inorder :: Tree t -> [t]
inorder Nilt = []
inorder (Node x lf rt) = inorder lf ++ [x] ++ inorder rt