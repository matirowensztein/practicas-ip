module MisFunciones where

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)
