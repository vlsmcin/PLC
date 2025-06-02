ehPrimo :: Int -> Bool
ehPrimo 1 = False
ehPrimo 2 = True
ehPrimo x = not (temDiv x 2)
    where temDiv :: Int -> Int -> Bool
          temDiv x y | mod x y == 0 = True
                     | y == x - 1 = False
                     | otherwise = temDiv x (y+1)

sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 x y = foldr1 (+) (map (\x -> x*x) (filter ehPrimo [x..y]))