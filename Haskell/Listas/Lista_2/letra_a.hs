main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result

data Cmd = Cursor Int
           | Backspace Int
           | Delete Int
           | Insert String
           deriving (Read)

editText :: String -> [Cmd] -> String
editText str lst = doCursor str lst 0
    where doCursor :: String -> [Cmd] -> Int -> String
          doCursor str [] _ = str
          doCursor str ((Cursor i):nxt) cur = doCursor str nxt (cur+i)
          doCursor str ((Backspace i):nxt) cur | i > 0 = doCursor (apagaNaPosX cur str) ((Backspace (i-1)):nxt) (max 0 (cur-1))
                                               | otherwise = doCursor str nxt cur
          doCursor str ((Delete i):nxt) cur | i > 0 = doCursor (apagaNaPosX (cur+1) str) ((Delete (i-1)):nxt) cur
                                            | otherwise = doCursor str nxt cur
          doCursor str ((Insert ch):nxt) cur = doCursor (insereNaPosX cur ch str) nxt cur

apagaNaPosX :: Int -> String -> String
apagaNaPosX x str = deletarChar 0 str
    where deletarChar :: Int -> String -> String
          deletarChar _ [] = []
          deletarChar i (s:ss) | i == (x - 1) = deletarChar (i+1) ss
                               | otherwise = [s] ++ deletarChar (i+1) ss

insereNaPosX :: Int -> String -> String -> String
insereNaPosX x ch str = insereChar 0 ch str False
    where insereChar :: Int -> String -> String -> Bool -> String
          insereChar _ ch [] inseriu | inseriu = []
                                     | otherwise = ch
          insereChar i ch (s:ss) inseriu | i == x = ch ++ [s] ++ insereChar (i+1) ch ss True
                                         | otherwise = [s] ++ insereChar (i+1) ch ss inseriu

lenghtStr :: String -> Int
lenghtStr [] = 0
lenghtStr (s:ss) = 1 + lenghtStr ss