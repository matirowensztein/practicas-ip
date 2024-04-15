{-
num: 1469
i: 2
n: 4

cantDigitos: 4
k: cantDigitos - i (4-2)
(n `div` 10^k) `mod` 10
-}

iesimoDigito:: Integer -> Integer -> Integer
iesimoDigito n i = (n `div` 10^((cantDigitos n) - i)) `mod` 10

cantDigitos:: Integer -> Integer
cantDigitos n 
    | n < 10 = 1
    | n > 10 = 1 + cantDigitos(div n 10)