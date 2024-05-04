-- https://github.com/laurabailleres/introprogramacion/blob/main/consignaParcialHaskell.txt

type Formula = (String, String)

-- (a)

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

cantidadDeVotosAfirmativos :: [Int] -> Int
cantidadDeVotosAfirmativos [] = 0
cantidadDeVotosAfirmativos (x:xs) = x + cantidadDeVotosAfirmativos xs

porcentajeDeVotosAfirmativos :: [Formula] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos formula votos cantTotalVotos = (division (cantidadDeVotosAfirmativos votos) cantTotalVotos) * 100

-- (b)

nombresEnFormulas :: [Formula] -> [String]
nombresEnFormulas [] = []
nombresEnFormulas (x:xs) = [fst x, snd x] ++ nombresEnFormulas xs

contiene :: [String] -> String -> Bool
contiene [] y = False
contiene (x:xs) y = x == y || contiene xs y

repetido :: [String] -> Bool
repetido [] = False
repetido (x:xs) = contiene xs x || repetido xs

formulasInvalidas :: [Formula] -> Bool
formulasInvalidas formulas = repetido (nombresEnFormulas formulas)

-- (c)

cantidadDeVotosAlVice :: String -> [Formula] -> [Int] -> Int
cantidadDeVotosAlVice vice (f:fs) (v:vs)
    | vice == snd f = v
    | otherwise = cantidadDeVotosAlVice vice fs vs
    
porcentajeDeVotos :: String -> [Formula] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = (division votosVice votosAfirmativos) * 100
    where votosVice = cantidadDeVotosAlVice vice formulas votos
          votosAfirmativos = cantidadDeVotosAfirmativos votos

menorCantidadVotos :: [Int] -> Int
menorCantidadVotos [] = -1
menorCantidadVotos [x] = x
menorCantidadVotos (x:xs) | x < y = x | otherwise = y
    where y = menorCantidadVotos xs

presidenteConTantosVotos :: [Formula] -> [Int] -> Int -> String
presidenteConTantosVotos [] _ _ = ""
presidenteConTantosVotos (f:fs) (v:vs) votos
    | v == votos = fst f
    | otherwise = presidenteConTantosVotos fs vs votos

menosVotado :: [Formula] -> [Int] -> String
menosVotado formulas votos = presidenteConTantosVotos formulas votos (menorCantidadVotos votos)