esPar :: Int -> Bool
esPar = even

f :: Int -> Int
f n = if n <= 7 then n * n else 2 * n - 1

g :: Int -> Int
g n = if esPar n then n `div` 2 else 3 * n + 1

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (n1, n2, n3) = (f n1 > g n1) && (f n2 > g n2) && (f n3 > g n3)
