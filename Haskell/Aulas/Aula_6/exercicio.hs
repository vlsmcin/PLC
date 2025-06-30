type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio","O Senhor dos Aneis"),
               ("Andre","Duna"),
               ("Fernando","Jonathan Strange & Mr. Norrell"),    
               ("Fernando","Duna")
              ]

{- 
livros :: BancoDados -> Pessoa -> [Livro]

emprestimos :: BancoDados -> Livro ->[Pessoa]

emprestado :: BancoDados -> Livro -> Bool

qtdEmprestimos :: BancoDados -> Pessoa -> Int

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
-}

livros :: BancoDados -> Pessoa -> [Livro]
livros lst p = [y | (x,y) <- lst, p == x]

emprestimos :: BancoDados -> Livro ->[Pessoa]
emprestimos bd lv = [p | (p,l) <- bd, lv == l]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd lv = foldr1 (||) [l == lv | (p,l) <- bd]

--emprestado bd liv = (emprestimos bd liv /= [])

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = foldr1 (+) (map turnOne bd)
    where turnOne :: (Pessoa,Livro) -> Int
          turnOne (per,l) | per == p = 1
                          | otherwise = 0

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar bd p l = ((p,l):bd)

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver bd p l = filter cond bd
    where cond :: (Pessoa,Livro) -> Bool
          cond (ps,lv) | (ps,lv) == (p,l) = False
                       | otherwise = True

-- devolver bd p l = [(ps,lv) | (ps,lv) <- bd, (ps,lv) /= (p,l)]