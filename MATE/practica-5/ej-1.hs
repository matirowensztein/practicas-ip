longitud :: [t] -> Integer
longitud [] = 0
longitud (e:t) = 1 + longitud t

ultimo :: [t] -> t 
ultimo [e] = e 
ultimo (_:t) = ultimo t

principio :: [t] -> [t] 
principio [e] = []
principio (e:t) = [e] ++ principio t

reverso :: [t] -> [t] 
reverso [] = []
reverso (e:t) = reverso t ++ [e]
