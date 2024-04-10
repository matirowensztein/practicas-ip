-- (a)
menorDivisor :: Integer -> Integer
menorDivisor n = internoMenorDivisor 2 n
    where internoMenorDivisor i n | n `mod` i == 0 = i
                                  | otherwise = internoMenorDivisor (i+1) n

-- (b)
esPrimo :: Integer -> Bool
esPrimo n = n > 1 && n == menorDivisor n

-- (c)
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m = not (m `mod` menorDivisor n == 0) && not (n `mod` menorDivisor m == 0)

-- (d)
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarNPrimos 2 n
    where buscarNPrimos i n | n == 1 && esPrimo i = i
                            | esPrimo i = buscarNPrimos (i+1) (n-1)
                            | otherwise = buscarNPrimos (i+1) n

-- nEsimoPrimo :: Integer -> Integer
-- nEsimoPrimo n = buscarNPrimos 2 n
--     where buscarNPrimos i n | esPrimo i = n == 1 ? i : buscarNPrimos (i+1) (n-1)
--                             | otherwise = buscarNPrimos (i+1) n
