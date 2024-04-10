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
f n m = sumaInterna n m + f (n-2) m
    where sumaInterna n m | m == 0 = 0
                          | otherwise = n^m + sumaInterna n (m-2)


-- No funciona de esta manera ya que en la grilla se pasara por cirtos lugares multiples veces
f' :: Int -> Int -> Int
f' 0 m = 0
f' n 0 = 0
f' n m = n^m + f' (n-2) m + f' n (m-1)
