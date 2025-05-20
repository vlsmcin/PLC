main = do
    a <- getLine
    b <- getLine
    c <- getChar
    let result = isReplica a (read b) c
    print result

isReplica :: String -> Int -> Char -> Bool
isReplica str x c = repete str 0
    where repete :: [Char] -> Int -> Bool
          repete [] y | y == x = True
                      | otherwise = False
          repete (s:ss) y | s == c  = repete ss (y+1)
                          | otherwise = False
