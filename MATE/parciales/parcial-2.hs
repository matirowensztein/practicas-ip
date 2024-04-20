-- https://gitlab.com/faustomartinez/uba-algoritmos-y-estructuras-de-datos-i/-/blob/main/1er-parcial/PrimerParcial.pdf

{-

Ej:
[("Juan Perez", "Susana Garcia"), ("Maria Montero", "Pablo Moreno")]
[34, 56]
34 + 56 = 90
100 - 90 = 10
-}

type Formula = (String, String)

-- (a)

cantidadDeVotosAfirmativos :: [Int] -> Int
cantidadDeVotosAfirmativos [] = 0
cantidadDeVotosAfirmativos (x:xs) = x + cantidadDeVotosAfirmativos xs

votosEnBlanco :: [Formula] -> [Int] -> Int -> Int
votosEnBlanco formulas votos cantTotalDeVotos = cantTotalDeVotos - cantidadDeVotosAfirmativos votos

-- (b)

contiene :: (Eq a) => [a] -> a -> Bool
contiene [] _ = False
contiene (x:xs) y = x == y || xs `contiene` y

formulasValidasAuxiliar :: [Formula] -> [String] -> Bool
formulasValidasAuxiliar [] _ = True
formulasValidasAuxiliar ((p,vp):xs) nombres
    | nombres `contiene` p || nombres `contiene` vp = False
    | otherwise = formulasValidasAuxiliar xs ([p,vp] ++ nombres)

formulasValidas :: [Formula] -> Bool
formulasValidas formulas = formulasValidasAuxiliar formulas []

-- (c)

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

-- como el presidente debe estar en una formula no miro el caso base por la especificacion
-- en un programa real no haria esto, probablemente manejaria el error agregando la linea
-- cantidadDeVotos [] _ = error "El presidente debe estar en la lista"
-- o algo similar
cantidadDeVotos :: String -> [Formula] -> [Int] -> Int
cantidadDeVotos p (x:xs) (v:vs)
    | fst x == p = v
    | otherwise = cantidadDeVotos p xs vs

porcentajeDeVotos :: String -> [Formula] -> [Int] -> Float
porcentajeDeVotos presidente formulas votos = (division (cantidadDeVotos presidente formulas votos) (cantidadDeVotosAfirmativos votos)) * 100

-- (d)
proximaFormula :: [Formula] -> [Int] -> Formula -> Int -> Formula
proximaFormula [] _ formula _ = formula
proximaFormula (f:fs) (v:vs) formula votos
    | v > votos = proximaFormula fs vs f v
    | otherwise = proximaFormula fs vs formula votos

proximoPresidente :: [Formula] -> [Int] -> String
proximoPresidente formulas votos = fst (proximaFormula formulas votos (head formulas) (head votos))

