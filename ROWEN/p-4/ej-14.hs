{-
q^a+b - q^a * q^b
q = 2
n = 2
m = 3

2^1+1 + 2^1+2 + 2^1+3 + 2^2+1 + 2^2+2 + 2^2+3 = 84

-}

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias _ 0 _ = 0
sumaPotencias q n m = helperF q n m + sumaPotencias q (n-1) m 
    where helperF q n m | m == 0 = 0 
                        | otherwise = q^(n+m) + helperF q n (m-1)