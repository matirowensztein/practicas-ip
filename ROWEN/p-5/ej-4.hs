sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos "" = ""
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = [x] ++ sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
contarPalabras "" = 1
contarPalabras (x:xs) | x == ' ' = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs

palabraMasLarga :: [Char] -> Integer
palabraMasLarga "" = 0
palabraMasLarga (x:xs) | x /= ' ' = 1 + palabraMasLarga xs
                       | otherwise = palabraMasLarga xs
                       where contadorCaracteres (x:xs) | x /= ' ' = 1 + palabraMasLarga xs
                                                       | otherwise = palabraMasLarga xs