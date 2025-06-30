--applyTwice executa duas vezes a mesma função
--applyTwice :: (a -> a) -> a -> a
--applyTwice f x = f (f x)

total :: (Int -> Int) -> Int -> Int
total f 0 = f 0
total f n = total f (n-1) + f n

sq :: Int -> Int
sq n = n*n

sumSquares :: Int -> Int
sumSquares n = total sq n

maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = max (maxFun f (n-1)) (f n)

zeroInRange :: (Int -> Int) -> Int -> Bool
zeroInRange f 0 = (f 0 == 0)
zeroInRange f n = zeroInRange f (n-1) || (f n == 0)

isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescent f n = f n >= f (n-1) && isCrescent f (n-1)

--map :: (t -> u) -> [t] -> [u]
--map f [] = []
--map f (a:as) = f a : map f as

--map f l = [f a | a <- l]

--foldr1 combina elementos de uma lista 2 a 2
-- foldr1 (+) (map vendas [1..10])