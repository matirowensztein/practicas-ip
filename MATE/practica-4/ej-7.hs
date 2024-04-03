todosDigitosIguales :: (Integral a) => a -> Bool
todosDigitosIguales n
    | n < 10 = True
    | otherwise = ultimoDigito == anteultimoDigito && todosDigitosIguales (n `div` 10)
    where ultimoDigito = n `mod` 10
          anteultimoDigito = n `div` 10 `mod` 10
