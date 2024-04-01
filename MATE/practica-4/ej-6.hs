{-
Ej con 123
ultimo digito = n `mod` 10
anteultimo digito = (n `mod` 100 - n `mod` 10) `div` 10
anteultimo digito = (n `div` 10) - 10 * (n `div` 100)
antepenultimo digito = (n `mod` 1000 - n `mod` 100) `div` 100

sumaDigitos n = n `mod` 10 + sumaDigitos (n `div` 10)

sumaDigitos 123 = 3 + sumaDigitos 12
sumaDigitos 12 = 2 + sumaDigitos 1
sumaDigitos 1 = 1 + sumaDigitos 0
sumaDigitos 0 = 0

sumaDigitos 13295 = 5 + sumaDigitos 1329
sumaDigitos 1329 = 9 + sumaDigitos 132
sumaDigitos 132 = 2 + sumaDigitos 13
sumaDigitos 13 = 3 + sumaDigitos 1
sumaDigitos 1 = 1 + sumaDigitos 0
sumaDigitos 0 = 0
-}

sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = n `mod` 10 + sumaDigitos (n `div` 10)

sumaDigitos' :: Integer -> Integer
sumaDigitos' n
    | n < 10 = n
    | otherwise = n `mod` 10 + sumaDigitos (n `div` 10)
