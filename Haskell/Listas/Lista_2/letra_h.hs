main :: IO () 
main = do
    trg <- getLine
    let area = areaTriangulo (read trg :: Triangulo)
    print(area)

data Triangulo = Triangulo Ponto Ponto Ponto
    deriving (Show, Eq, Read)

type Ponto = (Int, Int)

type Area = Double

areaTriangulo :: Triangulo -> Area
areaTriangulo (Triangulo (x1,y1) (x2,y2) (x3,y3)) = abs ((fromIntegral ((x1*y2) + (y1*x3) + (x2*y3) - (y1*x2) - (x1*y3) - (y2*x3)) :: Double)/2.0)