data Animal = Cisnal | Iguanoide | Narvale | Null
  deriving (Eq, Show)

main = do
  firstExtract <- words <$> getLine                       -- equivalente a (read firstExtract :: [String])
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result

dna2 :: [String] -> [String] -> [Int]
dna2 fr1 fr2 = auxDna fr1 fr2 0 0 0
    where auxDna :: [String] -> [String] -> Int -> Int -> Int -> [Int]
          auxDna [] _ c i n = [c,i,n]
          auxDna _ [] c i n = [c,i,n]
          auxDna (st1:st1s) (st2:st2s) c i n | calcularValor st1 st2 >= 0.1 && calcularValor st1 st2 <= 0.3 = auxDna st1s st2s (c+1) i n
                                             | calcularValor st1 st2 >= 0.4 && calcularValor st1 st2 <= 0.7 = auxDna st1s st2s c (i+1) n
                                             | calcularValor st1 st2 >= 0.8 = auxDna st1s st2s c i (n+1)
                                             | otherwise = auxDna st1s st2s c i n

calcularValor :: String -> String -> Float
calcularValor st1 st2 = fromInteger (compararStrings st1 st2) / fromInteger (tamMaiorString st1 st2)

compararStrings :: String -> String -> Integer
compararStrings _ [] = 0
compararStrings [] _ = 0
compararStrings (s1:s1s) (s2:s2s) | s1 == s2 = 1 + compararStrings s1s s2s
                                  | otherwise = compararStrings s1s s2s

tamMaiorString :: String -> String -> Integer
tamMaiorString st1 st2 | (lenghtStr st1) >= (lenghtStr st2) = lenghtStr st1
                       | otherwise = lenghtStr st2

lenghtStr :: String -> Integer
lenghtStr [] = 0
lenghtStr (s:ss) = 1 + lenghtStr ss