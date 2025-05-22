main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result

logMes :: String -> String -> Double
logMes month str = foldl (+) 0.0 (getMonthList str month)

getMonthList :: String -> String -> [Double]
getMonthList str searchMonth = auxGet str [] False True [] []
    where auxGet :: String -> String -> Bool -> Bool -> [Char] -> [Double] -> [Double]
          auxGet [] _ _ _ _ lst = lst
          auxGet (s:ss) flt state isMonth month lst 
            | ('0' <= s && s <= '9') || s == '.' = auxGet ss (flt ++ [s]) True isMonth month lst
            | state == True && s == ';' && month == searchMonth = auxGet ss [] False True [] (lst ++ [read flt::Double])
            | s == ';' = auxGet ss flt state False month lst
            | 'A' <= s && s <= 'Z' && isMonth == True = auxGet ss flt False True (month ++ [s]) lst
            | otherwise = auxGet ss [] False isMonth month lst