module Practica where

{-
problema menorDivisor(n: Z): Z {
    requiere { n > 1 }
    asegura { res | n }
    asegura { forall m, m | n -> m >= res }
}
-}

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorAux n 2
    where menorDivisorAux n m | n `mod` m == 0 = m
                              | otherwise = menorDivisorAux n (m+1)

{-
problema esPrimo(n: Z): Z {
    requiere { True }
    asegura { n = 1 -> res = False }
    asegura { res = True <-> n = menorDivisor n }
}
-}

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = n == menorDivisor n

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs) = a /= b && (a,b) `noEn` xs && relacionesValidas xs
    where noEn _ [] = True
          noEn (a,b) ((c,d):xs) =  (a /= c || b /= d) && (a /= d || b /= c) && (a,b) `noEn` xs

personasAux :: [(String,String)] -> [String] -> [String]
personasAux [] ps = ps
personasAux ((a,b):rs) ps = personasAux rs ((a `siNoEsta` ps) ++ (b `siNoEsta` ps) ++ ps)
    where siNoEsta p [] = [p]
          siNoEsta p [q] | p == q = []
                         | otherwise = [p]
          siNoEsta p (q:qs) | p == q = []
                            | otherwise = siNoEsta p qs

personas :: [(String,String)] -> [String]
personas rs = personasAux rs []

amigosDeAux :: String -> [(String, String)] -> [String] -> [String]
amigosDeAux p [] ps = ps
amigosDeAux p ((a,b):rs) ps | p == a = amigosDeAux p rs (b:ps)
                            | p == b = amigosDeAux p rs (a:ps)
                            | otherwise = amigosDeAux p rs ps

amigosDe :: String -> [(String, String)] -> [String]
amigosDe p rs = amigosDeAux p rs []

largo :: [String] -> Int
largo [] = 0
largo (p:ps) = 1 + largo ps

cantAmigos :: String -> [(String, String)] -> Int
cantAmigos p rs = largo (amigosDe p rs)

personaConMasAmigosAux :: String -> [String] -> [(String, String)] -> String
personaConMasAmigosAux p [] _ = p
personaConMasAmigosAux p (q:qs) rs | amigosDeP >= amigosDeQ = personaConMasAmigosAux p qs rs
                                   | otherwise = personaConMasAmigosAux q qs rs
    where amigosDeP = cantAmigos p rs
          amigosDeQ = cantAmigos q rs

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos rs = personaConMasAmigosAux (head ps) (tail ps) rs
    where ps = personas rs
