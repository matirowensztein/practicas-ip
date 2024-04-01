sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = (x `mod` 10) + ((x `div` 10) `mod` 10)

comparar :: Int -> Int -> Int
comparar a b
    | val == LT = 1
    | val == EQ = 0
    | val == GT = -1
    where val = sumaUltimosDosDigitos a `compare` sumaUltimosDosDigitos b

