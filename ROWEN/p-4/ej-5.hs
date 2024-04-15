{-
n! = 1 * 2 * ... * n
n! = n * (n-1)!
-}

factorial :: Integer -> Integer
factorial n
    | n == 0 = 1
    | otherwise = n * factorial (n - 1)

{-
5!! = 1 * 3 * 5
n!! = n * (n-2) * (n-4) * (n-6) * ...
n!! = n * (n-2)!!

5!! = (5-2*0) * (5-2*1) * (5-2*2))
5!! = 5*3*1
-}

medioFac :: Integer -> Integer
medioFac n
    | n <= 0 = 1
    | otherwise = n * medioFac (n - 2)


