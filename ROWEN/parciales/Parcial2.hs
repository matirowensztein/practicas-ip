module Parcial2 where

-- 1.1

votosNoBlancos :: [Integer] -> Integer
votosNoBlancos [] = 0
votosNoBlancos (x:xs) = x + votosNoBlancos xs

votosEnBlanco :: [(String, String)] -> [Integer] -> Integer -> Integer
votosEnBlanco formulas votos totalVotos = totalVotos - votosNoBlancos votos

-- 1.2

formulaEnLista :: [(String, String)] -> [String]
formulaEnLista [] = []
formulaEnLista (x:xs) = [fst x, snd x] ++ formulaEnLista xs

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece n (l:ls) | n == l = True
                   | otherwise = pertenece n ls

repeticionNoValida :: [String] -> Bool
repeticionNoValida [] = True
repeticionNoValida (l:ls) | pertenece l ls = False
                          | otherwise = repeticionNoValida ls
                
formulasValidas :: [(String, String)] -> Bool
formulasValidas formulas = repeticionNoValida (formulaEnLista formulas)

-- 1.3

division :: Integer -> Integer -> Float
division a b = (fromIntegral a) / (fromIntegral b)

votosPresi :: String -> [(String, String)] -> [Integer] -> Integer
votosPresi _ [] [] = 1
votosPresi n (l:ls) (v:vs) | n == fst l = v
                           | otherwise = votosPresi n ls vs

calculoPorcentaje :: [Integer] -> Integer -> Float
calculoPorcentaje vs vp = (division vp (sumVotosTot vs)) * 100
    where sumVotosTot [] = 0
          sumVotosTot (v:vs) = v + sumVotosTot vs 

porcentajeDeVotos :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeVotos presidente formulas votos = calculoPorcentaje votos (votosPresi presidente formulas votos) 

-- 1.4

masVotos :: [Integer] -> Integer
masVotos [] = 0
masVotos [x] = x
masVotos (x:y:xs) | x > y = masVotos (x:xs)
                  | otherwise = masVotos (y:xs)

calcularProxPresi :: [(String, String)] -> [Integer] -> Integer -> String
calcularProxPresi [] _ _ = ""
calcularProxPresi (l:ls) (v:vs) mv | mv == v = fst l
                                   | otherwise = calcularProxPresi ls vs mv

proximoPresidente :: [(String, String)] -> [Integer] -> String
proximoPresidente formulas votos = calcularProxPresi formulas votos (masVotos votos)