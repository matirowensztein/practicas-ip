{-
n = 3
m = 3
1^1 + 1^2 + 1^3 +
2^1 + 2^2 + 2^3 +
3^1 + 3^2 + 3^3

n = 3
m = 2
1^1 + 1^2 +
2^1 + 2^2 +
3^1 + 3^2
1 + 1 + 2 + 4 + 3 + 9 = 20

sumaDoble n m = 
-}

f :: Int -> Int -> Int
f 0 m = 0
f n m = sumaDoble n m + f (n-1) m
    where sumaDoble n m 
        | m == 0 = 0
        | otherwise = n^m + sumaDoble n (m-1)