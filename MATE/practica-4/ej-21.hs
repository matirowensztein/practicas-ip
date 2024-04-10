pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m (-1) r = 0
pitagoras m n r = internoPitagoras m n r + pitagoras m (n-1) r

internoPitagoras :: Integer -> Integer -> Integer -> Integer
internoPitagoras (-1) q r = 0
internoPitagoras p q r = cumpleCondicion p q r + internoPitagoras (p-1) q r

cumpleCondicion :: Integer -> Integer -> Integer -> Integer
cumpleCondicion p q r | p^2 + q^2 <= r^2 = 1
                      | otherwise = 0

