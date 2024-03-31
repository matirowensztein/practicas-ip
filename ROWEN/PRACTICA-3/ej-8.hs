sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos c = mod c 10 + mod (c `div` 10) 10

comparar :: Integer -> Integer -> Integer
comparar a b 
    | sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b) = 1
    | sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b) = -1
    | sumaUltimosDosDigitos(a) == sumaUltimosDosDigitos(b) = 0
