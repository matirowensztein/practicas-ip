sumaDivisores :: Int -> Int -> Int
sumaDivisores n 0 = 0
sumaDivisores n i | n `mod` i == 0 = i + sumaDivisores n (i-1)
                          | otherwise = sumaDivisores n (i-1)

tomaValorMax :: Int -> Int -> Int
tomaValorMax a b | a > b = 0
                 | otherwise = max (sumaDivisores a (a-1)) (tomaValorMax (a+1) b)
