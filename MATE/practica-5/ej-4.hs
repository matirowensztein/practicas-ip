sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos "" = ""
sacarBlancosRepetidos (c:str)
    | c == ' ' && head str == ' ' = sacarBlancosRepetidos str
    | otherwise = [c] ++ sacarBlancosRepetidos str

contarPalabras :: [Char] -> Integer
contarPalabras "" = 0
contarPalabras (c:str)
    | str == "" && c /= ' ' = 1
    | c == ' ' && head str /= ' ' = 1 + contarPalabras str
    | otherwise = contarPalabras str

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga "" = ""
palabraMasLarga str = comparar (primeraPalabra str) (palabraMasLarga (eliminarPrimeraPalabra str))
    where primeraPalabra "" = ""
          primeraPalabra (c:str) | c == ' ' = "" | otherwise = [c] ++ primeraPalabra str
          eliminarPrimeraPalabra "" = ""
          eliminarPrimeraPalabra (c:str) | c == ' ' = str | otherwise = eliminarPrimeraPalabra str
          comparar str1 str2 | length str1 > length str2 = str1 | otherwise = str2

palabras :: [Char] -> [[Char]]
palabras "" = []
palabras str = [primeraPalabra str] ++ palabras (eliminarPrimeraPalabra str)
    where primeraPalabra "" = ""
          primeraPalabra (c:str) | c == ' ' = "" | otherwise = [c] ++ primeraPalabra str
          eliminarPrimeraPalabra "" = ""
          eliminarPrimeraPalabra (c:str) | c == ' ' = str | otherwise = eliminarPrimeraPalabra str

aplanar :: [[Char]] -> [Char]
aplanar [] = ""
aplanar (s:l) = aplanarPalabra s ++ aplanar l
    where aplanarPalabra "" = ""
          aplanarPalabra (c:s) = [c] ++ aplanarPalabra s

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = ""
aplanarConBlancos (s:l) | aplanarConBlancos l == "" = aplanarPalabra s
                        | otherwise = aplanarPalabra s ++ " " ++ aplanarConBlancos l
    where aplanarPalabra "" = ""
          aplanarPalabra (c:s) = [c] ++ aplanarPalabra s

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] n = ""
aplanarConNBlancos (s:l) n | aplanarConNBlancos l n == "" = aplanarPalabra s
                           | otherwise = aplanarPalabra s ++ espacio n ++ aplanarConNBlancos l n
    where aplanarPalabra "" = ""
          aplanarPalabra (c:s) = [c] ++ aplanarPalabra s
          espacio 0 = ""
          espacio n = " " ++ espacio (n-1)

