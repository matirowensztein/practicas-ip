{-
6 3 -> True
3 6 -> False
7 3 -> False
0 m -> True
n 1 -> True
n n -> True
-}

{-
n divisible por m
n multiplo de m
2n multiplo de m
n+m multiplo de m
n-m multiplo de m
-}

esDivisible :: Integer -> Integer -> Bool
esDivisible n m
    | n < m = False
    | n == m = True
    | n > m = esDivisible (n-m) m

