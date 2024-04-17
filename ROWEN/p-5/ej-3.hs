sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [] = 1
maximo (x:xs) = maximoAux x (maximo xs)
    where maximoAux a b | a >= b = a
                        | otherwise = b

sumarN :: Integer -> [Integer] -> [Integer]
sumarN y [] = []
sumarN y (x:xs) = [x + y] ++ sumarN y xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (last xs) (x:xs)

pares :: [Integer] -> [Integer] 
pares [] = []
pares (x:xs) | mod x 2 /= 0 = pares xs
             | otherwise = [x] ++ pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN y (x:xs) | mod x y == 0 = [x] ++ multiplosDeN y xs
                      | otherwise = multiplosDeN y xs

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = [maximo xs] ++ ordenar (quitarTodos (maximo xs) xs)

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos y (x:xs) | y == x = quitarTodos y xs
                    | y /= x = [x] ++ quitarTodos y xs