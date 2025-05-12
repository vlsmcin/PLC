import Data.Char

fat :: Integer -> Integer
fat 0 = 1
fat n = n * fat(n-1)

-- Import tem que ser no começo

offset = ord 'A' - ord 'a'

maiuscula :: Char -> Char
maiuscula ch | ch >= 'a' && ch <= 'z' =  chr (ord ch + offset)
             | otherwise = ch

ehDigito :: Char -> Bool
ehDigito ch = ('0'<=ch) && (ch <= '9')

-- show 8 vai gerar '8'
-- "False " ++ show True = "False True"
-- putStrLn ("False " ++ "\n" ++ show True)
-- (read "3"):: Int