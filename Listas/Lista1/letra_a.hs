main = do
    a <- getLine
    let result = minMaxCartao a
    print result

minMaxCartao :: String -> (Double, Double)
minMaxCartao str = (minList (getValues str [] False []), maxList (getValues str [] False []))

getValues :: String -> String -> Bool -> [Double] -> [Double]
getValues [] _ _ lst = lst
getValues (s:ss) flt state lst | ('0' <= s && s <= '9') || s == '.' = getValues ss (flt ++ [s]) True lst
                               | state == True && s == ';' = getValues ss [] False (lst ++ [read flt::Double])
                               | otherwise = getValues ss [] False lst

minList :: [Double] -> Double
minList [] = 9999.99
minList (a:as) = min a (minList as)

maxList :: [Double] -> Double
maxList [] = 0
maxList (a:as) = max a (maxList as)