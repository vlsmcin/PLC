main = do
       lista <- getLine
       print $ maquinaSomar (read lista :: [Int])

maquinaSomar :: [Int] -> [Int]
maquinaSomar lst = somaZero lst 0 0
    where somaZero :: [Int] -> Int -> Int -> [Int]
          somaZero [] _ _ = [] 
          somaZero (a:as) x z | z == 2 = []
                              | a == 0 && x == 0 = [] ++ somaZero as 0 (z + 1)
                              | a == 0 = [x] ++ somaZero as 0 (z + 1)
                              | otherwise = somaZero as (x + a) 0