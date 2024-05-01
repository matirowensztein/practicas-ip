perteneceLista :: [Int] -> [Int] -> Bool
perteneceLista [] _ = True
perteneceLista [] _ = True
perteneceLista [] _ = True
perteneceLista (l:y) xs | perteneceNum l xs = perteneceLista y xs
                        | otherwise = False
                       where 
                        perteneceNum _ [] = False
                             perteneceNum l (x:xs) | l == x = True
                                                   | otherwise = perteneceNum l xs

contiene :: [Int] -> [[Int]] -> Bool
contiene _ [] = False
contiene y (x:xs) | perteneceLista y x = True
                  | otherwise = contiene y xs

listaSinRepetidos :: [[Int]] -> Bool
listaSinRepetidos [] = False
listaSinRepetidos (x:xs) = contiene x xs || listaSinRepetidos xs