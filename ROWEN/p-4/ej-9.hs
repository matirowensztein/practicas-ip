iesimoDigito:: Integer -> Integer -> Integer
iesimoDigito n i = (n `div` 10^((cantDigitos n) - i)) `mod` 10

cantDigitos:: Integer -> Integer
cantDigitos n 
    | n < 10 = 1
    | n > 10 = 1 + cantDigitos(n `div` 10)

esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | iesimoDigito n 1 == n `mod` 10 = esCapicua (n `mod` 10^(cantDigitos n - 1) `div` 10)
            | otherwise = False