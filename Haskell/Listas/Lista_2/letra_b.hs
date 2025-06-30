import Data.Char

main = do
    sentence_1 <- getLine
    sentence_2 <- getLine
    let result = uncommonFromTwoSentences sentence_1 sentence_2
    print result

minusculo :: Char -> Char
minusculo ch | 'A' <= ch && ch <= 'Z' = chr (ord ch + 32)
           | otherwise = ch

stringMinuscula :: String -> String
stringMinuscula str = map minusculo str

separarPalavras :: String -> [String]
separarPalavras frase = auxSeparar frase ""
    where auxSeparar :: String -> String -> [String]
          auxSeparar [] str = [str]
          auxSeparar (s:ss) str | s == ' ' = [str] ++ auxSeparar ss ""
                                | otherwise = auxSeparar ss (str ++ [s])

apareceNVezes :: [String] -> String -> Int
apareceNVezes [] _ = 0
apareceNVezes (fr:frs) str | str == fr = 1 + apareceNVezes frs str
                           | otherwise = apareceNVezes frs str

filtrarOcorrenciasUnicas :: String -> [String]
filtrarOcorrenciasUnicas fr = filter (\palavra -> apareceNVezes (map stringMinuscula (separarPalavras fr)) palavra == 1) (map stringMinuscula (separarPalavras fr))

naoApareceNaFrase :: [String] -> String -> Bool
naoApareceNaFrase fr str = (apareceNVezes fr str) == 0

uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences st1 st2 = qSort ((filter (naoApareceNaFrase (map stringMinuscula (separarPalavras st1))) (filtrarOcorrenciasUnicas st2)) ++
                                   (filter (naoApareceNaFrase (map stringMinuscula (separarPalavras st2))) (filtrarOcorrenciasUnicas st1)))

qSort :: [String] -> [String]
qSort [] = []
qSort (x:xs) = qSort [y | y <- xs, x > y] ++ [x] ++ qSort[z | z <- xs, z >= x]