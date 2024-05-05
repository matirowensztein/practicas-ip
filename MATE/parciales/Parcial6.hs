{-

¡Vamos Campeones!
En exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas
funcionalidades en Haskell, Los datos con los que contamos para esto son los nombres de los equipos que participan
del torneo, los nombres de los arqueros titulares de cada uno de dichos equipos, y la cantidad de goles recibidos
por esos arqueros. Los nombres de los equipos y sus respectivos arqueros serán modelados mediante tuplas de tipo
(String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre
del arquero titular de dicho equipo.
En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goles es [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)

1) Atajaron Suplentes
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {
	res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.
	}
}

2) Equipos Válidos
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {
	(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club
	}
}

3) Porcentaje de goles
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {
	res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
	}
}

Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

4) valla menos vencida
problema vallamenosvencida (arquerosporequipo: seq<string x string>, goles: seq<z>): string {
	requiere: {equiposvalidos(arquerosporequipo)}
	requiere: {|arquerosporequipo| = |goles|}
	requiere: {todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {
	res es alguno de los arqueros de arquerosporequipo que menor goles recibió de acuerdo a goles
	}
-}

module Parcial6 where

suma :: (Integral a) => [a] -> a
suma [x] = x
suma (x : xs) = x + suma xs

atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int
atajaronSuplentes _ goles totalGolesTorneo = totalGolesTorneo - suma goles

contiene :: (Eq a) => [a] -> a -> Bool
contiene [] _ = False
contiene (x : xs) y = x == y || xs `contiene` y

equiposValidosRecursivo :: [(String, String)] -> [String] -> Bool
equiposValidosRecursivo [] _ = True
equiposValidosRecursivo ((a, _) : xs) equipos = not (equipos `contiene` a) && equiposValidosRecursivo xs (a : equipos)

equiposValidos :: [(String, String)] -> Bool
equiposValidos arquerosPorEquipo = equiposValidosRecursivo arquerosPorEquipo []

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

golesDe :: String -> [(String, String)] -> [Int] -> Int
golesDe t ((_, c) : xs) (g : gs)
  | t == c = g
  | otherwise = golesDe t xs gs

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles arquero arquerosPorEquipo goles = 100 * division (golesDe arquero arquerosPorEquipo goles) (suma goles)

vallaMenosVencidaRecursivo :: (String, Int) -> [(String, String)] -> [Int] -> String
vallaMenosVencidaRecursivo (a, g) [] _ = a
vallaMenosVencidaRecursivo (a, g) ((_, a2) : as) (g2 : gs)
  | g >= g2 = vallaMenosVencidaRecursivo (a, g) as gs
  | otherwise = vallaMenosVencidaRecursivo (a2, g2) as gs

vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida arquerosPorEquipo goles = vallaMenosVencidaRecursivo ("", -1) arquerosPorEquipo goles
