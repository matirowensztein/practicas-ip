-- (a)
f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

f1 :: Int -> Int
f1 n = do
    if n == 1 
        then 8
    else if n == 4
        then 131
    else if n == 16
        then 16
    else 0

f3 :: Int -> Int
f3 n | n == 1 = 8
     | n == 4 = 131
     | n == 16 = 16

f4 n = case n of
    1 -> 8
    8 -> 131
    16 -> 16

-- (b)
g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

-- (c)
-- h(n) = f(g(n))
-- h(8) = f(g(8)) = f(16) = 16

h :: Int -> Int
h n = f (g n);

k :: Int -> Int
k n = g (f n)
