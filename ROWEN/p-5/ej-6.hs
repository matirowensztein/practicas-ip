type Set a = [a]

vacio :: Set Int
vacio = []

agregar :: Int -> Set Int -> Set Int
agregar x []= [x]
agregar x c | pertenece x c = c
            | otherwise = (x:c)
            where pertenece x (y:c) | x == y = True
                                    | otherwise = pertenece x c