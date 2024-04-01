esMultiplo :: Int -> Int -> Bool
esMultiplo x y = x `mod` y == 0

bisiesto :: Int -> Bool
bisiesto n = (n `esMultiplo` 4)
    && (not (n `esMultiplo` 100) || (n `esMultiplo` 400))
