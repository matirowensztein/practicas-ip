raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesion (fromIntegral n) - 1
    where sucesion n | n == 1 = 2
                     | otherwise = 2 + (1 / sucesion (n-1))