sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos "" = ""
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = [x] ++ sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
contarPalabras "" = 1
contarPalabras (x:xs) | x == ' ' = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga "" = ""
palabraMasLarga str = comparar (primeraPalabra str) (palabraMasLarga (eliminarPrimeraPalabra str))
    where primeraPalabra "" = ""
          primeraPalabra (c:str) | c == ' ' = "" 
                                 | otherwise = [c] ++ primeraPalabra str
          eliminarPrimeraPalabra "" = ""
          eliminarPrimeraPalabra (c:str) 
                                 | c == ' ' = str 
                                 | otherwise = eliminarPrimeraPalabra str
          comparar str1 str2 
            | length str1 > length str2 = str1 
            | otherwise = str2

palabras :: [Char] -> [[Char]]
palabras "" = []
palabras xs = [primeraPalabra xs] ++ palabras (eliminarPrimeraPalabra xs)
    where primeraPalabra "" = ""
          primeraPalabra (x:xs) | x == ' ' = "" 
                                | otherwise = [x] ++ primeraPalabra xs
          eliminarPrimeraPalabra "" = ""
          eliminarPrimeraPalabra (x:xs) 
                                 | x == ' ' = xs 
                                 | otherwise = eliminarPrimeraPalabra xs

aplanar :: [[Char]] -> [Char]
aplanar [] = ""
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = ""
aplanarConNBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = ""
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ espacios n ++ aplanarConNBlancos xs n
    where espacios 0 = ""
          espacios n = " " ++ espacios (n-1)
