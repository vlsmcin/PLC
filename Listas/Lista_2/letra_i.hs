import Data.Char

main :: IO ()
main = do

  deslocamento <- getLine
  str <- getLine

  let result = cifraCesar (read deslocamento) string

  putStrLn result

cifraCesar :: Int -> String -> String
cifraCesar x str = map (deslocamentoChar x) str

deslocamentoChar :: Int -> Char -> Char
deslocamentoChar x ch | 'A' <= ch && ch <= 'Z' = chr ((mod (ord ch - 65 + x) 26) + 97)
                      | 'a' <= ch && ch <= 'z' = chr ((mod (ord ch - 97 + x) 26) + 97)
                      | otherwise = ch