module Ej6 where

type Set a = [a]

setVacio :: Set a
setVacio = []

setAgregar :: (Eq a) => a -> Set a -> Set a
setAgregar x c
  | x `elem` c = c
  | otherwise = c ++ [x]

setIncluido :: (Eq a) => Set a -> Set a -> Bool
setIncluido [] _ = True
setIncluido (x : xs) c = (x `elem` c) && (xs `setIncluido` c)

setIguales :: (Eq a) => Set a -> Set a -> Bool
setIguales c1 c2 = c1 `setIncluido` c2 && c2 `setIncluido` c1

agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos n [] = []
agregarATodos n (x : xs) = setAgregar n x : agregarATodos n xs

partes :: Integer -> Set (Set Integer)
partes 0 = [[]]
partes n = partes (n - 1) ++ agregarATodos n (partes (n - 1))

productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano [] _ = []
productoCartesiano (e : c1) c2 = producto e c2 ++ productoCartesiano c1 c2
  where
    producto e [] = []
    producto e (e2 : c) = [(e, e2)] ++ producto e c
