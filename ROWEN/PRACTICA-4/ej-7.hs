{-
2222
2 222 - 2
222
2 22 - 2
22 
2 2 - 2
2
-}

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n < 10 = True
    | ultimoDigito == penultimoDigito = todosDigitosIguales (n `div` 10)
    | otherwise = False
    where
    ultimoDigito = n `mod` 10
    penultimoDigito = (n `div` 10) `mod` 10

