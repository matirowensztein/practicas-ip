module MisFunciones where

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

menoresA :: (a Ord) => [a] -> a -> [a]
menoresA [] _ = []
menoresA (x:xs) y
    | x <= y = [x] ++ menoresA xs y
    | otherwise = menoresA xs y

mayoresA :: (a Ord) => [a] -> a -> [a]
mayoresA [] _ = []
mayoresA (x:xs) y
    | x > y = [x] ++ mayoresA xs y
    | otherwise = mayoresA xs y

qsort :: (a Ord) => [a] -> [a]
qsort [] = []
qsort (x:xs) = menoresA xs x ++ [x] ++ mayoresA xs x
