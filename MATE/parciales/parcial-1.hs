-- https://gitlab.com/faustomartinez/uba-algoritmos-y-estructuras-de-datos-i/-/blob/main/simulacro-1er-parcial/enunciado.pdf

type Persona = String
type Relacion = (Persona, Persona)

sonIguales :: Persona -> Persona -> Bool
sonIguales [] [] = True
sonIguales p1 [] = False
sonIguales [] p2 = False
sonIguales (c1:p1) (c2:p2) = c1 == c2 && sonIguales p1 p2

relacionesValidas :: [Relacion] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) = sonIguales (fst x) (snd x) && relacionesValidas xs

pertenece :: Persona -> [Persona] -> Bool
pertenece p [] = False
pertenece p (x:xs) = sonIguales p x || pertenece p xs

agregarPersonasUnicasA :: [Relacion] -> [Persona] -> [Persona]
agregarPersonasUnicasA [] ps = ps
agregarPersonasUnicasA (r:rs) ps
    | (fst r) `pertenece` ps && (snd r) `pertenece` ps = rs `agregarPersonasUnicasA` ps
    | (fst r) `pertenece` ps = rs `agregarPersonasUnicasA` (ps ++ [snd r])
    | (snd r) `pertenece` ps = rs `agregarPersonasUnicasA` (ps ++ [fst r])
    | otherwise = rs `agregarPersonasUnicasA` (ps ++ [fst r, snd r])

personas :: [Relacion] -> [Persona]
personas [] = []
personas l = l `agregarPersonasUnicasA` []

filtrarRelacionesSin :: [Relacion] -> Persona -> [Relacion]
filtrarRelacionesSin [] _ = []
filtrarRelacionesSin (r:rs) p
    | sonIguales p (fst r) || sonIguales p (snd r) = [r] ++ (rs `filtrarRelacionesSin` p)
    | otherwise = rs `filtrarRelacionesSin` p

eliminarPersona :: [Persona] -> Persona -> [Persona]
eliminarPersona [] _ = []
eliminarPersona (x:xs) p
    | sonIguales x p = eliminarPersona xs p
    | otherwise = [x] ++ eliminarPersona xs p

amigosDe :: Persona -> [Relacion] -> [Persona]
amigosDe p rs = ((rs `filtrarRelacionesSin` p) `agregarPersonasUnicasA` []) `eliminarPersona` p

cantidadDeAmigos :: [Persona] -> Persona
cantidadDeAmigos [] = 0
cantidadDeAmigos (x:xs) = 1 + cantidadDeAmigos xs

masAmigosQue :: [Relacion] -> Persona -> Persona
masAmigosQue rs p1 p2
    | cantidadDeAmigos (amigosDe p1) > cantidadDeAmigos (amigosDe p2) = p1
    | otherwise = p2

personaConMasAmigosRecursion :: [Persona] -> Persona
personaConMasAmigosRecursion (x:xs)
    | x `masAmigosQue` (head xs) = x
    | otherwise = xs

personaConMasAmigos :: [Relacion] -> Persona
personaConMasAmigos r = personaConMasAmigosRecursion (r `agregarPersonasUnicasA` [])

