-- data Bool = True | False
data Estacao = Inverno | Verao | Outono | Primavera
    deriving (Show) --  Define as Operações

data Temp = Frio | Quente
    deriving (Show, Eq) -- Frio == Frio agora funciona

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade
    deriving (Show)

lista_de_Pessoas :: [Pessoas]
lista_de_Pessoas = [Pessoa "Jose" 22, Pessoa "Maria" 23]

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a

data Shape = Circle Float | Rectangle Float Float
--Circle 4.9 :: Shape
--Rectangle 4.2 2.0 = Shape
isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False

-- Exercicio
area :: Shape -> Float
area (Circle r) = pi * r*r
area (Rectangle x y) = x * y

data Expr = Lit Int
          | Add Expr Expr
          | Sub Expr Expr

eval :: Expr -> Int
eval (Lit n) = n 
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)

myShow :: Expr -> String
myShow (Lit n) = show n
myShow (Add x y) = "(" ++ myShow x ++ " + " ++ myShow y ++ ")"
myShow (Sub x y) = "(" ++ myShow x ++ " - " ++ myShow y ++ ")"

data Pairs t = Pair t t

-- Pair 6 8 :: Pair Int
-- Pair True True :: Pairs Bool

data List t = Nil | Cons t (List t)
    deriving (Show)
data Tree t = NilT | Node t (Tree t) (Tree t)
    deriving (Show)


-- Atividade

toList :: List t -> [t]
toList Nil = []
toList (Cons x y) = [x] ++ toList y

fromList :: [t] -> List t
fromList [] = Nil
fromList (a:as) = Cons a (fromList as)

depth :: Tree t -> Int
depth NilT = 0
depth (Node t lf rt) = 1 + max (depth lf) (depth rt)

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node t lf rt) = [t] ++ collapse lf ++ collapse rt


mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ NilT = NilT
mapTree func (Node t lf rt) = Node (func t) (mapTree func lf) (mapTree func rt) 