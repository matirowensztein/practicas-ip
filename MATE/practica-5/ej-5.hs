nat2bin :: Integer -> [Integer]
nat2bin 0 = []
nat2bin n | n `mod` 2 == 1 = nat2bin (n `div` 2) ++ [1]
          | otherwise = nat2bin (n `div` 2) ++ [0]

bin2nat :: [Integer] -> Integer
bin2nat [] = 0
bin2nat (x:xs) | x == 0 = bin2nat xs | otherwise = 2^(length xs) + bin2nat xs

nat2hex :: Integer -> [Char]
nat2hex 0 = ""
nat2hex n = nat2hex (n `div` 16) ++ digit
    where digit = case n `mod` 16 of 0 -> "0"; 1 -> "1";
                                     2 -> "2"; 3 -> "3";
                                     4 -> "4"; 5 -> "5";
                                     6 -> "6"; 7 -> "7";
                                     8 -> "8"; 9 -> "9";
                                     10 -> "A"; 11 -> "B";
                                     12 -> "C"; 13 -> "D";
                                     14 -> "E"; 15 -> "F"

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada l = sumaAcumulada (init l) ++ [sum l]

menorDivisor :: Integer -> Integer
menorDivisor n = internoMenorDivisor 2 n
    where internoMenorDivisor i n | n `mod` i == 0 = i
                                  | otherwise = internoMenorDivisor (i+1) n

esPrimo :: Integer -> Bool
esPrimo n = n > 1 && n == menorDivisor n

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarNPrimos 2 n
    where buscarNPrimos i n | n == 1 && esPrimo i = i
                            | esPrimo i = buscarNPrimos (i+1) (n-1)
                            | otherwise = buscarNPrimos (i+1) n

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [descomponer x 1] ++ descomponerEnPrimos xs
    where descomponer :: Integer -> Integer -> [Integer]
          descomponer 1 _ = []
          descomponer n i | n `mod` (nEsimoPrimo i) == 0 = [nEsimoPrimo i] ++ descomponer (n `div` (nEsimoPrimo i)) i
                          | otherwise = descomponer n (i+1)

