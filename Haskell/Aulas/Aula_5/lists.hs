firstDigit :: String -> Char
firstDigit st = case (st) of
                   [] -> '\0'
                   (a:as) -> a

myzip :: [t] -> [u] -> [(t,u)]
myzip (a:as) (b:bs) = (a,b):(myzip as bs)
myzip _ _ = []

--doubleList xs = [2*a|a <- xs]
--doubleIfEven xs = [2*a|a <- xs, isEven a]

qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = qSort [y | y <- xs, x > y] ++ [x] ++ qSort[z | z <- xs, z >= x]