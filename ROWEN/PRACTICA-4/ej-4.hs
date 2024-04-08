{-
sumaImpares 7 = 1 + 3 + 5 + 7 + 9 + 11 + 13
sumaImpares 6 = 1 + 3 + 5 + 7 + 9 + 11
sumaImpares 7 = (sumaImpares 6) + 13
sumaImpares 7 = sumaImpares 6
sumaImpares n = nImpar n + sumaImpares (n - 1)
sumaImpares n = n*2-1 + sumaImpares (n - 1)

nImpar 1 = 1
nImpar 2 = 3
nImpar 3 = 5

nImpar 1 = 1*2 - 1
nImpar 2 = 2*2 - 1
nImpar 3 = 3*2 - 1
nImpar n = n*2 - 1

n = 3
sumaImpares 3 = 5 + 4 = 9
n = 2
sumaImpares 2 = 3 + 1
n = 1
sumaImpares 1 = 1 + 0
n = 0
sumaImpares 0 = 0

1 + 2 + 3 + 4 + 5 + 6 + 7
-}

-- sumaImpares n = n*2-1 + sumaImpares (n - 1)

sumaImpares :: Integer -> Integer
sumaImpares n
    | n < 0 = error "n debe ser mayor o igual a 0"
    | n == 0 = 0
    | otherwise = nImpar n + sumaImpares (n - 1)
    where nImpar n = n*2-1;
