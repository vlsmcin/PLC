rlencode0 :: [Int] -> [Int]
rlencode0 lst = cntzero lst [] 0
    where cntzero :: [Int] -> [Int] -> Int -> [Int]
          cntzero [] newlst x | x > 0 = [0,x]
                              | otherwise = newlst
          cntzero (a:as) newlst x | a == 0 = cntzero as newlst (x+1)
                                  | a /= 0 && x > 0 = cntzero as (newlst ++ [0,x,a]) 0
                                  | otherwise = cntzero as (newlst ++ [a]) 0

rldecode0 :: [Int] -> [Int]
rldecode0 lst = addZero lst False
    where addZero :: [Int] -> Bool -> [Int]
          addZero [] _ = []
          addZero (a:as) zeroFound | zeroFound == True = (zeroList a) ++ (addZero as False) 
                                   | a == 0 = addZero as True
                                   | otherwise = [a] ++ (addZero as False)
          zeroList :: Int -> [Int]
          zeroList x | x == 0 = []
                     | otherwise = [0] ++ zeroList (x-1)

rlencodeLetras :: String -> String


