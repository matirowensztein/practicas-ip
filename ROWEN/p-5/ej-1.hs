{-
    t: [1,2,3,4,5]
    longitud = 1 + logitud (1 : [2,3,4,5])
    longitud = 1 + 1 + logitud (2 : [3,4,5])
    longitud = 1 + 1 + 1 + logitud (3 : [4,5])
    longitud = 1 + 1 + 1 + 1 + logitud (4 : [5])
    longitud = 1 + 1 + 1 + 1 + 1 + logitud (5 : [])
    longitud = 1 + 1 + 1 + 1 + 1 + 0
    longitud = 5
-}

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:t) = 1 + longitud t


{-
    t: [1,2,3]
    ultimo = ultimo (1 : [2,3])
    ultimo = ultimo (2 : [3])
    ultimo = 3
-}

ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:t) = ultimo t


principio :: [t] -> [t] 
principio [x] = []
principio (x:t) = [x] ++ principio t

{-
    t: [1,2,3]
    reverso = reverso (1 : [2,3]) ++ [1]
    reverso = reverso (2 : [3]) ++ [2]  ++ [1]
    reverso = [3] ++ [2]  ++ [1]
    reverso = [3,2,1]
-}

reverso :: [t] -> [t]
reverso [x] = [x]
reverso (x:t) = reverso t ++ [x]