main = interact $ show . unzip' . (read :: String -> [(Int,Int)])

unzip' :: [(Int, Int)] -> ([Int],[Int])
unzip' lst = (foldr (++) [] [[a] | (a,b) <- lst], foldr (++) [] [[b] | (a,b) <- lst])