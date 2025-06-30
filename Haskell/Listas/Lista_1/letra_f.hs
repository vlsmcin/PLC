main = do
    s <- getLine
    let result = htob s
    print result

hexDigitToBin :: Char -> String
hexDigitToBin '0' = "0000"
hexDigitToBin '1' = "0001"
hexDigitToBin '2' = "0010"
hexDigitToBin '3' = "0011"
hexDigitToBin '4' = "0100"
hexDigitToBin '5' = "0101"
hexDigitToBin '6' = "0110"
hexDigitToBin '7' = "0111"
hexDigitToBin '8' = "1000"
hexDigitToBin '9' = "1001"
hexDigitToBin 'A' = "1010"
hexDigitToBin 'B' = "1011"
hexDigitToBin 'C' = "1100"
hexDigitToBin 'D' = "1101"
hexDigitToBin 'E' = "1110"
hexDigitToBin 'F' = "1111"

htob :: String -> String
htob [] = ""
htob (a:as) = hexDigitToBin a ++ htob as