-- https://gitlab.com/faustomartinez/uba-algoritmos-y-estructuras-de-datos-i/-/blob/main/simulacro-1er-parcial/enunciado.pdf

-- (1)

contiene :: [(String, String)] -> (String, String) -> Bool
contiene [] y = False
contiene (x:xs) y | (fst y == fst x || fst y == snd x) && (snd y == fst x || snd y == snd x) = True
                  | otherwise = contiene xs y

revisarRepetidos :: [(String, String)] -> Bool
revisarRepetidos [] = True
revisarRepetidos (x:xs) | fst x == snd x = False
                        | contiene xs x = False
                        | otherwise = revisarRepetidos xs

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas relaciones = revisarRepetidos relaciones

-- (2)

pertenece :: String -> [String] -> Bool
pertenece _ [] = False 
pertenece x (y:xs) | x == y = True
                   | otherwise = pertenece x xs

sinRepetidos :: [String] -> [String]
sinRepetidos [] = []
sinRepetidos (x:xs) | pertenece x xs = sinRepetidos xs
                    | otherwise = [x] ++ sinRepetidos xs

personas :: [(String, String)] -> [String]
personas [] = []
personas (x:xs) = sinRepetidos (relacionesEnLista) 
                where relacionesEnLista = [fst x, snd x] ++ personas xs

-- (3)

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe y (x:xs) | y == fst x || y == snd x = amigosPersona y x
                  | otherwise = amigosDe y xs 
                  where amigosPersona y x | y == fst x = [snd x] ++ amigosDe y xs
                                          | otherwise = [fst x] ++ amigosDe y xs

-- (4)

cantAmigos :: String -> [String] -> Integer
cantAmigos _ [] = 0 
cantAmigos x (y:xs) | x == y = 1 + cantAmigos x xs
                    | otherwise = cantAmigos x xs

nombreAmigos :: [(String, String)] -> [String]
nombreAmigos [] = []
nombreAmigos (x:xs) = [fst x, snd x] ++ nombreAmigos xs

compararAmigos :: [String] -> String -> Integer -> String
compararAmigos [] n _ = n
compararAmigos (x:xs) n i | cantAmigos x xs >= i = compararAmigos xs x (cantAmigos x xs)
                          | otherwise = compararAmigos xs n i

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = []
personaConMasAmigos xs = compararAmigos (nombreAmigos xs) " " 1