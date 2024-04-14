sumaDivisores :: Integer -> Integer
sumaDivisores x = helperSD x 1 0
    where helperSD x y z | mod x y == 0 = helperSD x (y+1) (z+y)
                         | x >= y = helperSD x (y+1) z
                         | otherwise = z

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax a b = helperTVM a b 0 0
    where helperTVM a b c d | c < sumaDivisores a = helperTVM a b (sumaDivisores a) a
                            | a < b = helperTVM (a+1) b c d
                            | otherwise = d