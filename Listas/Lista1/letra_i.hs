main = do
    a <- getLine
    let result = executa (read a)
    print result

type Comando = String
type Valor = Int

executa :: [(Comando, Valor)] -> Int
executa lst = operation lst 0
    where operation :: [(Comando, Valor)] -> Int -> Int
          operation [] x = x
          operation ((op,val):nxt) x | op == "Multiplica" = operation nxt (x*val)
                                     | op == "Soma" = operation nxt (x + val)
                                     | op == "Subtrai" = operation nxt (x - val)
                                     | op == "Divide" && val == 0 = -666
                                     | op == "Divide" = operation nxt (div x val)