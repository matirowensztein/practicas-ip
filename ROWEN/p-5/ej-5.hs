nat2bin :: Integer -> [Integer]
nat2bin n | n < 2 = [1]
          | mod n 2 == 0 = nat2bin (div n 2) ++ [0]
          | mod n 2 /= 0 = nat2bin (div n 2) ++ [1]
          
-- bin2nat :: [Integer] -> Integer
-- bin2nat [] = 0
-- bin2nat xs = calcAux xs 0
--     where calcAux [] _ = 0
--           calcAux (x:xs) n = [x] * (2^n) + calcAux xs (n+1)

-- bin2nat :: [Integer] -> Integer
-- bin2nat [] = 0
-- bin2nat (x:xs) = x * 2^(length xs) + bin2nat xs
 
-- nat2hex :: Integer -> [Char]

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = sumaAcumulada (quitarUltimo xs) ++ [sumAux xs] 
    where sumAux [] = 0
          sumAux (y:ys) = y + sumAux ys
          quitarUltimo [x] = []
          quitarUltimo (x:xs) = [x] ++ quitarUltimo xs

-- descomponerEnPrimos [2, 10, 6] es [[2], [2, 5], [2, 3]]
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [divPrimos x 2] ++ descomponerEnPrimos xs
    where divPrimos 1 _ = []
          divPrimos x y | esPrimo y && mod x y == 0 = [y] ++ divPrimos (div x y) y
                        | otherwise = divPrimos x (y+1)

esPrimo :: Integer -> Bool
esPrimo n
    | n == 1 = True
    | n == 2 = True
    | mod n 2 == 0 = False
    | otherwise = helperPrimo n 3
    where helperPrimo n m | mod n m == 0 && m /= n = False
                          | m < n = helperPrimo n (m + 2)
                          | otherwise =  True