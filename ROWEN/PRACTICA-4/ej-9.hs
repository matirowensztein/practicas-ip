esCapicua:: Integer -> Bool
esCapicua n 
    | n < 10 = True
    | otherwise = 

iesimoDigito:: Integer -> Integer -> Integer
iesimoDigito n i = (n `div` 10^((cantDigitos n) - i)) `mod` 10

cantDigitos:: Integer -> Integer
cantDigitos n 
    | n < 10 = 1
    | n > 10 = 1 + cantDigitos(div n 10)