{-
n = 2
m = 1
0^1 + 1^2 +
1^1 + 2^2 +
2^1 + 3^2
= 0 + 1 + 2 + 4 + 3 + 9 = 20
-}

f :: Int -> Int -> Int
f 0 m = 0
f n m = sumaInterna n m + f (n-1) m
    where sumaInterna n m | m == 0 = 0
                          | otherwise = n^m + sumaInterna n (m-1)

