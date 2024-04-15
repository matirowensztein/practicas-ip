esCapicua :: (Integral a) => a -> Bool
esCapicua n
    | n < 10 = True
    | otherwise = primero == ultimo && siguiente
    where primero = iesimoDigito n 1
          ultimo = iesimoDigito n (cantDigitos n)
          siguiente = esCapicua (n `div` 10 `mod` 10^(cantDigitos n - 2))

iesimoDigito :: (Integral a) => a -> a -> a
iesimoDigito n i = (n `div` (10 ^ (cantDigitos n - i))) `mod` 10

cantDigitos :: (Integral n) => n -> n
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (n `div` 10)
