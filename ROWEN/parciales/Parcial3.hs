import Data.Char

esMin :: Char -> Bool
esMin a = ord a >= ord 'a' && ord a <= ord 'z'
charANat :: Char -> Int
charANat a | esMin a = (ord a) - (ord 'a')
natAChar :: Int -> Char
natAChar n | 0 <= n && n <= 25 = chr ((ord 'a' )+n)
natAChar1 :: Int -> Char
natAChar1 n | (-25) <= n && n < 0 = chr((ord 'z' ) + n)

-- (1)

cantMinuscula :: String -> Int
cantMinuscula [] = 0
cantMinuscula (x:xs) | esMin x = 1 + cantMinuscula xs
                     | otherwise = cantMinuscula xs

-- (2)

maximoCambios :: [String] -> String
maximoCambios [] = ""
maximoCambios [x] = x
maximoCambios (x:y:xs) | cantMinuscula x >= cantMinuscula y = maximoCambios (x:xs)
                       | otherwise = maximoCambios (y:xs)

-- (3)

desplazar :: Char -> Int -> Char
desplazar c n | (charANat c + n) < 0 = natAChar(25 - charANat c)
              | ((charANat c) + n) > 25 = natAChar(n - (25 - charANat c) - 1)
              | otherwise = natAChar (charANat c + n)

-- (4)

codificar :: String -> Int -> String
codificar [] _ = ""
codificar (m:ms) n | esMin m = [desplazar m n] ++ codificar ms n
                   | otherwise = [m] ++ codificar ms n

-- (5)

decodificar :: String -> Int -> String
decodificar [] _ = ""
decodificar (m:ms) n | esMin m = [desplazar m (-n)] ++ decodificar ms n
                     | otherwise = [m] ++ decodificar ms n