vendas :: Int -> Int
vendas 0 = 200
vendas 1 = 500
vendas 2 = 900
vendas 3 = 1500
vendas 4 = 400
vendas 5 = 100
vendas _ = 0

totalVendas :: Int -> Int
totalVendas n | n == 0 = vendas 0
              | otherwise = totalVendas (n - 1) + vendas n

maxVendas :: Int -> Int
maxVendas n | n == 0 = vendas 0
            | otherwise = max (maxVendas (n-1)) (vendas n)

-- maxVendas :: Int -> Int
-- maxVendas n = 0
-- maxVendas n = max (maxVendas (n - 1)) (vendas n)
-- Essa última pode ser (maxVendas (n - 1)) `max` (vendas n)
maxiThree :: Int -> Int -> Int -> Int
maxiThree m n p | m >= n && m >= p = m
                | n >= p = n
                | otherwise = p

maxiThree' :: Int -> Int -> Int -> Int
maxiThree' x y z = max (max x y) z

equalCount :: Int -> Int -> Int -> Int -> Int
equalCount mx m n p | mx == m && mx == n && mx == p = 3
                    | (mx == n || mx == m) && (mx == p || mx == m) = 2
                    | mx == p || mx == m || mx == n = 1

equalCount' :: Int -> Int -> Int -> Int -> Int
equalCount' m x y z = conta x + conta y + conta z
    where conta n | n == m = 1
                  | otherwise = 0


maxThreeOccurs :: Int -> Int -> Int -> (Int,Int)
maxThreeOccurs m n p = (mx, eqCount)
    where mx = maxiThree m n p
          eqCount = equalCount mx m n p

-- Exercicio
ehPrimo :: Int -> Bool
ehPrimo 1 = False
ehPrimo n = naoTemDivisor (n-1) n
    where naoTemDivisor :: Int -> Int -> Bool
          naoTemDivisor x y | x == 1 = True
                             | mod y x == 0 = False
                             | otherwise = naoTemDivisor (x-1) y


-- Primos entre si
primosEntreSi :: Int -> Int -> Bool
primosEntreSi x y = divisores 2 x y
    where divisores :: Int -> Int -> Int -> Bool
          divisores a b c | a == (b - 1) = True
                          | mod b a == 0 && mod c a == 0 = False
                          | otherwise = divisores (a+1) b c