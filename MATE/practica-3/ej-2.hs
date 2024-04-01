-- (a)

absoluto :: Int -> Int
absoluto n = if n >= 0 then n else -n

absoluto2 :: Int -> Int
absoluto2 n = do
    abs n

-- (b)

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto a b = max (abs a) (abs b)

-- (c)

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c = max a (max b c)

-- (d)

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y = x == 0 || y == 0

algunoEs02 :: Float -> Float -> Bool
algunoEs02 x y | x == 0 = True
               | y == 0 = True
               | otherwise = False

algunoEs03 :: Float -> Float -> Bool
algunoEs03 0 _ = True
algunoEs03 _ 0 = True
algunoEs03 x y = False

-- (e)

ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = x == 0 && y == 0

ambosSon02 :: Float -> Float -> Bool
ambosSon02 x y | x == 0 && y == 0 = True
               | otherwise = False

-- (f)

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 = y <= 3
                   | x <= 7 = y > 3 && y <= 7
                   | otherwise = y > 7

-- (g)

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | a == b && b == c = a 
                    | a == b = a + c
                    | a == c = a + b
                    | b == c = a + b
                    | otherwise = a + b + c


sumaDistintos2 :: Int -> Int -> Int -> Int
sumaDistintos2 a b c | a == b && b == c = a
                     | a == c || b == c = a + b
                     | a == b = a + c
                     | otherwise = a + b + c

-- (h)

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b = a `mod` b == 0

-- (i)

digitoUnidades :: Int -> Int
digitoUnidades a = a `mod` 10

-- (j)

digitoDecenas :: Int -> Int
digitoDecenas a = (a `mod` 100 - a `mod` 10) `div` 10

