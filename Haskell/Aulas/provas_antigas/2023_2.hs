fibonacci :: [Int]
fibonacci = [0,1] ++ gerarFibo 0 1 2
    where gerarFibo :: Int -> Int -> Int -> [Int]
          gerarFibo _ _ 20 = []
          gerarFibo ant at cnt = [ant + at] ++ gerarFibo at (ant+at) (cnt+1)

merge :: Ord t => [t] -> [t] -> [t]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x < y = [x] ++ merge xs (y:ys)
                    | otherwise = [y] ++ merge (x:xs) ys

data Elemento = Valor Int | Soma | Multiplica deriving (Show)

type Pilha t = [t]

exemploPilhaElem = [Valor 10, Valor 20, Soma, Valor 30, Multiplica]

gera_string :: Pilha Elemento -> String
gera_string [] = ")"
gera_string (Valor x: Valor y: Multiplica: nxt) = "(" ++ show x ++ "*" ++ show y ++ ")" ++ gera_string nxt
gera_string (Valor x: Valor y: Soma: nxt) = "(" ++ show x ++ "+" ++ show y ++ ")" ++ gera_string nxt
gera_string (Valor x: Multiplica:nxt) = "*" ++ show x ++ gera_string nxt
gera_string (Valor x: Soma: nxt) = "+" ++ show x ++ gera_string nxt

calcula :: Pilha Elemento -> Int
calcula (Valor x:[]) = x
calcula (Valor x:Valor y: Multiplica:nxt) = calcula ([Valor (x*y)] ++ nxt)
calcula (Valor x: Valor y: Soma:nxt) = calcula ([Valor (x+y)] ++ nxt)
