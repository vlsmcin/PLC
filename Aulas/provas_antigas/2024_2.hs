insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (a:as) | x <= a = [x,a] ++ as 
                | otherwise = [a] ++ insert x as

ehPrimo :: Int -> Bool
ehPrimo x = naoTemDiv x 2
    where naoTemDiv :: Int -> Int -> Bool
          naoTemDiv 1 _ = True
          naoTemDiv 2 _ = True
          naoTemDiv x y | y > x-1 = True
                        | mod x y == 0 = False
                        | otherwise = naoTemDiv x (y+1) 

sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 x y = foldr1 (+) (map (\x -> x*x) (filter ehPrimo [x..y]))

sumPrimeSquares2 :: Int -> Int -> Int
sumPrimeSquares2 x y = foldr1 (+) [i*i | i <- [x..y], ehPrimo i]

data Tree = No Int Tree Tree | Folha Int deriving Show

ordenada :: Tree -> Bool
ordenada tr = isordered (inorder tr)

inorder :: Tree -> [Int]    
inorder (Folha x) = [x]
inorder (No x lf rt) = inorder lf ++ [x] ++ inorder rt

isordered :: [Int] -> Bool
isordered [] = True
isordered (a:[]) = True
isordered (a:aa:as) | a < aa = isordered (aa:as)
                    | otherwise = False

teste1 = No 50 (No 25 (No 12 (Folha 6) (Folha 13)) (No 30 (Folha 26) (Folha 32))) (Folha 59)

teste2 = No 100 teste1 (No 200 (Folha 99) (No 298 (Folha 297) (Folha 299)))