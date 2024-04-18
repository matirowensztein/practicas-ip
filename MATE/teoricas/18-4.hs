{-
Parametros vs tuplas

- (_,_) es el constructor de una dupla
- (_,_,...,_) es el constructor de una tupla

notar que _ debe ser un valor, no un tipo, ya que sino
(_,_) seria el tipo de la dupla, no su constructor

n / n en Z es el constructor del tipo Int
-}
suma :: (Float, Float) -> (Float, Float) -> (Float, Float)
suma v w = (fst v + fst w, snd v + snd w)

suma' :: (Float, Float) -> (Float, Float) -> (Float, Float)
suma' (vx, vy) (wx, wy) = (vx + wx, vy + wy)

{-
promedio :: Float -> Float -> Float
y no
promedio :: Float X Float -> Float

por la currificacion, ya que la primera funcion
se puede interperetar como una funcion que toma dos
flotantes y devuelve un flotante o bien se puede 
interpretar como una funcion que toma un 
flotante y devuelve otra function que toma un flotante
y devuelve otro flotante (por aplacacion parcial)

promedio :: (Float -> Float) -> Float
o bien
promedio :: Float -> (Float -> Float)

((promedio 2) 3)
  ^ funcion
             ^ flotante

en esta materia n vamos a ver funciones de alto orden :C
es decir, funciones que toman como parametro otras funciones
estas functiones pueden ser interpretadas asi por el
concepto de currificacion

promedio :: (Float -> Float) -> Float
puede interpretarse como una function que toma otra
function tipo Float -> Float y devuelve un Float
-}

maximo :: Int -> Int -> Int
maximo n m
  | n > m = n
  | otherwise = m

-- usar a maximo como funcion auxiliar
maximo3 :: Int -> Int
maximo3 n = maximo 3 n

maximo3AlReves :: Int -> Int
maximo3AlReves n = maximo n 3

-- usar a maximo con aplicacion parcial
maximo3' :: Int -> Int
maximo3' = maximo 3

-- haskell no permite function overloading :C

-- en haskell no hay variables ya que tiene transparencia
-- referencial, solo tiene expresiones que no pueden ser
-- reasignadas y puede reducir expresiones en una expresion
-- atomica

-- ejecutar un programa en haskell es aplicar el mecanismo
-- de reduccion a las expresiones hasta alcanzar una
-- expresion atomica, que es el resultado que se muestra

{-
Recursion

Para que una funcion recursiva este bien definida:
- Debe tener al menos un caso base.
- Las llamadas recursivas deben acercarse al caso base.
-}

-- factorial usando guardas
factorial :: Integer -> Integer
factorial n
  | n == 0 = 1
  | n > 0 = n * factorial (n-1)

-- usando otherwise (otherwise := True)
factorial' :: Integer -> Integer
factorial' n
  | n == 0 = 1
  | otherwise = n * factorial (n-1)

-- usando pattern matching (un concepto del paradigma funcional)
factorial'' :: Integer -> Integer
factorial'' 0 = 1
factorial'' n = n * factorial (n-1)

{-
Haskell es peresozo (lazy) ya que solo comuta las cosas que
estrictamente necesita computar, como en la logica ternaria
de cortocircuito

Como reduce la expresion factorial 3?

factorial 3
-> 3 * factorial 2
-> 3 * 2 * factorial 1
-> 6 * factorial 1
-> 6 * 1 * factorial 0
-> 6 * * factorial 0
-> 6 * 1 * 1
-}

esPar :: Int -> Bool
esPar n
  | n == 0 = True
  | n == 1 = False
  | otherwise = esPar (n-2)

-- otra alternativa menos efeciente ya que la funcion
-- esPar se ejecuta el doble de veces (no se evalua en esta
-- materia)
esPar' :: Int -> Bool
esPar' n
  | n == 0 = True
  | otherwise = not (esPar (n-1))

{-
not (esPar 24)) -> not True -> False
         ^ HI -> True
not (not (not ... esPar 0)) -> False
                     ^ True
-}

esPar'' :: Int -> Bool
esPar'' n = n `mod` 2 == 0;

-- :t mod
-- mod :: Integral a => a -> a -> a

sumaLosPrimerosNImpares :: Integer -> Integer
sumaLosPrimerosNImpares n
  | n == 1 = 1
  | n > 1 = nEsimoImpar + sumaLosPrimerosNImpares (n-1)
  where nEsimoImpar = 2*n - 1

-- o por formula cerrada sin recursion
sumaLosPrimerosNImpares' :: Integer -> Integer
sumaLosPrimerosNImpares' n = n^2 - 1
-- esto se puede probar por induccion

{-
para mas tarde
Probar que  1 + 3 + ... + n*2-1 = n^2 - 1 para todo n en N
Es el ej de la diapo

En esta materia no es necesario probar la correctitud
del algoritmo, ya que se evalua con testing.
-}


