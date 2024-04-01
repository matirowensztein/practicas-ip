{-
a*a + a*b*k = 0
a*a = -a*b*k
k*b = -a
k = -a/b
-}

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = (a `div` b) * b == a
