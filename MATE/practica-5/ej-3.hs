{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use :" #-}
{-# HLINT ignore "Use even" #-}

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:l) = x + sumatoria l

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:l) = x * productoria l

maximo :: [Integer] -> Integer
maximo [] = 1
maximo (x:l) | x > y = x
             | otherwise = y
    where y = maximo l
    
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:l) = [x+n] ++ sumarN n l

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero l = sumarN (head l) l

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo l = sumarN (last l) l

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | x `mod` 2 == 0 = [x] ++ pares xs
             | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | x `mod` n == 0 = [x] ++ multiplosDeN n xs
                      | otherwise = multiplosDeN n xs
                      
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = ordenar [a | a <- xs, a <= x] ++ [x] ++ ordenar [a | a <- xs, a > x]
