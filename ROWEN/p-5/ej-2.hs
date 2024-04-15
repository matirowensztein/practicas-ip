pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece y (x:t) | y == x = True
                  | y /= x = pertenece y t

todasIguales :: (Eq t) => [t] -> Bool
todasIguales [] = True
todasIguales [x] = True
todasIguales (x:y:t) | x == y = todasIguales (y:t)
                     | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:t) | pertenece x t = False
                     | otherwise = todosDistintos t

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:t) | pertenece x t = True
                   | otherwise = hayRepetidos t

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:t) | y == x = t
               | y /= x = [x] ++ quitar y t

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos y (x:t) | y == x = quitarTodos y t
                    | y /= x = [x] ++ quitarTodos y t

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:t) | pertenece x t = [x] ++ eliminarRepetidos (quitarTodos x t)
                        | otherwise = [x] ++ eliminarRepetidos t

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] _ = True
mismosElementos _ [] = True
mismosElementos (x:t) (y:s) | pertenece x s && pertenece y t || x == y = mismosElementos t s
                            | otherwise = False

reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:t) = reverso t ++ [x]

capicua :: (Eq t) => [t] -> Bool
capicua t = t == reverso t