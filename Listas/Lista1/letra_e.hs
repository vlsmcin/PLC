main = do
       lista <- getLine
       print $ maquinaSomar (read lista :: [Int])

maquinaSomar :: [Int] -> [Int]
maquinaSomar lst = somaZero lst [] 0 0
    where somaZero :: [Int] -> [Int] -> Int -> Int -> [Int]
          somaZero [] bs _ _ = bs 
          somaZero (a:as) bs x z | z == 2 = bs
                                 | a == 0 && x == 0 = somaZero as bs 0 (z + 1)
                                 | a == 0 = somaZero as (bs ++ [x]) 0 (z + 1)
                                 | otherwise = somaZero as bs (x + a) 0