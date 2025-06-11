data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

main :: IO ()
main = do

  input <- getLine

  let result = dna1 (read input :: Tree Int)

  print result

dna1 :: Tree Int -> [String]