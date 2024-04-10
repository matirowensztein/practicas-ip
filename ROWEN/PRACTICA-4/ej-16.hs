menorDivisor :: Integer -> Integer
menorDivisor n 
    | mod n 2 == 0 = 2
    | otherwise = helperF n 3
    where helperF n m | mod n m == 0 && m /= 1 = m
                      | otherwise = helperF n (m + 2)


esPrimo :: Integer -> Bool
esPrimo n
    | n == 1 = True
    | mod n 2 == 0 = False
    | otherwise = helperPrimo n 3
    where helperPrimo n m | mod n m == 0 && m /= 1 = False
                          | m > n = helperPrimo n (m + 2)
                          | otherwise =  True


{-
a = 15 b = 14
mod n 2 == 0 && mod b 2 == 0 = False
otherwise = helperCoprimos
-}

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b 
    | mod a 2 == 0 && mod b 2 == 0 = False
    | otherwise = helperCoprimos a b 3
    where helperCoprimos a b c | mod a c == 0 && mod b c == 0 && c /= 1 = False
                               | c < a && c < b = helperCoprimos a b (c + 2)
                               | otherwise = True


nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarNPrimos 2 n
    where buscarNPrimos i n | n == 1 && esPrimo i = i
                            | esPrimo i = buscarNPrimos (i+1) (n-1)
                            | otherwise = buscarNPrimos (i+1) n