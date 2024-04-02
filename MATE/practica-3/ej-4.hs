prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a, b) (c, d) = a * b + c * d

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a, b) (c, d) = a < c && b < d

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt ((a-c)**2 + (b-d)**2)

sumaTerna :: Int -> Int -> Int -> Int
sumaTerna a b c = a + b + c

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a, b, c) k
    = sum [n | n <- [a, b, c], n `mod` k == 0]

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a, b, c) | even a = 1
                       | even b = 2
                       | even c = 3
                       | otherwise = 4

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)
