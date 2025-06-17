import Data.Char

rlencode0 :: [Int] -> [Int]
rlencode0 lst = percorrerAcumular lst 0
    where percorrerAcumular :: [Int] -> Int -> [Int]
          percorrerAcumular [] n | n /= 0 = [0,n]
                                 | otherwise = []
          percorrerAcumular (x:xs) n | x == 0 = percorrerAcumular xs (n+1)
                                     | n /= 0 = [0,n] ++ percorrerAcumular xs 0
                                     | otherwise = [x] ++ percorrerAcumular xs 0 

geraZeros :: Int -> [Int]
geraZeros 0 = []
geraZeros n = [0] ++ geraZeros (n-1)

rldecode0 :: [Int] -> [Int]
rldecode0 (x:[]) = [x]
rldecode0 [] = []
rldecode0 (x:x1:xs) | x == 0 = geraZeros x1 ++ rldecode0 xs
                    | otherwise = [x] ++ rldecode0 (x1:xs)

rlencodeLetras :: String -> String
rlencodeLetras str = percorrerAcumularStr str ' ' 0
    where percorrerAcumularStr :: String -> Char -> Int -> String
          percorrerAcumularStr [] past n | n > 0 = [chr (n + 49)]
                                         | otherwise = []
          percorrerAcumularStr (c:cs) past n | c == past = percorrerAcumularStr cs past (n+1)
                                             | n > 0 = [chr (n + 49)] ++ percorrerAcumularStr cs c 0
                                             | otherwise = [c] ++ percorrerAcumularStr cs c 0

gerarCaracteres :: Char -> Int -> String
gerarCaracteres _ 0 = []
gerarCaracteres ch n = [ch] ++ gerarCaracteres ch (n-1)

rldecodeLetras :: String -> String
rldecodeLetras [] = []
rldecodeLetras (c:[]) = [c]
rldecodeLetras (c:cc:cs) | '0' <= cc && cc <= '9' = gerarCaracteres c (ord cc - 48) ++ rldecodeLetras cs
                         | otherwise = [c] ++ rldecodeLetras (cc:cs)

data Letra = Unica Char | Repetida Char Int
    deriving Show

rlencodeLetrasCodigo :: String -> [Letra]
rlencodeLetrasCodigo str = percorrerAcumularLetra str ' ' 0
    where percorrerAcumularLetra :: String -> Char -> Int -> [Letra]
          percorrerAcumularLetra [] _ _= []
          percorrerAcumularLetra (c:[]) past n | past == c = [Repetida c (n+2)]
                                               | n > 0 = [Repetida past (n+1), Unica c]
                                               | otherwise = [Unica past,Unica c]
          percorrerAcumularLetra (c:cc:cs) past n | c == past = percorrerAcumularLetra (cc:cs) past (n+1)
                                                  | n > 0 = [Repetida past (n+1)] ++ percorrerAcumularLetra (cc:cs) c 0
                                                  | c == cc = percorrerAcumularLetra (cc:cs) c n
                                                  | otherwise = [Unica c] ++ percorrerAcumularLetra (cc:cs) c 0

rldecodeLetrasCodigo :: [Letra] -> String
rldecodeLetrasCodigo [] = []
rldecodeLetrasCodigo (Unica ch:nxt) = [ch] ++ rldecodeLetrasCodigo nxt
rldecodeLetrasCodigo (Repetida ch x:nxt) = gerarCaracteres ch x ++ rldecodeLetrasCodigo nxt 