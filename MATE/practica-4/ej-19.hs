menorDivisor :: Integer -> Integer
menorDivisor n = internoMenorDivisor 2 n
    where internoMenorDivisor i n | n `mod` i == 0 = i
                                  | otherwise = internoMenorDivisor (i+1) n

egPrimo :: Integer -> Bool
esPrimo n = n > 1 && n == menorDivisor n

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = interno n 2
    where interno n i | n < 0 = False
                      | n == 0 = True
                      | esPrimo i = interno (n-i) (i+1)
                      | otherwise = interno n (i+1)
