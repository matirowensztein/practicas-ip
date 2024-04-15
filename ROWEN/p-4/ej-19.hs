esPrimo :: Integer -> Bool
esPrimo n
    | n == 1 = True
    | n == 2 = True
    | mod n 2 == 0 = False
    | otherwise = helperPrimo n 3
    where helperPrimo n m | mod n m == 0 && m /= n = False
                          | m < n = helperPrimo n (m + 2)
                          | otherwise =  True


esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = sumaPrimos n 2 0
    where sumaPrimos n x y | n == y = True
                           | esPrimo x = sumaPrimos n (x+1) (y+x)
                           | n > x = sumaPrimos n (x+1) y
                           | otherwise = False