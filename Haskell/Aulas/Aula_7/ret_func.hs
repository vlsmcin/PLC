sucessor :: Int -> Int
sucessor x = x + 1

twice :: (t -> t) -> (t -> t)
twice f = f . f

-- (sucessor . sucessor) 10

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f) . f

-- Função lambda
-- map (\x -> x * x) [10..20]
-- soma = \x -> (\y -> x + y)

-- (map sucessor) [20..30]
-- map (+30) [10..20]
-- map (>15) [10..20]
-- filter (>15) [10..20]
-- filter (\x -> x > 15) [10..20]