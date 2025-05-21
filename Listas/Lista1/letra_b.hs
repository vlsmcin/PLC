main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result

logMes :: String -> String -> Double

getMonthList :: String -> String -> Bool -> [Double] -> [Double]
getValues [] _ _ lst = lst
getValues (s:ss) flt state lst | ('0' <= s && s <= '9') || s == '.' = getValues ss (flt ++ [s]) True lst
                               | state == True && s == ';' = getValues ss [] False (lst ++ [read flt::Double])
                               | otherwise = getValues ss [] False lst