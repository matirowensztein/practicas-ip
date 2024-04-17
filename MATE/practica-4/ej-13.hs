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
f i m = sumaMPotencias i m + f (i-1) m

sumaMPotencias :: Int -> Int -> Int
sumaMPotencias n 0 = 0
sumaMPotencias n j = n^j + sumaMPotencias n (j-1)

