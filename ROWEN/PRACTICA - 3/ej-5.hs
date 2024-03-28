todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (a, b, c) | f (a) > g (a) && f (b) > g (b) && f (c) > g (c) = True
                       | otherwise = False 

f :: Integer -> Integer
f x | x <= 7 = x^2
    | otherwise = 2*x - 1 

g :: Integer -> Integer
g y | mod y 2 == 0 = y `div` 2
    | otherwise = 3 * y + 1