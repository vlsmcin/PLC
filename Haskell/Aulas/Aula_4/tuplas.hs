type Name = String
type Age = Int
type Phone = String
type Person = (Name, Age, Phone)

name :: Person -> Name
name (n, a, p) = n

-- Já existe fst :: (t1, t2) -> t1
-- Também existe snd :: (t1, t2) -> t2

-- Resto tá no slide
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b / (2.0*a)

twoRoots :: Float -> Float -> Float -> Float
twoRoots a b c = (d-e, d+e)
    where d = -b/(2.0*a)
          e = sqrt(b^2-4.0*a*c)/(2.0*a)

roots :: Float -> Float -> Float -> String
roots a b c | b^2 == 4.0*a*c = show (oneRoot a b c)
            | b^2 > 4.0*a*c = show f ++ show s
            | otherwise = "No roots"
    where (f,s) = twoRoots a b c