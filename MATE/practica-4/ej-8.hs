iesimoDigito :: (Integral a) => a -> a -> a
iesimoDigito n i = (n `div` (10 ^ (cantDigitos n - i))) `mod` 10

cantDigitos :: (Integral n) => n -> n
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (n `div` 10)
