main = do
      a <- getLine
      let result = fatPrime (read a :: Int)
      print result

ehPrimo :: Int -> Bool
ehPrimo x = temDiv x 2
    where temDiv :: Int -> Int -> Bool
          temDiv 1 _ = False
          temDiv 2 _ = True
          temDiv x y | mod x y == 0 = False
                     | y > floor (sqrt (fromIntegral x)) = True
                     | otherwise = temDiv x (y + 1)

pegaDivisores :: Int -> Int -> [Int]
pegaDivisores x y | x == y = [x]
                  | mod x y == 0 = [y] ++ pegaDivisores x (y+1)
                  | otherwise = pegaDivisores x (y+1)

filtraPrimos :: [Int] -> [Int]
filtraPrimos [] = []
filtraPrimos (a:as) | ehPrimo a == True = [a] ++ filtraPrimos as
                    | otherwise = filtraPrimos as

divideNVezes :: Int -> Int -> Int
divideNVezes x y | mod x y == 0 = 1 + divideNVezes (div x y) y
                 | otherwise = 0

fatPrime :: Int -> [(Int, Int)]
fatPrime n =  pegaPar (filtraPrimos (pegaDivisores n 1))
    where pegaPar :: [Int] -> [(Int, Int)]
          pegaPar [] = []
          pegaPar (a:as) = [(a, divideNVezes n a)] ++ pegaPar as