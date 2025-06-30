--[1, 2, 3, 4] :: [Int]
--[(5,True), (7,True)] :: [(Int, Bool)]
--[[4,2], [3,7,7,1], []] :: [[Int]]
--['b','o','m'] :: [Char]
--"bom" = [Char]
--
--[5] -- 5:[]
--[4,5] -- 4:(5:[])
--
--[2..10] -- [2,3,4,5,6,7,8,9,10]
--[7,2..(-10)] -- [7,2,-3,-8]
--[2.8..6] -- [2.8,3.8,4.8,5.8]

sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as

-- Exercicio
double :: [Int] -> [Int]
double [] = []
double (i:j) = i*2:double j

member :: [Int] -> Int -> Bool
member [] x = False
member (i:j) x | x == i = True
               | otherwise = member j x

digits :: String -> String
digits [] = []
digits (a:b) | '0' <= a && a <= '9' = a : digits b
             | otherwise = digits b

sumPairs :: [(Int,Int)]->[Int]
sumPairs [] = []
sumPairs ((i,j):k) = (i+j):sumPairs k