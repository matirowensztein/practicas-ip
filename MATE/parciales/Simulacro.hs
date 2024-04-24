module Simulacro where

type Relacion = (String, String)

relacionesIncluyen :: [Relacion] -> Relacion -> Bool
relacionesIncluyen [] _ = False
relacionesIncluyen (x:xs) r = (fst x == fst r && snd x == snd r) || (fst x == snd r && snd x == fst r)

relacionesValidas :: [Relacion] -> Bool
relacionesValidas [] = True
relacionesValidas (r:rs) = fst r /= snd r && not (relacionesIncluyen rs r) && relacionesValidas rs

personaEn :: [String] -> String -> Bool
personaEn [] _ = False
personaEn (x:xs) y = x == y || personaEn xs y

personasUnicas :: [Relacion] -> [String] -> [String]
personasUnicas [] ps = ps
personasUnicas (x:xs) ps
    | personaEn ps (fst x) && personaEn ps (snd x) = personasUnicas xs ps
    | personaEn ps (fst x) = personasUnicas xs ([snd x] ++ ps)
    | personaEn ps (snd x) = personasUnicas xs ([fst x] ++ ps)
    | otherwise = personasUnicas xs ([fst x, snd x] ++ ps)

personas :: [Relacion] -> [String]
personas relaciones = personasUnicas relaciones []

amigosDeAux :: String -> [Relacion] -> [String]
amigosDeAux _ [] = []
amigosDeAux p (x:xs)
    | p == fst x = [snd x] ++ amigosDeAux p xs
    | p == snd x = [fst x] ++ amigosDeAux p xs
    | otherwise = amigosDeAux p xs

amigosDe :: String -> [Relacion] -> [String]
amigosDe persona relaciones = amigosDeAux persona relaciones

largo :: [a] -> Integer
largo [] = 0
largo (_:xs) = 1 + largo xs

masAmigosRecursivo :: String -> [String] -> [Relacion] -> String
masAmigosRecursivo p [] _ = p
masAmigosRecursivo p (x:xs) rs
    | largo (amigosDe x rs) > largo (amigosDe p rs) = masAmigosRecursivo x xs rs
    | otherwise = masAmigosRecursivo p xs rs

personaConMasAmigos :: [Relacion] -> String
personaConMasAmigos relaciones = masAmigosRecursivo (head (personas relaciones)) (tail (personas relaciones)) relaciones
