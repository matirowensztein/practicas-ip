type Set a = [a]

vacio :: Set Integer
vacio = []

perteneceNum :: Integer -> Set Integer -> Bool
perteneceNum _ [] = False
perteneceNum n (x:xs) | n == x = True
                      | otherwise = perteneceNum n xs

perteneceList :: Set Integer -> Set (Set Integer) -> Bool
perteneceList _ [] = False
perteneceList n (x:xs) | mismosElementos n x = True
                       | otherwise = perteneceList n xs        

agregar :: Integer -> Set Integer -> Set Integer
agregar x c | perteneceNum x c = c
            | otherwise = (x:c)
             
agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos _ [] = []
agregarATodos n (x:xs) | perteneceList (agregar n x) (x:xs) = agregarATodos n xs
                       | otherwise = [agregar n x] ++ agregarATodos n xs

quitarTodos _ [] = []
quitarTodos y (x:t) | y == x = quitarTodos y t
                    | y /= x = [x] ++ quitarTodos y t

mismosElementos [] [] = True
mismosElementos [] s = s == []
mismosElementos t [] = t == []
mismosElementos (x:t) (y:s) | (perteneceNum x s && perteneceNum y t) || x == y = mismosElementos (quitarTodos x s) (quitarTodos y t)
                            | otherwise = False