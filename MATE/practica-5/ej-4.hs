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
