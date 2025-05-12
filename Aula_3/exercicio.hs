addEspacos :: Int -> String
addEspacos n | n == 0 = ""
             | otherwise = " " ++ addEspacos(n-1)

paraDireita :: Int -> String -> String
paraDireita n str = addEspacos n ++ str

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

imprimeTotal :: Int -> String
imprimeTotal n = "Total" ++ paraDireita 4 (show (totalVendas n)) ++ "\n"

imprimeSemanas :: Int -> String
imprimeSemanas n = imprimeCada 0
    where imprimeCada :: Int -> String
          imprimeCada i | i <= n = paraDireita 2 (show(i)) ++ paraDireita 6 (show(vendas i)) ++ "\n" ++ imprimeCada (i+1)
                        | otherwise = ""
-- Poderia fazer também: imprimeSemanas n = imprimeSemana n - 1 ++ imprimeSemana n (Só adaptar)

imprimeMedia :: Int -> String
imprimeMedia n = "Média" ++ paraDireita 4 (show(mediaVendas n)) ++ "\n"
    where mediaVendas :: Int -> Float
          mediaVendas n = fromIntegral (totalVendas n) / fromIntegral (n+1)

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr ("Semana" ++ paraDireita 2 "Venda" ++ "\n"
                          ++ imprimeSemanas n
                          ++ imprimeTotal n
                          ++ imprimeMedia n)