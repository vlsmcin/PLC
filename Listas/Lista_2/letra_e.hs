data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

main = do
       a <- getLine
       b <- getLine
       let result = destination (read a) (read b)
       print result

destination :: (Int, Int) -> [Command] -> (Int,Int)
destination (x,y) cmnd = move (x,y) cmnd 1
    where move :: (Int, Int) -> [Command] -> Int -> (Int, Int)
          move (x1,y1) [] _ = (x1,y1)
          move (x1,y1) (Forward n:nxt) 1 = move (x1,y1+n) nxt 1
          move (x1,y1) (Forward n:nxt) 2 = move (x1-n,y1) nxt 2
          move (x1,y1) (Forward n:nxt) 3 = move (x1,y1-n) nxt 3
          move (x1,y1) (Forward n:nxt) 0 = move (x1+n,y1) nxt 0
          move (x1,y1) (Backward n:nxt) 1 = move (x1,y1-n) nxt 1
          move (x1,y1) (Backward n:nxt) 2 = move (x1+n,y1) nxt 2
          move (x1,y1) (Backward n:nxt) 3 = move (x1,y1+n) nxt 3
          move (x1,y1) (Backward n:nxt) 0 = move (x1-n,y1) nxt 0
          move (x1,y1) (TurnLeft:nxt) pos = move (x1,y1) nxt (mod (pos+1) 4)
          move (x1,y1) (TurnRight:nxt) pos = move (x1,y1) nxt (mod (pos-1) 4)