{-
El where es un reemplazo sintactico, por lo tanto ocupa
menos espacio de memoria y es mas eficiente que crear y
llamar una nueva funcion.
-}

{-
Generalizacion de funciones
Resolver un problema utilizando otro similar.

Implementar una funcion sumaDivisores :: Integer -> Integer
que calcule la suma de los divisores de un numero entero positivo
-}

sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta i n
  | i == n = n
  | n `mod` i == 0 = i + (i+1) `sumaDivisoresHasta` n
  | otherwise = (i+1) `sumaDivisoresHasta` n

sumaDivisores :: Integer -> Integer
sumaDivisores n = 1 `sumaDivisoresHasta` n

-- Lo mismo pero con i de n a 1 en vez de 1 a n
sumaDivisoresHasta' :: Integer -> Integer -> Integer
sumaDivisoresHasta' 1 _ = 1
sumaDivisoresHasta' i n
  | n `mod` i == 0 = i + (i-1) `sumaDivisoresHasta'` n
  | otherwise = (i-1) `sumaDivisoresHasta'` n

sumaDivisores' :: Integer -> Integer
sumaDivisores' n = n `sumaDivisoresHasta'` n

esPrimo :: Integer -> Bool
esPrimo n = sumaDivisores n == n + 1

{-
Especificacion de un problema: Extension
Se puede restringir los posibles tipos de una variable de tipo
mediante un requiere

problema suma (x: T, y: T): T {
  requiere: { T en [N,Z,R] } // en haskell es la clase de tipos
  asegura: { res = x + y }
}
-}

{-
Pensemos en listas: Motivacion
maximo :: Int -> Int -> Int
maximo3 :: Int -> Int -> Int -> Int
maximo4 :: Int -> Int -> Int -> Int -> Int
.
.
.
maximoN :: Int -> Int -> ... -> Int

Con listas, usamos
maximoN :: [Int] -> Int

Listas
Las listas son secuencias de elementos de un mismo tipo
- [1,2,3] :: [Int]
- [True,False,False,True] :: [Bool]
- [] es la lista vacia
- [10 `div`5,2 `div` 2] :: [Int]
- [[1],[2,3],[],[1,1000,2,0] :: [[Int]]

Observadores del preludio de las listas
- head :: [a] -> a
  - su precondicion es que la lista no este vacia
- tail:: [a] -> a
  - su precondicion es que la lista no este vacia
- (:) :: a -> [a] -> a
  - es el constructor de las listas
  - opera con precedencia de derecha a izquierdad
  - a1 : [a2,a3,...an] = $ [a1] ++  [a2,a2,...an] (creo)
- (++) :: [a] -> [a] -> [a]
  - es la concatenacion de listas

[1,2,3] = 1:2:3:[]

[a1,a2,...,an]
= a1:[a2,...,an]]
= a1:a2:...:an:[]

[2,3] ++ [4,5]

[1..] es una lista infinita, pero como haskell computa valores
de forma lazy, no tiene problema trabajando con listas infinitas

Ej: Escribir una expresion que denote la lista estrictamente decreciente
de enteros que comienza con el numero 1 y termina con el numero
-100.
[1,(-1)..(-100)]

Ej: Escribir una expresion que denote la lista estrictamente creciente de
enteros entre −20 y 20 que son congruentes a 1 modulo 4
[i | i <- [-20..20], i `mod` 4 == 1]
o bien (con lo que vimos)
[-19,-15..20]

5 congruente a 8 modulo 3 (5 = 8 (3)) ya que 8/5 tiene resto 3
-}

-- con pattern matching
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:l) = x + (sumatoria l)

-- con observadores (head y tail)
sumatoria' :: [Integer] -> Integer
sumatoria' [] = 0
sumatoria' l = head l + (sumatoria' (tail l))

-- con observadores y guardas sin nada de pattern matching
sumatoria'' :: [Integer] -> Integer
sumatoria'' l
  | l == [] = 0
  | otherwise = head l + (sumatoria'' (tail l))

-- usando un where no muy util en mi opinion
sumatoria''' :: [Integer] -> Integer
sumatoria''' l
  | esVacia = 0
  | otherwise = head l + (sumatoria''' (tail l))
  where esVacia = l == []

-- sacando esVacia a otra funcion afuera del where
-- cambiando el scope de esVacia de la funcion al scope global
esVacia :: [Integer] -> Bool
esVacia l = l == []

esVacia' :: [Integer] -> Bool
esVacia' = (==) []

sumatoria'''' :: [Integer] -> Integer
sumatoria'''' l
  | esVacia l = 0
  | otherwise = head l + (sumatoria'''' (tail l))

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (_:l) = 1 + (longitud l)

pertenece :: Integer -> [Integer] -> Bool
pertenece _ [] = False
pertenece x (l:ls) = x == l || pertenece x ls

