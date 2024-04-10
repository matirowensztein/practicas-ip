{-
q^a+b - q^a * q^b
n = 2
m = 3

1/1 + 1/2 + 1/3 + 2/1 + 2/2 + 2/3 = 

-}

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 _ = 0
sumaRacionales n m = helperF n m + sumaRacionales (n-1) m
    where helperF n m | m == 0 = 0
                      | otherwise = fromIntegral n / fromIntegral m + helperF n (m-1)