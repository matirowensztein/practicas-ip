pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (p:l) | e == p = True
                  | otherwise = pertenece e l

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [e] = True
todosIguales (e:l) | e /= head l = False
                   | otherwise = todosIguales l

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [e] = True 
todosDistintos (e:l) | e `pertenece` l = False
                     | otherwise = todosDistintos l

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [e] = False
hayRepetidos (e:l) | e `pertenece` l = True
                   | otherwise = hayRepetidos l

hayRepetidos' :: (Eq t) => [t] -> Bool
hayRepetidos' l = not $ todosDistintos l

quitar :: (Eq t) => t -> [t] -> [t]
quitar t [] = []
quitar t (x:xs) | t == x = xs
                | otherwise = [x] ++ quitar t xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos t [] = []
quitarTodos t (x:xs) | t == x = quitarTodos t xs
                     | otherwise = [x] ++ quitarTodos t xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = [x] ++ eliminarRepetidos (quitarTodos x xs)

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] l2 = l2 == []
mismosElementos l1 [] = l1 == []
mismosElementos (x1:l1) (x2:l2) = (x1 == x2 || (x1 `pertenece` l2 && x2 `pertenece` l1)) && 
                                  mismosElementos (quitarTodos x1 (quitarTodos x2 l1)) (quitarTodos x1 (quitarTodos x2 l2))

reverso :: [t] -> [t] 
reverso [] = []
reverso (e:t) = reverso t ++ [e]

capicua :: (Eq t) => [t] -> Bool
capicua l = l == (reverso l)

