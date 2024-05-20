contieneNum :: Integer -> [Integer] -> Bool
contieneNum y [] = False
contieneNum y (x:xs) | x == y = True
                     | otherwise = contieneNum y xs

perteneceLista :: Integer -> [[Integer]] -> [[Integer]]
perteneceLista _ [] = []
perteneceLista n (x:xs) | contieneNum n x = [x] ++ perteneceLista n xs
                         | otherwise = [n:x] ++ perteneceLista n xs

revisarRepetidos :: [[Integer]] -> [[Integer]]
revisarRepetidos [] = []
revisarRepetidos (x:xs) | contiene x xs = revisarRepetidos xs
                        | otherwise =  [x] ++ revisarRepetidos xs

quitarTodos :: Integer -> [Integer] -> [Integer]
quitarTodos _ [] = []
quitarTodos y (x:xs) | y == x = quitarTodos y xs
                    | y /= x = [x] ++ quitarTodos y xs

sonIguales :: [Integer] -> [Integer] -> Bool
sonIguales [] [] = True
sonIguales [] ys = False
sonIguales xs [] = False
sonIguales (x:xs) y | contieneNum x y = sonIguales xs (quitarTodos x y)
                    | otherwise = False


contiene :: [Integer] -> [[Integer]] -> Bool
contiene y [] = False
contiene y (x:xs) | sonIguales y x = True
                  | otherwise = contiene y xs

agregarATodos :: Integer -> [[Integer]] -> [[Integer]]
agregarATodos n ls = revisarRepetidos (perteneceLista n ls)