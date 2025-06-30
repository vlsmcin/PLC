data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

main :: IO ()
main = do

  input <- getLine

  let result = dna1 (read input :: Tree Int)

  print result

inorder :: Tree Int -> [Int]
inorder Nilt = []
inorder (Node x lf rt) = inorder lf ++ [x] ++ inorder rt


dna1 :: Tree Int -> [String]
dna1 Nilt = []
dna1 tr = juntarPor8 (map mapa (inorder tr)) "" 0


juntarPor8 :: String -> String -> Int -> [String]
juntarPor8 [] str _ = [str]
juntarPor8 (s:ss) str x | x < 8 = juntarPor8 ss (str ++ [s]) (x+1)
                        | x == 8 = [str] ++ juntarPor8 ss [s] 1
          

mapa :: Int -> Char
mapa x | mod x 5 == 0 = 'E'
       | mod x 5 == 1 = 'M'
       | mod x 5 == 2 = 'A'
       | mod x 5 == 3 = 'C'
       | mod x 5 == 4 = 'S'