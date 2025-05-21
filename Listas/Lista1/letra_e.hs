main = do
       lista <- getLine
       print $ maquinaSomar (read lista :: [Int])

maquinaSomar :: [Int] -> [Int]
maquinaSomar lst = somaZero lst 0 0 True
    where somaZero :: [Int] -> Int -> Int -> Bool -> [Int]
          somaZero [] _ _ _ = []
          somaZero (a:as) x z rst | z == 2 = []
                                       | a == 0 && rst == True = [] ++ somaZero as 0 (z + 1) True 
                                       | a == 0 = [x] ++ somaZero as 0 (z + 1) True
                                       | otherwise = somaZero as (x + a) 0 False