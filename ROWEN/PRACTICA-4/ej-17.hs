esFibonacci :: Integer -> Bool
esFibonacci n = internoEsFibonacci (0, 1) n
    where internoEsFibonacci (a, b) n | a == n = True
                                      | a > n = False
                                      | otherwise = internoEsFibonacci (b, a+b) n